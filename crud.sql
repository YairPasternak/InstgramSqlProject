--PART 3 -CRUD Operation

--הוספת משתמש חדש

INSERT INTO Users(name,username,email,age,city,bio,createdAt)
VALUES ('Daniel','daniel22','daniel@gmail.com',22,'Tel Aviv','New here','2026-05-11 12:00:00');

--הוספת פוסט חדש
INSERT INTO Posts(userId, imageUrl, caption, status, createdAt) VALUES (1,'img/post11.jpg','Another post','active','2026-05-11 12:10:00');

--הוספת תגובה לפוסט
INSERT INTO Comments(postId, userId, content, createdAt) VALUES (1, 3, 'Love this', '2026-05-11 12:15:00');

--הוספת לייק לפוסט
INSERT INTO Likes(postId, userId, createdAt) VALUES (1, 2, '2026-05-11 12:30:00');

--עדכון bio של משתמש
UPDATE Users SET bio = 'Matematica' WHERE id = 1;

--עדכון caption של פוסט
UPDATE Posts SET caption = 'Updated caption' WHERE id = 1;

--מחיקת תגובה
DELETE FROM Comments WHERE id = 1;

--מחיקת סטורי
DELETE FROM Stories WHERE id = 1;

--את כל המשתמשים
SELECT * FROM Users;

-- כל הפוסטים
SELECT * FROM Posts;

--את כל הסטוריז
SELECT * FROM Stories;

-- את כל התגובות
SELECT * FROM Comments; 

-- את כל הלייקים
SELECT * FROM Likes;

--part5 

--משתמשים מעל גיל 18
SELECT *FROM Users WHERE age>18;

--משתמשים מעיר מסוימת
SELECT *FROM Users WHERE city='Tel Aviv';

--משתמשים שהשם שלהם מכיל אות מסוימת
--gfhdfgdfgafdgfg
SELECT *FROM Users WHERE name LIKE '%a%';

--משתמשים מערים מסוימות בלבד
SELECT *FROM Users WHERE city IN ('Tel Aviv','Haifa');

--משתמשים בגילאים בין 18 ל־30
SELECT *FROM Users WHERE age BETWEEN 18 AND 30;

--פוסטים פעילים בלבד
SELECT *FROM Posts WHERE status='active';

--משתמשים שאין להם bio
SELECT *FROM Users WHERE bio IS NULL;

--PART 6 

--sorting users by age מקטן לגדול
SELECT * FROM users ORDER BY age ASC;

--sorting users by age מגדול לקטן
SELECT * FROM users ORDER BY age DESC;

--5 הפוסטים האחרונים
SELECT * FROM Posts ORDER BY createdAt  DESC LIMIT 5;

--3 המשתמשים המבוגרים ביותר
SELECT * FROM Users ORDER BY age DESC LIMIT 3;

--PART 7 - JOINS

--שם משתמש + כותרת הפוסט שלו
SELECT username, caption FROM Users 
INNER JOIN Posts ON Users.id = Posts.userId;

--שם משתמש + תגובה שהוא כתב
SELECT username, content FROM Users 
INNER JOIN Comments ON Users.id = Comments.userId;

--שם משתמש + הפוסט שעליו הוא עשה לייק
SELECT username, caption     FROM Users
INNER JOIN Likes ON Likes.userId=Users.id
INNER JOIN   Posts ON  Likes.postId  =Posts.id;


--PART 8 - LEFT JOIN

--כל המשתמשים, גם כאלה שלא פרסמו פוסטים
SELECT  Users.* , Posts.caption FROM Users 
LEFT JOIN  Posts on Posts.userId=Users.Id;

--כל הפוסטים, גם כאלה שאין להם תגובות
SELECT  Posts.* ,Comments.content FROM Posts 
LEFT JOIN Comments ON Comments.postId=Posts.id;

--כל הפוסטים, גם כאלה שאין להם לייקים
SELECT  Posts.*  FROM Posts
LEFT JOIN Likes ON Likes.postId=Posts.id;

-- חלק 9 — GROUP BY
-- יש להציג:
-- כמה פוסטים יש לכל משתמש
SELECT Users.username ,COUNT(Posts.id) AS PostCount FROM Users
INNER JOIN Posts ON Posts.userId=Users.id
GROUP BY  Users.id ;
-- כמה תגובות יש לכל פוסט
SELECT Posts.caption ,COUNT(Comments.id) AS CommentsCount FROM Posts
INNER JOIN Comments ON Comments.postId=Posts.id
GROUP BY  Posts.id ;
-- כמה לייקים יש לכל פוסט
SELECT Posts.caption ,COUNT(Likes.id) AS LikesCount FROM Posts
INNER JOIN Likes ON Likes.postId=Posts.id
GROUP BY  Posts.id ;
-- כמה עוקבים יש לכל משתמש
SELECT Users.username ,COUNT(Follows.id) AS FollowsCount FROM Users
INNER JOIN Follows ON Follows.followingId= Users.id
GROUP BY  Users.id ;
-- כמה פוסטים יש לכל משתמש  
SELECT Users.username ,COUNT(Posts.id) AS PostCount FROM Users
LEFT JOIN Posts ON Posts.userId=Users.id    
GROUP BY  Users.id ;

--Part10 
--רק משתמשים שיש להם יותר מפוסט אחד
--תביא לי לכל משתמש כמות הפוסטים יותר מפוסט אחד 
SELECT Users.* , COUNT(Posts.id) AS CounterPost FROM Users 
INNER JOIN Posts ON Posts.userId= Users.id
GROUP BY Users.id
HAVING CounterPost >1;

-- רק פוסטים שיש להם יותר מ־2 תגובות
SELECT Posts.* , COUNT(Comments.id) AS CounterComments FROM Posts
INNER JOIN Comments ON Comments.postId= Posts.id
GROUP BY Posts.id
HAVING CounterComments >2;

-- רק פוסטים שיש להם יותר מ־3 לייקים
SELECT Posts.* , COUNT(Likes.id) AS CounterLikes FROM Posts
INNER JOIN Likes ON Likes.postId= Posts.id
GROUP BY Posts.id
HAVING CounterLikes >3;

-- רק משתמשים שיש להם יותר מ־2 עוקבים
SELECT Users.* , COUNT(Follows.id) AS CounterFollows FROM Users
INNER JOIN Follows ON Follows.followingId= Users.id
GROUP BY Users.id
HAVING CounterFollows >2;

--PART 11
--יש ליצור דוח שמציג:

--שם משתמש
-- username
-- כמות פוסטים
-- כמות לייקים כוללת על כל הפוסטים שלו
-- כמות תגובות כוללת על כל הפוסטים שלו
-- כמות עוקבים
-- רק משתמשים שיש להם לפחות פוסט אחד
-- מיון לפי כמות לייקים מהגבוה לנמוך

SELECT username,
COUNT(DISTINCT Posts.id) AS PostCount ,
COUNT(DISTINCT Likes.id) AS LikesCount,
COUNT(DISTINCT Comments.id) AS CommentsCount,
COUNT(DISTINCT Follows.id) AS FollowsCount
FROM Users
INNER JOIN Posts ON Posts.userId= Users.id
LEFT JOIN Likes ON Likes.postId=Posts.id
LEFT JOIN Comments ON Comments.postId=Posts.id
LEFT JOIN Follows ON Follows .followingId = Users.id
GROUP BY Users.id
ORDER BY LikesCount DESC;   

--BUNOS
SELECT * From Users 
--NOT IN תביא לי את המשתמשים שאני לא עוקב אחריהם
WHERE id NOT IN (-- תביא לי את המשתמשים שאני עוקב אחריהם
    SELECT Follows .followingId From Users
    INNER JOIN Follows ON Follows.followerId =Users.id
    WHERE username='yair94'
)
AND  (  -- תביא לי את המשתמשים מאותה עיר
    city= ( SELECT city FROM Users WHERE username='yair94')
    OR 
    -- תביא לי את המשתמשים עם הכי עוקבים (שיש להם שני עוקבים)
    id IN (
        SELECT Users.id  FROM Users
        INNER JOIN Follows ON Follows.followingId= Users.id
        GROUP BY Users.id
        HAVING COUNT(Follows.id) =2   
    )
)
--מוריד את עצמי מהתוצאות 
AND username <>'yair94';




