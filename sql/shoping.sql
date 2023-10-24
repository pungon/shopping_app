/*
 Navicat Premium Data Transfer

 Source Server         : DataApi
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : shoping

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 24/10/2023 23:01:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rate_product` double(4, 2) NULL DEFAULT NULL,
  `cost` double(10, 1) NULL DEFAULT NULL,
  `discount` int NULL DEFAULT NULL,
  `SoldQuantity` int NULL DEFAULT NULL,
  `transport_price` double(10, 1) NULL DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `image_1` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `store_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Product 1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 4.80, 1520.0, 20, 500, 10.0, 'Description for Product 1', 'https://saveimages.blob.core.windows.net/product/product1A-img1.png,https://saveimages.blob.core.windows.net/product/product1A-img2.png', 1);
INSERT INTO `product` VALUES (2, 'Product 2', 3.80, 250.0, 10, 1250, 30.0, 'เก้าอี้สนามพับได้ พร้อมที่รองแขน ที่วางแก้วด้านข้าง\r\nขนาด 50x50x80 ซม.\r\nรับน้ำหนักได้ 120 กก.\r\nเนื้อผ้าผลิตจาก เส้นใยโพลีเอสเตอร์\r\nท่อเหล็กพ่นสีกันสนิมหนา 16 มม.\r\nขนาดเก้าอี้เมื่อกาง : 82 x 50 x 80 ซม.\r\nขนาดสินค้า: กว้าง 50 ยาว 50 สูง 80 ซม.\r\nน้ำหนักสินค้า 1.75 กก. \r\nมี 5 สี ได้แก่ สีแดง สีกรม สีเขียว สีน้ำเงิน และสีดำ', 'https://saveimages.blob.core.windows.net/product/product2B-img1.png,https://saveimages.blob.core.windows.net/product/product2B-img2.png,https://saveimages.blob.core.windows.net/product/product2B-img3.png,https://saveimages.blob.core.windows.net/product/product2B-img4.png,https://saveimages.blob.core.windows.net/product/demo.png,https://saveimages.blob.core.windows.net/product/demo2.png,https://saveimages.blob.core.windows.net/product/demo3.png', 2);
INSERT INTO `product` VALUES (3, 'Product 3', 2.50, 750.0, NULL, 800, 8.0, 'Description for Product 3', 'https://saveimages.blob.core.windows.net/product/product3C-img1.png', 3);
INSERT INTO `product` VALUES (4, 'Product 4', 2.00, 1250.0, 5, 43, 15.0, 'Description for Product 4', 'https://saveimages.blob.core.windows.net/product/product4A-img1.png', 1);
INSERT INTO `product` VALUES (5, 'Product 5', 3.20, 60.0, NULL, 5000, 6.0, 'Description for Product 5', 'https://saveimages.blob.core.windows.net/product/product5B-img1.png', 2);
INSERT INTO `product` VALUES (6, 'Product 6', 5.00, 150.0, 30, 250, 12.0, 'Description for Product 6', 'https://saveimages.blob.core.windows.net/product/product6C-img1.png', 3);
INSERT INTO `product` VALUES (7, 'Product 7', 4.00, 80.0, NULL, 275, 8.0, 'Description for Product 7', NULL, 1);
INSERT INTO `product` VALUES (8, 'Product 8', 4.00, 90.0, 15, 980, 9.0, 'Description for Product 8', NULL, 2);
INSERT INTO `product` VALUES (9, 'Product 9', 4.00, 110.0, NULL, 54, 11.0, 'Description for Product 9', NULL, 3);
INSERT INTO `product` VALUES (10, 'Product 10', 4.00, 70.0, NULL, 99, 7.0, 'Description for Product 10', NULL, 1);

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `Store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Rate_the_store` decimal(2, 1) NOT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `imageProfile_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `imageCover_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (1, 'ร้าน A', 4.5, 'ร้านค้าแห่งนี้มีสินค้าคุณภาพ', 'profile_a.jpg', 'cover_a.jpg', 'กรุงเทพฯ');
INSERT INTO `store` VALUES (2, 'ร้าน B', 3.8, 'ร้านค้าให้บริการดีมาก', 'profile_b.jpg', 'cover_b.jpg', 'ชลบุรี');
INSERT INTO `store` VALUES (3, 'ร้าน C', 4.2, 'สินค้ามีคุณภาพมากๆ', 'profile_c.jpg', 'cover_c.jpg', 'เชียงใหม่');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `product_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user1', 'pass1', 'pololy kom', '1,2');
INSERT INTO `users` VALUES (2, 'user2', 'pass2', 'sanpiti khun', '1,3');
INSERT INTO `users` VALUES (3, 'user1', 'pass3', 'test', NULL);

SET FOREIGN_KEY_CHECKS = 1;
