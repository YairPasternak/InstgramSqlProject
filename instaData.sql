
INSERT INTO Users(name, username, email, age, city, bio) VALUES
('Yair Pasternak','yair94','yair@gmail.com',24,'Tel Aviv','Full stack student'),
('Malka Tizipi','shira_dd','shira12@gmail.com',22,'Tel Aviv','Love photos'),
('Amit Levi','amit_l','amit@gmail.com',25,'Haifa','Travel lover'),
('Dana Mizrahi','dana_m','dana@gmail.com',23,'Jerusalem','Food blogger'),
('Ron Azulay','ron_a','ron@gmail.com',27,'Beer Sheva','Fitness addict'),
('Maya Katz','maya_k','maya@gmail.com',21,'Ramat Gan','Music vibes'),
('Ido Peretz','ido_p','ido@gmail.com',26,'Ashdod','Cars and tech'),
('Shira David','shira_d','shira@gmail.com',24,'Tel Aviv','Daily stories');

INSERT INTO Posts(userId, imageUrl, caption, status, createdAt) VALUES
(1,'img/post1.jpg','First post','public','2022-05-10 09:00:00'),
(2,'img/post2.jpg','Coffee time','public','2021-08-01 11:15:00'),
(3,'img/post3.jpg','Trip to Eilat','public','2023-02-15 15:45:00'),
(4,'img/post4.jpg','Amazing burger','public','2020-12-11 18:30:00'),
(5,'img/post5.jpg','Workout done','public','2024-07-20 07:50:00'),
(6,'img/post6.jpg','Party night','public','2023-10-08 23:10:00'),
(7,'img/post7.jpg','My new BMW','public','2022-01-04 14:00:00'),
(8,'img/post8.jpg','Sea view','public','2025-03-01 17:20:00'),
(1,'img/post9.jpg','Coding session','public','2024-11-28 01:40:00'),
(2,'img/post10.jpg','Weekend chill','public','2025-04-18 19:00:00');

INSERT INTO Stories(userId, imageUrl, expiresAt, createdAt) VALUES
(1,'img/story1.jpg','2022-06-02 12:00:00','2022-06-01 12:00:00'),
(2,'img/story2.jpg','2021-09-03 13:00:00','2021-09-02 13:10:00'),
(3,'img/story3.jpg','2023-03-04 14:00:00','2023-03-03 14:20:00'),
(4,'img/story4.jpg','2020-12-25 15:00:00','2020-12-24 15:30:00'),
(5,'img/story5.jpg','2024-08-06 16:00:00','2024-08-05 16:40:00'),
(6,'img/story6.jpg','2023-11-07 17:00:00','2023-11-06 17:50:00');

INSERT INTO Comments(postId, userId, content, createdAt) VALUES
(1,2,'Nice picture!','2022-05-10 10:00:00'),
(1,3,'Love this','2022-05-10 11:30:00'),
(2,1,'Looks great','2021-08-01 12:00:00'),
(2,4,'Awesome','2021-08-01 13:10:00'),
(3,5,'Wish I was there','2023-02-15 16:20:00'),
(3,6,'Beautiful view','2023-02-15 18:40:00'),
(4,7,'So tasty','2020-12-11 19:15:00'),
(4,8,'Hungry now','2020-12-11 20:00:00'),
(5,1,'Strong bro','2024-07-20 08:20:00'),
(5,2,'Keep it up','2024-07-20 09:00:00'),
(6,3,'Crazy vibes','2023-10-09 00:10:00'),
(7,4,'Dream car','2022-01-04 15:10:00'),
(8,5,'Amazing place','2025-03-01 18:30:00'),
(9,6,'Good luck coding','2024-11-28 02:10:00'),
(10,7,'Enjoy weekend','2025-04-18 20:15:00');

INSERT INTO Likes(postId, userId, createdAt) VALUES
(1,2,'2022-05-10 10:05:00'),
(1,3,'2022-05-10 10:10:00'),
(1,4,'2022-05-10 10:20:00'),
(2,1,'2021-08-01 12:05:00'),
(2,3,'2021-08-01 12:10:00'),
(3,1,'2023-02-15 16:00:00'),
(3,5,'2023-02-15 16:30:00'),
(4,2,'2020-12-11 19:00:00'),
(4,6,'2020-12-11 19:20:00'),
(5,1,'2024-07-20 08:00:00'),
(5,7,'2024-07-20 08:30:00'),
(6,3,'2023-10-08 23:20:00'),
(6,8,'2023-10-08 23:30:00'),
(7,4,'2022-01-04 15:00:00'),
(7,5,'2022-01-04 15:30:00'),
(8,6,'2025-03-01 18:00:00'),
(8,7,'2025-03-01 18:10:00'),
(9,2,'2024-11-28 02:00:00'),
(9,8,'2024-11-28 02:20:00'),
(10,1,'2025-04-18 20:00:00');

INSERT INTO Follows(followerId, followingId, createdAt) VALUES
(1,2,'2022-03-15 12:00:00'),
(1,3,'2022-03-16 13:00:00'),
(2,1,'2021-07-23 14:00:00'),
(2,4,'2021-07-24 15:00:00'),
(3,1,'2023-01-12 16:00:00'),
(3,5,'2023-01-13 17:00:00'),
(4,2,'2020-11-06 18:00:00'),
(4,6,'2020-11-07 19:00:00'),
(5,3,'2024-06-18 20:00:00'),
(5,7,'2024-06-19 21:00:00'),
(6,4,'2023-09-03 22:00:00'),
(6,8,'2023-09-04 23:00:00'),
(7,1,'2021-12-29 10:00:00'),
(7,5,'2021-12-30 11:00:00'),
(8,2,'2025-02-20 12:00:00');
 
 SELECT * FROM Users;
 SELECT * FROM Posts;
SELECT * FROM Stories;
SELECT * FROM Comments;
 SELECT * FROM Likes;
SELECT * FROM Follows;