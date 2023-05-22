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
            "url": "http://127.0.0.1:8000/",
            "description": "Another url alternatives",
        }
    ],
)

MODEL = tf.keras.models.load_model("models/")
CLASS_NAMES = ['Agglonema', 'Alocasia', 'Gelombang Cinta', 'Janda Bolong', 'Lidah Mertua', 'Lili Paris', 'Pucuk Merah', 'Suplir']

@app.get("/ping")
async def ping():
    return "Server is running"

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
    file: UploadFile = File(...)
):
    img = read_image(await file.read())

    predictions = MODEL.predict(img)
    predicted_class = CLASS_NAMES[np.argmax(predictions[0])]

    confidence = np.max(predictions[0])

    return {
        'class': predicted_class,
        'confidence': float(confidence)
    }

if __name__ == "__main__":
    uvicorn.run(app, host='localhost', port=8000)