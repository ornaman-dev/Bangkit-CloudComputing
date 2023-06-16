# User Authentication API
## API Documentation
### Endpoint
> https://backend-dot-c23-ps369.as.r.appspot.com/ <I>(include web preview)</I>
### User Register
- Path
  + /users
- Method
  + POST
- Request Body
  ```json
  {
    "name": "str",
    "email": "str",
    "password": "str"
  }
  ```
- Response
  ```json
  {
    "id": "str",
    "name": "str",
    "email": "str"
  }
  ```
- Postman Example
  ![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/6b2bbf9d-9880-4396-b0be-2ce897fa67b7)

### User Login
- Path
  + /login/token
- Method
  + POST
- Request Body
  + `username`
  + `password`
  + `grant_type`
  + `scope`
  + `client_id`
  + `client_secret`
- Response
  ```json
  {
    "id": "str",
    "name": "str",
    "email": "str",
    "access_token": "str",
    "token_type": "str"
  }
  ```
- Postman Example
  ![https___backend-dot-c23-ps369 as r appspot com_login_token - My Workspace 6_16_2023 8_17_00 PM](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/cc45100f-061e-472b-8fe1-991772781e48)

### Read Current User
- Path
  + /users/me
- Method
  + GET
- Response
  ```json
  {
    "id": "str",
    "name": "str",
    "email": "str"
  }
  ```
- Postman Example
  ![https___backend-dot-c23-ps369 as r appspot com_users_me - My Workspace 6_16_2023 8_18_51 PM](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/e108ad1d-ed75-4394-8540-36bb895c5a78)

