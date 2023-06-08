# Bangkit-CloudComputing
## API Plant Recommendation

<br>

### Documentation
| Method | Path | Parameter | Response |
| :--- | :--- | :--- | :--- |
| `POST` | /likes | user_id: `str`<br>post_id: `str` | [<br/>{ <br/> &emsp;"id" : `str`, <br/> &emsp;"name" : `string`, <br/> &emsp;"image" : `str` <br/> &emsp;"desc" : `str` <br/> },<br/>...<br/>] |
| `DELETE` | /unlike | user_id: `str`<br>post_id: `str` | {<br/>&emsp;"message": "success"<br/>} |

| Table Relation |
| :--- |
|![Screenshot 2023-06-05 094501 (2)](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/d47748fc-31f3-4011-8f89-1a7ac175394a)|

### Postman Example
/likes
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/1a76c754-30c3-436c-a5bb-3186d8724ea1)
/unlike
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/0729c4aa-4268-4834-8146-ddc0c4bceb43)
