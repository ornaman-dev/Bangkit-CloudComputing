# Bangkit-CloudComputing
## API Plant Classification

### Documentation
| Method | Path | Parameter | Response |
| :--- | :--- | :--- | :--- |
| `GET` | /ping | none | "The server is running." |
| `POST` | /predict | file: `file` | { <br/> &emsp;"class" : `string`, <br/> &emsp;"description" : `string`, <br/> &emsp;"confidence" : `float` <br/> &emsp;"image" : `string` <br/> } |

### Postman Example
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/8ab10089-3c64-4618-8b9e-4558be901ec3)
