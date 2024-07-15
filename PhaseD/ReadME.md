דוח שלב 4:

האגף החדש - המשמר הלאומי DSD:

![תמונה של WhatsApp‏ 2024-07-12 בשעה 17 23 38_7d1d9717](https://github.com/user-attachments/assets/fca0072d-ec4d-419e-898c-d8640cc5a70a)


האגף החדש - המשמר הלאומי ERD:

![NG](https://github.com/user-attachments/assets/e8da43e0-306b-412c-bd4b-fcd2604df410)


המערכת המשותפת - IAF ומשמר לאומי משותף ERD:
![348314156-ecfec15d-3d99-4b30-a33f-65067dddba78](https://github.com/user-attachments/assets/dea0ae62-0609-45f7-9f03-0f51f19d7ce0)



המערכת המשותף - IAF ומשמר לאומי DSD משותף:
![image](https://github.com/user-attachments/assets/4d106127-d320-4cda-977c-593c68f9b68f)


 החלטות שנעשו בשלב האינטגרציה:

לאחר סיעור מוחות סוער מאוד, החלטנו לשלב בין AIRCRAFT שבפרויקט שלנו לבין GEAR שבפרויקט המשמר הלאומי, באופן כזה שלAIRCRAFT יש GEAR. ידוע שכלי טייס של חיל האוויר משתמשים בציוד שיש למשמר הלאומי, לכן רעיון זה מצא חן בעינינו.

בחרנו שלא להוסיף עוד מפתחות ראשיים, כי אין צורך. כל השאר נשאר דומה כי לא היו נתונים כפולים.



הסבר מילולי של התהליך והפקודות:

יצרנו טבלאות לכל היישויות החדשות שפיענחנו מהפרויקט של המשמר הלאומי:

#### יצירת טבלת BASE
- **מטרה:** יצירת טבלה שנקראת `BASE` המכילה מידע על בסיסים.
- **שדות:**
- `base_id`: מספר זיהוי ייחודי לכל בסיס (מספר, לא יכול להיות NULL).
- `location`: מיקום הבסיס (מחרוזת באורך עד 1000 תווים, לא יכול להיות NULL).
- `description`: תיאור הבסיס (מחרוזת באורך עד 1000 תווים, לא יכול להיות NULL).
- **הגדרת מפתח ראשי:** הוספת עמודת `base_id` כמפתח ראשי (PRIMARY KEY).

#### יצירת טבלת GEAR
- **מטרה:** יצירת טבלה שנקראת `GEAR` המכילה מידע על ציוד.
- **שדות:**
- `armor_type`: סוג השריון (מספר, לא יכול להיות NULL).
- `gun_type`: סוג הנשק (מספר, לא יכול להיות NULL).
- `gear_id`: מספר זיהוי ייחודי לכל פריט ציוד (מספר, לא יכול להיות NULL).
- **הגדרת מפתח ראשי:** הוספת עמודת `gear_id` כמפתח ראשי (PRIMARY KEY).
- **הגדרת Constraint:** הוספת constraint לבדוק ש`armor_type` נמצא בטווח 1 עד 5.

#### יצירת טבלת PERSONAL_INFO
- **מטרה:** יצירת טבלה שנקראת `PERSONAL_INFO` המכילה מידע אישי.
- **שדות:**
- `address`: כתובת (מחרוזת באורך עד 1000 תווים, לא יכול להיות NULL).
- `phone_number`: מספר טלפון (מחרוזת באורך עד 20 תווים, לא יכול להיות NULL).
- `email`: דואר אלקטרוני (מחרוזת באורך עד 500 תווים, לא יכול להיות NULL).
- **הגדרת מפתח ראשי:** הוספת עמודת `phone_number` כמפתח ראשי (PRIMARY KEY).

#### יצירת טבלת POSITION
- **מטרה:** יצירת טבלה שנקראת `POSITION` המכילה מידע על תפקידים.
- **שדות:**
- `role_id`: מספר זיהוי ייחודי לכל תפקיד (מספר, לא יכול להיות NULL).
- `role_name`: שם התפקיד (מחרוזת באורך עד 100 תווים, לא יכול להיות NULL).
- `description`: תיאור התפקיד (מחרוזת באורך עד 1000 תווים, לא יכול להיות NULL).
- **הגדרת מפתח ראשי:** הוספת עמודת `role_id` כמפתח ראשי (PRIMARY KEY).

#### יצירת טבלת SHIFTS
- **מטרה:** יצירת טבלה שנקראת `SHIFTS` המכילה מידע על משמרות.
- **שדות:**
- `shift_id`: מספר זיהוי ייחודי לכל משמרת (מספר, לא יכול להיות NULL).
- `start_date_time`: תאריך ושעת התחלת המשמרת (תאריך, לא יכול להיות NULL).
- `end_date_time`: תאריך ושעת סיום המשמרת (תאריך, לא יכול להיות NULL).
- `base_id`: מספר זיהוי של הבסיס שבו מתקיימת המשמרת (מספר, לא יכול להיות NULL).
- **הגדרת מפתח ראשי:** הוספת עמודת `shift_id` כמפתח ראשי (PRIMARY KEY).
- **הגדרת מפתח זר:** הוספת מפתח זר `base_id` הקשור לעמודת `base_id` בטבלת `BASE`.
- **הגדרת Constraint:** הוספת constraint לבדוק ש`end_date_time` מאוחר יותר מ-`start_date_time`.

#### יצירת טבלת VOLUNTEERS
- **מטרה:** יצירת טבלה שנקראת `VOLUNTEERS` המכילה מידע על מתנדבים.
- **שדות:**
- `volunteer_id`: מספר זיהוי ייחודי לכל מתנדב (מספר, לא יכול להיות NULL).
- `join_date`: תאריך הצטרפות (תאריך, ברירת מחדל `SYSDATE`, לא יכול להיות NULL).
- `name`: שם המתנדב (מחרוזת באורך עד 100 תווים, לא יכול להיות NULL).
- `role_id`: מספר זיהוי של התפקיד (מספר, לא יכול להיות NULL).
- `gear_id`: מספר זיהוי של הציוד (מספר, לא יכול להיות NULL).
- `phone_number`: מספר טלפון (מחרוזת באורך עד 20 תווים, לא יכול להיות NULL).
- **הגדרת מפתח ראשי:** הוספת עמודת `volunteer_id` כמפתח ראשי (PRIMARY KEY).
- **הגדרת מפתחות זרים:**
- `role_id` הקשור לעמודת `role_id` בטבלת `POSITION`.
- `gear_id` הקשור לעמודת `gear_id` בטבלת `GEAR`.
- `phone_number` הקשור לעמודת `phone_number` בטבלת `PERSONAL_INFO`.

#### יצירת טבלת SIGNED_UP
- **מטרה:** יצירת טבלה שנקראת `SIGNED_UP` המכילה מידע על מתנדבים שנרשמו למשמרות.
- **שדות:**
- `volunteer_id`: מספר זיהוי של המתנדב (מספר, לא יכול להיות NULL).
- `shift_id`: מספר זיהוי של המשמרת (מספר, לא יכול להיות NULL).
- **הגדרת מפתח ראשי משולב:** הוספת עמודות `volunteer_id` ו-`shift_id` כמפתח ראשי משולב (PRIMARY KEY).
- **הגדרת מפתחות זרים:**
- `volunteer_id` הקשור לעמודת `volunteer_id` בטבלת `VOLUNTEERS`.
- `shift_id` הקשור לעמודת `shift_id` בטבלת `SHIFTS`.

#### עדכון טבלת AIRCRAFT
- **מטרה:** הוספת עמודת `gear_id` לטבלת `AIRCRAFT` וקביעת מפתח זר לעמודה זו.
- **שדות:**
- `gear_id`: מספר זיהוי של הציוד (מספר).
- **הגדרת מפתח זר:** הוספת מפתח זר `gear_id` הקשור לעמודת `gear_id` בטבלת `GEAR`.



קובץ tst:

הסקריפט מבצע פעולת עדכון עבור כל רשומה בטבלת AIRCRAFT. הוא בוחר מזהה של ציוד (gear_id) אקראי מטבלת GEAR ומעדכן את העמודה המתאימה בטבלת AIRCRAFT עבור כל רשומה בטבלה.



מבטים:

תיאור המבט Volunteers_Shifts
מבט זה משלב נתונים אודות מתנדבים ומשמרות אליהן הם רשומים. הוא כולל את מזהה המתנדב, שם המתנדב, מזהה המשמרת, תאריך ושעת התחלה וסיום של המשמרת, ומיקום הבסיס בו המשמרת מתקיימת.

שליפת נתונים ממנו עם select * (מספיק 10 רשומות):

![image](https://github.com/user-attachments/assets/fc35c5a7-7267-4247-b76d-a9c5ccf13a8e)





תיאור המבט Maintenance_Aircraft_Check
מבט זה מציג מידע אודות מטוסים שדורשים תחזוקה. הוא משלב נתונים אודות מטוסים עם נתוני טיסות, ומציג מטוסים שטסו ב-30 הימים האחרונים או שלא טסו כלל. המבט כולל את המספר הסידורי של המטוס, תאריך הייצור, סוג התחמושת, מודל המטוס, תאריך הטיסה האחרונה, ומשך זמן הטיסה.

שליפת נתונים ממנו עם select * (מספיק 10 רשומות):

![image](https://github.com/user-attachments/assets/0ef952b1-81d5-4c13-8a6a-1defc8b12c6f)




שאילתות:


דוח משמרות מתנדבים
שאילתה זו מציגה תמונה כללית של המשמרות וכמות המתנדבים בכל משמרת.




```
-- get an image of shifts to see how occupied they are.
SELECT shift_id, start_date_time, end_date_time, base_location, COUNT(volunteer_id) AS volunteer_count
FROM Volunteers_Shifts
GROUP BY shift_id, start_date_time, end_date_time, base_location;
```


פלט השאילתא:

![image](https://github.com/user-attachments/assets/0a98854c-520e-4e9d-9dee-b12cb3437a16)


דוח משמרות עתידיות
שאילתה זו מציגה תמונה כללית המתדנבים והמשמרות שיש להם השנה.




```
-- get an image of shifts for every volunteer in the comming year
SELECT volunteer_id, volunteer_name, shift_id, start_date_time, end_date_time, base_location
FROM Volunteers_Shifts
WHERE start_date_time > to_date('01/01/2024', 'DD/MM/YYYY')
ORDER BY start_date_time ASC;
```


פלט השאילתא:

![image](https://github.com/user-attachments/assets/5a42bc64-a64b-49c6-ac02-9ebfd3b1635b)





דוח תחזוקת מטוסים
שאילתה זו מציגה רשימת מטוסים שדורשים תחזוקה מיידית מאחר והם בני יותר מ-40 שנים.

```
-- list the aircrafts which are older than 40, and thus need imidiate meintenence
SELECT serialid, production_date, ammunitiontype, model
FROM Maintenance_Aircraft_Check
WHERE production_date <= ADD_MONTHS(SYSDATE, -480);
```

פלט השאילתא:

![image](https://github.com/user-attachments/assets/6a490d92-d94e-4cc4-95d5-132ea7308979)



שאילתת מלאי נשק
שאילתה זו מציגה אילו סוגי תחמושת הינם הכי נפוצים בקרב המטוסים, בשביל תחזוקת מלאי.
```
-- list the most commonly used ammunition type
SELECT ammunitiontype, COUNT(*) AS usage_count
FROM Maintenance_Aircraft_Check
GROUP BY ammunitiontype
ORDER BY usage_count DESC;
```

פלט השאילתא:

![image](https://github.com/user-attachments/assets/1736b812-0d2a-4334-91a5-288e6be9f793)



