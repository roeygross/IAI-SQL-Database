דוח שלב 4:

האגף החדש - המשמר הלאומי DSD:

![תמונה של WhatsApp‏ 2024-07-12 בשעה 17 23 38_7d1d9717](https://github.com/user-attachments/assets/fca0072d-ec4d-419e-898c-d8640cc5a70a)


האגף החדש - המשמר הלאומי ERD:

![NG](https://github.com/user-attachments/assets/e8da43e0-306b-412c-bd4b-fcd2604df410)


המערכת המשותפת - IAF ומשמר לאומי משותף ERD:
![integrated](https://github.com/user-attachments/assets/ecfec15d-3d99-4b30-a33f-65067dddba78)


המערכת המשותף - IAF ומשמר לאומי DSD משותף:
![image](https://github.com/user-attachments/assets/4d106127-d320-4cda-977c-593c68f9b68f)


 החלטות שנעשו בשלב האינטגרציה

החלטנו לאחד ב

·         הסבר מילולי של התהליך והפקודות


מבטים:

תיאור המבט Volunteers_Shifts
מבט זה משלב נתונים אודות מתנדבים ומשמרות אליהן הם רשומים. הוא כולל את מזהה המתנדב, שם המתנדב, מזהה המשמרת, תאריך ושעת התחלה וסיום של המשמרת, ומיקום הבסיס בו המשמרת מתקיימת.

שליפת נתונים ממנו עם select * (מספיק 10 רשומות):




תיאור המבט Maintenance_Aircraft_Check
מבט זה מציג מידע אודות מטוסים שדורשים תחזוקה. הוא משלב נתונים אודות מטוסים עם נתוני טיסות, ומציג מטוסים שטסו ב-30 הימים האחרונים או שלא טסו כלל. המבט כולל את המספר הסידורי של המטוס, תאריך הייצור, סוג התחמושת, מודל המטוס, תאריך הטיסה האחרונה, ומשך זמן הטיסה.

שליפת נתונים ממנו עם select * (מספיק 10 רשומות):


שאילתות:


דוח משמרות מתנדבים
שאילתה זו מציגה תמונה כללית של המשמרות וכמות המתנדבים בכל משמרת.
ְְ```
-- get an image of shifts to see how occupied they are.
SELECT shift_id, start_date_time, end_date_time, base_location, COUNT(volunteer_id) AS volunteer_count
FROM Volunteers_Shifts
GROUP BY shift_id, start_date_time, end_date_time, base_location;
```


פלט השאילתא:




דוח תחזוקת מטוסים
שאילתה זו מציגה רשימת מטוסים שדורשים תחזוקה מיידית מאחר והם בני יותר מ-40 שנים.

```
-- list the aircrafts which are older than 40, and thus need imidiate meintenence
SELECT serialid, production_date, ammunitiontype, model
FROM Maintenance_Aircraft_Check
WHERE production_date <= ADD_MONTHS(SYSDATE, -480);
```

פלט השאילתא:

