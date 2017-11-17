CREATE SCHEMA testSchema;
SET SCHEMA 'testschema';
-- -- CREATE STORE TABLE
CREATE TABLE STORES(
	store_id SERIAL PRIMARY KEY,
	store_name VARCHAR(100) NOT NULL,
	store_image VARCHAR NOT NULL
);

-- -- CREATE CATEGORY TABLE
CREATE TABLE CATEGORIES(
	category_id SERIAL PRIMARY KEY,
	category_name VARCHAR(100) NOT NULL,
	category_image VARCHAR NOT NULL,
	store_fk_id SERIAL
);

-- -- SET FK ON CATEGORIES TABLE
ALTER TABLE
	testschema.categories
ADD CONSTRAINT
	"store_fk_id"
FOREIGN KEY
	("store_fk_id")
REFERENCES
	testschema.stores("store_id")
;

-- -- CREATE PRODUCTS TABLE
CREATE TABLE PRODUCTS(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	product_image VARCHAR NOT NULL,
	category_fk_id SERIAL
);

-- -- SET FK ON PRODUCTS TABLE
ALTER TABLE
	testschema.products
ADD CONSTRAINT
	"category_fk_id"
FOREIGN KEY
	("category_fk_id")
REFERENCES
	testschema.categories("category_id")
;

-- -- SET MOCK DATA IN STORE TABLE
-- 7 eleven
INSERT INTO
	STORES(store_name, store_image)
VALUES
('Seven Eleven', 'http://is3.mzstatic.com/image/thumb/Purple69/v4/10/d7/42/10d74262-04eb-0155-5ed3-33b981f023ab/pr_source.png/0x0ss-85.jpg');
-- Famima
INSERT INTO
	STORES(store_name, store_image)
VALUES
('Family Mart', 'http://www.marksign.net/wp-content/uploads/2016/04/familymart.jpg');
-- LO-son
INSERT INTO
	STORES(store_name, store_image)
VALUES
('LAWSON', 'http://is3.mzstatic.com/image/thumb/Purple118/v4/d1/11/3a/d1113ae9-5beb-3ea0-da8a-14ea0b048c6c/source/1200x630bb.jpg');

-- -- STE MOCK DATA IN CATEGORY TABLE
-- [セブンイレブン] --
-- セブンおでん
INSERT INTO
	CATEGORIES(category_name, category_image, store_fk_id)
VALUES
('セブンおでん', 'http://ent.smt.docomo.ne.jp/wp-content/uploads/2016/05/20160827193311.jpg', 1);
-- セブンおにぎり
INSERT INTO
	CATEGORIES(category_name, category_image, store_fk_id)
VALUES
('セブンおにぎり', 'http://mognavi.jp/image/food/02/39/01/1063214.jpg', 1);
-- セブンスイーツ
INSERT INTO
	CATEGORIES(category_name, category_image, store_fk_id)
VALUES
('セブンスイーツ', 'http://konbinipan.com/wp-content/uploads/2015/04/76dac39ea9e988598b7ffcc84eab4abd.jpg', 1);
-- 調味料
INSERT INTO
	CATEGORIES(category_name, category_image, store_fk_id)
VALUES
('調味料', 'http://oec-daisho.com/column/wp-content/uploads/2015/07/embellir.jpg', 1);
-- セブン弁当
INSERT INTO
	CATEGORIES(category_name, category_image, store_fk_id)
VALUES
('セブン弁当', 'http://mognavi.jp/image/food/02/39/01/782486.jpg', 1);
-- 飲料
INSERT INTO
	CATEGORIES(category_name, category_image, store_fk_id)
VALUES
('飲料', 'http://a.ecimg.tw/items/DBAK3ZA9007JI4X/i010001_1475135111.jpg', 1);
-- 駄菓子
INSERT INTO
	CATEGORIES(category_name, category_image, store_fk_id)
VALUES
('駄菓子', 'http://ishikisoku.com/wp-content/uploads/2017/03/card_calbee.jpg', 1);
-- 日用品
INSERT INTO
	CATEGORIES(category_name, category_image, store_fk_id)
VALUES
('日用品', 'https://www.soukai.com/main/prdimg/y/048/y4580287282048.jpg', 1);
-- 本・雑誌・新聞
INSERT INTO
	CATEGORIES(category_name, category_image, store_fk_id)
VALUES
('本・雑誌・新聞', 'https://thumbnail.image.rakuten.co.jp/@0_mall/arne/cabinet/0005/0005a01696.jpg', 1);


-- -- STE MOCK DATA IN PRODUCTS TABLE
-- [セブンイレブン] --
-- 大根(おでん)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('大根', 'http://coop-recipe.jp/images/thumb/Ij8nGJ,53f2b7624aa31.jpg', 1);
-- こんにゃく(おでん)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('こんにゃく', 'https://www.eatsmart.jp/image/food/00/00/07/292282.jpg', 1);

-- 鮭(おにぎり)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('鮭おにぎり', 'http://www.garbagenews.com/img10/gn-20100312-02.jpg', 2);
-- 昆布(おにぎり)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('昆布', 'https://www.eatsmart.jp/image/food/02/39/01/793384.jpg', 2);
-- ツナマヨ(おにぎり)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('ツナマヨ', 'http://img1.esimg.jp/resize/120x90/image/food/02/39/01/1017884.jpg?ts=20171026162310', 2);

-- ふわっとろくりぃむわらび(セブンスイーツ)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('ふわっとろくりぃむわらび(黒蜜入り)', 'http://snack-blog.com/wp-content/uploads/2016/06/img_cs_031_1.jpg', 3);
-- 濃厚フロマージュ(セブンスイーツ)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('濃厚フロマージュ', 'http://konbinipan.com/wp-content/uploads/2015/04/76dac39ea9e988598b7ffcc84eab4abd.jpg', 3);
-- ひとくちパンプキンチーズケーキ(セブンスイーツ)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('ひとくちパンプキンチーズケーキ', 'http://konbinipan.com/wp-content/uploads/2016/10/6a08fbb55b006c9a2457bf94380f25e0.jpg.pagespeed.ce.I5mT0FDQAT.jpg', 3);

-- みりん風調味料(調味料)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('みりん風調味料', 'http://img.omni7.jp/co/productimage/0004/product/42/4902106688242/image/4902106688242_main_l.jpg', 4);
-- 明太のり弁(セブン弁当)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('明太のり弁', 'https://www.eatsmart.jp/image/food/02/39/01/1268948.jpg', 5);
-- 天然水(飲料)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('天然水', 'http://img.omni7.jp/co/productimage/0005/product/50/460150/image/46001312_00_00_main_m.jpg', 6);
-- ティッシュ(日用品)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('ティッシュ', 'http://img.omni7.jp/co/productimage/0004/product/73/4901451163473/image/4901451163473_main_m.jpg', 7);
-- Forbes(本・雑誌・新聞)
INSERT INTO
	PRODUCTS(product_name, product_image, category_fk_id)
VALUES
('Forbes', 'http://image1.shopserve.jp/434-magazineworld.com/pic-labo/forbes20143.jpg', 8);
