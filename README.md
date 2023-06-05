# Bangkit-CloudComputing
## API Plant Recommendation

Link: https://c23-ps369.as.r.appspot.com/
<br>
TODO:
- <s>Implementing API</s>
- <s>Deploy to Google Cloud</s>
- Recommend logic revision
- Fix bug

### Documentation
| Method | Path | Parameter | Response |
| :--- | :--- | :--- | :--- |
| `POST` | /likes | user_id: `str`<br>post_id: `str` | [<br/>{ <br/> &emsp;"id" : `str`, <br/> &emsp;"name" : `string`, <br/> &emsp;"image" : `str` <br/> &emsp;"desc" : `string` <br/> },<br/>...<br/>] |
| `DELETE` | /unlike | user_id: `str`<br>post_id: `str` | {<br/>&emsp;"message":"success"<br/>} |

### Postman Example
/likes
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/1a76c754-30c3-436c-a5bb-3186d8724ea1)
/unlike
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/f123a8fb-6448-432a-9cbf-d58dcdc84d14)
