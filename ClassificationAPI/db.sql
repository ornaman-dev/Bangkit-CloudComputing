INSERT INTO `plants` VALUES 
(1,'Agglonema', 'Agglonema adalah tanaman hias populer dari suku talas-talasan atau Araceae. Genus Aglaonema memiliki sekitar 30 spesies. Mereka berasal dari daerah tropis dan subtropis di Asia dan Nugini. Mereka umumnya dikenal sebagai Chinese evergreens.'),
(2,'Alocasia', 'Kuping gajah (Alocasia) adalah spesies hibrida antara Alocasia longiloba dan Alocasia sanderiana. Alocasia dikenal karena daunnya yang besar dan beragam kultivar dalam spesiesnya. Kuping Gajah berasal dari Asia tropis dan Australia.'),
(3,'Gelombang Cinta', 'Gelombang cinta (Anthurium plowmanii) adalah contoh keserbagunaan. Di habitat aslinya, tanaman tropis dengan dedaunan besar yang menarik ini tumbuh sebagai epifit, paling sering menempel pada pohon. Namun karena ukuran dan berat dedaunannya, ia dapat jatuh ke tanah dan terus tumbuh sebagai tanaman terestrial. Julukan spesifik dari nama Latin, plowmanii, diberikan untuk menghormati ahli etnobotani abad ke-20 yang meninggal secara tragis, Timothy Plowman.'),
(4,'Janda Bolong', 'Janda bolong (Monstera obliqua) adalah spesies tumbuhan asli Amerika Tengah dan Selatan. Monstera obliqua dinamai untuk lubang di daunnya. Spesies ini dianggap mahal untuk dibudidayakan dan juga dianggap sebagai spesies tanaman hias yang langka. Tanaman ini memiliki daun yang khas, yaitu terdapat bolong-bolong di tengah daunnya.'),
(5,'Lidah Mertua', 'Lidah mertua (Sansevieria) dapat dianggap sebagai tanaman hias dan pajangan arsitektural karena daunnya yang seperti pedang dengan pola garis tebal, yang khas dan menarik perhatian. Lidah mertua adalah marga tanaman hias yang cukup populer sebagai penghias bagian dalam rumah karena tanaman ini dapat tumbuh dalam kondisi yang sedikit air dan cahaya matahari. Namun, berhati-hatilah dengan tanaman ini karena beracun jika tertelan dan dapat menyebabkan mual, muntah, bahkan pembengkakan tenggorokan dan lidah.'),
(6,'Lili Paris', 'Lili paris (Chlorophytum comosum) adalah tanaman abadi hijau dengan daun tipis panjang yang memberinya nama lain, "tanaman pita". Tanaman ini telah menyebar jauh dari Afrika asalnya karena mudah dirawat. Karena tanaman Lili paris tumbuh dengan baik di tempat teduh sebagian atau penuh, mereka menjadi tanaman hias yang populer.'),
(7,'Pucuk Merah', 'Pucuk merah (Syzygium myrtifolium) adalah spesies tumbuhan yang dikenal sebagai tanaman hias yang berasal dari genus Syzygium. Warna tunas daun yang baru muncul memiliki warna merah menyala sehingga tumbuhan ini memiliki sebutan Pucuk Merah. Warna daun akan berubah perlahan menjadi hijau seiring berjalannya waktu. Pucuk merah adalah sejenis tanaman perdu yang biasanya dijadikan tanaman hias di pekarangan rumah, perkantoran dan sebagainya serta masih termasuk ke dalam family yang sama dengan tanaman cengkih.'),
(8,'Suplir', 'Suplir  (Adiantum formosum) berasal dari Australia dan Selandia Baru dan ditemukan di hutan hujan, aliran air, dan ngarai. Meskipun dedaunannya terlihat halus, tanaman ini adalah tanaman yang keras dan mudah tumbuh, dengan air yang cukup. Tumbuh perlahan dan tidak suka dipindahkan begitu sudah mapan.')
;

ALTER TABLE `plants` CHANGE `desc` `desc` VARCHAR(555) NOT NULL;

SELECT users.id, users.user_name, plants.name, posts.image, posts.id
FROM users INNER JOIN posts ON users.id = posts.user_id 
INNER JOIN plants ON posts.plant_id = plants.id;

INSERT INTO `favorite` VALUES 
(1, 1, 1),
(2, 2, 3),
(3, 1, 1),
(4, 3, 2)
;

SELECT favorite.id, users.user_name AS nama, 
    plants.name AS tanaman, posts.image
FROM users 
INNER JOIN favorite ON users.id = favorite.user_id
INNER JOIN posts ON favorite.post_id = posts.id 
INNER JOIN plants ON posts.plant_id = plants.id
;

SELECT favorite.id, plants.name AS tanaman,
    posts.image, users.user_name AS postingan 
FROM users 
INNER JOIN posts ON users.id = posts.user_id
INNER JOIN plants ON posts.plant_id = plants.id
INNER JOIN favorite ON favorite.post_id = posts.id 
ORDER BY favorite.id ASC
;

SELECT users.user_name AS nama, plants.name AS tanaman
FROM posts INNER JOIN plants ON plants.id = posts.plant_id
INNER JOIN favorite ON favorite.post_id = posts.id
INNER JOIN users ON favorite.user_id = users.id
WHERE users.id = 2
;

SELECT posts.id, plants.name, posts.image, plants.desc
FROM posts INNER JOIN plants ON posts.plant_id = plants.id
WHERE plants.name = 'Suplir' OR plants.name = 'Agglonema'
;

INSERT INTO `users` VALUES
('user-97e049','John'), -- 1 post
('user-f24f39','Bob'), -- 1 post
('user-9b5b67','Sully'), -- 3 posts
('user-fb8496','Chris'), -- 2 posts
('user-c51d80','Stephen') -- 1 post
;

INSERT INTO `posts` VALUES 
('post-e99636','user-f24f39','plant-a644c9','https://storage.googleapis.com/plant-classification-images/plant-382e6ee7.jpg'),
('post-f1fd80','user-97e049','plant-460f60','https://storage.googleapis.com/plant-classification-images/plant-9b05408d.jpg'),
('post-111d59','user-9b5b67','plant-5ee69c','https://storage.googleapis.com/plant-classification-images/plant-f3dd819c.jpg'),
('post-ccd905','user-fb8496','plant-98e6b4','https://storage.googleapis.com/plant-classification-images/plant-9dc1f90d.jpg'),
('post-12f6c8','user-c51d80','plant-973e5d','https://storage.googleapis.com/plant-classification-images/plant-20f7a443.jpeg'),
('post-6fe13d','user-fb8496','plant-903512','https://storage.googleapis.com/plant-classification-images/plant-70bfb76a.jpg'),
('post-9c7c27','user-9b5b67','plant-6dad53','https://storage.googleapis.com/plant-classification-images/plant-c1bf6dff.jpg'),
('post-8367db','user-9b5b67','plant-5dcc15','https://storage.googleapis.com/plant-classification-images/plant-a91a05c8.jpeg')
;

-- SHOW USER FAV PLANTS
SELECT plants.name AS tanaman 
FROM posts INNER JOIN plants ON plants.id = posts.plant_id 
INNER JOIN favorite ON favorite.post_id = posts.id 
INNER JOIN users ON favorite.user_id = users.id 
WHERE users.id = 'user-fb8496' OR posts.id = 'post-ccd905';

-- SHOW RECOMENDED POSTS
SELECT posts.id, plants.name, posts.image, plants.desc 
FROM posts INNER JOIN plants ON posts.plant_id = plants.id 
WHERE plants.name = 'Lili Paris' AND posts.user_id != 'user-c51d80';
