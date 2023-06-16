# Plant Recommendation API
## API Documentation
### Endpoint
> https://c23-ps369.as.r.appspot.com/
### Shows All Plants
- Path
  + /plants
- Method
  + GET
- Response
  ```json
  [
    {
     "id": "str",
     "name": "str",
     "name_alt": "str",
     "image": "str",
     "desc": "str"
    }
    ...
  ]
  ```
- Postman Example
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/883591d4-cd45-486d-a80d-c8c8e16c6198)


### Shows Detail Plant
- Path
  + /plant?id={plant_id}
- Method
  + GET
- Parameter
  + `plant_id`
- Response
  ```json
  [
    {
    "id": "str",
    "name": "str",
    "name_alt": "str",
    "image": "str",
    "desc": "str",
    "light": "str",
    "water": "str",
    "humidity": "str",
    "temperature": "str",
    "food": "str",
    "toxicity": "str",
    "cares": "str",
    "fact": "str"
    }
  ]
  ```
- Postman Example
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/757aab3c-7aba-49cc-aac8-7121f022ab2e)

### Users Like Plants
- Path
  + /likes
- Method
  + POST
- Request Body
  ```json
  {
    "user_id": "str"
    "plant_id": "str"
  }
  ```
- Response
  ```json
  [
    {
    "id" : "str",
    "name_alt" : "str",
    "image" : "str",
    "desc" : "str"
    },
    ...
  ]
  ```
- Postman Example
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/6246c017-faa7-4942-b067-0b67416b629a)

### Users Dislike the Plants
- Path
  + /unlike
- Method
  + DELETE
- Request Body
  ```json
  {
    "user_id": "str"
    "plant_id": "str"
  }
  ```
- Response
  ```json
  {
    "message": "success"
  }
  ```
- Postman Example
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/6dc0080e-ccd0-48e9-8d60-314fb43e4e21)
