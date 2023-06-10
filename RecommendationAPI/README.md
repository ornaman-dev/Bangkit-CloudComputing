# Bangkit-CloudComputing
## API Plant Recommendation

<br>

### Documentation
| Method | Path | Parameter | Response |
| :--- | :--- | :--- | :--- |
| `GET` | /plants | none | [<br/>{<br/>&emsp;"id": `str`<br/>&emsp;"name": `str`<br/>&emsp;"name_alt": `str`<br/>&emsp;"image": `str`<br/>&emsp;"desc": `str`<br/>}<br/>...<br/>] |
| `GET` | /plant?id=`str` | id: `str` | [<br/>{<br/>&emsp;"id": `str`<br/>&emsp;"name": `str`<br/>&emsp;"name_alt": `str`<br/>&emsp;"image": `str`<br/>&emsp;"desc": `str`<br/>&emsp;"light": `str`<br/>&emsp;"water": `str`<br/>&emsp;"humidity": `str`<br/>&emsp;"temperature": `str`<br/>&emsp;"food": `str`<br/>&emsp;"toxicity": `str`<br/>&emsp;"cares": `str`<br/>&emsp;"fact": `str`<br/>}<br/>] |
| `POST` | /likes | user_id: `str`<br>plant_id: `str` | [<br/>{ <br/> &emsp;"id" : `str`, <br/> &emsp;"name_alt" : `str`, <br/> &emsp;"image" : `str` <br/> &emsp;"desc" : `str` <br/> },<br/>...<br/>] |
| `DELETE` | /unlike | user_id: `str`<br>plant_id: `str` | {<br/>&emsp;"message": "success"<br/>} |


### Postman Example
/plants
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/883591d4-cd45-486d-a80d-c8c8e16c6198)
/plant?id={plant_id}
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/757aab3c-7aba-49cc-aac8-7121f022ab2e)
/likes
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/6246c017-faa7-4942-b067-0b67416b629a)
/unlike
![image](https://github.com/ornaman-dev/Bangkit-CloudComputing/assets/73805258/6dc0080e-ccd0-48e9-8d60-314fb43e4e21)
