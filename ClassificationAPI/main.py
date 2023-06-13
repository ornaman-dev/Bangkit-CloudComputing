from efficientnet.tfkeras import EfficientNetB3
from fastapi import FastAPI, File, UploadFile
from gcloud import storage
from io import BytesIO
from PIL import Image

import keras.utils as image
import tensorflow as tf
import numpy as np

import requests
import uvicorn
import uuid
import os

app = FastAPI(
    title="Ornaman REST API documentation",
    description="This API was built to classification ornamental plant by images and recommendations (machine learning plant identification service)",
    version="1.0.0",
    servers=[
        {
            "url": "http://localhost:8000",
            "description": "Development Server"
        },
        {
            "url": "http://127.0.0.1:8000/",
            "description": "Another url alternatives",
        }
    ],
)

MODEL = tf.keras.models.load_model("models/model_EfficientNetB3.h5")
MODEL2 = tf.keras.models.load_model("models/model_identification.h5")
CLASS_NAMES = ['Sri rezeki', 'Kuping Gajah', 'Gelombang Cinta', 'Janda Bolong', 'Lidah Mertua', 'Lili Paris', 'Pucuk Merah', 'Suplir']
CLASS_NAMES2 = ['Not Plant', 'Plant']
CLASS_DESC = [
    'Aglaonema merupakan tanaman yang berwarna - warni dengan daun bermotif mencolok. Karena sifatnya yang santai, Aglaonemas sangat cocok untuk ruang tamu atau kantor modern, kamar tidur redup, atau ruang belajar yang nyaman.Karena toleransi Aglaonema terhadap kondisi lembab dan kering, dan fakta bahwa Aglaonema akan tumbuh subur dengan cahaya redup, Aglaonema adalah pilihan yang sempurna untuk kondisi cahaya yang kurang ideal atau pemilik tanaman yang pelupa.',
    'Alocasia adalah tanaman tropis yang menakjubkan dengan daun berbentuk panah. Area hangat dan terang di rumah Anda akan cocok dengan tanaman ini. Alocasia berasal dari daerah tropis di Kepulauan Pasifik Selatan, terutama Filipina. Tanaman Alocasia menyukai kelembaban ekstra yang terdapat di dapur atau kamar mandi.',
    'Tahukah Anda bahwa "bunga" berwarna-warni pada Anthurium sebenarnya adalah daun yang mengalami modifikasi? Bunga sebenarnya dari tanaman ini tumbuh dari struktur tengah yang disebut infloresensi. Ditemukan awalnya di daerah pegunungan Andes di Kolombia dan Ekuador, tanaman ini menyukai tempat hangat dengan sedikit kelembaban ekstra.',
    'Monstera adalah tanaman hias yang unik dan mudah dirawat dengan daun yang dramatis dan berlubang. Monstera adalah tanaman merambat dan suka menjuntai di sekitar pot atau memanjat di sepanjang tiang atau pagar. Tanaman ini juga tahan saat tidak selalu disiram, sehingga cocok untuk para penyuka tanaman yang tidak berpengalaman.',
    'Sansevieria ditandai dengan daun-daunnya yang tegak, keras, dan berbentuk seperti pedang. Sifat natural mereka membuat mereka menjadi pilihan alami untuk desain interior modern dan kontemporer. Jika Anda baru memulai merawat tanaman atau hanya mencari tanaman hias yang mudah dirawat, Sansevieria adalah pilihan yang tepat untuk Anda. Mereka dapat bertahan di bawah sinar matahari penuh dan mampu bertahan di kondisi cahaya rendah, meskipun mereka akan tumbuh dengan baik di bawah sinar matahari tidak langsung. Dan karena Sansevieria berasal dari padang pasir kering di Afrika Barat, mereka tidak memerlukan banyak air, terutama di musim dingin.',
    'Lili paris adalah salah satu tanaman hias yang paling mudah beradaptasi dan sangat mudah untuk tumbuh. lili paris yang ramah hewan juga dikenal karena kualitas penyaring udaranya, menjadikannya tambahan yang sehat untuk rumah Anda. Berasal dari daerah tropis dan selatan Afrika, lili paris memiliki reputasi sebagai tanaman yang sangat tahan terhadap situasi apapun. Ketika tanaman ini dewasa, mereka akan menghasilkan "spiderettes" yang dapat Anda sebarkan untuk menumbuhkan tanaman baru. Tanaman ini adalah pilihan yang tepat untuk pemilik tanaman pemula.',
    'Pucuk merah memiliki batang berkayu dan daun yang rindang, dengan tekstur yang kasar dan tepi yang bergerigi. tanaman ini berasal dari Meksiko. Tanaman ini menarik karena ujung daunnya berwarna merah, merah muda ataupun putih. Tanaman ini menyukai cahaya tidak langsung yang terang dan penyiraman yang tidak terlalu sering.',
    'Suplir adalah tanaman pakis yang memiliki daun halus dan indah. Tanaman ini tumbuh hingga ketinggian sekitar 30-60 cm dan memiliki daun hijau muda hingga hijau tua yang lembut dan berkilau. Suplir biasanya digunakan sebagai tanaman hias dalam ruangan atau di taman teduh. Tanaman ini membutuhkan cahaya terfilter dan tanah yang lembab dengan drainase yang baik. Suplir adalah tanaman yang menarik secara visual dan juga dapat membantu memperbaiki kualitas udara di sekitarnya.'
]

def upload_image(data):
    os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = r'credentials.json'
    client = storage.Client()
    file = os.path.splitext(data.filename)
    
    bucket = client.get_bucket('ornaman-plant-images')

    img_type = data.filename.split(".")[-1]
    if(img_type == 'jpg'):
        img_type = 'jpeg'

    blob = bucket.blob('plant-' + str(uuid.uuid4())[:8] + file[1])
    blob.upload_from_file(data.file)
    blob.content_type = 'image/' + img_type
    blob.patch()

    img_url = blob.public_url

    return img_url

def read_image(data):
    response = requests.get(data)
    img = Image.open(BytesIO(response.content))

    imgResize = img.resize((300, 300))
    imgArr = np.array(imgResize)

    x = image.img_to_array(imgArr)
    x /= 255.0
    x = np.expand_dims(x, axis=0)

    imgFinal = np.vstack([x])

    return imgFinal

@app.post("/predict")
async def predict(
    file: UploadFile = File(...)
):
    img_url = upload_image(file)
    img = read_image(img_url)

    try:
        pred = MODEL2.predict(img)
        pred_index = np.argmax(pred)

        if(pred_index == 0):
            return {
                "class": "Gambar bukan tanaman hias",
                'description': "Gambar yang diberikan tidak termasuk ke dalam tanaman hias. Pilih gambar yang lain dan coba lagi.",
                'image': img_url
            }
        
        predictions = MODEL.predict(img)
        predict_list = np.round(predictions,3)

        if (np.max(predict_list) < 0.8):
            return {
                'class': "Bukan tanaman milik Ornaman.",
                'description': "Gambar yang diberikan tidak termasuk ke dalam tanaman milik Ornaman. Pilih tanaman yang lain dan coba lagi.",
                'image': img_url
            }
    except:
        return {
            'class': "Terjadi kesalahan saat memuat gambar.",
            'description': "Kegagalan dalam memuat sebuah gambar yang diharapkan atau kesalahan saat pengguna mencoba memuat atau menampilkan gambar dari sumber tertentu.",
            'image': img_url
        }
    
    predicted_idx = np.argmax(predictions[0])

    class_name = CLASS_NAMES[predicted_idx]
    class_desc = CLASS_DESC[predicted_idx]

    return {
        'class': class_name,
        'description': class_desc,
        'image': img_url
    }

@app.get("/")
def home():
    return "Hello World! This belongs to the root path of Classification API by Ornaman Team."

if __name__ == "__main__":
    uvicorn.run(app, host='0.0.0.0', port=8000)