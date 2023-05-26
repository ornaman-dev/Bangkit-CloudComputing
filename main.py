from fastapi import FastAPI, File, UploadFile
import keras.utils as image
import tensorflow as tf
import numpy as np
import uvicorn
from PIL import Image
from io import BytesIO

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
            "url": "https://classification-api-rf6r3bwska-et.a.run.app/",
            "description": "Production Server",
        }
    ],
)

MODEL = tf.keras.models.load_model("models/")
CLASS_NAMES = ['Agglonema', 'Alocasia', 'Gelombang Cinta', 'Janda Bolong', 'Lidah Mertua', 'Lili Paris', 'Pucuk Merah', 'Suplir']
CLASS_DESC = [
    'Agglonema adalah tanaman hias populer dari suku talas-talasan atau Araceae. Genus Aglaonema memiliki sekitar 30 spesies. Mereka berasal dari daerah tropis dan subtropis di Asia dan Nugini. Mereka umumnya dikenal sebagai Chinese evergreens.',
    'Kuping gajah (Alocasia) adalah spesies hibrida antara Alocasia longiloba dan Alocasia sanderiana. Alocasia dikenal karena daunnya yang besar dan beragam kultivar dalam spesiesnya. Kuping Gajah berasal dari Asia tropis dan Australia.',
    'Gelombang cinta (Anthurium plowmanii) adalah contoh keserbagunaan. Di habitat aslinya, tanaman tropis dengan dedaunan besar yang menarik ini tumbuh sebagai epifit, paling sering menempel pada pohon. Namun karena ukuran dan berat dedaunannya, ia dapat jatuh ke tanah dan terus tumbuh sebagai tanaman terestrial. Julukan spesifik dari nama Latin, plowmanii, diberikan untuk menghormati ahli etnobotani abad ke-20 yang meninggal secara tragis, Timothy Plowman.',
    'Janda bolong (Monstera obliqua) adalah spesies tumbuhan asli Amerika Tengah dan Selatan. Monstera obliqua dinamai untuk lubang di daunnya. Spesies ini dianggap mahal untuk dibudidayakan dan juga dianggap sebagai spesies tanaman hias yang langka. Tanaman ini memiliki daun yang khas, yaitu terdapat bolong-bolong di tengah daunnya.',
    'Lidah mertua (Sansevieria) dapat dianggap sebagai tanaman hias dan pajangan arsitektural karena daunnya yang seperti pedang dengan pola garis tebal, yang khas dan menarik perhatian. Lidah mertua adalah marga tanaman hias yang cukup populer sebagai penghias bagian dalam rumah karena tanaman ini dapat tumbuh dalam kondisi yang sedikit air dan cahaya matahari. Namun, berhati-hatilah dengan tanaman ini karena beracun jika tertelan dan dapat menyebabkan mual, muntah, bahkan pembengkakan tenggorokan dan lidah.',
    'Lili paris (Chlorophytum comosum) adalah tanaman abadi hijau dengan daun tipis panjang yang memberinya nama lain, "tanaman pita". Tanaman ini telah menyebar jauh dari Afrika asalnya karena mudah dirawat. Karena tanaman Lili paris tumbuh dengan baik di tempat teduh sebagian atau penuh, mereka menjadi tanaman hias yang populer.',
    'Pucuk merah (Syzygium myrtifolium) adalah spesies tumbuhan yang dikenal sebagai tanaman hias yang berasal dari genus Syzygium. Warna tunas daun yang baru muncul memiliki warna merah menyala sehingga tumbuhan ini memiliki sebutan Pucuk Merah. Warna daun akan berubah perlahan menjadi hijau seiring berjalannya waktu. Pucuk merah adalah sejenis tanaman perdu yang biasanya dijadikan tanaman hias di pekarangan rumah, perkantoran dan sebagainya serta masih termasuk ke dalam family yang sama dengan tanaman cengkih.',
    'Suplir  (Adiantum formosum) berasal dari Australia dan Selandia Baru dan ditemukan di hutan hujan, aliran air, dan ngarai. Meskipun dedaunannya terlihat halus, tanaman ini adalah tanaman yang keras dan mudah tumbuh, dengan air yang cukup. Tumbuh perlahan dan tidak suka dipindahkan begitu sudah mapan.'
]

@app.get("/ping")
async def ping():
    return "The server is running."

def read_image(data) -> np.ndarray:
    img = Image.open(BytesIO(data))
    imgResize = img.resize((150, 150))
    imgArr = np.array(imgResize)

    x = image.img_to_array(imgArr)
    x /= 255.0
    x = np.expand_dims(x, axis=0)

    imgFinal = np.vstack([x])

    return imgFinal

@app.post("/predict")
async def predict(
    image: UploadFile = File(...)
):
    img = read_image(await image.read())

    predictions = MODEL.predict(img)
    predicted_idx = np.argmax(predictions[0])

    class_name = CLASS_NAMES[predicted_idx]
    class_desc = CLASS_DESC[predicted_idx]
    confidence = np.max(predictions[0])

    return {
        'class': class_name,
        'description': class_desc,
        'confidence': float(confidence)
    }

@app.get("/")
def home():
    return "Hello World! This belongs to the route path of Classification API by Ornaman Team."

if __name__ == "__main__":
    uvicorn.run(app, host='0.0.0.0', port=8000)
