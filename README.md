# Bangkit-CloudComputing
## API Klasifikasi Tanaman Hias
| Method | Path | Parameter | Response |
| :--- | :--- | :--- | :--- |
| `GET` | /ping | none | "The server is running." |
| `POST` | /predict | image: `file` | { <br/> &emsp;"class" : `string`, <br/> &emsp;"description" : `string`, <br/> &emsp;"confidence" : `float` <br/> } |
