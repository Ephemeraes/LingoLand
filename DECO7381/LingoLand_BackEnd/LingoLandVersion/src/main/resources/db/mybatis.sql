/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : mybatis

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 11/09/2024 21:21:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for juniordata
-- ----------------------------
DROP TABLE IF EXISTS `juniordata`;
CREATE TABLE `juniordata`  (
                               `id` int(0) NOT NULL AUTO_INCREMENT,
                               `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `scontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                               `scn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                               `usphone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `trans` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                               `po` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `tranother` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of juniordata
-- ----------------------------
INSERT INTO `juniordata` VALUES (1, 'ruler', 'a 12-inch ruler', '一把12英寸的尺子', '\'rulɚ', '尺子', 'n', 'a long flat straight piece of plastic, metal, or wood that you use for measuring things or drawing straight lines');
INSERT INTO `juniordata` VALUES (2, 'pencil', 'a sharp pencil', '尖尖的铅笔', '\'pɛnsl', '铅笔', 'n', 'an instrument that you use for writing or drawing, consisting of a wooden stick with a thin piece of a black or coloured substance in the middle');
INSERT INTO `juniordata` VALUES (3, 'eraser', 'Press to bring up the eraser tool, orfind it in your Toolbox.', '按调出橡皮擦工具，或在你的工具栏里找到它。', 'ɪ\'resɚ', '橡皮', 'n', 'a small piece of rubber that you use to remove pencil or pen marks from paper');
INSERT INTO `juniordata` VALUES (4, 'crayon', 'He coloured the picture with crayon.', '他用蜡笔给画上色。', 'kreən', '蜡笔', 'n', 'a stick of coloured  wax  or  chalk  that children use to draw pictures');
INSERT INTO `juniordata` VALUES (5, 'bag', 'I took the gift out of my bag.', '我把礼物从我的包里拿出来。', 'bæɡ', '包', 'n', 'a flexible container with a single opening');
INSERT INTO `juniordata` VALUES (6, 'pen', 'a ballpoint pen', '圆珠笔', 'pɛn', '钢笔', 'n', 'an instrument for writing or drawing with ink');
INSERT INTO `juniordata` VALUES (7, 'pencil box', 'Put the pen and pencil in the pencil box.', '把钢笔和铅笔放在文具盒里。', '\'pɛnsl bɑks', '铅笔盒', 'n', '');
INSERT INTO `juniordata` VALUES (8, 'book', 'I’ve just started reading a book by Graham Greene.', '我刚开始看格雷厄姆·格林写的一本书。', 'bʊk', '书', 'n', 'a set of printed pages that are held together in a cover so that you can read them');
INSERT INTO `juniordata` VALUES (9, 'no', '‘Are you Italian?’ ‘No, I’m Spanish.’', '“你是意大利人吗？”“不，我是西班牙人。”', 'no', '不', 'adj.', 'used to give a negative reply to a question, offer, or request');
INSERT INTO `juniordata` VALUES (10, 'your', 'Could you move your car?', '你能把你的车挪一下吗？', 'jʊər; jʊr', '你（们）的', 'adj.', 'used when speaking or writing to one or more people to show that something belongs to them or is connected with them');
INSERT INTO `juniordata` VALUES (11, 'red', 'We painted the door bright red .', '我们把门漆成鲜红色。', 'rɛd', '红色；红色的', 'adj.', 'having the colour of blood');
INSERT INTO `juniordata` VALUES (12, 'green', 'beautiful green eyes', '漂亮的碧眼', 'ɡrin', '绿色；绿色的', 'adj.', 'having the colour of grass or leaves');
INSERT INTO `juniordata` VALUES (13, 'yellow', 'yellow flowers', '黄花', 'ˈjɛlo', '黄色；黄色的', 'adj.', 'having the colour of butter or the middle part of an egg');
INSERT INTO `juniordata` VALUES (14, 'blue', 'the blue waters of the lake', '蓝蓝的湖水', 'blu', '蓝色；蓝色的', 'adj.', 'having the colour of the sky or the sea on a fine day');
INSERT INTO `juniordata` VALUES (15, 'black', 'a black evening dress', '黑色晚礼服', 'blæk', '黑色；黑色的', 'adj.', 'having the darkest colour, like coal or night');
INSERT INTO `juniordata` VALUES (16, 'brown', 'dark brown hair', '深褐色的头发', 'braʊn', '棕色；棕色的', 'adj.', 'having the colour of earth, wood, or coffee');
INSERT INTO `juniordata` VALUES (17, 'white', 'a white dress', '白色连衣裙', 'hwaɪt', '白色；白色的', 'adj.', 'having the colour of milk, salt, or snow');
INSERT INTO `juniordata` VALUES (18, 'orange', 'a bright shade of orange', '鲜艳的橘黄色', '\'ɔrɪndʒ', '橙色；橙色的', 'adj.', 'a colour that is between red and yellow');
INSERT INTO `juniordata` VALUES (19, 'OK', '‘Can I take the car today?’ ‘Okay.’', '“今天我能用这辆车吗？”“行啊。”', '', '好；行', '', 'used to show that you agree with something or give permission for someone to do something');
INSERT INTO `juniordata` VALUES (20, 'mum', 'I have understood my mum. She has done all the things for the sake of me.', '现在我对未来充满了信心，我理解了妈妈，她所做的一切都是为了我。', 'mʌm', '妈妈', 'n.', 'mother');
INSERT INTO `juniordata` VALUES (21, 'face', 'She had a beautiful face.', '她面容秀美。', 'fes', '脸', 'n.', 'the front part of your head, where your eyes, nose, and mouth are');
INSERT INTO `juniordata` VALUES (22, 'ear', 'She tucked her hair behind her ears.', '她把头发拢到耳朵背后。', 'ɪr', '耳朵', 'n.', 'one of the organs on either side of your head that you hear with');
INSERT INTO `juniordata` VALUES (23, 'eye', 'He’s got beautiful eyes.', '他有一双漂亮的眼睛。', 'aɪ', '眼睛', 'n.', 'one of the two parts of the body that you use to see with');
INSERT INTO `juniordata` VALUES (24, 'nose', 'Someone punched him on the nose.', '有人一拳打在他的鼻子上。', 'noz', '鼻子', 'n.', 'the part of a person’s or animal’s face used for smelling or breathing');
INSERT INTO `juniordata` VALUES (25, 'mouth', 'He lifted his glass to his mouth.', '他把玻璃杯举到嘴边。', 'maʊθ', '嘴', 'n.', 'the part of your face which you put food into, or which you use for speaking');
INSERT INTO `juniordata` VALUES (26, 'arm', '', '', 'ɑrm', '胳膊', 'n.', 'if a man has a woman on his arm, she is walking beside him holding his arm');
INSERT INTO `juniordata` VALUES (27, 'hand', 'Steve gripped the steering wheel tightly with both hands.', '史蒂夫双手紧握方向盘。', 'hænd', '手', 'n.', 'the part of your body at the end of your arm, including your fingers and thumb, that you use to hold things');
INSERT INTO `juniordata` VALUES (28, 'head', 'He kissed the top of her head.', '他吻了一下她的头顶。', 'hɛd', '头', 'n.', 'the top part of your body that has your face at the front and is supported by your neck');
INSERT INTO `juniordata` VALUES (29, 'body', 'the human body', '人体', '\'bɑdi', '身体', 'n.', 'the physical structure of a person or animal');
INSERT INTO `juniordata` VALUES (30, 'leg', 'a young boy with skinny legs', '双腿干瘦的小男孩', 'lɛɡ', '腿', 'n.', 'one of the long parts of your body that your feet are joined to, or a similar part on an animal or insect');
INSERT INTO `juniordata` VALUES (31, 'foot', 'My foot hurts.', '我脚痛。', 'fʊt', '脚', 'n.', 'the part of your body that you stand on and walk on');
INSERT INTO `juniordata` VALUES (32, 'school', 'His mother always used to pick him up from school.', '他母亲以前一直去学校接他。', 'skul', '学校', 'n.', 'a place where children are taught');
INSERT INTO `juniordata` VALUES (33, 'duck', 'I bought her a toy duck that ran upon little wheels.', '我给她买了一个靠小轮子行走的玩具鸭子。', 'dʌk', '鸭子', 'n.', 'a very common water bird with short legs and a wide beak, used for its meat, eggs, and soft feathers');
INSERT INTO `juniordata` VALUES (34, 'pig', 'He kept pigs and poultry.', '他养过猪和家禽。', 'pɪɡ', '猪', 'n.', 'a farm animal with short legs, a fat body and a curved tail. Pigs are kept for their meat, which includes  pork  ,  bacon  and  ham  .');
INSERT INTO `juniordata` VALUES (35, 'cat', 'The police played an elaborate game of cat and mouse to trap him.', '警方跟他玩了一场精心布局的猫捉老鼠游戏，诱他落网。', 'kæt', '猫', 'n.', 'to pretend to allow someone to do or have what they want, and then to stop them from doing or having it');
INSERT INTO `juniordata` VALUES (36, 'bear', '', '', 'bɛr', '熊', 'n.', '');
INSERT INTO `juniordata` VALUES (37, 'dog', 'I could hear a dog barking .', '我听到了狗吠声。', 'dɔɡ', '狗', 'n.', 'a common animal with four legs, fur, and a tail. Dogs are kept as pets or trained to guard places, find drugs etc.');
INSERT INTO `juniordata` VALUES (38, 'elephant', 'The hunter destroyed the elephant.', '猎手射杀了那头大象。', 'ˈɛləfənt', '大象', 'n.', 'a very large grey animal with four legs, two tusks(= long curved teeth ) and a trunk(= long nose ) that it can use to pick things up');
INSERT INTO `juniordata` VALUES (39, 'monkey', 'The monkey engulfed the food whole.', '这只猴子囫囵吞下食物。', '\'mʌŋki', '猴子', 'n.', 'a small brown animal with a long tail, which uses its hands to climb trees and lives in hot countries');
INSERT INTO `juniordata` VALUES (40, 'bird', 'wild birds', '野鸟', 'bɝd', '鸟', 'n.', 'a creature with wings and feathers that can usually fly. Many birds sing and build nests, and female birds lay eggs');
INSERT INTO `juniordata` VALUES (41, 'tiger', 'A tiger lives off some small animals.', '老虎靠吃一些小动物为生。', '\'taɪɡɚ', '老虎', 'n.', 'a large wild animal that has yellow and black lines on its body and is a member of the cat family');
INSERT INTO `juniordata` VALUES (42, 'panda', 'The caged panda chafed against the bars.', '笼子里的大熊猫贴在栅栏上蹭它的身体。', '\'pændə', '大熊猫', 'n.', 'a large black and white animal that looks like a bear and lives in the mountains of China');
INSERT INTO `juniordata` VALUES (43, 'zoo', 'They taxied to the zoo.', '他们乘出租车去动物园。', 'zu', '动物园', 'n.', 'a place, usually in a city, where animals of many kinds are kept so that people can go to look at them');
INSERT INTO `juniordata` VALUES (44, 'funny', 'the funniest man in Britain', '英国最滑稽的男人', '\'fʌni', '滑稽的；好笑的', 'adj.', 'making you laugh');
INSERT INTO `juniordata` VALUES (45, 'bread', 'Would you like some bread with your soup?', '你喝汤时要吃点面包吗？', 'brɛd', '面包', 'n.', 'a type of food made from flour and water that is mixed together and then baked');
INSERT INTO `juniordata` VALUES (46, 'juice', 'a carton of orange juice', '一纸盒橙汁', 'dʒus', '果汁', 'n.', 'the liquid that comes from fruit and vegetables, or a drink that is made from this');
INSERT INTO `juniordata` VALUES (47, 'egg', 'Blackbirds lay their eggs in March.', '乌鸫在3月产蛋。', 'ɛɡ', '蛋', 'n.', 'a round object with a hard surface, that contains a baby bird, snake, insect etc and which is produced by a female bird, snake, insect etc');
INSERT INTO `juniordata` VALUES (48, 'milk', 'a bottle of milk', '一瓶奶', 'mɪlk', '牛奶', 'n.', 'a white liquid produced by cows or goats that is drunk by people');
INSERT INTO `juniordata` VALUES (49, 'water', 'There’s water all over the bathroom floor.', '浴室地面上都是水。', 'ˈwɔtɚ', '水', 'n.', 'the clear liquid without colour, smell, or taste that falls as rain and that is used for drinking, washing etc');
INSERT INTO `juniordata` VALUES (50, 'cake', 'We had cake and ice cream.', '我们吃了蛋糕和冰激凌。', 'kek', '蛋糕', 'n.', 'a soft sweet food made by baking a mixture of flour, butter, sugar, and eggs');
INSERT INTO `juniordata` VALUES (51, 'fish', 'Over 1,500 different species of fish inhabit the waters around the reef.', '那片礁石周围的水域生活着1,500多种不同的鱼类。', 'fɪʃ', '鱼', 'n.', 'an animal that lives in water, and uses its  fins  and tail to swim');
INSERT INTO `juniordata` VALUES (52, 'rice', 'a tasty sauce served with rice or pasta', '配米饭或意面的美味酱汁', 'raɪs', '米饭', 'n.', 'a food that consists of small white or brown grains that you boil in water until they become soft enough to eat');
INSERT INTO `juniordata` VALUES (53, 'one', 'They had one daughter.', '他们有一个女儿。', 'wʌn', '一', 'num.', 'the number 1');
INSERT INTO `juniordata` VALUES (54, 'two', 'I’ll be away for almost two weeks.', '我要离开差不多两周时间。', 'tu', '二', 'num.', 'the number 2');
INSERT INTO `juniordata` VALUES (55, 'three', 'They’ve won their last three games.', '他们赢了最近三场比赛。', 'θri', '三', 'num.', 'the number 3');
INSERT INTO `juniordata` VALUES (56, 'four', 'She is married with four children.', '她已婚，有四个孩子。', 'fɔr', '四', 'num.', 'the number 4');
INSERT INTO `juniordata` VALUES (57, 'five', 'There is also a golf course five miles away.', '五英里外还有个高尔夫球场。', 'faɪv', '五', 'num.', 'the number 5');
INSERT INTO `juniordata` VALUES (58, 'six', 'six months ago', '六个月前', 'sɪks', '六', 'num.', 'the number 6');
INSERT INTO `juniordata` VALUES (59, 'seven', 'The women visited cities in seven states.', '这些女性访问了七个州的城市。', '\'sɛvn', '七', 'num.', 'the number 7');
INSERT INTO `juniordata` VALUES (60, 'eight', 'It’s only eight days till Christmas.', '还有8天就到圣诞节了。', 'et', '八', 'num.', 'the number 8');
INSERT INTO `juniordata` VALUES (61, 'nine', 'He’s only been in this job for nine months.', '他干这份工作才九个月。', 'naɪn', '九', 'num.', 'the number 9');
INSERT INTO `juniordata` VALUES (62, 'ten', 'Snow had been falling steadily for ten days.', '雪已经连续下了10天了。', 'tɛn', '十', 'num.', 'the number 10');
INSERT INTO `juniordata` VALUES (63, 'brother', 'I have two brothers, William and Mark.', '我有两个兄弟，威廉和马克。', '\'brʌðɚ', '兄；弟', 'n.', 'a male who has the same parents as you');
INSERT INTO `juniordata` VALUES (64, 'plate', 'The plates were piled high with rice.', '盘子里都堆满了米饭。', 'pleɪt', '盘子', 'n.', 'a flat and usually round dish that you eat from or serve food on');

-- ----------------------------
-- Table structure for middledata
-- ----------------------------
DROP TABLE IF EXISTS `middledata`;
CREATE TABLE `middledata`  (
                               `id` int(0) NOT NULL,
                               `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `scontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                               `scn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                               `usphone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `trans` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                               `po` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `tranother` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of middledata
-- ----------------------------
INSERT INTO `middledata` VALUES (1, 'science', 'Many leading scientists do not consider that science can give absolutely reliable knowledge.', '许多杰出科学家都不认为科学能够提供绝对可靠的知识。', '\'saɪəns', '科学', 'n', 'knowledge about the world, especially based on examining, testing, and proving facts');
INSERT INTO `middledata` VALUES (2, 'museum', 'the Museum of Modern Art', '现代艺术博物馆', 'mjuˈzɪəm', '博物馆', 'n', 'a building where important  cultural  , historical, or scientific objects are kept and shown to the public');
INSERT INTO `middledata` VALUES (3, 'post office', 'The hotel is opposite the post office.', '邮局的对过是旅馆。', 'ˈpost ɔfɪs', '邮局', 'n', 'a place where you can buy stamps, send letters and packages etc');
INSERT INTO `middledata` VALUES (4, 'bookstore', 'He lit upon some jest books in the bookstore.', '他在书店偶然发现了一些笑话集。', 'bʊkstɔr', '书店', 'n', 'a shop that sells books');
INSERT INTO `middledata` VALUES (5, 'cinema', 'It’s on at the local cinema.', '此片正在当地影院上映。', '\'sɪnəmə', '电影院', 'n', 'a building in which films are shown');
INSERT INTO `middledata` VALUES (6, 'hospital', 'They are building a new hospital.', '他们正在建一家新医院。', '\'hɑspɪtl', '医院', 'n', 'a large building where sick or injured people receive medical treatment');
INSERT INTO `middledata` VALUES (7, 'crossing', 'Turn left at the first crossing.', '在第一个十字路口左转。', '\'krɔsɪŋ', '十字路口', 'n', 'a place where two lines, roads, tracks etc cross');
INSERT INTO `middledata` VALUES (8, 'turn', 'Ricky turned and walked away.', '里基转身走了。', 'tɝn', '转弯', 'v', 'to move your body so that you are looking in a different direction');
INSERT INTO `middledata` VALUES (9, 'left', 'She held out her left hand.', '她伸出左手。', 'lɛft', '左', 'adj', 'your left side is the side of your body that contains your heart');
INSERT INTO `middledata` VALUES (10, 'on foot', 'He vainly hope to travel round the world on foot.', '他梦想步行周游世界。', '', '步行', '', '');
INSERT INTO `middledata` VALUES (11, 'by', 'The price of oil fell by a further $2 a barrel.', '每桶油价又下跌了两美元。', 'baɪ', '乘', 'prep', 'used to say how great a change or difference is');
INSERT INTO `middledata` VALUES (12, 'bus', 'I took a bus to San Francisco.', '我乘公共汽车去旧金山。', 'bʌs', '公共汽车', 'n', 'a large vehicle that people pay to travel on');
INSERT INTO `middledata` VALUES (13, 'plane', 'It is a big airline with a large fleet of planes.', '这是一家大航空公司，拥有庞大的机群。', 'plen', '飞机', 'n', 'a vehicle that flies in the air and has wings and at least one engine');
INSERT INTO `middledata` VALUES (14, 'taxi', 'They sent me home in a taxi.', '他们用出租车把我送回家。', '\'tæksi', '出租汽车', 'n', 'a car and driver that you pay to take you somewhere');
INSERT INTO `middledata` VALUES (15, 'ship', 'the ship’s captain', '这艘船的船长', 'ʃɪp', '船', 'n', 'a large boat used for carrying people or goods across the sea');
INSERT INTO `middledata` VALUES (16, 'subway', 'the New York City subway', '纽约市的地铁', '\'sʌbwe', '地铁', 'n', 'a railway system that runs under the ground below a big city');
INSERT INTO `middledata` VALUES (17, 'train', 'We went all the way to Inverness by train.', '我们一路坐火车到因弗内斯。', 'tren', '火车', 'n', 'a set of several carriages that are connected to each other and pulled along a railway line by an engine');
INSERT INTO `middledata` VALUES (18, 'slow', 'The car was travelling at a very slow speed.', '汽车正以非常慢的速度行驶。', 'sloʊ', '慢的', 'adj', 'not moving, being done, or happening quickly');
INSERT INTO `middledata` VALUES (19, 'down', 'Keep your speed down.', '速度放慢。', 'daʊn', '减少', 'v', 'at or towards a level or amount that is less');
INSERT INTO `middledata` VALUES (20, 'slow down', 'You will need to slow down for a while.', '你将会需要放松一会儿。', '', '慢下来', '', 'If someone slows down or if something slows them down, they become less active');
INSERT INTO `middledata` VALUES (21, 'stop', 'He stopped suddenly when he saw Ruth.', '他一看到露丝，便突然停住了。', 'stɑp', '停下', 'v', 'to not walk, move, or travel any more, or to make someone or something do this');
INSERT INTO `middledata` VALUES (22, 'Mrs', 'It is said that Mrs White rules her husband strictly.', '据说怀特夫人对她的丈夫管得很严。', 'ˈmɪsɪz', '夫人', 'adj', '');
INSERT INTO `middledata` VALUES (23, 'early', 'the early morning sunshine', '清晨的阳光', '\'ɝli', '早到的', 'adv', 'in the first part of a period of time, event, or process');
INSERT INTO `middledata` VALUES (24, 'helmet', 'The Sword split the Knight\'s helmet and bit him fatally.', '剑劈开了骑士的头盔并致命地刺进他。', '\'hɛlmɪt', '头盔', 'n', 'a strong hard hat that soldiers,  motorcycle  riders, the police etc wear to protect their heads');
INSERT INTO `middledata` VALUES (25, 'must', 'All passengers must wear seat belts.', '所有乘客都必须系安全带。', 'mʌst', '必须', 'mod', 'to have to do something because it is necessary or important, or because of a law or order');
INSERT INTO `middledata` VALUES (26, 'wear', 'Susanna was wearing a black silk dress.', '苏珊娜穿着一条黑色真丝连衣裙。', 'wɛr', '戴', 'v', 'to have something such as clothes, shoes, or jewellery on your body');
INSERT INTO `middledata` VALUES (27, 'attention', 'My attention wasn’t really on the game.', '我的注意力其实不在比赛上。', 'ə\'tɛnʃən', '注意', 'n', 'when you carefully listen to, look at, or think about someone or something');
INSERT INTO `middledata` VALUES (28, 'pay attention to', 'In this materialistic age we do not have time to pay attention to our surroundings.', '在这唯物主义的时代里，我们没有时间去注意我们周围的世界。', '', '注意', '', '');
INSERT INTO `middledata` VALUES (29, 'traffic', 'There wasn’t much traffic on the roads.', '路上车辆不多。', '\'træfɪk', '交通', 'n', 'the vehicles moving along a road or street');
INSERT INTO `middledata` VALUES (30, 'traffic lights', 'It\'s so much safer to get across the road at the traffic lights.', '在有交通红绿灯的地方横穿马路要安全得多。', '', '交通信号灯', '', 'a set of red, yellow, and green lights that control traffic');
INSERT INTO `middledata` VALUES (31, 'Munich', 'And then we went to Munich.', '然后我们去了慕尼黑。', '\'mju:nik', '慕尼黑', 'n', '');
INSERT INTO `middledata` VALUES (32, 'Germany', 'Germany borders on France.', '德国与法国接壤。', '\'dʒɝməni', '德国', 'n', '');
INSERT INTO `middledata` VALUES (33, 'Alaska', 'Like I said, perfect, if you live in Alaska.', '像我说过的，完美，如果你住在阿拉斯加的话。', 'ə\'læskə', '阿拉斯加州', 'n', '');
INSERT INTO `middledata` VALUES (34, 'sled', 'She tumbled over a sled.', '她被雪橇绊了一跤。', 'slɛd', '雪橇', 'n', 'A sled is the same as a ');
INSERT INTO `middledata` VALUES (35, 'fast', 'Slow down – you’re driving too fast.', '慢点——你开得太快了。', 'fæst', '快的', 'adj', 'moving quickly');
INSERT INTO `middledata` VALUES (36, 'ferry', 'I left my bag of film on the  ferry.', '我把装底片的旅行袋遗放在渡船上.', '\'fɛri', '轮渡', 'n', 'a boat that carries people or goods across a river or a narrow area of water');
INSERT INTO `middledata` VALUES (37, 'Papa Westray', 'Papa Westray has a population of just 70 and no secondary school.', '帕帕韦斯特雷岛人口只有70，岛上没有中学。', '', '帕帕韦斯特雷岛', '', '');
INSERT INTO `middledata` VALUES (38, 'Scotland', 'He traveled Scotland last year.', '他去年在苏格兰旅行。', '\'skɔtlənd', '苏格兰', 'n', '');
INSERT INTO `middledata` VALUES (39, 'visit', 'Eric went to Seattle to visit his cousins.', '埃里克到西雅图去看望他的表兄弟。', '\'vɪzɪt', '拜访', 'v', 'to go and spend time in a place or with someone, especially for pleasure or interest');
INSERT INTO `middledata` VALUES (40, 'film', 'Have you seen any good films recently?', '你最近看过什么好的影片吗？', 'fɪlm', '电影', 'n', 'a story that is told using sound and moving pictures, shown at a cinema or on television');
INSERT INTO `middledata` VALUES (41, 'see a film', 'Plan a weekend to go out with friends to barbecue countryside, see a film, play electronic games, play footaball or barly take a walk together.', '安排个周末跟朋友一起，一起去野外烧烤、看电影、玩电子游戏、踢足球、或者只是一起走走。', '', '看电影', '', '');
INSERT INTO `middledata` VALUES (42, 'trip', 'Two lucky employees won a round-the-world trip.', '两名幸运的雇员赢得一次环游世界的机会。', 'trɪp', '旅行', 'n', 'a visit to a place that involves a journey, for pleasure or a particular purpose');
INSERT INTO `middledata` VALUES (43, 'take a trip', 'Fred and Jeff are friends. They want to take a trip together.', '国庆节快要来临了，弗雷德和杰夫是朋友，他们想一起去旅行。', '', '去旅行', '', '');
INSERT INTO `middledata` VALUES (44, 'supermarket', 'His eyes roved round the supermarket.', '他的眼睛环视了一下超级市场。', '\'sʊpɚ\'mɑrkɪt', '超市', 'n', 'a very large shop that sells food, drinks, and things that people need regularly in their homes');
INSERT INTO `middledata` VALUES (45, 'evening', 'I do most of my studying in the evening.', '我学习大都在晚上。', '\'ivnɪŋ', '晚上', 'n', 'the early part of the night between the end of the day and the time you go to bed');
INSERT INTO `middledata` VALUES (46, 'tonight', 'I think I’ll go to bed early tonight.', '我想今晚我会早点上床睡觉。', 'tə\'naɪt', '今晚', 'adv', 'during the night of this day');
INSERT INTO `middledata` VALUES (47, 'tomorrow', 'Our class is going to London tomorrow.', '我们班明天要去伦敦。', 'tə\'mɔro', '明天', 'adv', 'on or during the day after today');
INSERT INTO `middledata` VALUES (48, 'next week', 'He will speak to us next week.', '下星期他将给我们做讲演。', 'nɛkst wik', '下周', '', '');
INSERT INTO `middledata` VALUES (49, 'dictionary', 'a German-English dictionary', '一本德英词典', '\'dɪkʃə\'nɛri', '词典', 'n', 'a book that gives a list of words in alphabetical order and explains their meanings in the same language, or another language');
INSERT INTO `middledata` VALUES (50, 'comic', 'a comic novel', '滑稽小说', '\'kɑmɪk', '滑稽的', 'n', 'amusing you and making you want to laugh');
INSERT INTO `middledata` VALUES (51, 'comic book', '...comic book heroes such as Spider Man.', '…连环漫画杂志中的男主角，如蜘蛛人。', '', '连环画', '', 'A comic book is a magazine that contains stories told in pictures');
INSERT INTO `middledata` VALUES (52, 'word', 'Write an essay of about five hundred words.', '写一篇约500字的文章。', 'wɝd', '单词', 'n', 'a single group of letters that are used together with a particular meaning');
INSERT INTO `middledata` VALUES (53, 'word book', '', '', '\'wɝk\'bʊk', '单词书', '', '');
INSERT INTO `middledata` VALUES (54, 'post card', 'Send them a post card.', '寄给他们一张明信片。', '', '明信片', '', 'A postcard is a thin card, often with a picture on one side, which you can write on and mail to people without using an envelope');
INSERT INTO `middledata` VALUES (55, 'lesson', 'piano lessons', '钢琴课', '\'lɛsn', '课', 'n', 'a period of time in which someone is taught a particular skill, for example how to play a musical instrument or drive a car');
INSERT INTO `middledata` VALUES (56, 'space', 'How much space is there on each disk?', '每张磁盘有多大容量？', 'spes', '太空', 'n', 'the amount of an area, room, container etc that is empty or available to be used');
INSERT INTO `middledata` VALUES (57, 'travel', 'They travelled 200 miles on the first day.', '他们第一天行进了200英里。', '\'trævl', '旅行', 'v', 'to go a particular distance or at a particular speed');
INSERT INTO `middledata` VALUES (58, 'half', 'Only half the guests had arrived by seven o’clock.', '7点钟前只来了一半客人。', 'hæf', '一半', 'adj', 'exactly or about 50% (1/2) of an amount, time, distance, number etc');
INSERT INTO `middledata` VALUES (59, 'price', 'She balked at the price.', '她对这价格犹豫不决。', 'praɪs', '价格', 'n', 'the amount of money you have to pay for something');
INSERT INTO `middledata` VALUES (60, 'Mid-Autumn Festival', 'Thus informed, the people rose together on the designated day to overthrow the Yuan, and since that time mooncakes have become an integral part of the Mid-Autumn Festival.', '后来，人们在八月十五那天集合起来推翻了元朝统治。 从那以后，月饼成为中秋节不可或缺的元素。', '', '中秋节', '', 'The Mid-Autumn Festival is a Chinese festival that is held to celebrate the end of the summer harvest, when the crops have been gathered. It is also called the . ');
INSERT INTO `middledata` VALUES (61, 'together', 'We’ve very much enjoyed working together .', '我们在一起工作非常开心。', 'tə\'ɡɛðɚ', '一起', 'adv', 'if two or more people do something together, they do it with each other');
INSERT INTO `middledata` VALUES (62, 'get together', 'A whole range of people from all backgrounds can get together and enjoy themselves.', '出身经历各异的人们可以聚在一起玩得很开心。', '', '聚会', '', 'When people get together, they meet in order to discuss something or to spend time together');
INSERT INTO `middledata` VALUES (63, 'mooncake', 'Parents make mooncakes, moon masks, and lanterns with their children.', '家长们与他们的孩子们一起制作月饼、月亮形面具和灯笼。', '\'munkeɪk', '月饼', 'n', 'A mooncake is a type of cake that is eaten during the Chinese . It is filled with a thick paste, and often has a salted egg inside it. ');
INSERT INTO `middledata` VALUES (64, 'poem', 'You need to touch up the poem.', '你需要给这首诗润色一下。', '\'poəm', '诗', 'n', 'a piece of writing that expresses emotions, experiences, and ideas, especially in short lines using words that  rhyme (= end with the same sound ) ');
INSERT INTO `middledata` VALUES (65, 'moon', 'the craters on the surface of the moon', '月球表面的环形山', 'mun', '月亮', 'n', 'the round object that you can see shining in the sky at night, and that moves around the Earth every 28 days');
INSERT INTO `middledata` VALUES (66, 'studies', '...a relaxed and happy atmosphere that will allow you to study to your full potential.', '…一个将使你学习到充分发挥潜能的轻松又愉快的氛围。', '\'stʌdiz', '学习', 'n', 'If you study, you spend time learning about a particular subject or subjects');
INSERT INTO `middledata` VALUES (67, 'puzzle', 'The meaning of the poem has always been a puzzle.', '那首诗的含义始终是个谜。', '\'pʌzl', '谜', 'n', 'something that is difficult to understand or explain');
INSERT INTO `middledata` VALUES (68, 'hiking', 'We’re going to do some hiking this summer.', '今年夏天我们要去远足。', '\'haɪkɪŋ', '远足', 'n', 'the activity of taking long walks in the mountains or country');
INSERT INTO `middledata` VALUES (69, 'pen pal', 'She: In my high school French class, there was a pen pal requirement.', '她 ：在高中的法语课上，要求每个人交一名笔友。', '', '笔友', '', 'someone you make friends with by writing letters, especially someone who lives in another country and who you have never met');
INSERT INTO `middledata` VALUES (70, 'hobby', 'What are your hobbies?', '你有些什么爱好？', '\'hɑbi', '业余爱好', 'n', 'an activity that you enjoy doing in your free time');
INSERT INTO `middledata` VALUES (71, 'jasmine', '', '', '\'dʒæzmɪn', '茉莉', 'n', 'a plant that grows up a wall, frame etc and has small sweet-smelling white or yellow flowers');
INSERT INTO `middledata` VALUES (72, 'idea', 'You should talk to Ken – he\'s always full of good ideas.', '你应该和肯谈谈，他总是满脑子好主意。', 'aɪ\'diə', '主意', 'n', 'a plan or suggestion for a possible course of action, especially one that you think of suddenly');
INSERT INTO `middledata` VALUES (73, 'Canberra', 'In Australia, climate change is a political football, kicked about in the power game played in Canberra.', '在澳大利亚，气候变化是政治足球，在堪培拉的权力游戏中被踢来踢去。', '\'kænbərə', '堪培拉', '', '');
INSERT INTO `middledata` VALUES (74, 'amazing', 'He’s an amazing player to watch.', '看他比赛那才叫精彩呢。', 'ə\'mezɪŋ', '令人惊奇的', 'a', 'very good, especially in an unexpected way');
INSERT INTO `middledata` VALUES (75, 'shall', 'Shall I get the keys?', '我拿钥匙可以吗？', 'ʃəl', '表示征求意见', 'mod', 'You use shall with \"I\" and \"we\" in questions in order to make offers or suggestions, or to ask for advice');
INSERT INTO `middledata` VALUES (76, 'goal', 'He dribbled past the fullback and scored a goal.', '他越过对方后卫，趁势把球踢入球门。', 'ɡol', '射门', 'n', 'the area between two posts where the ball must go in order to score in games such as football or  hockey ');
INSERT INTO `middledata` VALUES (77, 'join', 'When did you join the Labour Party?', '你何时加入工党的？', 'dʒɔɪn', '加入', 'v', 'to become a member of an organization, society, or group');
INSERT INTO `middledata` VALUES (78, 'club', 'Manchester United Football Club', '曼联（队）足球俱乐部', 'klʌb', '俱乐部', 'n', 'a professional organization including the players, managers, and owners of a sports team');
INSERT INTO `middledata` VALUES (79, 'share', 'We don’t have enough books so you’ll have to share.', '我们书不够，所以你们得合着用。', 'ʃɛr', '分享', 'v', 'to have or use something with other people');
INSERT INTO `middledata` VALUES (80, 'factory', 'a car factory', '汽车制造厂', '\'fæktri', '工厂', 'n', 'a building or group of buildings in which goods are produced in large quantities, using machines');
INSERT INTO `middledata` VALUES (81, 'worker', 'workers in the tourist industry', '旅游行业工作者', '\'wɝkɚ', '工人', 'n', 'someone who does a job, especially a particular type of job');
INSERT INTO `middledata` VALUES (82, 'postman', 'That postman is in charge of this route.', '那个邮递员负责这条投递线路。', '\'postmən', '邮递员', 'n', 'someone whose job is to collect and deliver letters');
INSERT INTO `middledata` VALUES (83, 'businessman', 'A businessman will grasp at any chance to make a profit.', '一个商人会抓住任何一个机会赚钱。', '\'bɪznəsmæn', '商人', 'n', 'a man who works in business');
INSERT INTO `middledata` VALUES (84, 'police officer', 'The police officer said your country [Pakistan] is not secure but I still prefer to live there. I love my country.', '警官说你们巴基斯坦现在也不安全，但是我仍然希望回到祖国去生活，我爱我的祖国。', 'pəˈlis ˈɔfɪsɚ', '警察', 'n', 'a member of the police');
INSERT INTO `middledata` VALUES (85, 'fisherman', 'In scorn of that audience, he imagines another audience, another audience to write for and to emulate, an audience represented by the fisherman.', '讽刺这个观众，他想象着另一个观众，可以为之写作，做榜样的观众，渔夫代表了这个观众。', '\'fɪʃɚmən', '渔民', 'n', 'someone who catches fish as a sport or as a job');
INSERT INTO `middledata` VALUES (86, 'scientist', 'He is a scientist of high prestige.', '他是一位有声望的科学家。', '\'saɪəntɪst', '科学家', 'n', 'someone who works or is trained in science');
INSERT INTO `middledata` VALUES (87, 'pilot', 'an airline pilot', '航空公司飞行员', '\'paɪlət', '飞行员', 'n', 'someone who operates the controls of an aircraft or spacecraft');
INSERT INTO `middledata` VALUES (88, 'coach', 'a tennis coach', '网球教练', 'kotʃ', '教练', 'n', 'someone who trains a person or team in a sport');
INSERT INTO `middledata` VALUES (89, 'country', 'the Scandinavian countries', '斯堪的纳维亚国家', '\'kʌntri', '国家', 'n', 'an area of land that is controlled by its own government, president, king etc');
INSERT INTO `middledata` VALUES (90, 'head teacher', 'The head teacher said pupils’, parents’ and other teachers’ opinions were sought before the uniform rules were changed.', '校长说，在修改这一着装规定之前，已经征求过学生、家长和其他老师的意见。', '', '校长', '', 'the teacher who is in charge of a school');
INSERT INTO `middledata` VALUES (91, 'sea', 'Jay stripped his clothes off and ran into the sea.', '杰伊脱光衣服奔入海里。', 'si', '大海', 'n', 'the large area of salty water that covers much of the Earth’s surface');
INSERT INTO `middledata` VALUES (92, 'stay', 'Rollings will stay as chairman this year.', '罗林斯今年将继续担任主席一职。', 'ste', '保持', 'v', 'to continue to be in a particular position, place, or state, without changing');
INSERT INTO `middledata` VALUES (93, 'university', 'He teaches Esperanto at that university.', '他在那所大学教世界语。', ',junɪ\'vɝsəti', '大学', 'n', 'an educational institution at the highest level, where you study for a degree');
INSERT INTO `middledata` VALUES (94, 'gym', 'I go to the gym as often as I can.', '我一有空就去健身房健身。', 'dʒɪm', '体育馆', 'n', 'a special building or room that has equipment for doing physical exercise');
INSERT INTO `middledata` VALUES (95, 'if', 'We’ll stay at home if it rains.', '如果下雨，我们就待在家里。', 'ɪf', '如果', 'prep', 'used when talking about something that might happen or be true, or might have happened');
INSERT INTO `middledata` VALUES (96, 'reporter', 'a news reporter', '新闻记者', 'rɪ\'pɔrtɚ', '记者', 'n', 'someone whose job is to write about news events for a newspaper, or to tell people about them on television or on the radio');
INSERT INTO `middledata` VALUES (97, 'use', 'Can I use your phone?', '我可以用一下你的电话吗？', 'juz', '使用', 'v', 'if you use a particular tool, method, service, ability etc, you do something with that tool, by means of that method etc, for a particular purpose');
INSERT INTO `middledata` VALUES (98, 'type', 'italic type', '斜体字', 'taɪp', '打字', 'n', 'printed letters');
INSERT INTO `middledata` VALUES (99, 'quickly', 'We need to get this finished as quickly as possible.', '我们必须尽快完成此事。', '\'kwɪkli', '迅速地', 'adv', 'fast');
INSERT INTO `middledata` VALUES (100, 'secretary', 'My secretary will fax you all the details.', '我的秘书会把所有的细节发传真给你。', '\'sɛkrətɛrɪ', '秘书', 'n', 'someone who works in an office  typing  letters, keeping records, answering telephone calls, arranging meetings etc');
INSERT INTO `middledata` VALUES (101, 'angry', 'I was angry because he hadn’t told me his plans.', '我很生气，因为他没有告诉我他的计划。', 'ˈæŋgrɪ', '生气的', 'adj', 'feeling strong emotions which make you want to shout at someone or hurt them because they have behaved in an unfair, cruel, offensive etc way, or because you think that a situation is unfair, unacceptable etc');
INSERT INTO `middledata` VALUES (102, 'afraid', 'There’s no need to be afraid.', '没有必要害怕。', 'ə\'fred', '害怕', 'v', 'frightened because you think that you may get hurt or that something bad may happen');
INSERT INTO `middledata` VALUES (103, 'sad', '', '', 'sæd', '难过的', 'adj', 'not happy, especially because something unpleasant has happened');
INSERT INTO `middledata` VALUES (104, 'worried', 'She gave me a worried look.', '她担心地看了我一眼。', '\'wɝrɪd', '担心的', 'adj', 'unhappy because you keep thinking about a problem, or about something bad that might happen');
INSERT INTO `middledata` VALUES (105, 'happy', 'It’s a lovely house and we’ve been very happy here.', '房子很漂亮，我们住在这里非常开心。', '\'hæpɪ', '高兴的', 'adj', 'having feelings of pleasure, for example because something good has happened to you or you are very satisfied with your life');
INSERT INTO `middledata` VALUES (106, 'see a doctor', 'You\'re hacking these days, you should go to see a doctor.', '这几天你总是干咳，你得找医生看一看啦。', '', '看病', '', '');
INSERT INTO `middledata` VALUES (107, 'wear.', 'Susanna was wearing a black silk dress.', '苏珊娜穿着一条黑色真丝连衣裙。', 'wɛr', '穿', 'v', 'to have something such as clothes, shoes, or jewellery on your body');
INSERT INTO `middledata` VALUES (108, 'more', 'More and more people are surviving heart attacks.', '越来越多的人在心脏病发作后存活下来。', 'mɔr', '更多的', 'adj', 'You use more to indicate that there is a greater amount of something than before or than average, or than something else. You can use \"a little,\" \"a lot,\" \"a bit,\" \"far,\" and \"much\" in front of more. ');
INSERT INTO `middledata` VALUES (109, 'deep', 'a deep wound', '很深的伤口', 'dip', '深的', 'adj', 'going far in from the outside or from the front edge of something');
INSERT INTO `middledata` VALUES (110, 'breath', 'Slow down, I need to catch my breath.', '慢一点，我要喘口气。', 'brɛθ', '呼吸', 'v', 'to start breathing normally again after running or making a lot of effort');
INSERT INTO `middledata` VALUES (111, 'take a deep breath', 'I did just have to take a deep breath and push the publish button regardless of the fear.', '我实在只需要深呼吸一口，然后不管什么恐惧，点一下发布按钮就好了。', '', '深呼吸', '', '');
INSERT INTO `middledata` VALUES (112, 'count', 'I was amazed at the number of plants - I counted 147.', '我对植物的数量之多感到惊讶，我数了有147棵。', 'kaʊnt', '数数', 'v', 'to calculate the total number of things or people in a group');
INSERT INTO `middledata` VALUES (113, 'count to ten', 'Before you blow up and say something you\'ll regret later - count to ten.', '在你自我膨胀并说出一些会后悔的话之前——先数到十吧。', '', '数到十', '', '');
INSERT INTO `middledata` VALUES (114, 'chase', 'The dogs saw him running and chased him.', '那些狗看到他在跑就追他。', '', '追赶', 'v', 'to quickly follow someone or something in order to catch them');
INSERT INTO `middledata` VALUES (115, 'mice', 'Cats prey on birds and mice.', '猫捕食鸟类及老鼠。', 'maɪs', '老鼠', 'n', '');
INSERT INTO `middledata` VALUES (116, 'bad', 'The bad weather conditions prevented the plane from landing.', '恶劣的天气使飞机无法着陆。', 'bæd', '邪恶的', 'adj', 'Something that is bad is unpleasant, harmful, or undesirable');
INSERT INTO `middledata` VALUES (117, 'hurt', 'Was anyone hurt in the accident?', '事故中有人受伤吗？', 'hɝ​t', '受伤', 'v', 'to injure yourself or someone else');
INSERT INTO `middledata` VALUES (118, 'ill', 'Bridget can’t come – she’s ill.', '布里奇特不能来了，她生病了。', 'ɪl', '有病', 'adj', 'suffering from a disease or not feeling well');
INSERT INTO `middledata` VALUES (119, 'wrong', 'Is anything wrong? You haven’t said more than two words since you got here.', '出什么事啦？你到这儿以后还没说超过两句话呢。', 'rɔŋ', '有毛病', 'adj', 'used to describe a situation where there are problems, or when someone is ill or unhappy');
INSERT INTO `middledata` VALUES (120, 'should', 'What should I do? Should I trust him?', '我该怎么办？我应该相信他吗？', 'ʃəd; strong form ʃʊd', '应该', 'mod', 'used to give or ask for advice');
INSERT INTO `middledata` VALUES (121, 'feel', 'Do you still feel hungry?', '你还觉得饿吗？', 'fil', '觉得', 'v', 'to experience a particular physical feeling or emotion');
INSERT INTO `middledata` VALUES (122, 'well', 'He had the operation yesterday, and he’s doing very well.', '他昨天做了手术，恢复得很好。', 'wɛl', '健康', 'adv', 'if someone who has been ill is doing well, they are becoming healthy again');
INSERT INTO `middledata` VALUES (123, 'sit', 'The parliament building sits in a large square.', '议会大楼位于一个大广场上。', 'sɪt', '坐', 'v', 'to be in a particular position or condition');
INSERT INTO `middledata` VALUES (124, 'grass', 'I walked across the grass.', '我走在草地上。', 'ɡræs', '草坪', 'n', 'an area of grass, especially an area where the grass is kept cut short');
INSERT INTO `middledata` VALUES (125, 'ant', 'In the dry season, it could be attacked by another species of ant.', '在干燥的季节里,它可能会遭到另一个种类的蚂蚁攻击。', 'ænt', '蚂蚁', 'n', 'a small insect that lives in large groups');
INSERT INTO `middledata` VALUES (126, 'worry', 'You’ve really got no need to worry about your weight.', '你真的不必担心你的体重。', 'ˈwʌrɪ', '担心', 'v', 'to be anxious or unhappy about someone or something, so that you think about them a lot');
INSERT INTO `middledata` VALUES (127, 'stuck', 'Sara tried to open the window but it was stuck.', '萨拉想打开窗户，但窗户卡住了。', 'stʌk', '陷住', 'adj', 'impossible or unable to move from a particular position');
INSERT INTO `middledata` VALUES (128, 'mud', 'By the end of the game, all the kids were covered in mud.', '到了比赛快结束的时候，所有的孩子都浑身是泥。', 'mʌd', '泥', 'n', 'wet earth that has become soft and sticky');
INSERT INTO `middledata` VALUES (129, 'pull', 'Mom! Davey’s pulling my hair!', '妈妈! 戴维拽我的头发！', 'pʊl', '拉', 'v', 'to use your hands to make something or someone move towards you or in the direction that your hands are moving');
INSERT INTO `middledata` VALUES (130, 'everyone', 'If everyone is ready, I’ll begin.', '如果大家都准备好了，我就开始。', '\'ɛvrɪwʌn', '每人', 'n', 'every person');
INSERT INTO `middledata` VALUES (131, 'be proud of', 'You are the pride of us , you will be proud of us in the future.', '你现在是我们的骄傲，我们将来才能是你的自豪。', '', '为...骄傲；感到自豪', '', '');
INSERT INTO `middledata` VALUES (132, 'absent', 'students who are regularly absent from school', '经常缺课的学生', 'ˈæbsnt;(for v.)əbˈsɛnt', '缺席的；不在的', 'adj', 'not at work, school, a meeting etc, because you are sick or decide not to go');
INSERT INTO `middledata` VALUES (133, 'fail', 'It looks likely that the peace talks will fail.', '看来和平谈判可能会失败。', 'fel', '失败；未能（做到）', 'v', 'to not succeed in achieving something');
INSERT INTO `middledata` VALUES (134, 'examination', 'The examination results will be announced in September.', '考试成绩将于9月公布。', 'ɪg\'zæmə\'neʃən', '考试；审查', 'n', 'a spoken or written test of knowledge, especially an important one');
INSERT INTO `middledata` VALUES (135, 'boarding school', 'She and her brother are both at boarding school.', '她和她弟弟都在寄宿学校念书。', '', '寄宿学校', '', 'a school where students live as well as study');
INSERT INTO `middledata` VALUES (136, 'leaf', 'a flowering bush with large shiny leaves', '叶子大而油亮的开花灌木', 'lif', '叶子', 'n', 'one of the flat green parts of a plant that are joined to its stem or branches');
INSERT INTO `middledata` VALUES (137, 'in person', 'You have to sign for it in person.', '你必须亲自签收。', '', '亲身；亲自', '', 'if you do sth in person , you go somewhere and do it yourself, instead of doing it by letter, asking sb else to do it, etc.');
INSERT INTO `middledata` VALUES (138, 'exactly', 'It’s exactly half past five.', '一分不差，正好5点半。', 'ɪɡ\'zæktli', '确切地；精确地', 'adv', 'used when emphasizing that something is no more and no less than a number or amount, or is completely correct in every detail');
INSERT INTO `middledata` VALUES (139, 'pride', 'He wore his medals with pride.', '他自豪地戴着奖章。', 'praɪd', '自豪；骄傲', 'n', 'a feeling that you are proud of something that you or someone connected with you has achieved');
INSERT INTO `middledata` VALUES (140, 'take pride in', 'It is right that we should care about and take pride in the way we express ourselves.', '我们就应该时时在意自己的表达方式，并且要引以为豪，这也是应有的态度。', '', '为...感到自豪', '', '');
INSERT INTO `middledata` VALUES (141, 'grandson', 'My grandson\'s birthday was on Tuesday.', '我孙子的生日是星期二。', '\'ɡrænsʌn', '孙子；外孙', 'n', 'the son of your son or daughter');
INSERT INTO `middledata` VALUES (142, 'general', 'There has been a general decline in standards.', '道德水准普遍下降。', '\'dʒɛnrəl', '普遍的；常规的；总的', 'adj', 'involving the whole of a situation, group, or thing, rather than specific parts of it');
INSERT INTO `middledata` VALUES (143, 'introduction', 'Pete, are you going to make the introductions?', '皮特，你来作一下介绍吧。', ',ɪntrə\'dʌkʃən', '介绍', 'n', 'the act of formally telling two people each other’s names when they first meet');
INSERT INTO `middledata` VALUES (144, 'Paula', 'Peter asks Paula to go to dinner.', '彼得请保拉去共进晚餐。', '\'pɔ:lə', '葆拉 （女名）', '', '');
INSERT INTO `middledata` VALUES (145, 'Alfred', '\"On going around with the boys, I guess.\" said Alfred.', '“我想是和朋友们一起出去，”艾尔弗雷德说。', '\'ælfrɪd', '艾尔弗雷德（男名）', '', '');
INSERT INTO `middledata` VALUES (146, 'Billy', 'Billy：But what if my friends see me.', '比利：但要是我朋友看到怎幺办。', '', '比利（男名）', '', '');
INSERT INTO `middledata` VALUES (147, 'Candy', '', '', '', '坎迪（女名）', '', '');
INSERT INTO `middledata` VALUES (148, 'Jerry', '', '', '', '杰里（男名）；杰丽（女名）', '', '');
INSERT INTO `middledata` VALUES (149, 'Emily', 'At times, Henrietta would tell me she felt slightly guilty that Emily enjoyed staying with her so much.', '有时，亨利埃塔会对我说，埃米莉如此喜欢和她待在一起，让她感到有些内疚。', '\'emili', '埃米莉（女名）', '', '');
INSERT INTO `middledata` VALUES (150, 'material', 'curtain material', '窗帘布', 'mə\'tɪrɪəl', '衣料，布料；材料，原料', 'n', 'cloth used for making clothes, curtains etc');
INSERT INTO `middledata` VALUES (151, 'chopsticks', 'We still lack a pair of chopsticks.', '还少一双筷子。', '\'tʃɑp,stɪks', '筷子', 'n', 'a pair of narrow sticks that are used for eating East Asian food');
INSERT INTO `middledata` VALUES (152, 'coin', 'Toss a coin to see who goes first.', '抛硬币决定谁先来。', 'kɔɪn', '硬币', 'n', 'a piece of metal, usually flat and round, that is used as money');
INSERT INTO `middledata` VALUES (153, 'fork', 'Put the knives and forks on the table.', '把刀叉摆放在桌子上。', 'fɔrk', '餐叉，叉子', 'n', 'a tool you use for picking up and eating food, with a handle and three or four points');
INSERT INTO `middledata` VALUES (154, 'blouse', 'a silk blouse', '丝质女衬衫', 'blaʊs', '（女士）短上衣；衬衫', 'n', 'a shirt for women');
INSERT INTO `middledata` VALUES (155, 'sliver', 'a sliver of glass ＃', '一块玻璃碎片', '\'slɪvɚ', '小块，薄片；碎片，裂片', 'n', 'a small pointed or thin piece that has been cut or broken off something');
INSERT INTO `middledata` VALUES (156, 'glass', 'a glass bowl', '玻璃碗', 'ɡlæs', '玻璃', 'n', 'a transparent solid substance used for making windows, bottles etc');
INSERT INTO `middledata` VALUES (157, 'cotton', 'a white cotton shirt', '白色棉布衬衫', '\'kɑtn', '棉；棉花', 'n', 'cloth or thread made from the white hair of the cotton plant');
INSERT INTO `middledata` VALUES (158, 'steel', 'a steel bridge', '钢铁大桥', 'stil', '钢；钢铁', 'n', 'strong metal that can be shaped easily, consisting of iron and  carbon');
INSERT INTO `middledata` VALUES (159, 'grass', 'She enjoyed the feel of grass beneath her feet.', '她喜欢踩在草上的感觉。', 'ɡræs', '草；草地', 'n', 'a very common plant with thin leaves that covers the ground in fields and gardens and is often eaten by animals');
INSERT INTO `middledata` VALUES (160, 'leaf.', 'a flowering bush with large shiny leaves', '叶子大而油亮的开花灌木', 'lif', '叶；叶子', 'n', 'one of the flat green parts of a plant that are joined to its stem or branches');
INSERT INTO `middledata` VALUES (161, 'produce', 'New drugs are producing remarkable results .', '新药正在产生显著的效果。', 'prəˈdus;(for n.)ˈprɒdus; prɑdus', '引起；造成；产生；制造；生产；出产', 'v', 'to cause a particular result or effect');
INSERT INTO `middledata` VALUES (162, 'widely', 'Organic food is now widely available.', '现在有机食品很多地方都可买到。', '\'waɪdli', '广泛地；普遍地', 'adv', 'in a lot of different places or by a lot of people');
INSERT INTO `middledata` VALUES (163, 'process', 'Goats’ cheese may be processed in many ways.', '山羊奶干酪可以有多种加工方法。', 'proˈsɛs;(for n.)prɑsɛs', '加工；处理', 'v', 'to make food, materials, or goods ready to be used or sold, for example by preserving or improving them in some way');
INSERT INTO `middledata` VALUES (164, 'France', 'Germany borders on France.', '德国与法国接壤。', '', '法国', '', '');
INSERT INTO `middledata` VALUES (165, 'no matter', 'The effect of pushing the button is the same no matter who does it.', '不论是什么人去按电钮， 其效果都是一样的。', '', '不论；无论', '', '');
INSERT INTO `middledata` VALUES (166, 'local', 'local hospital', '当地医院', 'ˈloʊkl', '当地的；本地的', 'adj', 'relating to the particular area you live in, or the area you are talking about');
INSERT INTO `middledata` VALUES (167, 'even though', 'I have friends even though I am a man of few words. ＃', '虽然我是个寡言的人，但我也有自己的朋友。', '', '虽然；即使', '', 'despite the fact or belief that; no matter whether');
INSERT INTO `middledata` VALUES (168, 'brand', 'products which lack a strong brand image', '缺乏鲜明品牌形象的产品', 'brænd', '品牌；牌子', 'n', 'a type of product made by a particular company, that has a particular name or design');
INSERT INTO `middledata` VALUES (169, 'avoid', 'Road safety is taught to young children to avoid road accidents.', '小孩子受到道路安全知识的教育，以避免交通事故。', 'ə\'vɔɪd', '避免；回避', 'v', 'to prevent something bad from happening');
INSERT INTO `middledata` VALUES (170, 'product', 'The London factory assembles the finished product .', '伦敦工厂组装成品。', '\'prɑdʌkt', '产品；制品', 'n', 'something that is grown or made in a factory in large quantities, usually in order to be sold');
INSERT INTO `middledata` VALUES (171, 'handbag', 'A man twitched the handbag from her hand.', '一个人从她手中抢走了手提包。', '\'hænd\'bæg', '小手提包', 'n', 'a small bag in which a woman carries money and personal things');
INSERT INTO `middledata` VALUES (172, 'mobile', 'mobile air-conditioners', '移动式空调器', 'ˈməʊbl;mobil', '可移动的；非固定的', 'adj', 'not fixed in one position, and easy to move and use in different places');
INSERT INTO `middledata` VALUES (173, 'Germany', 'Germany borders on France.', '德国与法国接壤。', '\'dʒɝməni', '德国', '', '');
INSERT INTO `middledata` VALUES (174, 'surface', 'Nearly 10% of the Earth’s surface is covered by ice.', '地球表面将近 10% 被冰层覆盖。', '\'sɝfɪs', '表面；表层', 'n', 'the top layer of an area of water or land');

-- ----------------------------
-- Table structure for seniordata
-- ----------------------------
DROP TABLE IF EXISTS `seniordata`;
CREATE TABLE `seniordata`  (
  `id` int(0) NOT NULL,
  `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `scn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `usphone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `trans` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `po` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tranother` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seniordata
-- ----------------------------
INSERT INTO `seniordata` VALUES (1, 'textbook', 'a biology textbook', '一本生物教科书', '\'tɛkstbʊk', '教科书；课本', 'n', 'a book that contains information about a subject that people study, especially at school or college');
INSERT INTO `seniordata` VALUES (2, 'conversation', 'a telephone conversation', '电话交谈', ',kɑnvɚ\'seʃən', '交谈；谈话', 'n', 'an informal talk in which people exchange news, feelings, and thoughts');
INSERT INTO `seniordata` VALUES (3, 'aloud', 'When we were children, our father read aloud to us.', '当我们是孩子时，我们的父亲大声地朗读给我们听。', 'ə\'laʊd', '大声地；出声地', 'adv', 'if you read, laugh, say something etc aloud, you read etc so that people can hear you');
INSERT INTO `seniordata` VALUES (4, 'pronunciation', 'She gave the word its French pronunciation.', '她给出了这个单词的法语发音。', 'prə,nʌnsɪ\'eʃən', '发音；读音', 'n', 'the way in which a language or a particular word is pronounced');
INSERT INTO `seniordata` VALUES (5, 'sentence', 'His voice dropped at the end of the sentence.', '到句子结尾处，他压低了嗓音。', '\'sɛntəns', '句子', 'n', 'a group of words that usually contains a subject and a verb, and expresses a complete idea. Sentences written in English begin with a capital letter and usually end with a  full stop  or a  question mark');
INSERT INTO `seniordata` VALUES (6, 'patient', 'You’ll just have to be patient and wait till I’m off the phone.', '你只能耐心点，等我打完电话。', 'ˈpeʃənt', '有耐心的', 'adj', 'able to wait calmly for a long time or to accept difficulties, people’s annoying behaviour etc without becoming angry');
INSERT INTO `seniordata` VALUES (7, 'expression', 'Student leaders are demanding greater freedom of expression (= the right to say what you think without being punished ).', '学生领袖要求得到更多的言论自由。', 'ɪk\'sprɛʃən', '表达（方式）；表示', 'n', 'something you say, write, or do that shows what you think or feel');
INSERT INTO `seniordata` VALUES (8, 'discover', 'The body was discovered in a field.', '尸体是在一块田地里找到的。', 'dɪ\'skʌvɚ', '发现', 'v', 'to find someone or something, either by accident or because you were looking for them');
INSERT INTO `seniordata` VALUES (9, 'secret', 'I can’t tell you. It’s a secret.', '我不能告诉你，这是个秘密。', '\'sikrɪt', '秘密；秘诀', 'n', 'something that is kept hidden or that is known about by only a few people');
INSERT INTO `seniordata` VALUES (10, 'fall in love with', '', '', '', '爱上；与...相爱', '', '');
INSERT INTO `seniordata` VALUES (11, 'grammar', 'Check your spelling and grammar.', '检查你的拼写和语法。', '\'græmɚ', '语法', 'n', 'the rules by which words change their forms and are combined into sentences, or the study or use of these rules');
INSERT INTO `seniordata` VALUES (12, 'repeat', 'Can you repeat your question?', '你能重复一遍你的问题吗？', 'rɪ\'pit', '重复；重说；重写；重做', 'v', 'to say or write something again');
INSERT INTO `seniordata` VALUES (13, 'note', 'Can I borrow your lecture notes?', '我能不能借用一下你的课堂笔记？', 'not', '笔记；记录', 'n', 'something that you write down to remind yourself of something');
INSERT INTO `seniordata` VALUES (14, 'pal', 'They talked like old pals.', '他们像老朋友一样交谈。', 'pæl', '朋友；伙伴', 'n', 'Your pals are your friends');
INSERT INTO `seniordata` VALUES (15, 'pattern', 'Weather patterns have changed in recent years.', '气候模式近年已经发生了变化。', '\'pætɚn', '模式；方式', 'n', 'the regular way in which something happens, develops, or is done');
INSERT INTO `seniordata` VALUES (16, 'physics', '...the laws of physics.', '…物理学定律。', '\'fɪzɪks', '物理；物理学', 'n', 'the science concerned with the study of physical objects and substances, and of natural forces such as light, heat, and movement');
INSERT INTO `seniordata` VALUES (17, 'chemistry', 'a person’s body chemistry', '人体的化学组成', '\'kɛmɪstri', '化学', 'n', 'the science that is concerned with studying the structure of substances and the way that they change or combine with each other');
INSERT INTO `seniordata` VALUES (18, 'partner', 'Clare’s my tennis partner.', '克莱尔是我的网球搭档。', '\'pɑrtnɚ', '搭档；同伴', 'n', 'someone you do a particular activity with, for example dancing or playing a game against two other people');
INSERT INTO `seniordata` VALUES (19, 'pronounce', 'How do you pronounce your name?', '你的名字怎么念？', 'prə\'naʊns', '发音', 'v', 'to make the sound of a letter, word etc, especially in the correct way');
INSERT INTO `seniordata` VALUES (20, 'increase', 'The population increased dramatically in the first half of the century.', '该世纪上半叶，人口大幅度增加。', '\'ɪnkris', '增加；增长', 'v', 'if you increase something, or if it increases, it becomes bigger in amount, number, or degree');
INSERT INTO `seniordata` VALUES (21, 'speed', 'The truck was travelling at a speed of 50 mph.', '卡车正以 50 英里的时速在行驶。', 'spid', '速度', 'n', 'the rate at which something moves or travels');
INSERT INTO `seniordata` VALUES (22, 'ability', 'the ability to walk', '行走的能力', 'əˈbɪlətɪ', '能力；才能', 'n', 'the state of being able to do something');
INSERT INTO `seniordata` VALUES (23, 'brain', 'Messages from the brain are carried by the central nervous system.', '大脑发出的信息是通过中枢神经系统传递的。', 'bren', '大脑', 'n', 'the organ inside your head that controls how you think, feel, and move');
INSERT INTO `seniordata` VALUES (24, 'active', 'games for active youngsters', '活跃好动的年轻人玩的游戏', '\'æktɪv', '活跃的；积极的', 'adj', 'always busy doing things, especially physical or mental activities');
INSERT INTO `seniordata` VALUES (25, 'attention', 'My attention wasn’t really on the game.', '我的注意力其实不在比赛上。', 'ə\'tɛnʃən', '注意；关注', 'n', 'when you carefully listen to, look at, or think about someone or something');
INSERT INTO `seniordata` VALUES (26, 'pay attention to', 'In this materialistic age we do not have time to pay attention to our surroundings.', '在这唯物主义的时代里，我们没有时间去注意我们周围的世界。', '', '注意；关注', '', '');
INSERT INTO `seniordata` VALUES (27, 'connect', 'We’d like two rooms with connecting doors (= doors that join the rooms ) .', '我们想要两个有门相通的房间。', 'kə\'nɛkt', '（使）连接；与...有联系', 'v', 'to join two or more things together');
INSERT INTO `seniordata` VALUES (28, 'connect … with', 'There is no evidence to connect them with the attack.', '没有证据把他们和这次袭击联系在一起。', '', '把...和...连接或联系起来', '', '');
INSERT INTO `seniordata` VALUES (29, 'overnight', 'Pam’s staying overnight at my house.', '帕姆要在我家过夜。', '\'ovənaɪt', '一夜之间；在夜间', 'adv', 'for or during the night');
INSERT INTO `seniordata` VALUES (30, 'review', 'a review of the year', '对这一年的回顾', 'rɪ\'vju', '回顾', 'n', 'a report on a series of events or a period of time, that mentions the most important parts');
INSERT INTO `seniordata` VALUES (31, 'knowledge', 'He did not have much knowledge of American history.', '他对美国历史所知不多。', '\'nɑlɪdʒ', '知识；学问', 'n', 'the information, skills, and understanding that you have gained through learning or experience');
INSERT INTO `seniordata` VALUES (32, 'wisely', 'Sian had very wisely left the party before all the trouble started.', '沙恩很明智地在一切麻烦开始之前就离开了那个聚会。', '\'waɪzli', '明智地；聪明地', 'adv', 'showing good judgment');
INSERT INTO `seniordata` VALUES (33, 'Annie', 'After the movie was finished, my husband reminded me that I am an Annie Sullivan.', '看完电影后，我丈夫提醒我说，我就是一个安妮·莎莉文式的人。', '', '安妮（女名）', '', '');
INSERT INTO `seniordata` VALUES (34, 'Alexander Graham Bell', 'It is the story of Alexander Graham Bell.', '这就是亚历山大·格雷厄姆·贝尔的故事。', '', '亚历山大 • 格雷厄姆 • 贝尔', '', '');
INSERT INTO `seniordata` VALUES (35, 'lantern', 'Light the lantern, take it and go down stairs.', '你把这灯笼点起来，带着它下楼去。', '\'læntɚn', '灯笼', 'n', 'a lamp that you can carry, consisting of a metal container with glass sides that surrounds a flame or light');
INSERT INTO `seniordata` VALUES (36, 'stranger', 'Children must not talk to strangers.', '小孩子千万不要同陌生人说话。', '\'strendʒɚ', '陌生人', 'n', 'someone that you do not know');
INSERT INTO `seniordata` VALUES (37, 'relative', 'a gathering of friends and relatives', '亲朋好友的聚会', '\'rɛlətɪv', '亲属；亲戚', 'n', 'a member of your family');
INSERT INTO `seniordata` VALUES (38, 'put on', 'I can eat what I want but I never put on weight.', '我想吃什么就能吃什么，而体重从不增加。', 'pʊt ɑn', '增加（体重）；发胖', '', 'If someone puts on weight, they become heavier');
INSERT INTO `seniordata` VALUES (39, 'pound', 'Moira weighs about 130 pounds.', '莫伊拉的体重约为130磅。', 'paʊnd', '磅（重量单位）；英镑（英国货币单位）', 'n', 'a unit for measuring weight, equal to 16  ounce s  or 0.454 kilograms');
INSERT INTO `seniordata` VALUES (40, 'folk', 'folk tales', '民间故事', 'fok', '民间的；民俗的', 'adj', 'folk art, stories, customs etc are traditional and typical of the ordinary people who live in a particular area');
INSERT INTO `seniordata` VALUES (41, 'goddess', 'Aphrodite, goddess of love', '爱神阿佛洛狄忒', 'ɡɑdɪs', '女神', 'n', 'a female  being  who is believed to control the world or part of it, or represents a particular quality');
INSERT INTO `seniordata` VALUES (42, 'steal', 'Boys broke into a shop and stole £45 in cash.', '男孩们闯进一家商店，盗走了45英镑现金。', 'stil', '偷；窃取', 'v', 'to take something that belongs to someone else');
INSERT INTO `seniordata` VALUES (43, 'lay', 'He laid his hand on my shoulder.', '他把一只手搭在我的肩上。', 'le', '放置；安放；产（卵）；下（蛋）', 'v', 'to put someone or something down carefully into a flat position');
INSERT INTO `seniordata` VALUES (44, 'lay out', 'Grace laid out the knives and forks on the table.', '格雷丝把刀叉摆放在桌子上。', '\'lei,aut', '摆放；布置', '', 'If you lay out a group of things, you spread them out and arrange them neatly, for example, so that they can all be seen clearly');
INSERT INTO `seniordata` VALUES (45, 'dessert', 'I have the menu all planned out, from the appetizers to the dessert.', '所有东西我都策划出了，写在菜单上，有开胃食品，也有餐后甜点。', 'dɪ\'zɝt', '（饭后）甜点；甜食', 'n', 'sweet food served after the main part of a meal');
INSERT INTO `seniordata` VALUES (46, 'garden', 'He’s outside in the garden.', '他在外面花园里。', '\'ɡɑrdn', '花园；园子', 'n', 'the area of land next to a house, where there are flowers, grass, and other plants, and often a place for people to sit');
INSERT INTO `seniordata` VALUES (47, 'admire', 'We stopped halfway to admire the view .', '我们中途停下来观赏风景。', 'ədˈmaɪr', '欣赏；仰慕', 'v', 'to look at something and think how beautiful or impressive it is');
INSERT INTO `seniordata` VALUES (48, 'tie', 'I wear a shirt and tie at work.', '我上班穿衬衫打领带。', 'taɪ', '领带', 'n', 'a long narrow piece of cloth tied in a knot around the neck, worn by men');
INSERT INTO `seniordata` VALUES (49, 'haunted', 'a haunted house', '闹鬼的房子', '\'hɔntɪd', '有鬼魂出没的；闹鬼的', 'adj', 'a haunted building is believed to be visited regularly by the soul of a dead person');
INSERT INTO `seniordata` VALUES (50, 'ghost', 'They say the young girl’s ghost still haunts (= often appears in ) the house.', '他们说那个少女的鬼魂依旧在那房子里出没。', 'ɡost', '鬼；鬼魂', 'n', 'the spirit of a dead person that some people think they can feel or see in a place');
INSERT INTO `seniordata` VALUES (51, 'trick', 'Pretending he doesn’t remember is an old trick of his.', '假装不记得是他的老花招了。', 'trɪk', '花招；把戏', 'n', 'something you do in order to deceive someone');
INSERT INTO `seniordata` VALUES (52, 'treat', 'We treated Mom to lunch at the Savoy.', '我们请妈妈在萨沃伊酒店吃午饭。', 'trit', '款待；招待', 'n', 'something special that you give someone or do for them because you know they will enjoy it');
INSERT INTO `seniordata` VALUES (53, 'spider', 'a spider\'s web', '蛛网', '\'spaɪdɚ', '蜘蛛', 'n', 'a small creature with eight legs, which catches insects using a fine network of sticky threads');
INSERT INTO `seniordata` VALUES (54, 'Christmas', 'Are you going home for Christmas?', '你回家过圣诞节吗？', '', '圣诞节', 'n', 'the period of time around December 25th, the day when Christians celebrate the birth of Christ');
INSERT INTO `seniordata` VALUES (55, 'fool', 'What a fool she had been to think that he would stay.', '她竟然那么傻，以为他会留下来。', 'ful', '蠢人；傻瓜', 'n', 'a stupid person or someone who has done something stupid');
INSERT INTO `seniordata` VALUES (56, 'lie', 'Don’t lie in the sun for too long.', '不要在日光下躺太长时间。', '', '平躺；处于', 'v', 'to be in a position in which your body is flat on the floor, on a bed etc');
INSERT INTO `seniordata` VALUES (57, 'novel', 'a novel by Jane Austen', '简·奥斯丁的小说', 'ˈnɑːvl', '（长篇）小说', 'n', 'a long written story in which the characters and events are usually imaginary');
INSERT INTO `seniordata` VALUES (58, 'eve', 'We’re arriving on Christmas Eve.', '我们将在平安夜到达。', '', '（尤指宗教节假日的）前夕；前夜', 'n', 'the night or day before an important day');
INSERT INTO `seniordata` VALUES (59, 'bookstore', 'He lit upon some jest books in the bookstore.', '他在书店偶然发现了一些笑话集。', 'bʊkstɔr', '书店', 'n', 'a shop that sells books');
INSERT INTO `seniordata` VALUES (60, 'dead', 'Her mother had been dead for ten years.', '她母亲去世十年了。', 'dɛd', '死的；失去生命的', 'adj', 'no longer alive');
INSERT INTO `seniordata` VALUES (61, 'business', 'Students on the course learn about all aspects of business.', '这门课程的学生要学习商业活动的各个方面。', 'ˈbɪznɪs', '生意；商业', 'n', 'the activity of making money by producing or buying and selling goods, or providing services');
INSERT INTO `seniordata` VALUES (62, 'punish', 'Smacking is not an acceptable way of punishing a child.', '要惩罚孩子，不应该用打的方式。', '\'pʌnɪʃ', '处罚；惩罚', 'v', 'to make someone suffer because they have done something wrong or broken the law');
INSERT INTO `seniordata` VALUES (63, 'warn', '‘Be careful, the rocks are slippery,’ Alex warned.', '“小心，岩石很滑。”亚历克斯提醒说。', 'wɔrn', '警告；告诫', 'v', 'to tell someone that something bad or dangerous may happen, so that they can avoid it or prevent it');
INSERT INTO `seniordata` VALUES (64, 'present', 'I’m looking for a present for Mark.', '我在找一份礼物送给马克。', 'prɪˈzɛnt;(for n.)ˈprɛznt', '礼物；现在', 'n', 'something you give someone on a special occasion or to thank them for something');
INSERT INTO `seniordata` VALUES (65, 'nobody', 'I knocked on the door but nobody answered.', '我敲了敲门，但没人应门。', '\'nəubədi, -bɔdi', '没有人', 'pron', 'no one');
INSERT INTO `seniordata` VALUES (66, 'warmth', 'She went further into the room, drawn by the warmth of the fire.', '她被火的温暖吸引着，走进了房间。', 'wɔrmθ', '温暖；暖和', 'n', 'the heat something produces, or when you feel warm');
INSERT INTO `seniordata` VALUES (67, 'spread', 'the rapid spread of cholera in Latin America', '霍乱在拉丁美洲的迅速传播', 'sprɛd', '蔓延；传播', 'n', 'when something affects or is known about by more people or involves a larger area');
INSERT INTO `seniordata` VALUES (68, 'Macao', 'These are ferries that ply between Hong Kong and Macao.', '这些是往返香港和澳门间的渡轮。', 'mə\'kau', '澳门', '', '');
INSERT INTO `seniordata` VALUES (69, 'Chiang Mai', 'I caught the trees in the water for this shot, which is the one that reminds me of my time in Chiang Mai.', '我拍到了这张树木倒影在水面的照片，这样的景象也让我想起了那段在清迈的时光。', '', '清迈（泰国城市）', '', '');
INSERT INTO `seniordata` VALUES (70, 'Halloween', 'What should I be for Halloween?', '万圣节我该打扮成什么模样？', 'ˌhæloˈin', '万圣节前夕', '', 'the night of October 31st, which is now celebrated by children, who dress in costumes and go from house to house asking for sweets, especially in the US and Canada. In the past, people believed the souls of dead people appeared on Halloween.');
INSERT INTO `seniordata` VALUES (71, 'Valentine’s Day', 'On this Valentine’s Day, just like every day, all I have is love for you.', '如同每一个平常的日子，我在这个情人节里所拥有的东西，就是对你的爱。', '', '情人节', '', '');
INSERT INTO `seniordata` VALUES (72, 'Clara', 'Clara, I heard nothing of what you said but that du.', '克拉拉，你说的其他话我都没听见，只听见了那个“你”。', '\'klærə', '克拉拉（女名）', '', '');
INSERT INTO `seniordata` VALUES (73, 'Santa', 'From then on，red stockings were hung by the chimney in hopes Santa would fill them with gifts.', '从那以后，红色长筒袜就常被挂在烟囱上，希望圣诞老人能够在里面塞满礼物。', '\'sæntə', '圣诞老人', '', '');
INSERT INTO `seniordata` VALUES (74, 'Charles  Dickens', '', '', '', '查尔斯 • 狄更斯（英国作家）', '', '');
INSERT INTO `seniordata` VALUES (75, 'Scrooge', 'What a bunch of Scrooges.', '真是一群吝啬鬼。', '', '斯克鲁奇', '', '');
INSERT INTO `seniordata` VALUES (76, 'Jacob   Marley', '', '', '', '雅各布 • 马利', '', '');
INSERT INTO `seniordata` VALUES (77, 'restroom', 'In a hurry to get back to campus for a college class, he instead visited a restroom after spending hours in line and left without as much as a souvenir.', '在排队苦苦等候了几个小时之后，他才进入公园，去了一趟公共厕所，就急急忙忙的赶回大学校园去上课。 他走时甚至连一件像样的纪念品都没买。', '\'rɛstrum', '（美）洗手间；公共厕所', 'n', 'In a restaurant, theatre, or other public place, a restroom is a room with a toilet for customers to use');
INSERT INTO `seniordata` VALUES (78, 'stamp', 'a 29-cent stamp', '一枚 29 美分的邮票', 'stæmp', '邮票；印章', 'n', 'a small piece of paper that you buy and stick onto an envelope or package before posting it');
INSERT INTO `seniordata` VALUES (79, 'postcard', 'Don’t forget to send us a postcard!', '别忘了给我们寄张明信片！', '\'post\'kɑrd', '明信片', 'n', 'a card that can be sent in the post without an envelope, especially one with a picture on it');
INSERT INTO `seniordata` VALUES (80, 'pardon', '‘Hurry up Jonathan!’ ‘Pardon?’ ‘I said hurry up!’', '“快点，乔纳森！”“你说什么啊？”“我说快点！”', '\'pɑrdn', '请再说一遍；抱歉，对不起', 'interj', 'used when you want someone to repeat something because you did not hear it');
INSERT INTO `seniordata` VALUES (81, 'washroom', '', '', '\'wɑʃrum', '洗手间；厕所', 'n', 'a room in a public building where you can wash and use the toilet');
INSERT INTO `seniordata` VALUES (82, 'bathroom', 'Where’s the bathroom?', '洗手间在哪里？', '\'bæθrum', '洗手间；浴室', 'n', 'a room where there is a toilet');
INSERT INTO `seniordata` VALUES (83, 'quick', 'That was quick! I thought you’d be another hour.', '很快啊！我以为你还要一个小时呢。', 'kwɪk', '快的；迅速的', 'adj', 'lasting for or taking only a short time');
INSERT INTO `seniordata` VALUES (84, 'rush', 'He does not intend to rush his decision.', '他不想仓促作出决定。', 'rʌʃ', '仓促；急促', 'v', 'to do or decide something too quickly, especially so that you do not have time to do it carefully or well');
INSERT INTO `seniordata` VALUES (85, 'suggest', 'The zoo asked its visitors to suggest a name for the new baby panda.', '动物园请游客提建议，给刚出生的大熊猫起一个名字。', 'sə\'dʒɛst', '建议；提议', 'v', 'to tell someone your ideas about what they should do, where they should go etc');
INSERT INTO `seniordata` VALUES (86, 'staff', 'The entire staff has done an outstanding job this year.', '今年全体员工工作都非常出色。', 'stæf', '全体职员；职工', 'n', 'the people who work for an organization');
INSERT INTO `seniordata` VALUES (87, 'grape', 'a bunch of grapes', '一串葡萄', 'ɡrep', '葡萄', 'n', 'one of a number of small round green or purple fruits that grow together on a  vine . Grapes are often used for making wine');
INSERT INTO `seniordata` VALUES (88, 'central', 'He lives in central London.', '他住在伦敦市中心。', '\'sɛntrəl', '中心的；中央的', 'adj', 'in the middle of an area or an object');
INSERT INTO `seniordata` VALUES (89, 'mail', 'The post office got behind in delivering Christmas mail.', '邮局没有及时发送圣诞节邮件。', 'mel', '邮件；信件', 'n', 'the letters and packages that are delivered to you');
INSERT INTO `seniordata` VALUES (90, 'east', 'I don’t know the east coast well.', '我不太熟悉东海岸。', 'ist', '东方的；东部的', 'adj', 'in the east or facing the east');
INSERT INTO `seniordata` VALUES (91, 'fascinating', 'a fascinating book', '一本引人入胜的书', '\'fæsɪnetɪŋ', '迷人的；极有吸引力的', 'adj', 'extremely interesting');
INSERT INTO `seniordata` VALUES (92, 'convenient', 'Mail-order catalogs are a convenient way to shop.', '使用邮购目录是一种方便的购物方式。', 'kənˈvinjənt', '便利的；方便的', 'adj', 'useful to you because it saves you time, or does not spoil your plans or cause you problems');
INSERT INTO `seniordata` VALUES (93, 'mall', 'Let’s meet at the mall and go see a movie.', '我们在购物中心碰头，然后去看电影吧。', 'mɔl', '商场；购物中心', 'n', 'a large area where there are a lot of shops, usually a covered area where cars are not allowed');
INSERT INTO `seniordata` VALUES (94, 'clerk', 'a clerk in a commercial firm', '一家商行的文员', 'klɝk', '职员', 'n', 'someone who keeps records or accounts in an office');
INSERT INTO `seniordata` VALUES (95, 'corner', 'He pulled a dirty handkerchief out by its corner and waved it at me.', '他拽出一块脏手帕，捏着一角向我挥动。', '\'kɔrnɚ', '角；拐角；角落', 'n', 'the point at which two lines or edges meet');
INSERT INTO `seniordata` VALUES (96, 'polite', 'She’s always very polite.', '她总是很有礼貌。', 'pə\'laɪt', '有礼貌的；客气的', 'adj', 'behaving or speaking in a way that is correct for the social situation you are in, and showing that you are careful to consider other people’s needs and feelings');
INSERT INTO `seniordata` VALUES (97, 'politely', 'She bobbed politely at me.', '她有礼貌地向我行了个屈膝礼。', 'pə\'laɪtli', '礼貌地；客气地', 'adv', '');
INSERT INTO `seniordata` VALUES (98, 'speaker', 'The keynote speaker (= main or most important speaker ) was Robert Venturi, the architect.', '主要发言人是建筑师罗伯特·文图里。', '\'spikɚ', '发言者；讲（某种语言）的人', 'n', 'someone who makes a formal speech to a group of people');
INSERT INTO `seniordata` VALUES (99, 'request', 'France had agreed to his request for political asylum.', '法国已经同意了他政治避难的请求。', 'rɪ\'kwɛst', '要求；请求', 'n', 'a polite or formal demand for something');
INSERT INTO `seniordata` VALUES (100, 'choice', 'He has to make some important choices.', '他得作出一些重要的抉择。', 'tʃɔɪs', '选择；挑选', 'n', 'if you have a choice, you can choose between several things');
INSERT INTO `seniordata` VALUES (101, 'direction', 'Which direction did they go in ?', '他们朝哪个方向走了？', 'dəˈrɛkʃən; (also) daɪˈrɛkʃən', '方向；方位', 'n', 'the way something or someone moves, faces, or is aimed');
INSERT INTO `seniordata` VALUES (102, 'correct', 'If my calculations are correct, we’re about ten miles from Exeter.', '如果我计算得没错的话，我们离埃克塞特大约十英里。', 'kə\'rɛkt', '正确的；恰当的', 'adj', 'having no mistakes');
INSERT INTO `seniordata` VALUES (103, 'direct', 'Experienced users have direct access to the main data files.', '高级用户可直接浏览主数据文档。', 'dəˈrɛkt; daɪˈrɛkt', '直接的；直率的', 'adj', 'done without any other people, actions, processes etc coming between');
INSERT INTO `seniordata` VALUES (104, 'whom', 'Desperate for money, she called her sister, whom she hadn’t spoken to in 20 years.', '因为急需用钱，她就给姐姐打了电话，她们已经20年没说过话了。', 'hum', '谁；什么人', 'pron', 'the object form of ‘who’, used especially in formal speech or writing');
INSERT INTO `seniordata` VALUES (105, 'address', 'What’s your new address?', '你的新地址是什么？', 'əˈdrɛs;(for n)ˈædres; ædrɛs', '住址； 地址；通讯处', 'n', 'the details of the place where someone lives or works, which you use to send them letters etc');
INSERT INTO `seniordata` VALUES (106, 'faithfully', 'He had served the family faithfully for 40 years.', '他已忠心耿耿地为这家人服务了40年。', '\'feθfəli', '忠实地；忠诚地', 'adv', 'in a loyal way');
INSERT INTO `seniordata` VALUES (107, 'Italian', 'Her beauty is of the Italian type.', '她的美是意大利型的。', 'ɪˈtæljən', '意大利（人）的；', 'adj', 'relating to Italy, its people, or its language');
INSERT INTO `seniordata` VALUES (108, 'Kevin', '', '', '\'kevin', '凯文（男名）', '', '');
INSERT INTO `seniordata` VALUES (109, 'Tim', 'I realize that I\'m seeing Tim as he is in the world, with no reference to me at all.', '我意识到我所看到的，是蒂姆在他的世界里的生活，而这个世界和我一点关系也没有。', '', '蒂姆（男名）', '', '');
INSERT INTO `seniordata` VALUES (110, 'humorous', 'humorous stories', '诙谐的故事', '\'hjumərəs', '有幽默感的；滑稽有趣的', 'adj', 'funny and enjoyable');
INSERT INTO `seniordata` VALUES (111, 'silent', 'The crowd fell silent (= became silent ) when the President appeared.', '总统出现时，人群安静了下来。', '\'saɪlənt', '不说话的；沉默的', 'adj', 'not saying anything');
INSERT INTO `seniordata` VALUES (112, 'helpful', 'Thank you for your advice; it’s been very helpful.', '谢谢你的建议，它非常有用。', '\'hɛlpfl', '有用的；有帮助的', 'adj', 'providing useful help in making a situation better or easier');
INSERT INTO `seniordata` VALUES (113, 'from time to time', 'She has to work at weekends from time to time.', '她偶尔周末还得工作。', '', '时常；有时', '', 'occasionally but not regularly');
INSERT INTO `seniordata` VALUES (114, 'score', 'At half-time the score was one all.', '半场时的比分是一比一。', 'skɔ', '得分', 'n', 'the number of points that each team or player has won in a game or competition');
INSERT INTO `seniordata` VALUES (115, 'background', 'Students with a background in chemistry will probably find the course easier.', '学过化学的学生可能会觉得这门课程容易些。', '\'bækɡraʊnd', '背景', 'n', 'someone’s family, education, previous work etc');
INSERT INTO `seniordata` VALUES (116, 'interview', 'When Wardell was interviewed, he was impressive, and on that basis, he was hired.', '当沃德尔接受面试时，他给人印象深刻，因此他被雇用了。', '\'ɪntɚvju', '采访；面试', 'v', 'to ask someone questions during an interview');
INSERT INTO `seniordata` VALUES (117, 'Asian', 'Many of the shops were run by Asians.', '这些商店中有许多是由亚洲人经营的。', 'ˈeʒən, ˈeʃən', '亚洲的；亚洲人的', 'adj', 'from or relating to Asia, especially India or Pakistan');
INSERT INTO `seniordata` VALUES (118, 'deal with', 'He\'s good at dealing with pressure.', '他善于应付压力。', '', '对付；应付', '', 'to solve a problem, perform a task, etc.');
INSERT INTO `seniordata` VALUES (119, 'dare', 'He wanted to ask her, but he didn’t dare.', '他想问她，但又不敢。', 'dɛr', '敢于；胆敢', 'v', 'to be brave enough to do something that is risky or that you are afraid to do – used especially in questions or negative sentences');
INSERT INTO `seniordata` VALUES (120, 'private', 'Morris has a private jet.', '莫里斯拥有一架私人喷气式飞机。', 'ˈpraɪvɪt', '私人的', 'adj', 'for use by one person or group, not for everyone');
INSERT INTO `seniordata` VALUES (121, 'guard', 'There were two security guards on duty outside the building.', '大楼外面有两名保安在值勤。', 'ɡɑrd', '警卫；看守', 'n', 'someone whose job is to protect a place or person');
INSERT INTO `seniordata` VALUES (122, 'require', 'Campbell’s broken leg will probably require surgery.', '坎贝尔的一条腿骨折，可能需要手术。', 'rɪ\'kwaɪr', '需要；要求', 'v', 'to need something');
INSERT INTO `seniordata` VALUES (123, 'European', 'European languages', '欧洲的语言', '\'jʊrə\'piən', '欧洲的；欧洲人的', 'adj', 'relating to Europe or its people');
INSERT INTO `seniordata` VALUES (124, 'British', 'the British government', '英国政府', '\'brɪtɪʃ', '英国的；英国人的', 'adj', 'relating to Britain or its people');
INSERT INTO `seniordata` VALUES (125, 'speech', '...the development of speech in children.', '…孩子言语能力的发展。', 'spitʃ', '讲话；言语能力；演讲', 'n', 'Speech is the ability to speak or the act of speaking');
INSERT INTO `seniordata` VALUES (126, 'ant', 'Ants swarmed up out of the ground and covered her shoes and legs.', '蚂蚁从地里成群地爬出来，爬满了她的鞋和腿。', 'ænt', '蚂蚁', 'n', 'a small insect that lives in large groups');
INSERT INTO `seniordata` VALUES (127, 'insect', 'an insect bite', '昆虫的叮咬', '\'ɪnsɛkt', '昆虫', 'n', 'a small creature such as a fly or ant, that has six legs, and sometimes wings');
INSERT INTO `seniordata` VALUES (128, 'influence', 'As a scientist, his influence was immense.', '身为一名科学家，他的影响力极大。', '\'ɪnfluəns', '影响', 'n', 'the power to affect the way someone or something develops, behaves, or thinks, without using direct force or orders');
INSERT INTO `seniordata` VALUES (129, 'seldom', 'Karen had seldom seen him so angry.', '卡伦很少见他这么生气过。', '\'sɛldəm', '不常；很少', 'adv', 'very rarely or almost never');
INSERT INTO `seniordata` VALUES (130, 'proud', 'Seth was the proud owner of a new sports car.', '赛思因为有了新跑车而扬扬得意。', 'praʊd', '自豪的；骄傲的', 'adj', 'feeling pleased about something that you have done or something that you own, or about someone or something you are involved with or related to');
INSERT INTO `seniordata` VALUES (131, 'be proud of', 'You are the pride of us , you will be proud of us in the future.', '你现在是我们的骄傲，我们将来才能是你的自豪。', '', '为...骄傲；感到自豪', '', '');
INSERT INTO `seniordata` VALUES (132, 'absent', 'students who are regularly absent from school', '经常缺课的学生', 'ˈæbsnt;(for v.)əbˈsɛnt', '缺席的；不在的', 'adj', 'not at work, school, a meeting etc, because you are sick or decide not to go');
INSERT INTO `seniordata` VALUES (133, 'fail', 'It looks likely that the peace talks will fail.', '看来和平谈判可能会失败。', 'fel', '失败；未能（做到）', 'v', 'to not succeed in achieving something');
INSERT INTO `seniordata` VALUES (134, 'examination', 'The examination results will be announced in September.', '考试成绩将于9月公布。', 'ɪg\'zæmə\'neʃən', '考试；审查', 'n', 'a spoken or written test of knowledge, especially an important one');
INSERT INTO `seniordata` VALUES (135, 'boarding school', 'She and her brother are both at boarding school.', '她和她弟弟都在寄宿学校念书。', '', '寄宿学校', '', 'a school where students live as well as study');
INSERT INTO `seniordata` VALUES (136, 'leaf', 'a flowering bush with large shiny leaves', '叶子大而油亮的开花灌木', 'lif', '叶子', 'n', 'one of the flat green parts of a plant that are joined to its stem or branches');
INSERT INTO `seniordata` VALUES (137, 'in person', 'You have to sign for it in person.', '你必须亲自签收。', '', '亲身；亲自', '', 'if you do sth in person , you go somewhere and do it yourself, instead of doing it by letter, asking sb else to do it, etc.');
INSERT INTO `seniordata` VALUES (138, 'exactly', 'It’s exactly half past five.', '一分不差，正好5点半。', 'ɪɡ\'zæktli', '确切地；精确地', 'adv', 'used when emphasizing that something is no more and no less than a number or amount, or is completely correct in every detail');
INSERT INTO `seniordata` VALUES (139, 'pride', 'He wore his medals with pride.', '他自豪地戴着奖章。', 'praɪd', '自豪；骄傲', 'n', 'a feeling that you are proud of something that you or someone connected with you has achieved');
INSERT INTO `seniordata` VALUES (140, 'take pride in', 'It is right that we should care about and take pride in the way we express ourselves.', '我们就应该时时在意自己的表达方式，并且要引以为豪，这也是应有的态度。', '', '为...感到自豪', '', '');
INSERT INTO `seniordata` VALUES (141, 'grandson', 'My grandson\'s birthday was on Tuesday.', '我孙子的生日是星期二。', '\'ɡrænsʌn', '孙子；外孙', 'n', 'the son of your son or daughter');
INSERT INTO `seniordata` VALUES (142, 'general', 'There has been a general decline in standards.', '道德水准普遍下降。', '\'dʒɛnrəl', '普遍的；常规的；总的', 'adj', 'involving the whole of a situation, group, or thing, rather than specific parts of it');
INSERT INTO `seniordata` VALUES (143, 'introduction', 'Pete, are you going to make the introductions?', '皮特，你来作一下介绍吧。', ',ɪntrə\'dʌkʃən', '介绍', 'n', 'the act of formally telling two people each other’s names when they first meet');
INSERT INTO `seniordata` VALUES (144, 'Paula', 'Peter asks Paula to go to dinner.', '彼得请保拉去共进晚餐。', '\'pɔ:lə', '葆拉 （女名）', '', '');
INSERT INTO `seniordata` VALUES (145, 'Alfred', '\"On going around with the boys, I guess.\" said Alfred.', '“我想是和朋友们一起出去，”艾尔弗雷德说。', '\'ælfrɪd', '艾尔弗雷德（男名）', '', '');
INSERT INTO `seniordata` VALUES (146, 'Billy', 'Billy：But what if my friends see me.', '比利：但要是我朋友看到怎幺办。', '', '比利（男名）', '', '');
INSERT INTO `seniordata` VALUES (147, 'Candy', '', '', '', '坎迪（女名）', '', '');
INSERT INTO `seniordata` VALUES (148, 'Jerry', '', '', '', '杰里（男名）；杰丽（女名）', '', '');
INSERT INTO `seniordata` VALUES (149, 'Emily', 'At times, Henrietta would tell me she felt slightly guilty that Emily enjoyed staying with her so much.', '有时，亨利埃塔会对我说，埃米莉如此喜欢和她待在一起，让她感到有些内疚。', '\'emili', '埃米莉（女名）', '', '');
INSERT INTO `seniordata` VALUES (150, 'material', 'curtain material', '窗帘布', 'mə\'tɪrɪəl', '衣料，布料；材料，原料', 'n', 'cloth used for making clothes, curtains etc');
INSERT INTO `seniordata` VALUES (151, 'chopsticks', 'We still lack a pair of chopsticks.', '还少一双筷子。', '\'tʃɑp,stɪks', '筷子', 'n', 'a pair of narrow sticks that are used for eating East Asian food');
INSERT INTO `seniordata` VALUES (152, 'coin', 'Toss a coin to see who goes first.', '抛硬币决定谁先来。', 'kɔɪn', '硬币', 'n', 'a piece of metal, usually flat and round, that is used as money');
INSERT INTO `seniordata` VALUES (153, 'fork', 'Put the knives and forks on the table.', '把刀叉摆放在桌子上。', 'fɔrk', '餐叉，叉子', 'n', 'a tool you use for picking up and eating food, with a handle and three or four points');
INSERT INTO `seniordata` VALUES (154, 'blouse', 'a silk blouse', '丝质女衬衫', 'blaʊs', '（女士）短上衣；衬衫', 'n', 'a shirt for women');
INSERT INTO `seniordata` VALUES (155, 'sliver', 'a sliver of glass ＃', '一块玻璃碎片', '\'slɪvɚ', '小块，薄片；碎片，裂片', 'n', 'a small pointed or thin piece that has been cut or broken off something');
INSERT INTO `seniordata` VALUES (156, 'glass', 'a glass bowl', '玻璃碗', 'ɡlæs', '玻璃', 'n', 'a transparent solid substance used for making windows, bottles etc');
INSERT INTO `seniordata` VALUES (157, 'cotton', 'a white cotton shirt', '白色棉布衬衫', '\'kɑtn', '棉；棉花', 'n', 'cloth or thread made from the white hair of the cotton plant');
INSERT INTO `seniordata` VALUES (158, 'steel', 'a steel bridge', '钢铁大桥', 'stil', '钢；钢铁', 'n', 'strong metal that can be shaped easily, consisting of iron and  carbon');
INSERT INTO `seniordata` VALUES (159, 'grass', 'She enjoyed the feel of grass beneath her feet.', '她喜欢踩在草上的感觉。', 'ɡræs', '草；草地', 'n', 'a very common plant with thin leaves that covers the ground in fields and gardens and is often eaten by animals');
INSERT INTO `seniordata` VALUES (160, 'leaf.', 'a flowering bush with large shiny leaves', '叶子大而油亮的开花灌木', 'lif', '叶；叶子', 'n', 'one of the flat green parts of a plant that are joined to its stem or branches');
INSERT INTO `seniordata` VALUES (161, 'produce', 'New drugs are producing remarkable results .', '新药正在产生显著的效果。', 'prəˈdus;(for n.)ˈprɒdus; prɑdus', '引起；造成；产生；制造；生产；出产', 'v', 'to cause a particular result or effect');
INSERT INTO `seniordata` VALUES (162, 'widely', 'Organic food is now widely available.', '现在有机食品很多地方都可买到。', '\'waɪdli', '广泛地；普遍地', 'adv', 'in a lot of different places or by a lot of people');
INSERT INTO `seniordata` VALUES (163, 'process', 'Goats’ cheese may be processed in many ways.', '山羊奶干酪可以有多种加工方法。', 'proˈsɛs;(for n.)prɑsɛs', '加工；处理', 'v', 'to make food, materials, or goods ready to be used or sold, for example by preserving or improving them in some way');
INSERT INTO `seniordata` VALUES (164, 'France', 'Germany borders on France.', '德国与法国接壤。', '', '法国', '', '');
INSERT INTO `seniordata` VALUES (165, 'no matter', 'The effect of pushing the button is the same no matter who does it.', '不论是什么人去按电钮， 其效果都是一样的。', '', '不论；无论', '', '');
INSERT INTO `seniordata` VALUES (166, 'local', 'local hospital', '当地医院', 'ˈloʊkl', '当地的；本地的', 'adj', 'relating to the particular area you live in, or the area you are talking about');
INSERT INTO `seniordata` VALUES (167, 'even though', 'I have friends even though I am a man of few words. ＃', '虽然我是个寡言的人，但我也有自己的朋友。', '', '虽然；即使', '', 'despite the fact or belief that; no matter whether');
INSERT INTO `seniordata` VALUES (168, 'brand', 'products which lack a strong brand image', '缺乏鲜明品牌形象的产品', 'brænd', '品牌；牌子', 'n', 'a type of product made by a particular company, that has a particular name or design');
INSERT INTO `seniordata` VALUES (169, 'avoid', 'Road safety is taught to young children to avoid road accidents.', '小孩子受到道路安全知识的教育，以避免交通事故。', 'ə\'vɔɪd', '避免；回避', 'v', 'to prevent something bad from happening');
INSERT INTO `seniordata` VALUES (170, 'product', 'The London factory assembles the finished product .', '伦敦工厂组装成品。', '\'prɑdʌkt', '产品；制品', 'n', 'something that is grown or made in a factory in large quantities, usually in order to be sold');
INSERT INTO `seniordata` VALUES (171, 'handbag', 'A man twitched the handbag from her hand.', '一个人从她手中抢走了手提包。', '\'hænd\'bæg', '小手提包', 'n', 'a small bag in which a woman carries money and personal things');
INSERT INTO `seniordata` VALUES (172, 'mobile', 'mobile air-conditioners', '移动式空调器', 'ˈməʊbl;mobil', '可移动的；非固定的', 'adj', 'not fixed in one position, and easy to move and use in different places');
INSERT INTO `seniordata` VALUES (173, 'Germany', 'Germany borders on France.', '德国与法国接壤。', '\'dʒɝməni', '德国', '', '');
INSERT INTO `seniordata` VALUES (174, 'surface', 'Nearly 10% of the Earth’s surface is covered by ice.', '地球表面将近 10% 被冰层覆盖。', '\'sɝfɪs', '表面；表层', 'n', 'the top layer of an area of water or land');
INSERT INTO `seniordata` VALUES (175, 'postman', 'That postman is in charge of this route.', '那个邮递员负责这条投递???路。', '\'postmən', '邮递员', 'n', 'someone whose job is to collect and deliver letters');
INSERT INTO `seniordata` VALUES (176, 'cap', '...a dark blue baseball cap.', '…一顶深蓝色的棒球帽。', 'kæp', '（尤指有帽舌的）帽子', 'n', 'a type of flat hat that has a curved part sticking out at the front, and is often worn as part of a uniform');
INSERT INTO `seniordata` VALUES (177, 'glove', 'a pair of gloves', '一副手套', 'ɡlʌv', '（分手指的）手套', 'n', 'a piece of clothing that you wear on your hand in order to protect it or keep it warm');
INSERT INTO `seniordata` VALUES (178, 'international', 'the response of the international community', '国际社会的反响', ',ɪntɚ\'næʃnəl', '国际的', 'adj', 'relating to or involving more than one nation');
INSERT INTO `seniordata` VALUES (179, 'competitor', 'Last year they sold twice as many computers as their competitors.', '去年他们的计算机销量是竞争对手的两倍。', 'kəm\'pɛtɪtɚ', '竞争者；参赛者', 'n', 'a person, team, company etc that is competing with another');
INSERT INTO `seniordata` VALUES (180, 'paint', 'The ceiling needs painting.', '天花板需要粉刷了。', 'pent', '刷漆；作画', 'v', 'to put paint on a surface');
INSERT INTO `seniordata` VALUES (181, 'its', 'He emphasized its importance to me.', '他向我强调它的重要性。', 'ɪts', '它的', 'adj', 'used to refer to something that belongs to or is connected with a thing, animal, baby etc that has already been mentioned');
INSERT INTO `seniordata` VALUES (182, 'form', 'a severe form of cancer', '一种严重的癌症', 'fɔrm', '类型；形式', 'n', 'a particular type of something that exists in many different varieties');
INSERT INTO `seniordata` VALUES (183, 'clay', '...the heavy clay soils of Georgia.', '…佐治亚州厚重的黏土的土壤。', 'kle', '黏土；陶土', 'n', 'a type of heavy sticky earth that can be used for making pots, bricks etc');
INSERT INTO `seniordata` VALUES (184, 'balloon', 'Can you help me blow up these balloons?', '你帮我把这些气球吹起来好吗？', 'bə\'lun', '气球', 'n', 'an object made of brightly coloured thin rubber, that is filled with air and used as a toy or decoration for parties');
INSERT INTO `seniordata` VALUES (185, 'scissors', 'a pair of scissors', '一把剪刀', '\'sɪzɚz', '(pl) 剪刀', 'n', 'a tool for cutting paper, cloth etc, made of two sharp blades fastened together in the middle, with holes for your finger and thumb');
INSERT INTO `seniordata` VALUES (186, 'lively', 'a lively child', '精力充沛的孩子', '\'laɪvli', '生气勃勃的；（色彩）鲜艳的', 'adj', 'someone who is lively has a lot of energy and is very active');
INSERT INTO `seniordata` VALUES (187, 'fairy', 'Do you believe in fairies?', '你相信有小仙子吗？', '\'fɛri', '仙子，小精灵', 'n', 'a small imaginary creature with magic powers, which looks like a very small person');
INSERT INTO `seniordata` VALUES (188, 'heat', 'Ice needs heat to melt.', '冰需要热才能融化。', 'hit', '热；高温', 'n', 'warmth or the quality of being hot');
INSERT INTO `seniordata` VALUES (189, 'polish', 'Your essay is good, you just need to polish it a bit.', '你的文章不错，只要稍加润色就可以了。', '\'pɑlɪʃ', '修改；润色；磨光，擦光', 'v', 'to improve a piece of writing, a speech etc by making slight changes to it before it is completely finished');
INSERT INTO `seniordata` VALUES (190, 'complete', 'Students must complete the course.', '学生必须学完这门课程。', 'kəm\'plit', '完成', 'v', 'to finish doing or making something, especially when it has taken a long time');
INSERT INTO `seniordata` VALUES (191, 'Korea', 'Korea lies (to the) west of Japan.', '韩国在日本以西。', 'kə\'rɪr', '朝鲜；韩国', '', '');
INSERT INTO `seniordata` VALUES (192, 'Switzerland', 'The River Rhine rises in Switzerland.', '莱茵河发源于瑞士。', '\'swɪtsələnd', '瑞士', '', '');
INSERT INTO `seniordata` VALUES (193, 'San Francisco', '', '', '', '圣弗朗西斯科（旧金山，美国城市）', '', '');
INSERT INTO `seniordata` VALUES (194, 'Pam', '', '', '', '帕姆（女名）', '', '');
INSERT INTO `seniordata` VALUES (195, 'heel', 'black boots with high heels', '有高跟的黑靴子', 'hil', '鞋跟；足跟', 'n', 'the raised part on the bottom of a shoe that makes the shoe higher at the back');
INSERT INTO `seniordata` VALUES (196, 'electricity', 'The farm was very isolated, but it had electricity.', '那个农场非常偏远，但有电力供应。', 'ɪ\'lɛk\'trɪsəti', '电；电能', 'n', 'the power that is carried by wires, cables etc, and is used to provide light or heat, to make machines work etc');
INSERT INTO `seniordata` VALUES (197, 'scoop', '...a small ice-cream scoop.', '…一把小冰淇淋勺。', 'skup', '勺；铲子', 'n', 'a round deep spoon for serving food, for example  ice cream  or  mashed  potato');
INSERT INTO `seniordata` VALUES (198, 'style', 'Car styles have changed radically in the past 20 years.', '在过去 20 年里，汽车的款式彻底改变了。', 'staɪl', '样式；款式', 'n', 'a particular design or fashion for something such as clothes, hair, furniture etc');
INSERT INTO `seniordata` VALUES (199, 'project', 'The project aims to provide an analysis of children’s emotions.', '该计划旨在对儿童情绪作出分析。', 'prəˈdʒɛkt; prɑdʒɛkt', '项目；工程', 'n', 'a carefully planned piece of work to get information about something, to build something, to improve something etc');
INSERT INTO `seniordata` VALUES (200, 'pleasure', 'the simple pleasures of life', '生活中的简单乐趣', 'ˈplɛʒɚ', '高兴；愉快', 'n', 'the feeling of happiness, enjoyment, or satisfaction that you get from an experience');
INSERT INTO `seniordata` VALUES (201, 'zipper', '...the metal zipper on his jacket.', '…他的夹克上的金属拉锁。', 'ˈzɪpə', '(zip) 拉链；拉锁', 'n', 'two lines of small metal or plastic pieces that slide together to fasten a piece of clothing');
INSERT INTO `seniordata` VALUES (202, 'daily', 'daily flights to Miami', '每日飞往迈阿密的航班', '\'delɪ', '每日的；日常的', 'adj', 'happening or done every day');
INSERT INTO `seniordata` VALUES (203, 'website', 'For more information on weight loss and healthy eating, visit our website.', '有关减肥和健康饮食的更多信息，请访问我们的网站。', '', '网站', 'n', 'a place on the Internet where you can find information about something, especially a particular organization');
INSERT INTO `seniordata` VALUES (204, 'pioneer', '...one of the leading pioneers of photojournalism.', '…摄影新闻界的主要先驱之一。', ',paɪə\'nɪr', '先锋；先驱', 'n', 'someone who is important in the early development of something, and whose work or ideas are later developed by other people');
INSERT INTO `seniordata` VALUES (205, 'list', 'The guidebook lists 1,000 hotels and restaurants.', '旅游手册上列有1,000家宾馆和餐厅。', 'lɪst', '列表；列清单', 'v', 'to write a list, or mention things one after the other');
INSERT INTO `seniordata` VALUES (206, 'mention', 'Was my name mentioned at all?', '我的名字被提到过吗？', '\'mɛnʃən', '提到；说到', 'v', 'to talk or write about something or someone, usually quickly and without saying very much or giving details');
INSERT INTO `seniordata` VALUES (207, 'by accident', '', '', '', '偶然；意外地', '', 'used to refer to something that belongs to or is connected with a thing, animal, baby etc that has already been mentioned');
INSERT INTO `seniordata` VALUES (208, 'nearly', 'It took nearly two hours to get here.', '到这里花了将近两小时。', '\'nɪrli', '几乎；差不多', 'adv', 'almost, but not quite or not completely');
INSERT INTO `seniordata` VALUES (209, 'boil', 'Put the spaghetti into plenty of boiling salted water.', '把意大利面放入大量煮沸的盐水中。', 'bɔɪl', '煮沸；烧开', 'v', 'when a liquid boils, or when you boil it, it becomes hot enough to turn into gas');
INSERT INTO `seniordata` VALUES (210, 'smell', 'What’s that horrible smell?', '是什么味道，这么难闻？', 'smɛl', '气味', 'n', 'the quality that people and animals recognize by using their nose');
INSERT INTO `seniordata` VALUES (211, 'saint', 'Saint Patrick', '圣帕特里克', 'sent', '圣人；圣徒', 'n', 'someone who is given the title ‘saint’ by the Christian church after they have died, because they have been very good or holy');
INSERT INTO `seniordata` VALUES (212, 'take place', '：The film festival takes place in October.', '电影节将于十月举行。', '', '发生；出现', '', 'to happen, especially after previously being arranged or planned');
INSERT INTO `seniordata` VALUES (213, 'doubt', 'This raises doubts about the point of advertising.', '这引起了人们对于广告作用的怀疑。', 'daʊt', '怀疑', 'n', 'If you have doubt or doubts about something, you feel uncertain about it and do not know whether it is true or possible. If you say you have no doubt about it, you mean that you are certain it is true.');
INSERT INTO `seniordata` VALUES (214, 'without doubt', 'This was without doubt the most interesting situation that Amanda had ever found herself in.', '这无疑是阿曼达遇到过的最有趣的情况。', '', '毫无疑问；的确', '', 'used when you are giving your opinion and emphasizing the point that you are making');
INSERT INTO `seniordata` VALUES (215, 'fridge', 'The fridge was stocked with food and drink. ＃', '冰箱里装满了食物和饮料。', 'frɪdʒ', '冰箱', 'n', 'a large piece of electrical kitchen equipment, used for keeping food and drinks cool');
INSERT INTO `seniordata` VALUES (216, 'translate', 'Poetry doesn’t usually translate well.', '诗歌通常都译不好。', 'træns\'let', '翻译', 'v', 'to change written or spoken words into another language');
INSERT INTO `seniordata` VALUES (217, 'lock', 'Did you lock the car?', '你把汽车锁好了吗？', 'lɑk', '锁上；锁住', 'v', 'to fasten something, usually with a key, so that other people cannot open it, or to be fastened like this');
INSERT INTO `seniordata` VALUES (218, 'earthquake', 'The city is in an earthquake zone.', '该市位于地震带。', '', '地震', 'n', 'a sudden shaking of the earth’s surface that often causes a lot of damage');
INSERT INTO `seniordata` VALUES (219, 'sudden', 'a sudden change in the weather', '天气的突然变化', '\'sʌdn', '突然（的）', 'adj', 'happening, coming, or done quickly or when you do not expect it');
INSERT INTO `seniordata` VALUES (220, 'all of a sudden', 'All of a sudden the lights went out.', '突然，灯都灭了。', '', '突然；猛地', '', 'quickly and unexpectedly');
INSERT INTO `seniordata` VALUES (221, 'biscuit', 'a packet of chocolate biscuits', '一包巧克力饼干', '\'bɪskɪt', '饼干', 'n', 'a small thin dry cake that is usually sweet and made for one person to eat');
INSERT INTO `seniordata` VALUES (222, 'cookie', 'a glass of milk and a cookie', '一杯牛奶和一块小甜饼', '\'kʊki', '曲奇饼', 'n', 'a small flat sweet cake');
INSERT INTO `seniordata` VALUES (223, 'instrument', 'surgical instruments', '外科(手术)器械', '\'ɪnstrəmənt', '器械； 仪器；工具', 'n', 'a small tool used in work such as science or medicine');
INSERT INTO `seniordata` VALUES (224, 'crispy', 'a piece of crispy fried bread', '一片烤得松脆的面包', '\'krɪspi', '脆的；酥脆的', 'adj', 'food that is crispy is pleasantly hard on the outside');
INSERT INTO `seniordata` VALUES (225, 'sour', 'Rachel sampled the wine. It was sour.', '雷切尔尝了尝葡萄酒，是酸的。', '\'saʊɚ', '酸的；有酸味的', 'adj', 'having a sharp acid taste, like the taste of a  lemon  or a fruit that is not ready to be eaten');
INSERT INTO `seniordata` VALUES (226, 'by mistake', 'Someone must have left the door open by mistake.', '一定是有人疏忽忘了关门。', '', '错误地；无意中', '', 'by accident; without intending to');
INSERT INTO `seniordata` VALUES (227, 'customer', 'We aim to offer good value and service to all our customers.', '我们力求为所有的客户提供物有所值的商品和服务。', '\'kʌstəmɚ', '顾客；客户', 'n', 'someone who buys goods or services from a shop, company etc');
INSERT INTO `seniordata` VALUES (228, 'Canadian', 'Most English people bracket American and Canadian accents together.', '大多数英国人都把美国音和加拿大音相提并论。', 'kə\'nedɪən', '加拿大的；加拿大人的', 'adj', 'relating to Canada or its people');
INSERT INTO `seniordata` VALUES (229, 'divide', 'The physical benefits of exercise can be divided into three factors.', '锻炼对身体的好处可以分成3个方面。', 'dɪ\'vaɪd', '分开；分散', 'v', 'if something divides, or if you divide it, it separates into two or more parts');
INSERT INTO `seniordata` VALUES (230, 'divide ... into', '', '', '', '把...分开', '', '');
INSERT INTO `seniordata` VALUES (231, 'purpose', 'The purpose of this meeting is to elect a new chairman.', '这次会议的目的是选出一位新主席。', '\'pɝpəs', '目的；目标', 'n', 'the purpose of something is what it is intended to achieve');
INSERT INTO `seniordata` VALUES (232, 'basket', 'a shopping basket', '购物篮', '\'bæskɪt', '篮；筐', 'n', 'a container made of thin pieces of plastic, wire, or wood woven together, used to carry things or put things in');
INSERT INTO `seniordata` VALUES (233, 'the Olympics', '', '', '', '奥林匹克运动会', '', '');
INSERT INTO `seniordata` VALUES (234, 'look up to', 'You\'re a popular girl, Grace, and a lot of the younger ones look up to you.', '你是个受欢迎的女孩，格雷丝，许多比你小的女孩都仰慕你。', '', '钦佩；仰慕', '', 'If you look up to someone, especially someone older than you, you respect and admire them');
INSERT INTO `seniordata` VALUES (235, 'hero', 'He had dared to speak out against injustice, and overnight he became a national hero .', '他敢于站出来抨击不公正的现象，一夜之间就成了国家英雄。', '\'hɪro', '英雄；男主角', 'n', 'a man who is admired for doing something extremely brave');
INSERT INTO `seniordata` VALUES (236, 'Berlin', 'He captained the siege of Berlin.', '他指挥了围攻柏林的战役。', 'bɝ\'lɪn', '柏林（德国城市）', '', '');
INSERT INTO `seniordata` VALUES (237, 'NBA', 'Michael Jorden surnamed “Flying Trapezist” has stepped out of the NBA.', '“空中飞人”迈克尔乔丹已从NBA中退役了。', '', '全美篮球协会(National Basketball Association)，国家篮球协会 （美国职业篮球联赛）', 'abbr', 'the American organization which arranges professional basketball games');
INSERT INTO `seniordata` VALUES (238, 'CBA', 'Many players, coaches, executives, and referees have honed their skills in the CBA before going on to NBA careers.', '很多运动员、教练、执行官和裁判在转入NBA职业比赛之前，已在CBA经过了磨练。', '', '中国篮球协会(China Basketball Association)，中国篮球协会（中国职业篮球联赛）', 'abbr.', '');
INSERT INTO `seniordata` VALUES (239, 'Chelsea Lanmon', '', '', '', '切尔西 • 兰曼', '', '');
INSERT INTO `seniordata` VALUES (240, 'Jayce  Coziar', '', '', '', '杰斯 • 克里亚', '', '');
INSERT INTO `seniordata` VALUES (241, 'Jamie Ellsworth', '', '', '', '杰米 • 埃尔斯沃恩', '', '');
INSERT INTO `seniordata` VALUES (242, 'Julie   Thompson', '', '', '', '朱莉 • 汤普森', '', '');
INSERT INTO `seniordata` VALUES (243, 'Whitcomb   Judson', '', '', '', '惠特科姆 • 贾德森', '', '');
INSERT INTO `seniordata` VALUES (244, 'Thomas  Watson', '', '', '', '托马斯 • 沃森', '', '');
INSERT INTO `seniordata` VALUES (245, 'George   Crum', '', '', '', '乔治 • 克拉姆', '', '');
INSERT INTO `seniordata` VALUES (246, 'James  Naismith', '', '', '', '詹姆斯 • 奈史密斯', '', '');
INSERT INTO `seniordata` VALUES (247, 'smoke', 'I don’t smoke and I don’t drink much.', '我不吸烟，酒也喝得不多。', 'smok', '吸烟；冒烟', 'v', 'to suck or breathe in smoke from a cigarette, pipe etc or to do this regularly as a habit');
INSERT INTO `seniordata` VALUES (248, 'pierce', 'Steam the corn until it can easily be pierced with a fork.', '把玉米蒸到用叉子可以轻易扎透。', 'pɪrs', '扎；刺破；穿透', 'v', 'to make a small hole in or through something, using an object with a sharp point');
INSERT INTO `seniordata` VALUES (249, 'license', 'The dealers applied for an export license.', '经销商申请了出口许可证。', '\'laɪsns', '(licence) 证；证件', '', 'an official document giving you permission to own or do something for a period of time');
INSERT INTO `seniordata` VALUES (250, 'safety', 'You shouldn’t travel alone, for safety’s sake .', '为安全起见，不要独自一人旅行。', '\'sefti', '安全；安全性', 'n', 'when someone or something is safe from danger or harm');
INSERT INTO `seniordata` VALUES (251, 'earring', '...a pair of diamond earrings.', '…一副钻石耳坠儿。', '\'ɪrɪŋ', '耳环；耳饰', 'n', 'a piece of jewellery that you wear on your ear');
INSERT INTO `seniordata` VALUES (252, 'cry', 'Don’t cry, Laura. It’ll be OK.', '不要哭，劳拉，没事的。', 'kraɪ', '哭；叫喊', 'v', 'to produce tears from your eyes, usually because you are unhappy or hurt');
INSERT INTO `seniordata` VALUES (253, 'field', 'a view of green fields and rolling hills', '田野青翠、丘陵起伏的景色', 'fild', '田野；（运动）场地', 'n', 'an area of land in the country, especially one where crops are grown or animals feed on grass');
INSERT INTO `seniordata` VALUES (254, 'hug', 'We stood there crying and hugging each other.', '我们站在那里哭着互相拥抱。', 'hʌɡ', '拥抱；搂抱', 'v', 'to put your arms around someone and hold them tightly to show love or friendship');
INSERT INTO `seniordata` VALUES (255, 'lift', 'Sophie lifted the phone before the second ring.', '铃响了一下苏菲就接起了电话。', 'lɪft', '举起；抬高', 'v', 'to move something or someone upwards into the air');
INSERT INTO `seniordata` VALUES (256, 'talk back', 'How dare you talk back to me!', '你竟敢和我顶嘴！', '', '回嘴；顶嘴', '', 'If you talk back to someone in authority such as a parent or teacher, you answer them in a rude way');
INSERT INTO `seniordata` VALUES (257, 'awful', 'The weather was awful.', '天气很糟糕。', '\'ɔfl', '很坏的；讨厌的', 'adj', 'very bad or unpleasant');
INSERT INTO `seniordata` VALUES (258, 'teen', '', '', 'tin', '十几岁（十三至十九岁之间）', 'n', 'a teenager');
INSERT INTO `seniordata` VALUES (259, 'regret', 'Don’t do anything you might regret.', '不要做自己会后悔的事。', 'rɪ\'ɡrɛt', '感到遗憾；懊悔', 'v', 'to feel sorry about something you have done and wish you had not done it');
INSERT INTO `seniordata` VALUES (260, 'poem', '...a book of love poems.', '…一本爱情诗集。', '\'poəm', '诗；韵文', 'n', 'a piece of writing that expresses emotions, experiences, and ideas, especially in short lines using words that  rhyme');
INSERT INTO `seniordata` VALUES (261, 'bedroom', 'a hotel with 50 bedrooms', '有50间客房的旅馆', '\'bɛdrum', '卧室', 'n', 'a room for sleeping in');
INSERT INTO `seniordata` VALUES (262, 'community', 'The police haven\'t really done anything for the black community in particular.', '这座新的艺术中心将为整个社区服务。', 'kəˈmjunətɪ', '社区；社团;团体', 'n', 'the people who live in the same area, town etc');
INSERT INTO `seniordata` VALUES (263, 'keep away from', 'You must keep away from the dog.', '你千万别靠近那条狗', '', '避免接近；远离', '', 'to avoid going near sb/sth');
INSERT INTO `seniordata` VALUES (264, 'chance', 'There’s always the chance that something will go wrong.', '总有可能会出现问题。', 'tʃæns', '机会；可能性', 'n', 'the possibility that something will happen, especially something you want');
INSERT INTO `seniordata` VALUES (265, 'make one’s own decision', '', '', '', '自己做决定', '', '');
INSERT INTO `seniordata` VALUES (266, 'manage', 'I don’t know how she manages with seven children.', '我不知道七个孩子她是怎么应付的。', '\'mænɪdʒ', '完成（困难的事）；应付（困难局面）', 'v', 'to succeed in dealing with problems, living in a difficult situation etc');
INSERT INTO `seniordata` VALUES (267, 'society', 'technology and its effects on modern society', '科技及其对现代社会的影响', 'səˈsaɪətɪ', '社会', 'n', 'people in general, considered in relation to the laws, organizations etc that make it possible for them to live together');
INSERT INTO `seniordata` VALUES (268, 'unit', 'The watt is a unit of electrical power.', '农业过去以一个家庭单元为基础。', '\'junɪt', '单元；单位', 'n', 'If you consider something as a unit, you consider it as a single, complete thing');
INSERT INTO `seniordata` VALUES (269, 'educate', 'The Ormerod School educates handicapped children.', '奥默罗德学校的教育对象为残疾儿童。', '\'ɛdʒuket', '教育；教导', 'v', 'to teach a child at a school, college, or university');
INSERT INTO `seniordata` VALUES (270, 'get in the way of', '', '', '', '挡...的路；妨碍', '', '');
INSERT INTO `seniordata` VALUES (271, 'professional', 'This business plan looks very professional.', '这个商业计划看上去很有专业水平。', 'prə\'fɛʃənl', '专业的；职业的', 'adj', 'showing that someone has been well trained and is good at their work');
INSERT INTO `seniordata` VALUES (272, 'enter', 'Silence fell as I entered the room.', '我一进去，屋里就静下来了。', '\'ɛntɚ', '进来；进去', 'v', 'to go or come into a place');
INSERT INTO `seniordata` VALUES (273, 'support', 'The bill was supported by a large majority in the Senate.', '这项法案得到参议院绝大多数人的支持。', 'sə\'pɔrt', '支持', 'v', 'to say that you agree with an idea, group, or person, and usually to help them because you want them to succeed');
INSERT INTO `seniordata` VALUES (274, 'Picasso', 'The painter modeled his style after that of Picasso.', '这位画家模仿毕加索的绘画风格。', 'pi\'kæsəu', '毕加索（西班牙画家）', '', '');
INSERT INTO `seniordata` VALUES (275, 'truck', 'a truck driver', '卡车司机', 'trʌk', '卡车；货车', 'n', 'a large road vehicle used to carry goods');
INSERT INTO `seniordata` VALUES (276, 'rabbit', 'The hound nips at a rabbit.', '猎犬在野兔身后紧追不舍。', '\'ræbɪt', '兔；野兔', 'n', 'a small animal with long ears and soft fur, that lives in a hole in the ground');
INSERT INTO `seniordata` VALUES (277, 'whose', 'So who are your real friends and whose real friends are you?', '而谁是你的真正的朋友，你又是谁的真正的朋友呢？', 'huz', '谁的；（特指）那个人的', 'pron', 'used to ask which person or people a particular thing belongs to');
INSERT INTO `seniordata` VALUES (278, 'attend', 'Only 12 people attended the meeting.', '只有12个人出席了会议。', 'ə\'tɛnd', '出席；参加', 'v', 'to go to an event such as a meeting or a class');
INSERT INTO `seniordata` VALUES (279, 'valuable', 'a valuable painting', '一幅名贵的画', 'ˈvæljuəbəl; ˈvæljə-', '宝贵的；很有用的', 'adj', 'worth a lot of money');
INSERT INTO `seniordata` VALUES (280, 'pink', 'Hannah’s face went pink.', '汉娜的脸上泛起了红晕。', 'pɪŋk', '粉红色的', 'adj', 'pale red');
INSERT INTO `seniordata` VALUES (281, 'picnic', 'We decided to have a picnic down by the lake.', '我们决定在湖边野餐。', '\'pɪknɪk', '野餐', 'n', 'if you have a picnic, you take food and eat it outdoors, especially in the country');
INSERT INTO `seniordata` VALUES (282, 'somebody', 'There’s somebody waiting to see you.', '有人等着要见你。', '\'sʌmbədi', '某人，有人；重要人物', 'pron', 'used to mean a person, when you do not know, or do not say who the person is');
INSERT INTO `seniordata` VALUES (283, 'anybody', 'You should have a try, don\'t swallow anybody.', '不要轻信任何人，你得亲自去试一试。', '\'ɛnɪbɑdi', '任何人', 'pron', 'used to refer to any person, when it is not important to say exactly who');
INSERT INTO `seniordata` VALUES (284, 'noise', 'What’s that noise?', '那是什么声音？', 'nɔɪz', '声音；噪音', 'n', 'a sound, especially one that is loud, unpleasant, or frightening');
INSERT INTO `seniordata` VALUES (285, 'policeman', 'He tried to corrupt the policeman with money.', '他设法用金钱向警察行贿。', 'pə\'lismən', '男警察', 'n', 'A policeman is a man who is a member of the police force');
INSERT INTO `seniordata` VALUES (286, 'wolf', 'a pack of wolves', '一群狼', 'wʊlf', '狼', 'n', 'a wild animal that looks like a large dog and lives and hunts in groups');
INSERT INTO `seniordata` VALUES (287, 'laboratory', 'a research laboratory', '研究实验室', 'ˈlæbrəˌtɔrɪ', '实验室', 'n', 'a special room or building in which a scientist does tests or prepares substances');
INSERT INTO `seniordata` VALUES (288, 'coat', 'Billy! Put your coat on, it’s cold outside!', '比利！穿上外套，外面很冷！', 'kot', '外套；外衣', 'n', 'a piece of clothing with long sleeves that is worn over your clothes to protect them or to keep you warm');
INSERT INTO `seniordata` VALUES (289, 'sleepy', 'The warmth from the fire made her feel sleepy.', '暖洋洋的炉火使她昏昏欲睡。', '\'slipi', '困倦的；瞌睡的', 'adj', 'tired and ready to sleep');
INSERT INTO `seniordata` VALUES (290, 'pocket', 'Luke came in with his hands in his pockets.', '卢克走了进来，双手插在口袋里。', '\'pɑkɪt', '衣袋；口袋', 'n', 'a type of small bag in or on a coat, trousers etc that you can put money, keys etc in');
INSERT INTO `seniordata` VALUES (291, 'alien', 'alien beings from another planet', '来自另一个行星的外星生物', 'ˈeliən,ˈeljən', '外星人；外侨，外国人', 'n', 'relating to creatures from another world');
INSERT INTO `seniordata` VALUES (292, 'suit', 'a grey lightweight suit', '轻薄灰色套装', 'sut', '西服；套装', 'n', 'a set of clothes made of the same material, usually including a jacket with trousers or a skirt');
INSERT INTO `seniordata` VALUES (293, 'express', 'Parents have expressed their concerns about their children’s safety.', '父母对自己孩子的安全表示忧虑。', 'ɪk\'sprɛs', '表示；表达', 'v', 'to tell or show what you are feeling or thinking by using words, looks, or actions');
INSERT INTO `seniordata` VALUES (294, 'not only … but also', 'Yes, I can play not only the piano but also the guitar.', '会的，我不仅会弹钢琴，还会弹吉他。', '', '不但...而且', '', 'used to emphasize that sth else is also true');
INSERT INTO `seniordata` VALUES (295, 'circle', 'Draw a circle 10cm in diameter.', '画一个直径10厘米的圆形。', '\'sɝkl', '圆圈', 'n', 'a completely round shape, like the letter O');
INSERT INTO `seniordata` VALUES (296, 'Britain', 'This is the stud  naturalized from Britain.', '这是从不列颠引进的种马。', '\'brɪtn', '( Great Britain) 大不列颠', 'n', '');
INSERT INTO `seniordata` VALUES (297, 'receive', 'All the children will receive a small gift.', '每个孩子都会收到一份小礼物。', 'rɪ\'siv', '接受；收到', 'v', 'to be given something');
INSERT INTO `seniordata` VALUES (298, 'leader', 'the largest ever gathering of world leaders', '全世界领导人史无前例的大聚会', '\'lidɚ', '领导；领袖', 'n', 'the person who directs or controls a group, organization, country etc');
INSERT INTO `seniordata` VALUES (299, 'midsummer', 'a perfect midsummer afternoon', '美好的仲夏午后', ',mɪd\'sʌmɚ', '仲夏；中夏', 'n', 'the middle of summer');
INSERT INTO `seniordata` VALUES (300, 'medical', 'medical research', '医学研究', '\'mɛdɪkl', '医疗的；医学的', 'adj', 'relating to medicine and the treatment of disease or injury');
INSERT INTO `seniordata` VALUES (301, 'prevent', 'The rules are intended to prevent accidents.', '这些规定旨在预防事故。', 'pri\'vɛnt', '阻止；阻挠', 'v', 'to stop something from happening, or stop someone from doing something');
INSERT INTO `seniordata` VALUES (302, 'energy', 'Where do those kids get their energy from?', '那些孩子哪来这么多精力？', '\'ɛnɚdʒi', '精力，力量', 'n', 'the physical and mental strength that makes you able to do things');
INSERT INTO `seniordata` VALUES (303, 'position', 'Our hotel was in a superb central position near St Mark’s Square.', '我们的酒店处于极佳的中心位置，在圣马克广场附近。', 'pə\'zɪʃən', '位置；地方', 'n', 'the place where someone or something is, especially in relation to other objects and places');
INSERT INTO `seniordata` VALUES (304, 'burial', 'The priest prepared the body for burial.', '牧师为尸体做好了下葬的准备。', '\'bɛrɪəl', '埋葬；安葬', 'n', 'the act or ceremony of putting a dead body into a  grave');
INSERT INTO `seniordata` VALUES (305, 'honor', 'The stadium was named in honor of the club’s first chairman.', '该体育馆以俱乐部的第一任主席命名以示纪念。', 'ɑnɚ', '( honour) 尊重；表示敬意；荣幸', 'n', 'in order to show how much you admire and respect someone');
INSERT INTO `seniordata` VALUES (306, 'ancestor', 'My ancestors were French.', '我的祖先是法国人。', '\'ænsɛstɚ', '祖宗；祖先', 'n', 'a member of your family who lived a long time ago');
INSERT INTO `seniordata` VALUES (307, 'victory', 'Union leaders are heading for victory in their battle over workplace rights.', '工会领袖们在争取工作场所权利的斗争中正迈向胜利。', '\'vɪktəri', '胜利；成功', 'n', 'a situation in which you win a battle, game, election, or dispute');
INSERT INTO `seniordata` VALUES (308, 'enemy', 'She’s a dangerous enemy to have.', '与她为敌很危险。', '\'ɛnəmi', '敌人；仇人', 'n', 'someone who hates you and wants to harm you');
INSERT INTO `seniordata` VALUES (309, 'period', 'Tomorrow’s weather will be dry with sunny periods.', '明天天气干燥，间或晴朗。', '\'pɪrɪəd', '一段时间；时期', 'n', 'a particular length of time with a beginning and an end');
INSERT INTO `seniordata` VALUES (310, 'mystery', 'Twenty years after the event, his death remains a mystery .', '事情过去二十年了，他的死仍然是个谜。', 'ˈmɪstri', '奥秘；神秘事物', 'n', 'an event, situation etc that people do not understand or cannot explain because they do not know enough about it');
INSERT INTO `seniordata` VALUES (311, 'Stonehenge', 'It will completely change the way we think about the landscape around Stonehenge.', '它将彻底改变我们对巨石阵周围风景的认识方法。', ',ston\'hɛndʒ', '巨石阵', '', '');
INSERT INTO `seniordata` VALUES (312, 'Carla', 'Thank you so much, Carla, and thanks for your leadership in this undertaking as well as so much else.', '非常感谢，卡拉，谢谢你在这项事业和其他众多事务中发挥的领导作用。', '', '卡拉（女名）', '', '');
INSERT INTO `seniordata` VALUES (313, 'J. K. Rowling', '', '', '', 'J. K. 罗琳（英国作家）', '', '');
INSERT INTO `seniordata` VALUES (314, 'Victor', '', '', '\'vɪktɚ', '维克托（男名）', '', '');
INSERT INTO `seniordata` VALUES (315, 'Jean', 'Jean knew the only way to be content without her husband\'s love was to seek an expression of love from God.', '琼知道，在没有丈夫的爱的情况下也能得到满足的唯一方式就是寻求上帝表达对她的爱。', '', '琼（女名）', '', '');
INSERT INTO `seniordata` VALUES (316, 'Paul Stoker', '', '', '', '保罗 • 斯托克', '', '');
INSERT INTO `seniordata` VALUES (317, 'prefer', 'This type of owl prefers a desert habitat.', '这种猫头鹰更喜欢沙漠的生活环境。', 'prɪ\'fɝ', '更喜欢', 'v', 'to like someone or something more than someone or something else, so that you would choose it if you could');
INSERT INTO `seniordata` VALUES (318, 'lyrics', '...Kurt Weill\'s Broadway opera with lyrics by Langston Hughes.', '…由兰斯顿·休斯作词的库尔特·韦尔的百老汇歌剧。', '\'lɪrɪks', '(pl) 歌词', 'n', 'The lyrics of a song are its words');
INSERT INTO `seniordata` VALUES (319, 'Australian', 'She went solo backpacking for eight months in the Australian outback.', '她在澳大利亚内陆独自背包旅行了八个月。', 'ɑ\'strelɪən', '澳大利亚的；澳大利亚人的', 'adj', 'relating to Australia or its people');
INSERT INTO `seniordata` VALUES (320, 'electronic', 'electronic games', '电子游戏', 'ɪˌlɛkˈtrɑnɪk', '电子的；电子设备的', 'adj', 'electronic equipment, such as computers and televisions, uses electricity that has passed through computer chips, transistors etc');
INSERT INTO `seniordata` VALUES (321, 'suppose', 'There were many more deaths than was first supposed.', '死亡人数远远超过最初的预料。', 'sə\'poz', '推断；料想', 'v', 'to think that something is probably true, based on what you know');
INSERT INTO `seniordata` VALUES (322, 'smooth', 'Her skin felt smooth and cool.', '她的皮肤摸上去又滑又凉。', 'smʊð', '平滑的；悦耳的', 'adj', 'a smooth surface has no rough parts, lumps, or holes, especially in a way that is pleasant and attractive to touch');
INSERT INTO `seniordata` VALUES (323, 'spare', 'Have you got any spare boxes?', '你有没有多余的盒子？', 'spɛr', '空闲的；不用的', 'adj', 'not being used or not needed at the present time');
INSERT INTO `seniordata` VALUES (324, 'case', 'We tend to think of these people as untrustworthy, but that is not the case.', '我们往往会认为这些人不可靠，但事实并非如此。', 'kes', '情况；实情', 'n', 'a situation that exists, especially as it affects a particular person or group');
INSERT INTO `seniordata` VALUES (325, 'in that case', '‘He didn’t want to talk to Sally.’ ‘In that case why did he agree to meet her?’', '“他不想和萨莉说话。”“既然那样，为什么他还同意和她见面？”', '', '既然那样；假使那样的话', '', 'if that is the situation');
INSERT INTO `seniordata` VALUES (326, 'war', 'the Vietnam War', '越南战争', 'wɔr', '战争；战争状态', 'n', 'when there is fighting between two or more countries or between opposing groups within a country, involving large numbers of soldiers and weapons');
INSERT INTO `seniordata` VALUES (327, 'director', '英文释义：the director of education', '中文释义：教育局局长', 'dəˈrɛktɚ, daɪ-', '部门负责人；导演', 'n', 'someone who is in charge of a particular activity or organization');
INSERT INTO `seniordata` VALUES (328, 'dialogue', 'a boring movie full of bad dialog', '充满差劲对白的乏味电影', 'ˈdaɪəˌlɔɡ', '(dialog) 对话；对白', 'n', 'a conversation in a book, play, or film');
INSERT INTO `seniordata` VALUES (329, 'documentary', '...a TV documentary on homelessness.', '…一部关于无家可归现象的电视记录片。', '\'dɑkjə\'mɛntri', '纪录片', 'n', 'a film or television or a radio programme that gives detailed information about a particular subject');
INSERT INTO `seniordata` VALUES (330, 'drama', 'the great traditions of ancient Greek drama', '古希腊戏剧的伟大传统', '\'drɑmə', '戏；剧', 'n', 'a play for the theatre, television, radio etc, usually a serious one, or plays in general');
INSERT INTO `seniordata` VALUES (331, 'plenty', 'There’s plenty to do and see in New York.', '在纽约有很多事可做，很多东西可看。', '\'plɛnti', '大量；众多', 'pron', 'a large quantity that is enough or more than enough');
INSERT INTO `seniordata` VALUES (332, 'plenty of', 'You have plenty of time to read.', '你有大量的时间读书。', '', '大量；充足', '', '');
INSERT INTO `seniordata` VALUES (333, 'shut', 'Shut the window, Ellen!', '埃伦，把窗关上！', 'ʃʌt', '(过去式 shut, 过去分词 shut) 关闭；关上', 'v', 'to close something, or to become closed');
INSERT INTO `seniordata` VALUES (334, 'superhero', '...superheroes like Batman and Superman.', '...像蝙蝠侠和超人那样的超级英雄。', '\'supɚhɪro', '超级英雄', 'n', 'a character in stories who uses special powers, such as great strength or the ability to fly, to help people');
INSERT INTO `seniordata` VALUES (335, 'horror', 'You should have seen the look of horror on his face.', '你真该看看他脸上恐惧的表情。', '\'hɔrɚ', '震惊；恐惧', 'n', 'a strong feeling of shock and fear');
INSERT INTO `seniordata` VALUES (336, 'thriller', '...a tense psychological thriller.', '…一部紧张刺激的心理惊悚小说。', '\'θrɪlɚ', '惊险电影（小说、戏剧）', 'n', 'a book or film that tells an exciting story about murder or crime');
INSERT INTO `seniordata` VALUES (337, 'intelligent', 'a group of highly intelligent (= very intelligent )students', '一组聪明异常的学生', 'ɪn\'tɛlɪdʒənt', '有才智的；聪明的', 'adj', 'an intelligent person has a high level of mental ability and is good at understanding ideas and thinking clearly');
INSERT INTO `seniordata` VALUES (338, 'sense', 'Cats have a very acute sense of hearing (= very good, so that they can hear even the smallest sound ) .', '猫的听觉非常敏锐。', 'sɛns', '感觉；意识', 'n', 'a feeling about something');
INSERT INTO `seniordata` VALUES (339, 'pain', 'the pain and grief of bereavement', '丧亲之痛', 'pen', '痛苦；苦恼', 'n', 'the feeling of unhappiness you have when you are sad, upset etc');
INSERT INTO `seniordata` VALUES (340, 'reflect', 'She could see her face reflected in the car’s windshield.', '她看到自己的脸映照在汽车的挡风玻璃上。', 'rɪ\'flɛkt', '映出；照出；反映', 'v', 'if a person or a thing is reflected in a mirror, glass, or water, you can see an image of the person or thing on the surface of the mirror, glass, or water');
INSERT INTO `seniordata` VALUES (341, 'perform', 'Chenier and the band are performing at the Silver Palace tomorrow.', '车尼尔和乐队明天将在银宫演出。', 'pɚ\'fɔrm', '表演；执行', 'v', 'to do something to entertain people, for example by acting a play or playing a piece of music');
INSERT INTO `seniordata` VALUES (342, 'amazing', 'He’s an amazing player to watch.', '看他比赛那才叫精彩呢。', 'ə\'mezɪŋ', '令人惊奇的； 令人惊喜的', 'adj', 'very good, especially in an unexpected way');
INSERT INTO `seniordata` VALUES (343, 'pity', 'It’s a great pity Joyce wasn’t invited.', '乔伊斯没有受到邀请太遗憾了。', '\'pɪti', '遗憾；怜悯', 'n', 'used to show that you are disappointed about something and you wish things could happen differently');
INSERT INTO `seniordata` VALUES (344, 'total', 'That’s £7 and £3.50, so the total is £10.50.', '7英镑加上3.50英镑，所以总数是10.50英镑。', '\'totl', '总数；合计', 'n', 'the final number or amount of things, people etc when everything has been counted');
INSERT INTO `seniordata` VALUES (345, 'in total', 'There were probably about 40 people there in total. ＃', '总共可能有40人左右。', '', '总共；合计', '', '');
INSERT INTO `seniordata` VALUES (346, 'master', 'a work of art by a true master', '一件真正的大师之作', '\'mæstɚ', '能手；主人', 'n', 'someone who is very skilled at something');
INSERT INTO `seniordata` VALUES (347, 'praise', 'Jane was praised by her teacher.', '简受到了老师的表扬。', 'prez', '表扬；赞扬', 'v', 'to say that you admire and approve of someone or something, especially publicly');
INSERT INTO `seniordata` VALUES (348, 'national', 'Religion matters very much at a national level.', '宗教事务在全国都非常重要。', '\'næʃnəl', '国家的；民族的', 'adj', 'related to a whole nation as opposed to any of its parts');
INSERT INTO `seniordata` VALUES (349, 'recall', 'You don’t happen to recall his name, do you?', '你不会恰巧还想得起他的名字吧？', '\'rikɔl', '回忆起；回想起', 'v', 'to remember a particular fact, event, or situation from the past');
INSERT INTO `seniordata` VALUES (350, 'wound', 'A nurse cleaned and bandaged the wound.', '护士把伤口清洗包扎好。', 'wund', '伤；伤口；创伤', 'n', 'an injury to your body that is made by a weapon such as a knife or a bullet');
INSERT INTO `seniordata` VALUES (351, 'World War II', 'This is quite an amazing feat seeing as how it had to rise up after the end of World War II when it found itself almost destroyed.', '日本在第二次世界大战结束时几乎完全摧毁，看到它能如此迅速地崛起，这可真算得上是一个令人吃惊的业绩。', '', '第二次世界大战', '', '');
INSERT INTO `seniordata` VALUES (352, 'Titanic', 'Directly in back of the building is a lake from which the tips of icebergs protrude, and anchored there is a ship named Titanic, whose deck chairs can be rearranged.', '在建筑物正后面有一个湖，湖里露出冰山的小角，有一艘名叫泰坦尼克的船停在那里，它的甲板椅子可以重新排列。', 'taɪ\'tænɪk', '泰坦尼克号（轮船名）；《泰坦尼克号》（电影名）', '', 'a luxury British liner that struck an iceberg near Newfoundland on its maiden voyage on the night of April 14');
INSERT INTO `seniordata` VALUES (353, 'Carmen', 'I like Carmen very much.', '我非常喜欢歌剧“卡门”。', '', '卡门（女名）', '', '');
INSERT INTO `seniordata` VALUES (354, 'Dan', '', '', 'dæn', '丹 • 德维什', '', '');
INSERT INTO `seniordata` VALUES (355, 'custom', 'The custom of lighting the Olympic flame goes back centuries.', '点燃奥运圣火的风俗可追溯到几个世纪前。', '\'kʌstəm', '风俗；习俗', 'n', 'something that is done by people in a particular society because it is traditional');
INSERT INTO `seniordata` VALUES (356, 'bow', 'She bowed and left the stage.', '她鞠了一躬，离开了舞台。', 'baʊ', '鞠躬', 'v', 'to bend the top part of your body forward in order to show respect for someone important, or as a way of thanking an  audience');
INSERT INTO `seniordata` VALUES (357, 'kiss', 'Maggie leaned forward and kissed her cheek.', '玛吉俯身吻了她的脸颊。', 'kɪs', '亲吻；接吻', 'v', 'to touch someone with your lips as a greeting, to show them love, or as part of a sexual relationship');
INSERT INTO `seniordata` VALUES (358, 'greet', 'Belinda greeted her warmly.', '贝琳达热情地招呼她。', 'ɡrit', '打招呼；迎接', 'v', 'to say hello to someone or welcome them');
INSERT INTO `seniordata` VALUES (359, 'value', 'Shelley valued her privacy.', '谢利很重视自己的隐私。', '\'vælju', '重视；珍视', 'v', 'to think that someone or something is important');
INSERT INTO `seniordata` VALUES (360, 'everyday', 'the problems of everyday life', '日常生活中的问题', '\'ɛvrɪde', '每天的；日常的', 'adj', 'ordinary, usual, or happening every day');
INSERT INTO `seniordata` VALUES (361, 'drop by', 'She and Danny will drop by later. ＃', '她和丹尼待会儿会过来坐一下。', '', '顺便访问；随便进入', '', 'visit someone informally');
INSERT INTO `seniordata` VALUES (362, 'capital', 'Washington D.C., the capital of the United States', '美国首都华盛顿特区', '\'kæpɪtl', '首都；国都', 'n', 'an important city where the main government of a country, state etc is');
INSERT INTO `seniordata` VALUES (363, 'noon', 'We met at 12 noon.', '我们中午12点见了面。', 'nun', '正午；中午', 'n', '12 o’clock in the daytime');
INSERT INTO `seniordata` VALUES (364, 'mad', 'You make me so mad !', '你真把我气坏了！', 'mæd', '很生气；疯的', 'adj', 'angry');
INSERT INTO `seniordata` VALUES (365, 'get mad', '', '', '', '大动肝火；气愤', '', '');
INSERT INTO `seniordata` VALUES (366, 'make an effort', 'In the meantime, I sit on some committees and study part time for a masters degree, and I make an effort to enjoy every bird and tree I see, and every moment with family and friends.', '与此同时，我还继续担当一些委员会的代表并通过业余时间的学习去获得硕士学位。 我努力享受着每天看到的每一棵树每一只鸟，与家人和朋友在一起的每一个时刻。', '', '作出努力', '', '');
INSERT INTO `seniordata` VALUES (367, 'traffic', 'There wasn’t much traffic on the roads.', '路上车辆不多。', '\'træfɪk', '交通；路上行驶的车辆', 'n', 'the vehicles moving along a road or street');
INSERT INTO `seniordata` VALUES (368, 'somewhere', 'My wallet must be around here somewhere.', '我的钱包肯定是在这里的什么地方。', '\'sʌmwɛr', '在某处；到某处', 'adv', 'in or to a place, but you do not say or know exactly where');
INSERT INTO `seniordata` VALUES (369, 'passport', 'I have an Irish passport.', '我持爱尔兰护照。', '\'pæspɔrt', '护照', 'n', 'a small official document that you get from your government, that proves who you are, and which you need in order to leave your country and enter other countries');
INSERT INTO `seniordata` VALUES (370, 'chalk', 'a box of coloured chalks', '一盒彩色粉笔', 'tʃɔk', '粉笔', 'n', 'small sticks of a white or coloured substance like soft rock, used for writing or drawing');
INSERT INTO `seniordata` VALUES (371, 'blackboard', 'She marked a square on the blackboard.', '她在黑板上画了个正方形。', '\'blækbɔrd', '黑板', 'n', 'a board with a dark smooth surface, used in schools for writing on with  chalk');
INSERT INTO `seniordata` VALUES (372, 'northern', 'a man with a northern accent', '带有北方口音的男子', '\'nɔrðɚn', '北方的；北部的', 'adj', 'in or from the north of a country or area');
INSERT INTO `seniordata` VALUES (373, 'coast', 'We drove along the Pacific coast to Seattle.', '我们沿着太平洋海岸驾车前往西雅图。', 'kost', '海岸；海滨', 'n', 'the area where the land meets the sea');
INSERT INTO `seniordata` VALUES (374, 'season', 'the effect on plants as the seasons start to change', '换季对植物的影响', '\'sizn', '季；季节', 'n', 'one of the main periods into which a year is divided, each of which has a particular type of weather. The seasons are spring, summer, autumn, and winter');
INSERT INTO `seniordata` VALUES (375, 'knock', 'I knocked and knocked but nobody answered.', '我把门敲了又敲，但无人回应。', 'nɑk', '敲门（窗）；敲；击', 'v', 'to hit a door or window with your closed hand to attract the attention of the people inside');
INSERT INTO `seniordata` VALUES (376, 'eastern', 'the eastern shore of the island', '岛的东岸', '\'istɚn', '东方的；东部的', 'adj', 'in or from the east of a country or area');
INSERT INTO `seniordata` VALUES (377, 'worth', 'Our house is worth £200 000.', '攀登到山顶要很长时间，但为了能看到山顶上的风景，这是值得的。', 'wɝθ', '值得；值…钱的', 'adj', 'important, good or enjoyable enough to make sb feel satisfied, especially when difficulty or effort is involved');
INSERT INTO `seniordata` VALUES (378, 'manner', 'He felt some guilt over the manner of her death.', '她以这种方式死去，他心里有些内疚。', '\'mænɚ', '方式；方法；(pl) 礼貌；礼仪', 'n', 'the way in which something is done or happens');
INSERT INTO `seniordata` VALUES (379, 'empty', 'an empty box', '空盒子', 'ˈɛmptɪ', '空的；空洞的', 'adj', 'having nothing inside');
INSERT INTO `seniordata` VALUES (380, 'basic', 'the basic principles of chemistry', '化学的基本原理', '\'besɪk', '基本的；基础的', 'adj', 'forming the most important or most necessary part of something');
INSERT INTO `seniordata` VALUES (381, 'exchange', 'Four of my cassettes for your Madonna CD is a fair exchange.', '我用四盒磁带换你的麦当娜激光唱片很公平。', 'ɪks\'tʃendʒ', '交换', 'n', 'the act of giving someone something and receiving something else from them');
INSERT INTO `seniordata` VALUES (382, 'go out of one’s way', 'She went out of her way to help them. ＃', '她不辞劳苦地帮助他们。', '', '特地；格外努力', '', '');
INSERT INTO `seniordata` VALUES (383, 'make ... feel at home', 'Sit down and make yourself at home.', '坐下，别拘束。', '', '使（某人）感到宾至如归', '', '');
INSERT INTO `seniordata` VALUES (384, 'granddaughter', '...a drawing of my granddaughter Amelia.', '…一幅我孙女阿梅莉亚的画像。', '\'ɡrændɔtɚ', '（外）孙女', 'n', 'the daughter of your son or daughter');
INSERT INTO `seniordata` VALUES (385, 'behave', 'She behaved in a very responsible way .', '她表现得很有责任心。', 'bɪ\'hev', '表现；举止', 'v', 'to do things that are good, bad, sensible etc');
INSERT INTO `seniordata` VALUES (386, 'except', 'They were all there except me.', '除了我以外他们都在那里。', 'ɪk\'sɛpt', '除...之外', 'prep', 'used to introduce the only person, thing, action, fact, or situation about which a statement is not true');
INSERT INTO `seniordata` VALUES (387, 'elbow', 'He slipped and fell, badly bruising an elbow.', '他滑倒了，严重挫伤了一只胳膊肘。', '\'ɛlbo', '肘；胳膊', 'n', 'the joint where your arm bends');
INSERT INTO `seniordata` VALUES (388, 'gradually', 'Jill gradually became aware of an awful smell.', '吉尔渐渐地闻到了一股难闻的气味。', '\'grædʒʊəli', '逐步地；渐进地', 'adv', 'slowly, over a long period of time');
INSERT INTO `seniordata` VALUES (389, 'suggestion', 'Any suggestions would be welcome.', '任何建议都欢迎。', 'sə\'dʒɛstʃən', '建议', 'n', 'an idea, plan, or possibility that someone mentions, or the act of mentioning it');
INSERT INTO `seniordata` VALUES (390, 'Brazil', 'Brazil has a big surplus of coffee.', '巴西有很多剩余咖啡。', 'brə\'zil', '巴西', '', '');
INSERT INTO `seniordata` VALUES (391, 'Mexico', 'We want to prove that in Mexico.', '我们要在墨西哥证明这一点。', '\'mɛksɪko', '墨西哥', '', '');
INSERT INTO `seniordata` VALUES (392, 'Cali', 'We spent close to two months together in Cali, and we met up again in Buenos Aires for two more months.', '我们曾在卡利（哥伦比亚西部城市）一起度过近两个月，又在布宜诺期艾利斯相遇相聚了两个月。', '\'kɑ:li', '卡利（哥伦比亚城市）', '', '');
INSERT INTO `seniordata` VALUES (393, 'Colombia  VmbI', '', '', '', '哥伦比亚（南美洲国家）', '', '');
INSERT INTO `seniordata` VALUES (394, 'Lausanne', 'Well, he was still helping her a year later, then; for somebody met \'em living at Lausanne together.', '可一年之后他仍然在继续帮助她呢。 有人在洛桑亲眼看见他们住在一起。', 'lo\'zæn', '洛桑（瑞士城市）', '', '');
INSERT INTO `seniordata` VALUES (395, 'Norway', 'Sweden borders Norway and Finland.', '瑞典与挪威、芬兰接壤。', '\'nɔrweɪ', '挪威', '', '');
INSERT INTO `seniordata` VALUES (396, 'Maria', 'Steven: Yes, but Maria might not be back in. You might have to help me.', '史蒂文： 是的， 但是玛丽亚有可能回不来， 你可能得帮帮我。', '\'mɛərɪr', '玛丽亚（女名）', '', '');
INSERT INTO `seniordata` VALUES (397, 'Katie', 'But Katie, my older sister, is not there.', '但是凯蒂，我的姐姐，她不在那里。', '', '凯蒂（女名）', '', '');
INSERT INTO `seniordata` VALUES (398, 'Sato', '\"I have reason to think this person is missing,\" a friend seeking Kimiko Sato wrote on the site.', '“我有理由认为这个人失踪了”，一个寻找佐藤林睿君的朋友在网上写道。', '', '佐藤（日本姓氏）', '', '');
INSERT INTO `seniordata` VALUES (399, 'Marie', '', '', '\'mɑ:ri', '玛丽（女名）；马里（男名）', '', '');
INSERT INTO `seniordata` VALUES (400, 'Teresa Lopez Upez', '', '', '', '特蕾莎 • 洛佩斯（人名）', '', '');
INSERT INTO `seniordata` VALUES (401, 'Marc LeBlanc', '', '', '', '马克 • 勒布朗（人名）', '', '');
INSERT INTO `seniordata` VALUES (402, 'the more … the more', 'The more I thought about it, the less I liked the idea. ＃', '我越想就越觉得这个主意不好。', '', '越...越... ； 愈...愈...', '', 'used to say that if a particular activity increases, another change happens as a result');
INSERT INTO `seniordata` VALUES (403, 'leave out', 'We left out the possibility of his coming for the party. ＃', '我们没有考虑到他会来参加聚会。', '', '不包括；不提及；忽略', '', 'to not include or mention sb/sth in sth');
INSERT INTO `seniordata` VALUES (404, 'friendship', 'her close friendship with her aunt', '她与姑母的亲密友谊', '\'frɛndʃɪp', '友谊；友情', 'n', 'a relationship between friends');
INSERT INTO `seniordata` VALUES (405, 'king', 'On 2 December Henry VI was crowned king (= made the king at an official ceremony ).', '12月2日，亨利六世加冕为王。', 'kɪŋ', '君主；国王', 'n', 'a man who rules a country because he is from a royal family');
INSERT INTO `seniordata` VALUES (406, 'prime', 'Smoking is the prime cause of lung disease.', '抽烟是引发肺部疾病的首要原因。', 'praɪm', '首要的；基本的', 'adj', 'main or most important');
INSERT INTO `seniordata` VALUES (407, 'minister', 'a senior Cabinet minister', '资深的内阁部长', '\'mɪnɪstɚ', '大臣；部长', 'n', 'a politician who is in charge of a government depart-ment, in Britain and some other countries');
INSERT INTO `seniordata` VALUES (408, 'prime minister', '...the former prime minister of Pakistan, Miss Benazir Bhutto.', '…巴基斯坦前总理贝娜齐尔·布托小姐。', '', '总理; 首相', 'n', 'The leader of the government in some countries');
INSERT INTO `seniordata` VALUES (409, 'fame', 'He claims he is not really interested in fame.', '他称自己对出名真的没有兴趣。', 'fem', '名声；声誉', 'n', 'the state of being known about by a lot of people because of your achievements');
INSERT INTO `seniordata` VALUES (410, 'pale', 'He looked very pale and drawn.', '他看上去非常苍白憔悴。', 'pel', '苍白的；灰白的', 'adj', 'having a skin colour that is very white, or whiter than it usually is');
INSERT INTO `seniordata` VALUES (411, 'queen', 'At 18, Victoria was crowned queen (= officially became ruler ).', '18岁时，维多利亚加冕为女王。', 'kwin', '王后；女王', 'n', 'the wife of a king');
INSERT INTO `seniordata` VALUES (412, 'examine', 'A team of divers was sent down to examine the wreck.', '一组潜水员被送到水下检查沉船。', 'ɪg\'zæmɪn', '（仔细地）检查；检验', 'v', 'to look at something carefully and thoroughly because you want to find out more about it');
INSERT INTO `seniordata` VALUES (413, 'nor', 'This clock neither gains nor loses.', '这钟走得既不快也不慢。', 'nɔr', '也不', 'conj', 'used before the second or last of a set of negative possibilities, usually after \'neither\'');
INSERT INTO `seniordata` VALUES (414, 'neither ... nor', '', '', '', '既不...也不', '', '');
INSERT INTO `seniordata` VALUES (415, 'palace', 'Buckingham Palace', '白金汉宫', 'ˈpælɪs', '王宫；宫殿', 'n', 'the official home of a person of very high rank, especially a king or queen – often used in names');
INSERT INTO `seniordata` VALUES (416, 'power', 'They seized power in a military coup.', '他们在一场军事政变中夺取了政权。', '\'paʊɚ', '权利；力量', 'n', 'the ability or right to control people or events');
INSERT INTO `seniordata` VALUES (417, 'wealth', 'The country’s wealth comes from its oil.', '这个国家的财富来自石油。', 'wɛlθ', '富裕；丰裕', 'n', 'a large amount of money, property etc that a person or country owns');
INSERT INTO `seniordata` VALUES (418, 'grey', 'an old lady with grey hair', '头发灰白的老太太', 'ɡre', '灰色的；（天空）阴沉的；昏暗的', 'adj', 'having the colour of dark clouds, neither black nor white');
INSERT INTO `seniordata` VALUES (419, 'lemon', 'a slice of lemon', '一片柠檬', '\'lɛmən', '柠檬', 'n', 'a fruit with a hard yellow skin and sour juice');
INSERT INTO `seniordata` VALUES (420, 'cancel', 'Our flight was cancelled.', '我们的航班取消了。', '\'kænsl', '取消；终止', 'v', 'to decide that something that was officially planned will not happen');
INSERT INTO `seniordata` VALUES (421, 'weight', 'The average weight of a baby at birth is just over seven pounds.', '婴儿的平均出生体重是七磅多一点。', 'wet', '重量；分量', 'n', 'how heavy something is when you measure it');
INSERT INTO `seniordata` VALUES (422, 'shoulder', 'She tapped the driver on the shoulder.', '她拍拍司机的肩。', '\'ʃoldɚ', '肩；肩膀', 'n', 'one of the two parts of the body at each side of the neck where the arm is connected');
INSERT INTO `seniordata` VALUES (423, 'goal', 'Your goal as a parent is to help your child become an independent adult.', '身为父母，你的目标就是要培养孩子成为独立的成年人。', 'ɡol', '目标；球门；射门', 'n', 'something that you hope to achieve in the future');
INSERT INTO `seniordata` VALUES (424, 'coach', 'a tennis coach', '网球教练', 'kotʃ', '教练；私人教师', 'n', 'someone who trains a person or team in a sport');
INSERT INTO `seniordata` VALUES (425, 'kick', 'He kicked the door hard.', '他用力踢门。', 'kɪk', '踢；踹', 'v', 'If you kick someone or something, you hit them forcefully with your foot');
INSERT INTO `seniordata` VALUES (426, 'teammate', 'He was always a solid player, a hard worker, a great example to his teammates.', '他一直是实力派运动员，勤奋刻苦，是队友的好榜样。', '\'tim\'met', '同队队员；队友', 'n', 'In a game or sport, your teammates are the other members of your team');
INSERT INTO `seniordata` VALUES (427, 'courage', 'Sue showed great courage throughout her illness.', '休在生病期间表现出了极大的勇气。', ' \'kɝrɪdʒ', '勇敢；勇气', 'n', 'the quality of being brave when you are facing a difficult or dangerous situation or when you are very ill');
INSERT INTO `seniordata` VALUES (428, 'rather', 'I grew up in rather unusual circumstances.', '我在相当不寻常的环境中长大。', '\'ræðɚ', '相当；宁愿', 'adv', 'You use rather to indicate that something is true to a fairly great extent, especially when you are talking about something unpleasant or undesirable');
INSERT INTO `seniordata` VALUES (429, 'rather than', 'I think you’d call it a lecture rather than a talk.', '我说啊，这是训斥，不是谈话。', '', '而不是', '', 'instead of');
INSERT INTO `seniordata` VALUES (430, 'pull', 'Mom! Davey’s pulling my hair!', '妈妈! 戴维拽我的头发！', 'pʊl', '拉；拖', 'v', 'to use your hands to make something or someone move towards you or in the direction that your hands are moving');
INSERT INTO `seniordata` VALUES (431, 'pull together', 'The nation was urged to pull together to avoid a slide into complete chaos.', '敦促全体国民同心协力，避免陷入全面的混乱之中。', '', '齐心协力；通力合作', '', 'If people pull together, they help each other or work together in order to deal with a difficult situation');
INSERT INTO `seniordata` VALUES (432, 'relief', 'I felt a huge surge of relief and happiness.', '我如释重负，大感欣慰。', 'rɪ\'lif', '轻松；解脱', 'n', 'a feeling of comfort when something frightening, worrying, or painful has ended or has not happened');
INSERT INTO `seniordata` VALUES (433, 'nod', 'I asked her if she was ready to go, and she nodded.', '我问她是否已准备好出发，她点了点头。', 'nɑd', '点头', 'v', 'to move your head up and down, especially in order to show agreement or understanding');
INSERT INTO `seniordata` VALUES (434, 'agreement', 'It is easier for two parties to reach agreement than for three.', '两方达成一致比三方达成一致容易。', 'ə\'grimənt', '（意见或看法）一致；同意', 'n', 'when people have the same opinion as each other');
INSERT INTO `seniordata` VALUES (435, 'fault', 'His worst fault is his arrogance.', '他最大的缺点是傲慢。', 'fɔlt', '过失；缺点', 'n', 'a bad or weak part of someone’s character');
INSERT INTO `seniordata` VALUES (436, 'disappoint', 'I hated to disappoint her.', '我不愿意让她失望。', '\'dɪsə\'pɔɪnt', '使失望', 'v', 'to make someone feel unhappy because something they hoped for did not happen or was not as good as they expected');
INSERT INTO `seniordata` VALUES (437, 'Bert', 'These two guys, in case you forgot, are called Bert and Ernie.', '以防忘记，我告诉大家这两个人物叫伯特和尔尼。', '', '伯特（男名）', '', '');
INSERT INTO `seniordata` VALUES (438, 'Holly', '', '', '\'hɑli', '霍莉（女名）', '', '');
INSERT INTO `seniordata` VALUES (439, 'backpack', '', '', '\'bæk\'pæk', '背包；旅行包', 'n', 'a  rucksack');
INSERT INTO `seniordata` VALUES (440, 'oversleep', 'Sorry I\'m late. I overslept.', '很抱歉我迟到了，我睡过头了。', 'ovə\'slip', '(过去式 overslept, 过去分词 overslept) 睡过头；睡得太久', 'v', 'to sleep for longer than you intended');
INSERT INTO `seniordata` VALUES (441, 'give ... a lift', '', '', '', '捎（某人）一程', '', '');
INSERT INTO `seniordata` VALUES (442, 'miss', 'I’m absolutely starving – I missed lunch.', '我饿坏了——我没吃上午饭。', 'mɪs', '错过；未得到', 'v', 'to not go somewhere or do something, especially when you want to but cannot');
INSERT INTO `seniordata` VALUES (443, 'unexpected', 'His death was totally unexpected.', '他的死完全出人意料。', '\'ʌnɪk\'spɛktɪd', '出乎意料的；始料不及的', 'adj', 'If an event or someone\'s behaviour is unexpected, it surprises you because you did not think that it was likely to happen');
INSERT INTO `seniordata` VALUES (444, 'block', 'Head for 44th Street, a few blocks east of Sixth Avenue.', '往44号街走，从第六大街往东走几个街区就是。', 'blɑk', '街区', 'n', 'the distance along a city street from where one street crosses it to the next');
INSERT INTO `seniordata` VALUES (445, 'worker', 'workers in the tourist industry', '旅游行业工作者', '\'wɝkɚ', '工作者；工人', 'n', 'someone who does a job, especially a particular type of job');
INSERT INTO `seniordata` VALUES (446, 'stare', 'She sat there staring into space (= looking for a long time at nothing ) .', '她坐在那里，出神地凝视前方。', 'stɛr', '盯着看；凝视', 'v', 'to look at something or someone for a long time without moving your eyes, for example because you are surprised, angry, or bored');
INSERT INTO `seniordata` VALUES (447, 'disbelief', 'The reaction to the murders was one of shock and disbelief.', '人们对这些谋杀事件的反应是震惊和不敢相信。', ',dɪsbɪ\'lif', '不信；怀疑', 'n', 'a feeling that something is not true or does not exist');
INSERT INTO `seniordata` VALUES (448, 'above', 'Our office is above the hairdresser’s.', '我们的办公室在理发店上面。', 'ə\'bʌv', '在上面；向上面', 'adv', 'in a higher position than something else');
INSERT INTO `seniordata` VALUES (449, 'burn', 'The boiler burns oil to produce heat.', '锅炉烧油产生热量。', 'bɝn', '着火；燃烧', 'v', 'if you burn a fuel, or if it burns, it is used to produce power, heat, light etc');
INSERT INTO `seniordata` VALUES (450, 'alive', 'It was a bad accident – they’re lucky to be alive.', '这是一宗严重事故——他们能活着实属幸运。', 'ə\'laɪv', '活着；有生气的', 'adj', 'still living and not dead');
INSERT INTO `seniordata` VALUES (451, 'take off', 'We eventually took off at 11 o\'clock and arrived in Juneau at 1:30.', '我们终于在11点起飞，1:30到达朱诺。', '', '中文释义:（飞机等）起飞；匆忙离开', '', 'When an aeroplane takes off, it leaves the ground and starts flying');
INSERT INTO `seniordata` VALUES (452, 'till', 'I didn’t have a boyfriend till I was 17.', '我直到17岁才有男朋友。', 'tɪl', '到；直到', 'conj & prep', 'until');
INSERT INTO `seniordata` VALUES (453, 'west', 'The route then heads west over Gerrick Moor.', '之后这条路折向西，穿过格里克漠泽。', 'wɛst', '向西；朝西', 'adv', 'towards the west');
INSERT INTO `seniordata` VALUES (454, 'cream', 'fresh cream', '鲜奶油', 'krim', '奶油；乳脂', 'n', 'a thick yellow-white liquid that rises to the top of milk');
INSERT INTO `seniordata` VALUES (455, 'boss', 'I’ll have to ask my boss for a day off.', '我得向老板请一天假。', 'bɑs', '老板；领导', 'n', 'the person who employs you or who is in charge of you at work');
INSERT INTO `seniordata` VALUES (456, 'pie', 'I had a steak and kidney pie with chips.', '我吃了一份牛肉腰子馅饼加薯条。', 'paɪ', '果馅饼；果馅派', 'n', 'fruit baked inside a  pastry  covering');
INSERT INTO `seniordata` VALUES (457, 'course', 'Andy’s doing a one-year journalism course.', '安迪正在修读为期一年的新闻课程。', 'kɔrs', '课程；过程，进程', 'n', 'a series of lessons in a particular subject');
INSERT INTO `seniordata` VALUES (458, 'bean', 'baked beans', '烘豆', 'bin', '豆；豆荚', 'n', 'a seed or a  pod , that comes from a climbing plant and is cooked as food. There are very many types of beans.');
INSERT INTO `seniordata` VALUES (459, 'market', 'Our main overseas market is Japan.', '我们的主要海外市场是日本。', '\'mɑrkɪt', '市场；集市', 'n', 'a particular country or area where a company sells its goods or where a particular type of goods is sold');
INSERT INTO `seniordata` VALUES (460, 'costume', 'the film’s lavish costumes and spectacular sets', '影片中奢华的戏装和壮观的场景', 'ˈkɑsˌtum', '戏装；化装服；服装，装束', 'n', 'a set of clothes worn by an actor or by someone to make them look like something such as an animal, famous person etc');
INSERT INTO `seniordata` VALUES (461, 'embarrassed', 'Lori gets embarrassed if we ask her to sing.', '我们要是请洛丽唱歌，她就会难为情。', 'ɪm\'bærəst', '窘迫的；害羞的', 'adj', 'feeling uncomfortable or nervous and worrying about what people think of you');
INSERT INTO `seniordata` VALUES (462, 'announce', 'They announced their engagement in ‘The Times’.', '他们在《泰晤士报》上宣布了订婚的消息。', 'ə\'naʊns', '宣布；宣告', 'v', 'to officially tell people about something, especially about a plan or a decision');
INSERT INTO `seniordata` VALUES (463, 'spaghetti', 'Susan: What kind of spaghetti sauce is this?', '苏珊： 这是哪种意大利面条酱？', 'spə\'ɡɛti', '意大利面条', 'n', 'a type of  pasta  in very long thin pieces, that is cooked in boiling water');
INSERT INTO `seniordata` VALUES (464, 'hoax', 'a bomb hoax', '虚假炸弹恐吓', 'hoks', '恶作剧；骗局', 'n', 'a false warning about something dangerous');
INSERT INTO `seniordata` VALUES (465, 'discovery', 'I felt I\'d made an incredible discovery.', '我感到自己有了一个惊人的发现。', 'dɪ\'skʌvəri', '发现；发觉', 'n', 'a fact or thing that someone finds out about, when it was not known about before');
INSERT INTO `seniordata` VALUES (466, 'lady', 'young/old/elderly etc lady', '年轻女子/上了年纪的女士/老妇人等', '\'ledi', '女士；女子；举止文雅的女人，淑女', 'n', 'a woman of a particular type or age');
INSERT INTO `seniordata` VALUES (467, 'officer', 'a commanding officer of the SAS', '英国空军特种部队的一名指挥官', '\'ɔfɪsɚ', '军官；官员', 'n', 'someone who is in a position of authority in the army, navy etc');
INSERT INTO `seniordata` VALUES (468, 'believable', 'a story with believable characters in it', '人物真实可信的故事', 'bi\'li:vəbl', '可相信的；可信任的', 'adj', 'something that is believable can be believed because it seems possible, likely, or real');
INSERT INTO `seniordata` VALUES (469, 'embarrassing', 'She asked a lot of embarrassing questions.', '她问了许多令人尴尬的问题。', 'ɪm\'bærəsɪŋ', '使人害羞的（难堪的或惭愧的）', 'adj', 'making you feel ashamed, nervous, or uncomfortable');
INSERT INTO `seniordata` VALUES (470, 'New Zealand', 'Meat from New Zealand is frozen and brought to England in special ships.', '从新西兰运来的肉被冷冻保藏，用特殊的船运往英国。', '', '新西兰', '', '');
INSERT INTO `seniordata` VALUES (471, 'Italy', 'They decided to swan around Italy this summer.', '他们决定今年夏天去意大利游逛。', '\'ɪtəlɪ', '意大利', '', '');
INSERT INTO `seniordata` VALUES (472, 'Mars', 'the enormous volcanoes known to exist on Mars', '已知在火星上存在的大量火山', 'mɑrz', '火星', '', 'the small red  planet  that is fourth in order from the Sun and is nearest the Earth');
INSERT INTO `seniordata` VALUES (473, 'Carl', 'Call me Carl.', '叫我卡尔吧。', '', '卡尔（男名）', '', '');
INSERT INTO `seniordata` VALUES (474, 'Orson', '', '', '\'ɔ:sən', '奥森', '', '');
INSERT INTO `seniordata` VALUES (475, 'litter', 'Clothes littered the floor.', '衣服扔了一地。', '\'lɪtɚ', '使凌乱；把...弄乱；乱扔（垃圾）', 'v', 'if things litter an area, there are a lot of them in that place, scattered in an untidy way');
INSERT INTO `seniordata` VALUES (476, 'bottom', 'The drugs had been hidden in a suitcase with a false bottom.', '毒品藏在一个带假底板的行李箱里。', '\'bɑtəm', '底部；最下部', 'n', 'the lowest part of something');
INSERT INTO `seniordata` VALUES (477, 'fisherman', 'The Algarve is a paradise for fishermen whether river anglers or deep-sea fishermen.', '阿尔加维对河边的垂钓者或深海的渔民都是一个天堂。', '\'fɪʃɚmən', '渔民；钓鱼的人', 'n', 'someone who catches fish as a sport or as a job');
INSERT INTO `seniordata` VALUES (478, 'coal', 'Put some coal on the fire.', '往火里加点煤。', 'kol', '煤；煤块', 'n', 'a hard black mineral which is dug out of the ground and burnt to produce heat');
INSERT INTO `seniordata` VALUES (479, 'public', 'We have to show that publishing this story is in the public interest (= helpful or useful to ordinary people ) .', '我们必须证明刊登这篇报道有利于公众。', '\'pʌblɪk', '公众的；公共的', 'adj', 'relating to all the ordinary people in a country, who are not members of the government or do not have important jobs');
INSERT INTO `seniordata` VALUES (480, 'ugly', 'a very ugly man', '非常丑陋的男子', '\'ʌɡli', '丑陋的；难看的', 'adj', 'extremely unattractive and unpleasant to look at');
INSERT INTO `seniordata` VALUES (481, 'advantage', 'Younger workers tend to be at an advantage (=  have an advantage  ) when applying for jobs.', '年轻点的工人申请工作时往往处于优势地位。', 'əd\'væntɪdʒ', '有利条件；优点', 'n', 'something that helps you to be more successful than others, or the state of having this');
INSERT INTO `seniordata` VALUES (482, 'cost', 'A full day’s activities will cost you £45.', '全天的活动需要45英镑。', 'kɔst', '花费；价钱为；计算…的成本；估计…的花费', 'v', 'to have a particular price');
INSERT INTO `seniordata` VALUES (483, 'wooden', 'a wooden bench', '木制长椅', '\'wʊdn', '木制的；木头的', 'adj', 'made of wood');
INSERT INTO `seniordata` VALUES (484, 'plastic', 'a plastic spoon', '塑料汤匙', '\'plæstɪk', '塑料的', 'adj', 'made of plastic');
INSERT INTO `seniordata` VALUES (485, 'make a difference', 'Whatever she did, it made no difference. ＃', '不管她做什么都没有用。', '', '有关系，作用，影响', '', 'to have an important effect or influence on something or someone');
INSERT INTO `seniordata` VALUES (486, 'shark', 'Sharks were circling around our boat.', '鲨鱼在我们的小船周围游弋。', 'ʃɑrk', '鲨鱼', 'n', 'a large sea fish with several rows of very sharp teeth that is considered to be dangerous to humans');
INSERT INTO `seniordata` VALUES (487, 'fin', 'We could see the fin of a shark as it slowly circled our boat.', '一条鲨鱼绕着我们的船缓缓转圈，我们都看到它的鳍。', 'fɪn', '（鱼）鳍', 'n', 'one of the thin body parts that a fish uses to swim');
INSERT INTO `seniordata` VALUES (488, 'cut off', 'Mrs. Johnson cut off a generous piece of the meat.', '约翰逊太太切下一大块肉。', '', '割掉；砍掉', '', 'If you cut something off, you remove it with a knife or a similar tool');
INSERT INTO `seniordata` VALUES (489, 'method', 'traditional teaching methods', '传统的教学法', '\'mɛθəd', '方法；措施', 'n', 'a planned way of doing something, especially one that a lot of people know about and use');
INSERT INTO `seniordata` VALUES (490, 'cruel', 'His death was a cruel blow .', '他的死是个无情的打击。', 'kruəl', '残酷的；残忍的', 'adj', 'making someone suffer or feel unhappy');
INSERT INTO `seniordata` VALUES (491, 'harmful', 'the harmful effects of smoking', '吸烟的害处', '\'hɑrmfəl', '有害的', 'adj', 'causing harm');
INSERT INTO `seniordata` VALUES (492, 'chain', 'She had a gold chain around her neck.', '她脖子上戴了条金项链。', 'tʃen', '链子；链条', 'n', 'a series of metal rings which are joined together in a line and used for fastening things, supporting weights, decoration etc');
INSERT INTO `seniordata` VALUES (493, 'ecosystem', '...the forest ecosystem.', '…森林生态系统。', '\'ɛko,sɪstəm', '生态系统', 'n', 'all the animals and plants in a particular area, and the way in which they are related to each other and to their environment');
INSERT INTO `seniordata` VALUES (494, 'low', 'Their safety standards seem to be pretty low.', '他们的安全标准似乎相当低。', '', '（数量等）少的；低的；矮的', 'adj', 'bad, or below an acceptable or usual level or quality');
INSERT INTO `seniordata` VALUES (495, 'industry', 'This type of software is widely used in industry.', '这种软件广泛应用于工业。', '\'ɪndəstri', '工业；行业', 'n', 'the large-scale production of goods or of substances such as coal and steel');
INSERT INTO `seniordata` VALUES (496, 'law', 'Elected officials ought to obey the law.', '民选官员理应遵守法律。', 'lɔ', '法律；法规', 'n', 'the whole system of rules that people in a particular country or area must obey');
INSERT INTO `seniordata` VALUES (497, 'reusable', 'Store refrigerated food in reusable containers rather than in plastic wrap or aluminium foil.', '用可再用容器而不是保鲜膜或铝箔纸来储存冷冻食品。', ',ri\'juzəbl', '可重复使用的；可再次使用的', 'adj', 'Things that are reusable can be used more than once');
INSERT INTO `seniordata` VALUES (498, 'afford', 'I couldn’t afford the rent on my own.', '我单靠自己付不起房租。', 'ə\'fɔrd', '买得起；承担得起（后果）', 'v', 'to have enough money to buy or pay for something');
INSERT INTO `seniordata` VALUES (499, 'transportation', 'The city needs to improve its public transportation (= buses, trains etc ) .', '这座城市需要改善公共交通。', ',trænspɔr\'teʃən', '运输业；交通运输', 'n', 'a system or method for carrying passengers or goods from one place to another');
INSERT INTO `seniordata` VALUES (500, 'recycle', 'We take all our bottles to be recycled.', '我们把我们所有的瓶子都回收利用。', ',ri\'saɪkl', '回收利用；再利用', 'v', 'to put used objects or materials through a special process so that they can be used again');
INSERT INTO `seniordata` VALUES (501, 'napkin', '...taking tiny bites of a hot dog and daintily wiping my lips with a napkin.', '…小口咬着热狗并用餐巾文雅地擦着我的嘴唇。', '\'næpkɪn', '餐巾；餐巾纸', 'n', 'a square piece of cloth or paper used for protecting your clothes and for cleaning your hands and lips during a meal');
INSERT INTO `seniordata` VALUES (502, 'upside down', 'To get the plant out of the pot, turn it upside down and give it a gentle knock.', '如果要把植物从盆里取出来，就把花盆翻过来，轻轻敲一下。', '', '颠倒；倒转', '', 'with the top at the bottom and the bottom at the top');
INSERT INTO `seniordata` VALUES (503, 'gate', 'We went through the gate into the orchard.', '我们穿过大门进了果园。', 'ɡet', '大门', 'n', 'the part of a fence or outside wall that you can open and close so that you can enter or leave a place');
INSERT INTO `seniordata` VALUES (504, 'bottle', 'an empty bottle', '一个空瓶子', '\'bɑtl', '瓶；瓶子', 'n', 'a container with a narrow top for keeping liquids in, usually made of plastic or glass');
INSERT INTO `seniordata` VALUES (505, 'president', 'President Bush', '布什总统', '\'prɛzɪdənt', '主席；总统；负责人', 'n', 'the official leader of a country that does not have a king or queen');
INSERT INTO `seniordata` VALUES (506, 'inspiration', 'The Malvern Hills have provided inspiration for many artists and musicians over the decades.', '几十年来，莫尔文丘陵为很多艺术家和音乐家提供了灵感。', 'ˌɪnspəˈreʃən', '灵感；鼓舞人心的人（或事物）', 'n', 'a good idea about what you should do, write, say etc, especially one which you get suddenly');
INSERT INTO `seniordata` VALUES (507, 'metal', 'The gate is made of metal.', '这扇大门是用金属做成的。', '\'mɛtl', '金属', 'n', 'a hard, usually shiny substance such as iron, gold, or steel');
INSERT INTO `seniordata` VALUES (508, 'creativity', 'artistic creativity', '艺术创造力', ',krie\'tɪvəti', '创造力；独创性', 'n', 'the ability to use your imagination to produce new ideas, make things etc');
INSERT INTO `seniordata` VALUES (509, 'WildAid', 'Since 1999, WildAid has helped the Russian government save the Siberian Tiger.', '“野生救援”从1999年开始帮助俄罗斯政府拯救西伯利亚虎。', '', '野生救援协会（美国）', '', '');
INSERT INTO `seniordata` VALUES (510, 'WWF', 'The WWF says it is worried about the loss of and damage to Earth\'s environment.', '世界自然基金会称很担心这给地球环境带来的损失和破坏。', '', '世界自然基金会(World Wide Fund For Nature)', '', '');
INSERT INTO `seniordata` VALUES (511, 'Mark', '', '', '', '马克（男名）', '', '');
INSERT INTO `seniordata` VALUES (512, 'Jason', 'Jason: No, I just want to accumulate some useful experience there.', '杰森:不想，我只想在那里积累一些有用的经验。', '\'dʒesən', '杰森（男名）', '', '');
INSERT INTO `seniordata` VALUES (513, 'Ken', 'Do they associate with Mary and Ken out of genuine affection, or because spending time with such miserable types makes them feel (and look) better?', '他们陪伴玛丽和肯恩真的是出于诚挚的感情吗？ 亦或是这些悲惨的人能令他们感觉（或是看起来）更好?', '', '肯（男名）', '', '');
INSERT INTO `seniordata` VALUES (514, 'Hayes', '', '', 'heiz', '海斯（姓）', '', '');
INSERT INTO `seniordata` VALUES (515, 'Jessica', 'You can ask Jessica what it’s like to be his sister.', '你可以问问杰西卡，做乔伊的姐姐是个什么感觉。', '\'dʒesikə', '杰茜卡（女名）', '', '');
INSERT INTO `seniordata` VALUES (516, 'Survey', 'The council conducted a survey of the uses to which farm buildings are put.', '该委员会对农场建筑的用途进行了一个调查。', 'ˈsɝˌve; (for v.) sɝˈve', '调查', 'n', 'If you carry out a survey, you try to find out detailed information about a lot of different people or things, usually by asking people a series of questions');
INSERT INTO `seniordata` VALUES (517, 'standard', 'Students have to reach a certain standard or they won’t pass.', '学生必须达到某一标准，否则无法通过。', '\'stændɚd', '标准；水平', 'n', 'the level that is considered to be acceptable, or the level that someone or something has achieved');
INSERT INTO `seniordata` VALUES (518, 'row', 'row upon row (= many rows ) of shelves stacked with books', '一排又一排堆满书的架子', 'ro', '一排；一列；一行', 'n', 'a line of things or people next to each other');
INSERT INTO `seniordata` VALUES (519, 'in a row', 'I’ve beaten her three times in a row . ＃', '我已经连续赢了她三次。', '', '连续几次地', '', 'happening a number of times, one after the other');
INSERT INTO `seniordata` VALUES (520, 'keyboard', 'a computer keyboard', '计算机键盘', '\'ki\'bɔrd', '（计算机等）键盘；琴键', 'n', 'a board with buttons marked with letters or numbers that are pressed to put information into a computer or other machine');
INSERT INTO `seniordata` VALUES (521, 'instruction', 'My instructions are (= I have been told ) to give the package to him personally.', '我接到的指示是亲手把包裹交给他。', 'ɪn\'strʌkʃən', '指示；命令', 'n', 'a statement telling someone what they must do');
INSERT INTO `seniordata` VALUES (522, 'double', 'The church has doubled its membership in the last five years.', '这座教堂的会众在过去的五年里增加了一倍。', '\'dʌbl', '加倍；是...的两倍', 'v', 'to become twice as big or twice as much, or to make something twice as big or twice as much');
INSERT INTO `seniordata` VALUES (523, 'shall', 'We shall be away next week.', '我们下周要出去。', 'ʃəl', '将要；将会', 'v', 'used to say what you will do in the future');
INSERT INTO `seniordata` VALUES (524, 'overcome', 'He struggled to overcome his shyness.', '他努力克服自己的羞怯。', ',ovɚ\'kʌm', '克服；战胜', 'v', 'to successfully control a feeling or problem that prevents you from achieving something');
INSERT INTO `seniordata` VALUES (525, 'make a mess', 'Many people make a mess of handling money.', '很多人不会理财。', '', '弄得一团糟，一塌糊涂', '', 'to do something badly');
INSERT INTO `seniordata` VALUES (526, 'graduate', 'When the boys graduated from high school, Ann moved to a small town in Vermont.', '男孩们中学毕业后安迁到了佛蒙特州的一座小镇。', 'ˈɡrædʒuˌet', '毕业；获得学位', 'v', 'to obtain a degree, especially a first degree, from a college or university');
INSERT INTO `seniordata` VALUES (527, 'keep one’s cool', '', '', '', '沉住气；保持冷静', '', '');
INSERT INTO `seniordata` VALUES (528, 'ours', 'I’ll show you to your room. Ours is next door.', '我带你去你的房间，我们的房间在你的隔壁。', 'ɑrz', '我们的', 'pron', 'used to refer to something that belongs to or is connected with us');
INSERT INTO `seniordata` VALUES (529, 'senior', 'the senior Democrat on the House committee', '众议院委员会中的资深民主党人', '\'sinɪɚ', '级别（或地位）高的', 'adj', 'having a higher position, level, or rank');
INSERT INTO `seniordata` VALUES (530, 'senior high (school)', '', '', '', '高中', '', '');
INSERT INTO `seniordata` VALUES (531, 'text', 'There should not be too much text in children’s books.', '儿童书籍里不应该有太多的文字。', 'tɛkst', '文本；课文', 'n', 'the writing that forms the main part of a book, magazine etc, rather than the pictures or notes');
INSERT INTO `seniordata` VALUES (532, 'level', 'Inflation fell to its lowest level in 30 years.', '通货膨胀降至30年来最低点。', '\'lɛvl', '标准；水平', 'n', 'the amount or degree of something, compared to another amount or degree');
INSERT INTO `seniordata` VALUES (533, 'degree', 'Preheat the oven to 425 degrees.', '把烘箱预热至425度。', 'dɪ\'ɡri', '度数；程度；（大学的）学位', 'n', 'a unit for measuring temperature. It can be shown as a symbol after a number. For example, 70° means 70 degrees.');
INSERT INTO `seniordata` VALUES (534, 'manager', 'one of our regional managers', '我们的一位地区经理', '\'mænɪdʒɚ', '经理；经营者', 'n', 'someone whose job is to manage part or all of a company or other organization');
INSERT INTO `seniordata` VALUES (535, 'believe in', 'You can believe in this girl,she\'ll never let you down.', '你可以信任这位姑娘，她决不会让你失望的。', '', '信任；信赖', '', 'to feel that you can trust sb');
INSERT INTO `seniordata` VALUES (536, 'gentleman', 'Could you serve this gentleman please, Miss Bath?', '巴思小姐，请你接待一下这位先生好吗？', '\'dʒɛntlmən', '先生', 'n', 'a polite word for a man, used especially when talking to or about a man you do not know');
INSERT INTO `seniordata` VALUES (537, 'graduation', 'After graduation Neil returned to Ohio.', '尼尔毕业以后回到了俄亥俄州。', ',ɡrædʒu\'eʃən', '毕业', 'n', 'the time when you complete a university degree course or your education at an American  high school');
INSERT INTO `seniordata` VALUES (538, 'ceremony', 'a wedding ceremony', '婚礼', 'ˈsɛrəˌmoʊni', '典礼；仪式', 'n', 'an important social or religious event, when a traditional set of actions is performed in a formal way');
INSERT INTO `seniordata` VALUES (539, 'congratulate', 'He never even stopped to congratulate me.', '他甚至没有过来向我祝贺。', 'kən\'ɡrætʃulet', '祝贺', 'v', 'to tell someone that you are happy because they have achieved something or because something nice has happened to them');
INSERT INTO `seniordata` VALUES (540, 'thirsty', 'Can I have a glass of water? I’m really thirsty.', '我能喝一杯水吗？ 我太渴了。', '\'θɝsti', '口渴的；渴望的', 'adj', 'feeling that you want or need a drink');
INSERT INTO `seniordata` VALUES (541, 'none', 'I wish I could offer you some cake but there’s none left.', '我真想能请你吃些蛋糕，但一点也没剩的了。', 'nʌn', '没有一个；毫无', 'pron', 'not any amount of something or not one of a group of people or things');
INSERT INTO `seniordata` VALUES (542, 'task', 'Sara had the task of preparing the agenda for meetings.', '萨拉的任务是准备会议议程。', 'tæsk', '任务；工作', 'n', 'a piece of work that must be done, especially one that is difficult or unpleasant or that must be done regularly');
INSERT INTO `seniordata` VALUES (543, 'ahead', 'He kept his gaze fixed on the car ahead.', '他的目光一直盯着前面的那辆汽车。', 'ə\'hɛd', '向前面；在前面', 'adv', 'a short distance in front of someone or something');
INSERT INTO `seniordata` VALUES (544, 'responsible', 'We are determined to bring the people responsible to justice.', '我们决意要将肇事者绳之以法。', 'rɪ\'spɑnsəbl', '应承担责任的；有责任的', 'adj', 'if someone is responsible for an accident, mistake, crime etc, it is their fault or they can be blamed');
INSERT INTO `seniordata` VALUES (545, 'be responsible for', 'Police believe that the same man is responsible for three other murders in the area.', '警方认为该地区其他三宗谋杀案也是此人所为。', '', '对...有责任；负责任', '', '');
INSERT INTO `seniordata` VALUES (546, 'separate', 'The gym and the sauna are in separate buildings.', '健身房和桑拿浴室在不同的大楼里。', '(for v.) sɛpəˌret; (for adj.) sɛprɪt', '单独的； 分离的', 'adj', 'not joined to or touching something else');
INSERT INTO `seniordata` VALUES (547, 'wing', 'The bird flapped its wings furiously.', '那只鸟使劲地拍打着翅膀。', 'wɪŋ', '翅膀；翼', 'n', 'one of the large flat parts that stick out from the side of a plane and help to keep it in the air');
INSERT INTO `seniordata` VALUES (548, 'Brian', 'Brian: So I could wear my swimmers to the office?', '布莱恩：那么我可以穿我的游泳衣去办公室了？', '\'braɪən', '布莱恩（男名）', '', '');
INSERT INTO `seniordata` VALUES (549, 'Luke', 'So the first casualty of the expedition was Luke himself, who decided to leave.', '因此这次探险的第一个受害者是卢克自己，他决定离开。', 'luk', '卢克（男名）', '', '');
INSERT INTO `seniordata` VALUES (550, 'Griffin', '', '', '', '格里芬（姓）', '', '');
INSERT INTO `seniordata` VALUES (551, 'Trent', 'For Tom and Trent, the trap demonstration was a setup on a stage.', '对汤姆和特伦特来说，这只是个设置在舞台上的陷阱。', 'trent', '特伦特（姓）', '', '');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `level` int(0) NULL DEFAULT 1,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parent_control_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `study_level` enum('junior','middle','senior') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'junior',
  `avatar` enum('1','2','3','4') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for users_login_log
-- ----------------------------
DROP TABLE IF EXISTS `users_login_log`;
CREATE TABLE `users_login_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL,
  `study_level` enum('junior','middle','senior') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `login_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_user_study_login`(`user_id`, `study_level`, `login_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for vocabulary_book
-- ----------------------------
DROP TABLE IF EXISTS `vocabulary_book`;
CREATE TABLE `vocabulary_book`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL,
  `word_id` int(0) NULL DEFAULT NULL,
  `study_level` enum('junior','middle','senior') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_user_word_study`(`user_id`, `word_id`, `study_level`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vocabulary_book
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

-- 创建题目表
CREATE TABLE GrammarQuestions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT,
    option_a TEXT,
    option_b TEXT,
    option_c TEXT,
    correct_answer CHAR(1),
    explanation TEXT
);

-- 插入题目数据
INSERT INTO GrammarQuestions (question_text, option_a, option_b, option_c, correct_answer, explanation) VALUES
('What is the plural form of "cat"?', 'cats', 'cat', 'catz', 'A', 'The plural form of "cat" is "cats". In English, we usually add -s or -es to make a noun plural.'),
('Which sentence is correct?', 'She goed to the store.', 'She went to the store.', 'She go to the store.', 'B', 'Sentence B is correct. The past tense of "go" is "went".'),
('What punctuation mark is used at the end of a question?', 'Period (.)', 'Exclamation mark (!)','Question mark (?)', 'C', 'The question mark (?) is used at the end of a question sentence.'),
('Which word is a pronoun?', 'Apple', 'He', 'Run', 'B', '"He" is a pronoun because it is used in place of a noun, like "he" instead of "John".'),
('Fill in the blank: The boy ___ a book.', 'has', 'have', 'had', 'A', 'The correct answer is "has". The sentence should be "The boy has a book."'),
('Identify the noun in the sentence: The cat sleeps.', 'cat', 'sleeps', 'the', 'A', 'The noun in the sentence is "cat". A noun is a person, place, thing, or idea.'),
('What is a synonym for "happy"?', 'Sad', 'Funny', 'Joyful', 'C', '"Joyful" is a synonym for "happy". Synonyms are words that have similar meanings.'),
('Which words make a complete sentence?', 'Jumping quickly.', 'The dog barked loudly.', 'Running down the street.', 'B', '"The dog barked loudly." is a complete sentence because it has a subject ("The dog") and a predicate ("barked loudly").'),
('What is a verb?', 'A describing word.', 'An action word.', 'A person, place, or thing.', 'B', 'A verb is an action word. It describes what someone or something does.'),
('Which word is a conjunction?', 'And', 'Jump', 'Happy', 'A', '"And" is a conjunction because it connects words, phrases, or sentences together.');


CREATE TABLE `words` (
  `Words_id` int NOT NULL AUTO_INCREMENT,
  `ori_words` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Translated_words` text,
  `Create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Words_id` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `chat_bot` (
                            `Chat_id` int NOT NULL AUTO_INCREMENT,
                            `words_id` int NOT NULL,
                            `content` text,
                            `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `content_type` tinyint NOT NULL COMMENT '1: ask, 2 : answer.',
                            PRIMARY KEY (`Chat_id`),
                            KEY `words_id` (`words_id`),
                            CONSTRAINT `words_id` FOREIGN KEY (`words_id`) REFERENCES `words` (`Words_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;