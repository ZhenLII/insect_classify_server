-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2020-02-11 14:28:19
-- 服务器版本： 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insect`
--

-- --------------------------------------------------------
CREATE DATABASE insect;
USE insect;
--
-- 表的结构 `insects`
--

CREATE TABLE `insects` (
  `insect_id` int(16) NOT NULL,
  `class_id` int(16) NOT NULL,
  `insect_name` varchar(64) NOT NULL,
  `insect_alias` varchar(128) DEFAULT NULL,
  `scientific_name` varchar(128) DEFAULT NULL,
  `order` varchar(64) DEFAULT NULL,
  `family` varchar(64) DEFAULT NULL,
  `genus` varchar(64) DEFAULT NULL,
  `description` varchar(1024) NOT NULL,
  `html` varchar(1024) DEFAULT NULL,
  `pic` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `insects`
--

INSERT INTO `insects` (`insect_id`, `class_id`, `insect_name`, `insect_alias`, `scientific_name`, `order`, `family`, `genus`, `description`, `html`, `pic`) VALUES
(1, 2, '长蝽科', NULL, 'Lygaeidae Schilling', '半翅目', '长蝽科', NULL, '长蝽科是半翅目中的大科之一，本科昆虫多为中、小型种类。广义的长蝽科是指昆虫分类中的长蝽总科，狭义的长蝽科做为长蝽总科下的一个科进入分类目录。狭义长蝽科昆虫为陆生蝽类，体形多样，据Slate记载，世界已知4248种，中国已知约320种，世界性广泛分布。主要生活于地表和地被物间以及植物上，有相当一部分种类嗜食果实和种子、吸食植物汁液等。若虫拟态蚂蚁的种类挺多。', NULL, 'insect/半翅目/长蝽科/unKnowGenus/长蝽科/'),
(2, 3, '披甲树螽', '盔甲蟋蟀、披甲蟋蟀', 'Acanthoplus discoidalis', '直翅目', '螽斯科', NULL, '披甲树螽是对于多种胸披硬甲的螽斯的统称，身长范畴约30-70+mm。这里取一种（学名为：Acanthoplus discoidalis）的品种，属直翅目螽斯科，体型硕大，不能飞行，体色多样。最让人惊讶的是它们全身带刺，遇到危险时会喷射难闻的毒液以减小被捕食的几率，是直翅目昆虫的“升级版”。该昆虫为杂食性，甚至自相残杀。而且，它们适应力极强，能在各种环境下生存，如：沙漠、雨林和平原等。主要分布于非洲的大部分地区。', NULL, 'insect/直翅目/螽斯科/unKnowGenus/披甲树螽/'),
(3, 4, '鸟翼裳凤蝶', '鸟翅裳凤蝶', 'Troides amphrysus', '鳞翅目', '凤蝶科', NULL, '鸟翼裳凤蝶（学名：Troides amphrysus）是凤蝶科裳凤蝶属的一种大型蝴蝶，该物种共有19个亚种。这种蝴蝶飞翔的时候姿态优美，后翅的黄色斑在阳光照射下金光灿灿，显得华贵美丽。幼虫寄主为多种马兜铃属（Aristolochia spp.）的植物，主要取食马兜铃属植物的叶，成虫喜访花，滑翔飞行，且速度较缓慢。卵生，一年多代，该物种在每年可发生二代以上。列入《华盛顿公约》（CITES）保护级别： 二类，比较珍贵。', NULL, 'insect/鳞翅目/凤蝶科/unKnowGenus/鸟翼裳凤蝶/'),
(4, 3, '花胫绿纹蝗', NULL, 'Aiolopus tamulus (Fabricius,1798)', '直翅目', '斑翅蝗科', '绿纹蝗属', '花胫绿纹蝗，学名：Aiolopus tamulus (Fabricius,1798)，斑翅蝗科绿纹蝗属的一种蝗虫。同所有蝗虫一样，花胫绿纹蝗吃植物，主要危害禾本科作物及棉花，成群的蝗虫的危害更是可怕，它们是最主要的农业害虫。', NULL, 'insect/直翅目/斑翅蝗科/绿纹蝗属/花胫绿纹蝗/'),
(5, 4, '银灰蝶', '银小灰蝶、银背小灰蝶、银斑小灰蝶、尖翅银灰蝶或银灰蝶', 'Curetis acuta', '鳞翅目', '真蝶总科灰蝶科', '属', '银灰蝶（学名：Curetis acuta）是一种小型美丽的蝴蝶，翅正面常呈银白色，颜色单纯而有光泽；翅反面的图案与颜色与正面不同，成为分类上的重要特征。复眼互相接近，其周围有一圈白毛。触角短，每节有白色环。雌蝶前足正常；雄蝶前足正常或跗节及爪退化。前翅R脉常只有3-4支；后翅大多无肩脉，有时有1-3个尾突。卵半圆球形或扁球形，精孔区凹陷，表面布满多角形雕纹，散产在寄主植物的嫩芽上。幼虫蛞蝓型，第七背板常有腺体开口，蛹为带蛹。寄主多为豆科。分布于日本、朝鲜半岛、中国、中南半岛、缅甸、喜马拉雅地区。', NULL, 'insect/鳞翅目/真蝶总科灰蝶科/属/银灰蝶/'),
(6, 4, '茶细蛾', '三角苞卷叶蛾', 'Caloptilia theivora (Walsingham)', '鳞翅目', '细蛾科', NULL, '昆虫名，为鳞翅目，细蛾科。主要危害茶树、山茶。幼虫喜幼嫩叶片取食为害，初孵幼虫(1～2龄)在叶背潜叶为害，随后卷边为害，在卷边内取食叶内，后期将叶尖卷成三角形虫苞，在苞内取食。不仅影响产量，而且由于虫粪污染，还会影响茶叶品质。', NULL, 'insect/鳞翅目/细蛾科/unKnowGenus/茶细蛾/'),
(7, 4, '红天蛾', '红夕天蛾、暗红天蛾、葡萄小天蛾、累氏红天蛾', 'Deilephila elpenor', '鳞翅目', '天蛾科', NULL, '红天蛾是属于鳞翅目、天蛾科的一种昆虫。分布在黑龙江、吉林、辽宁、青海、甘肃、山西、北京、河北、山东、安徽、江苏、上海、浙江、湖北、贵州、四川、云南等地。寄主于 凤仙花、柳兰、忍冬、秋兰、茜草科、柳叶菜科、草花类、葡萄等。体长33～40mm，翅展55～70mm。体、翅以红色为主，有红绿色闪光。幼虫啃食叶片，严重者叶子被吃光。', NULL, 'insect/鳞翅目/天蛾科/unKnowGenus/红天蛾/'),
(8, 5, '斑衣鱼', NULL, 'Thermobia domestica', '缨尾目', '衣鱼科', '衣鱼属', '斑衣鱼（学名：Thermobia domestica）属缨尾目衣鱼科，体型小，最长不会超过1.5cm，无翅，无变态发育，一生蜕皮多达60次。斑衣鱼和衣鱼有很多相似的地方，但斑衣鱼有黑色斑点和绒毛，喜温暖湿润的环境。这种昆虫常出没于家中，而且与蟑螂的食性差不多——几乎什么都吃，尤其是纸类、布类等，所以是害虫。该昆虫分布广泛，对人类没有太大威胁。', NULL, 'insect/缨尾目/衣鱼科/衣鱼属/斑衣鱼/'),
(9, 6, '刺槐种子小蜂', NULL, 'Bruchophagus philorobiniae Liao', '膜翅目', '广肩小蜂科', NULL, '刺槐种子小蜂（Bruchophagus philorobiniae Liao） ，该虫为害刺槐种子，会严重影响种子的收成。抚顺地区发生较普遍。', NULL, 'insect/膜翅目/广肩小蜂科/unKnowGenus/刺槐种子小蜂/'),
(10, 7, '三尾拟蜉蝣', NULL, 'Ephemeropsis trisetalis', '蜉蝣目', '六族蜉蝣科', '拟蜉蝣属', 'Eichwald于1864年研究前苏联早白垩世图尔盖—维季姆层的稚虫标本建立了拟蜉蝣属，模式种为三尾拟蜉蝣。三尾拟蜉蝣为水生昆虫的典型代表，生命周期短，属较大型的昆虫。二十世纪初，东方叶肢介—三尾拟蜉蝣—戴氏狼鳍鱼被作为热河生物群的代表。而在2008年，黄建东及任东发表论文称，经化石研究：三尾拟蜉蝣在热河生物群可能并不存在，可能仅分布在俄罗斯西伯利亚的外贝加尔和蒙古。', NULL, 'insect/蜉蝣目/六族蜉蝣科/拟蜉蝣属/三尾拟蜉蝣/'),
(11, 8, '墨西哥棉铃象', '墨西哥棉铃象甲、棉铃象虫', 'Anthonomus grandis Boheman', '鞘翅目', '象虫科', '花象属', '墨西哥棉铃象虫是美洲最严重的一种棉花害虫。据美国农业部统计，美国每年因该虫严重为害造成棉花减产达20一40%。这种害虫能够随棉产品传播，因而在国际上把它列为植物检疫对象。目前此虫虽然仅限于美洲，但因国际间的贸易日益频繁，发生区域逐渐扩大。成虫和幼虫都可造成危害。', NULL, 'insect/鞘翅目/象虫科/花象属/墨西哥棉铃象/'),
(12, 9, '柑橘花蕾蛆', '桔蕾瘿蝇，花蛆', 'Contarinia citri Barnes', '双翅目', '瘿蚊科', NULL, '昆虫名，属双翅目，瘿蚊科。中国各柑桔区均有分布，是柑桔花蕾期的重要害虫，成虫在花蕾直径2-3毫米时，将卵从其顶端产于花蕾中，幼虫食害花器使其成黄白色不能开放的圆球形，被害的花蕾状如灯笼，花瓣多有绿点，不能开放和授粉结果，会影响产量。', NULL, 'insect/双翅目/瘿蚊科/unKnowGenus/柑橘花蕾蛆/'),
(13, 10, '柿长绵粉蚧', '柿绵粉蚧、柿粉蚧，柿虱子', 'Phenacoccus pergandei Cockerell', '同翅目', '粉蚧科', '绵粉蚧属', '柿长绵粉蚧，Phenacoccus pergandei Cockerell，又名柿绵粉蚧、柿粉蚧，俗称柿虱子，属昆虫纲，同翅目粉蚧科绵粉蚧属的一种昆虫。是河南柿区的主要害虫之一，柿长绵粉蚧在中国各地的发生日趋严重。主要分布于河南、河北、山东、江苏等地。该虫以若虫和成虫聚集在柿树嫩枝、幼叶和果实上吸食汁液为害，为害柿、苹果、梨、枇杷、无花果和桑等。柿长绵粉蚧的捕食性天敌如小二星瓢虫和草蛉等、寄生性天敌如寄生蜂等对该虫都有一定的自然控制能力。', NULL, 'insect/同翅目/粉蚧科/绵粉蚧属/柿长绵粉蚧/'),
(14, 4, '白斑翅野螟', NULL, 'Bocchoris inspersalis (Zeller,1852)', '鳞翅目', '螟蛾科', '斑翅野螟属', '白斑翅野螟，Bocchoris inspersalis (Zeller,1852)，螟蛾科斑翅野螟属的一种昆虫。分布在安徽、江苏、浙江、台湾、湖南等地。为害毛竹、刚竹、淡竹。幼虫吐丝将叶片拉成弧状，在内取食。', NULL, 'insect/鳞翅目/螟蛾科/斑翅野螟属/白斑翅野螟/'),
(15, 10, '核桃黑斑蚜', NULL, '核桃黑斑蚜', '同翅目', '斑蚜科', NULL, '昆虫名，为同翅目，斑蚜科。分布于辽宁、山西、北京等地。在山西省核桃产区普遍发生，有蚜株率达90%，有蚜复叶占80%左右。以成、若蚜在核桃叶背及幼果上剌吸为害。', NULL, 'insect/同翅目/斑蚜科/unKnowGenus/核桃黑斑蚜/'),
(16, 8, '竹直锥大象虫', '竹象、竹大象虫、长足弯颈象', 'Cytotrachelus longimanus Fabricius', '鞘翅目', '象甲科', '直锥大象属', '竹直锥大象虫，Cytotrachelus longimanus Fabricius，为鞘翅目象甲科直锥大象属的一种昆虫。分布在浙江、福建、广东、广西、湖南、四川等地区，可以为害毛竹、青皮竹、粉单竹、甜竹、绿竹、水竹、茶竹等。幼虫蛀食竹笋，使竹笋内部霉烂而死，造成断头竹、畸形竹以及大量退笋，严重影响竹株正常生长。', NULL, 'insect/鞘翅目/象甲科/直锥大象属/竹直锥大象虫/'),
(17, 4, '甜菜白带野螟', '甜菜叶螟、白带螟蛾、青布袋、甜菜螟', 'Hymenia recurvalis (Fabricius)', '鳞翅目', '螟蛾科', '白带野螟属', '甜菜白带野螟，Hymenia recurvalis (Fabricius)，为鳞翅目螟蛾科白带野螟属的一种昆虫。分布在黑龙江、吉林、辽宁、内蒙古、宁夏、青海、陕西、山西、北京、河北、山东、安徽、江苏、上海、浙江、江西、福建、台湾、湖南、湖北、广东、广西、贵州、重庆、四川、云南、西藏。寄主植物有甜菜、大豆、玉米、甘薯、甘蔗、茶、向日葵等。 幼虫吐丝卷叶，在其内取食叶肉，留下叶脉。', NULL, 'insect/鳞翅目/螟蛾科/白带野螟属/甜菜白带野螟/'),
(18, 9, '荔枝叶瘿蚊', NULL, 'Dasineura sp', '双翅目', '瘿蚊科', NULL, '昆虫名，为双翅目，瘿蚊科。分布于广西、广东、海南等省区；以幼虫生箍，受害的点痕逐渐向叶片下背两在突起，形成瘤状虫瘿。严重时一片叶上有十多个虫瘿、一张复叶有虫瘿百以上，致使叶片扭曲。幼虫老熟钻出化蛹后，残留的虫瘿随着害叶老化逐渐干枯。有些叶片呈穿孔状。', NULL, 'insect/双翅目/瘿蚊科/unKnowGenus/荔枝叶瘿蚊/'),
(19, 10, '褐盔蜡蚧', '扁平球坚蚧、水木坚蚧、糖槭蚧', 'Partheno1ecanium corni（Bouche）', '同翅目', '蜡蚧科', NULL, '昆虫名，属同翅目（Homoptera ），蜡蚧科（Coccidae ）。分布在日本、前苏联、欧洲西部、北非、伊朗、朝鲜、美国、加拿大。中国内分布于东北、内蒙古、华北及陕西、青海、新疆等地。寄主有桃、杏、李、欧洲樱桃、葡萄、梨、苹果、沙果、核桃等果树及数十种林木。以若虫和成虫危害果树和林木的枝叶和果实。危害期间经常排泄出无色粘液，不但阻碍叶的生理作用，还招致蝇类吸食和霉菌寄生，严重发生时，枝梢干枯，甚至引起全株逐渐死亡。', NULL, 'insect/同翅目/蜡蚧科/unKnowGenus/褐盔蜡蚧/'),
(20, 4, '小白纹毒蛾', '毛毛虫、刺毛虫、棉古毒蛾等', 'Noto1ophus australis posticus Walker', '鳞翅目', '毒蛾科', NULL, '昆虫名，属鳞翅目，毒蛾科。分布于广东、云南、台湾等地。该虫寄主植物广泛，茶、棉、草莓、丝瓜、芦笋、萝卜、桃、葡萄、柑桔、梨、芒果等70多种作物均可受其害。初孵幼虫群集在叶上为害，后逐渐分散，取食花蕊及叶片。叶片被食成缺刻或孔洞。', NULL, 'insect/鳞翅目/毒蛾科/unKnowGenus/小白纹毒蛾/'),
(21, 4, '苹果蠹蛾', NULL, 'Cydia pomonella (L.)；Laspeyresia pomonella (Linne) Carpocapsa pomonella (L.)； Grapholitha pomonella (L.)', '鳞翅目', '卷蛾科', '小卷蛾属', '苹果蠹（读dù）蛾（Cydia pomonella）是杂食性钻蛀害虫 ，属鳞翅目卷蛾科，有很强的适应性、抗逆性和繁殖能力，是一类对世界水果生产具有重大影响的有害生物。成虫体长8毫米，翅展15-22毫米，体灰褐色。前翅臀角处有深褐色椭圆形大斑，内有3条青铜色条纹，其间显出4-5条褐色横纹，翅基部颜色为浅灰色，中部颜色最浅，杂有波状纹。 于2010年1月7日 被中华人民共和国生态环境部列为：中国第二批外来入侵物种名单 。加强生物物种资源和自然生态系统保护，努力开展外来入侵物种的防治工作，保护环境。', NULL, 'insect/鳞翅目/卷蛾科/小卷蛾属/苹果蠹蛾/'),
(22, 4, '茄黄斑螟蛾', '茄蛀螟、茄白翅野螟', 'Leucinodes orbonalis', '鳞翅目', '螟蛾科', NULL, '昆虫名，为鳞翅目，螟蛾科；是中国南方地区茄子的重要害虫，也能为害马铃薯、龙葵、豆类等作物。主要分布在中国台湾省及华南、华中、华东、西南地区。以幼虫为害蕾、花并蛀食嫩茎、嫩梢及果实。秋季多蛀害茄果，一个茄子内可有3～5头幼虫；夏季茄果受害轻，但花蕾、嫩梢受害重。', NULL, 'insect/鳞翅目/螟蛾科/unKnowGenus/茄黄斑螟蛾/'),
(23, 8, '杨梢叶甲', '杨梢金花虫、咬把虫', 'Parnops glasunowi Jacobson', '鞘翅目', '叶甲科', NULL, '杨梢叶甲又名杨梢金花虫、咬把虫，是杨柳科植物的重要叶部害虫，属昆虫纲，鞘翅目，叶甲科。危害特点是成虫咬断新梢或咬断叶柄，造成大量落叶，为害严重时会使全部树叶落光，对树木生长影响很大。该虫1年发生1代，以幼虫在土中越冬。防治措施为在5月上旬化蛹盛期进行中耕，破坏化蛹场所，对防治该虫十分有效。', NULL, 'insect/鞘翅目/叶甲科/unKnowGenus/杨梢叶甲/'),
(24, 6, '桃瘤蚜茧蜂', NULL, 'Ephedrus persicae Froggatt', '膜翅目', '蚜茧蜂科', NULL, '桃瘤蚜茧蜂是一种寄生于水稻小麦、隶属于蚜茧蜂科的膜翅目小动物。该蜂体型较小，黑褐色，雌、雄蜂相似，但是稍有不同。分布地区多集中在中国北京及东南部沿海地区。', NULL, 'insect/膜翅目/蚜茧蜂科/unKnowGenus/桃瘤蚜茧蜂/'),
(25, 4, '甘薯茎螟', NULL, 'Omphisa anastomosalis(Guenée)', '鳞翅目', '螟蛾科', NULL, '昆虫名，为鳞翅目，螟蛾科。分布于浙江、福建、台湾、广东、海南、广西、云南等省区。幼虫蛀入薯茎食害，造成中空膨大的虫瘿，常导致薯蔓折断而妨碍养分输导，影响甘薯的正常生长与结薯。', NULL, 'insect/鳞翅目/螟蛾科/unKnowGenus/甘薯茎螟/'),
(26, 6, '中华茧蜂', NULL, 'Bracon chinensis Szepligeti', '膜翅目', '茧蜂科', NULL, '中华茧蜂是一种寄生于水稻稻田、隶属于茧蜂科的膜翅目小动物。该蜂体型较小，雌、雄蜂相似，但是稍有不同。头、胸部赤褐色，并胸腹节暗褐色或黑色。分布地区多集中在中国浙湘及东南沿海等地区。', NULL, 'insect/膜翅目/茧蜂科/unKnowGenus/中华茧蜂/'),
(27, 6, '稻苞虫羽角姬小蜂', NULL, 'Sympiesis parnarae Chu et Liao', '膜翅目', '寡节小蜂科', NULL, '稻苞虫羽角姬小蜂是一种寄生于水稻稻田、隶属于寡节小蜂科的膜翅目小动物。该蜂体型较小，孔雀绿色，雌、雄蜂相似，但稍有不同。分布地区多集中在中国东南沿海地区。', NULL, 'insect/膜翅目/寡节小蜂科/unKnowGenus/稻苞虫羽角姬小蜂/'),
(28, 4, '淡褐巢蛾', '小巢蛾', 'Swammerdamia pyrella（De Villers）', '鳞翅目', '巢蛾科', NULL, '昆虫名，为鳞翅目，巢蛾科。分布于辽宁、山西、陕西、甘肃等省及日本、欧洲。寄主植物有苹果、梨、山楂、樱桃等。淡褐巢蛾以幼虫食害嫩芽、幼芽、花蕾和叶片，被害叶片残留下表皮和叶脉呈纱网状。在管理粗放的果园为害较重。', NULL, 'insect/鳞翅目/巢蛾科/unKnowGenus/淡褐巢蛾/'),
(29, 6, '燕麦蚜茧蜂', NULL, 'Aphidius avenae Haliday', '膜翅目', '蚜茧蜂科', NULL, '燕麦蚜茧蜂是一种寄生于水稻稻田、隶属于蚜茧蜂科的膜翅目小动物。该蜂体型较小，褐色，雌、雄蜂相似，但是稍有不同。分布地区多集中在中国湖南，北京等地区。', NULL, 'insect/膜翅目/蚜茧蜂科/unKnowGenus/燕麦蚜茧蜂/'),
(30, 4, '金毛虫', '桑斑褐毒蛾、纹白毒蛾', 'Prothesia similes xanthocampa', '鳞翅目', '毒蛾科', NULL, '昆虫名，属鳞翅目，毒蛾科。中国分布较普遍。危害苹果、梨、桃、山楂、杏、李、枣、柿、栗、海棠、樱桃、桑、柳等。幼虫喜食嫩叶，将叶咬食成缺刻或孔洞，甚至食光或仅剩叶脉。', NULL, 'insect/鳞翅目/毒蛾科/unKnowGenus/金毛虫/'),
(31, 9, '龙眼叶球瘿蚊', NULL, '龙眼叶球瘿蚊', '双翅目', '瘿蚊科', '波瘿蚊属', '昆虫名，为双翅目(Diptera)，瘿蚊科( Cecidomyiidae)。分布在广西、南宁地区的龙州、大新、崇左等龙眼产区发生较普遍；以幼虫为害龙眼叶片，受害处形成近圆球形的虫瘿。', NULL, 'insect/双翅目/瘿蚊科/波瘿蚊属/龙眼叶球瘿蚊/'),
(32, 8, '瘤胸簇天牛', NULL, 'Aristobia hispida', '鞘翅目', '天牛科', NULL, '鞘翅目，天牛科。分布在福建（全省大部分地区）、河北、陕西、河南、江苏、安徽、湖北、浙江、江西、台湾、广东、广西、四川、海南、西藏；越南等。寄主于漆树、杉类、柏木、柳、南岭黄檀、板栗、胡枝子、核桃、牛肋巴、油桐、桑树、紫穗槐、柑橘类、女贞、枫杨、金合欢类、桃、阴香、厚朴、油橄榄、栎类、黄檀类、化香。', NULL, 'insect/鞘翅目/天牛科/unKnowGenus/瘤胸簇天牛/'),
(33, 4, '甜菜斑蝇', '菜根蛆、甘蓝夜盗虫', 'Tetanopssp', '鳞翅目', '夜蛾科', NULL, '昆虫名，为鳞翅目，夜蛾科。分布东北、内蒙古、宁夏、四川、新疆等甜菜种植区。寄主植物为甜菜、甘蓝、油菜、白菜等十字花科植物。该虫在四川为害桑树。幼虫咬食甜菜叶片，只剩下叶脉，大发生时常把叶片吃光，继续食害叶柄和根头，常致块根减产10一20%，含糖量下降0.8—1度。', NULL, 'insect/鳞翅目/夜蛾科/unKnowGenus/甜菜斑蝇/'),
(34, 10, '棉长管蚜', '无网长管蚜、大棉蚜', 'Acyrthosiphom gossyp i i Mordviiko', '同翅目', '蚜科', '长管蚜属', '棉长管蚜又称为棉无网长管蚜、大棉蚜，学名Acyrthosiphom gossyp i i Mordviiko，属同翅目蚜科长管蚜属的一中昆虫，为害棉花、骆驼刺、苦豆子、蚕豆、豇豆、绿豆、圆叶锦葵、甘草等，是新疆棉区的主要害虫。', NULL, 'insect/同翅目/蚜科/长管蚜属/棉长管蚜/'),
(35, 4, '大豆斜纹夜蛾', '莲纹夜蛾，俗称夜盗虫、乌头虫', 'Prodenia litura（Fabricius）', '鳞翅目', '夜蛾科', NULL, '昆虫名，属鳞翅目（Lepidoptera），夜蛾科(Noctuidae)。是一类杂食性和暴食性害虫，危害寄主相当广泛，除十字花科蔬菜外，还可危害包括瓜、茄、豆、葱、韭菜、菠菜以及粮食、经济作物等近100科、300多种植物。以幼虫咬食叶片、花蕾、花及果实，初龄幼虫啮食叶片下表皮及叶肉，仅留上表皮呈透明斑；4龄以后进入暴食，咬食叶片，仅留主脉。在包心椰菜上，幼虫还可钻入叶球内危害，把内部吃空，并排泄粪便，造成污染，使之降低乃至失去商品价值。', NULL, 'insect/鳞翅目/夜蛾科/unKnowGenus/大豆斜纹夜蛾/'),
(36, 8, '油菜露尾甲', NULL, 'MeligethesaeneusFabricius', '鞘翅目', '叶甲科', NULL, '昆虫名，属鞘翅目，叶甲科。主要分布在新疆、甘肃等省。寄主植物除油菜外，尚有芥菜、白菜、甘蓝等十字花科植物，胡萝卜、向日葵、果树等植物。以成、幼虫取食油菜花粉、雄蕊、花柄及萼片，致蕾、花干枯死，难于正常结实。成虫为害重于幼虫。', NULL, 'insect/鞘翅目/叶甲科/unKnowGenus/油菜露尾甲/'),
(37, 10, '甘蔗灰粉蚧', '蔗节粉蚧', 'Dysmicoccus boninsis (Kuwana)', '同翅目', '粉蚧科', NULL, '同翅目，粉蚧科。分布在江西、福建、四川等省。 寄主甘蔗。 为害特点以成、若虫吸食甘蔗茎部汁液，影响甘蔗生长和成品质量及产量。', NULL, 'insect/同翅目/粉蚧科/unKnowGenus/甘蔗灰粉蚧/'),
(38, 4, '荔枝巢蛾', '荔枝巢蛾', 'ComoritisalbicapillaMoriuti', '鳞翅目', '巢蛾科', NULL, '昆虫名，为鳞翅目，巢蛾科。分布在广西、广东等省区和主要寄主植物有龙眼、荔枝、芒果等；以幼虫啃食果树主干和较粗大枝条的皮层，发生严重时，致使果株长势衰弱。', NULL, 'insect/鳞翅目/巢蛾科/unKnowGenus/荔枝巢蛾/'),
(39, 2, '桃瘤蚜', '桃瘤头蚜、桃纵卷瘤蚜', 'Tuberocephalusmomonis', '半翅目', '蚜科', NULL, '昆虫名，为半翅目，蚜科（以前归于同翅目）。中国分布较广，南、北方均有发生。其寄主植物有桃、樱桃、梅、梨等果树和艾蒿等菊科植物。以成虫、若虫群集在叶背吸食汁液，以嫩叶受害为重，受害叶片的边缘向背后纵向卷曲，卷曲处组织肥厚，似虫瘿，凸凹不平，初呈淡绿色，后变红色；严重时大部分叶片卷成细绳状，最后干枯脱落，严重影响桃树的生长发育。', NULL, 'insect/半翅目/蚜科/unKnowGenus/桃瘤蚜/'),
(40, 4, '猕猴桃透翅蛾', NULL, '猕猴桃透翅蛾', '鳞翅目', '透翅蛾科', NULL, '昆虫名，属鳞翅目(Lepidoptera)，透翅蛾科(Aegeriidae或Sesiidae)。分布在广东、福建、浙江、湖北、四川、江苏、贵州等省。中国已知40余种。双翅狭窄。翅面被稀疏鳞片。喜在白天飞翔，夜间静息。尤其晴天中午常在花丛间活动，取食花蜜。以幼虫蛀食枝蔓内部为害。受害处从蛀孔处排出褐色粪便，被害处膨大肿胀似瘤，叶片变质，果实脱落，最后造成枝蔓死亡。', NULL, 'insect/鳞翅目/透翅蛾科/unKnowGenus/猕猴桃透翅蛾/'),
(41, 10, '鸡冠花豆蚜', NULL, 'Aphis laburniKaltenbach=A.medicaginis Koch', '同翅目', '蚜总科', NULL, '昆虫名，为同翅目，蚜总科。中国各地均有分布。除为害鸡冠花外，还为害凌霄、银柳，紫藤、香豌豆等。 该蚜虫有群集性，在鸡冠花的新芽、嫩叶、花瓣等处吸食汁液，造成叶片卷缩，植株生长不良，影响开花；蚜排泄蜜露，可引起煤污病，严重影响其鸡冠花的光合作用。', NULL, 'insect/同翅目/蚜总科/unKnowGenus/鸡冠花豆蚜/'),
(42, 4, '柳毒蛾', '杨雪毒蛾、杨毒蛾', 'Stilprotia salicis (Linnaeus)', '鳞翅目', '毒蛾科', NULL, '昆虫名，为鳞翅目，毒蛾科。分布北起黑龙江、内蒙古、新疆，南至浙江、江西、湖南、贵州、云南，淮河以北密度较大。寄主于棉花、茶树、杨、柳、栎树、栗、樱桃、梨、梅、杏、桃等。危害棉花、茶树叶片。低龄幼虫只啃食叶肉，留下表皮，长大后咬食叶片成缺刻或孔洞。', NULL, 'insect/鳞翅目/毒蛾科/unKnowGenus/柳毒蛾/'),
(43, 8, '杏象甲', '杏虎象、桃象甲', 'RhVnchites faldermanni', '鞘翅目', '卷象科', NULL, '昆虫名，为鞘翅目，卷象科。在中国的东北、华北、西北等果产区均有发生。危害杏、桃、樱桃、枇杷。成虫食芽、嫩枝、花、果实，产卵时先咬伤果柄造成果实脱落。幼虫孵化后于果内蛀食。', NULL, 'insect/鞘翅目/卷象科/unKnowGenus/杏象甲/'),
(44, 8, '屎壳郎', '屎壳郎、屎虼螂、推丸、推车客、黑牛儿、铁甲将军、夜游将军', 'Catharsius molossus L．', '鞘翅目', '金龟子科', '蜣螂属', '屎壳郎是蜣螂的俗称，属于金龟科蜣螂亚科，也有很多人叫它屎虼（gè）螂、屎比房、推丸、裹粪牛、滚粪牛、滚粪郎等。 世界有2万多种蜣螂，分布在南极洲以外的任何一块大陆 [1] 。蜣螂能利用月光偏振现象进行定位，以帮助取食。有一定的趋光性。蜣螂大多都具有粪食性，可以将粪便滚动成球状，推行向前。其主要以动物粪便为食，有“自然界清道夫”的称号，又名“莫多昇”。', NULL, 'insect/鞘翅目/金龟子科/蜣螂属/屎壳郎/'),
(45, 8, '天牛科', NULL, 'Cerambycidae', '鞘翅目', '天牛科', NULL, '天牛科，属于节肢动物门昆虫纲鞘翅目的一个科。为植物的钻蛀性害虫，林、果、桑、茶、棉、麻、木器等均可受其为害。家茸天牛是房屋、家具、建筑物的大害虫。全世界已知25000多种，我国记载约2200余种及亚种。不少学者建议将天牛分为瘦天牛科及天牛科，其中天牛科分为8个亚科或7个亚科，我国学者采用的是1科6亚科系统。6亚科分别为：锯天牛亚科、瘦天牛亚科、幽天牛亚科、花天牛亚科、天牛亚科、沟胫天牛亚科。', NULL, 'insect/鞘翅目/天牛科/unKnowGenus/天牛科/'),
(46, 4, '蓝闪蝶', '蓝摩尔福蝶，大蓝闪蝶，蓝色妖姬', 'Morpho menelaus', '鳞翅目', '蛱蝶科', '闪蝶属', '蓝闪蝶（学名：Morpho menelaus）：又名蓝摩尔福蝶，是蛱蝶科闪蝶属中最大的一个物种，是一种热带蝴蝶，共有15个亚种。科名来自希腊词“μορφώ”，是希腊神话中爱与美的女神阿芙洛狄蒂的称号，意味着美丽、美观。蓝色的翅膀十分绚丽，长约15厘米。成年雌蝶的翅膀上表面呈蓝色，下表面的颜色和纹理与枯叶十分相似，呈现斑驳的棕色，灰色，黑色或红色。幼虫的毛会引起人类皮肤的不适。 生活在中美洲和南美洲，包括巴西，哥达加斯加和委内瑞拉。其硕大的翅膀使它们能够快速地在天空翱翔。日夜活动，飞翔敏捷。 （概述图来源： [1] ）', NULL, 'insect/鳞翅目/蛱蝶科/闪蝶属/蓝闪蝶/'),
(47, 9, '黄斑大蚊', NULL, 'Nephrotoma sp．', '双翅目', '大蚊科', NULL, '昆虫名，为双翅目，大蚊科。分布在宁夏、内蒙古、河南、山东、江苏等省。主要危害蚕豆、苜蓿、麦类、黄瓜、茄子、辣椒、番茄、草莓等作物。', NULL, 'insect/双翅目/大蚊科/unKnowGenus/黄斑大蚊/'),
(48, 3, '大扁头蟋', '棺材板 雄、猴头雌、七音蟋', 'Loxoblemmus doenitzi Stein', '直翅目', '蟋蟀科', NULL, '大扁头蟋，昆虫名，为 直翅目，蟋蟀科。分布于河北、河南、山东、陕西、山西、安徽、江苏、浙江、广西、四川；据记载日本也有。危害豆类、甘薯、草莓、花生、芝麻、棉花、蔬菜和果树苗木。', NULL, 'insect/直翅目/蟋蟀科/unKnowGenus/大扁头蟋/'),
(49, 4, '豇豆荚螟', NULL, 'Maruca testulalis Geyer', '鳞翅目', '螟蛾科', '豆荚野螟属', '豇豆荚螟，Maruca testulalis Geyer，为鳞翅目螟蛾科豆荚野螟属的一种昆虫。分布北起吉林、内蒙古，南至台湾、广东、广西、云南。山东受害重。主要危害大豆（毛豆）、豇豆、菜豆、扁豆、四季豆、豌豆、蚕豆等。', NULL, 'insect/鳞翅目/螟蛾科/豆荚野螟属/豇豆荚螟/'),
(50, 11, '差翅亚目', NULL, '差翅亚目', '蜻蜓目', NULL, NULL, '俗称蜻蜓。后翅基部比前翅基部稍大，翅脉也稍有不同。休息时四翅展开，平放于两侧。稚虫短粗，具直肠鳃，无尾鳃。包括蜓总科Aeshnoidea、大蜓总科Cordulegastroidea、蜻总科Libelluloidea等3总科，共11科。蜓科和蜻科最为常见，广布于我国各地。', NULL, 'insect/蜻蜓目/unKnowFamily/unKnowGenus/差翅亚目/'),
(51, 10, '樱桃瘿瘤头蚜', NULL, 'Tuberocephalus higansakurae', '同翅目', '蚜科', NULL, '昆虫名，属同翅目，蚜科。分布在浙江、北京、河南、河北等省、直辖市。主要为害樱桃叶片。叶片受害后向正面肿胀凸起，形成花生壳状的伪虫瘿，初略呈红色，后变枯黄，5月底发黑、干枯。', NULL, 'insect/同翅目/蚜科/unKnowGenus/樱桃瘿瘤头蚜/'),
(52, 10, '梅黑胶粉虱', '槠黑粉虱、槠黑漆粉虱、小黑粉虱', 'Aleurotrachelus camelliae', '同翅目', '粉虱科', NULL, '昆虫名，属同翅目，粉虱科。该虫为害严重时可引发煤污病，近两年在杨梅树上也普遍发生为害。近期许多果农反映杨梅叶背面有很多黑点状的虫，此虫原危害普通油茶。为害杨梅时，叶背会有许多黑点状的虫，是以口针插入叶片组织吸食汁液，绝大多数幼虫寄生于叶片背面，为害杨梅叶片。受害严重的杨梅树，常造成叶片早落，树势衰弱。还可引发煤污病。', NULL, 'insect/同翅目/粉虱科/unKnowGenus/梅黑胶粉虱/'),
(53, 10, '甘蔗红粉蚧', '蔗茎粉蚧、甘蔗粉炒壳虫、糖粉蚧', 'Saccharicoccus sacchari (Cockerell)', '同翅目', '粉蚧科', NULL, '昆虫名，为同翅目，粉蚧科。分布在中国内各蔗区。寄主于甘蔗、芒草等。成、若虫群集在蔗苗基部或青叶鞘包着的蔗茎节下部蜡粉带上吸食汁液，致蔗株生长衰弱，或诱发煤污病。', NULL, 'insect/同翅目/粉蚧科/unKnowGenus/甘蔗红粉蚧/'),
(54, 4, '大绢斑蝶', NULL, 'Parantica sita (Kollar,1844)', '鳞翅目', '斑蝶科', '绢斑蝶属', '大绢斑蝶Parantica sita (Kollar,1844)属昆虫纲，鳞翅目，斑蝶科，绢斑蝶属的昆虫。翅展雌性88mm，雄性83mm，体胸部棕褐色，腹部棕红色。', NULL, 'insect/鳞翅目/斑蝶科/绢斑蝶属/大绢斑蝶/'),
(55, 2, '缘蝽科', NULL, 'Coreidae', '半翅目', '缘蝽科', NULL, '该科昆虫为陆生蝽类昆虫。具单眼，中小型至大型，体壁坚硬，多为黄、褐、黑色，或鲜绿色，个别属为鲜红色。多数色泽比较单一，花斑显著的种类很少。身体多少狭长，由椭圆形至很细长的棍棒状不等。种类中，常体形奇特，给人以深刻的印象。触角4节，着生处偏于背面，由背方观察可以看到触角基。喙4节。前胸背板多少前倾，梯形或六角形。小盾片相对较小，不及蝽科之发达。前翅爪片远伸过小盾片末端，有很长的爪片接合缝，无楔片；前翅膜片具8根以上纵脉，纵脉或多或少相互平行，并由靠近膜片基部的一根横脉上发出，纵脉在端部尚可有分支。', NULL, 'insect/半翅目/缘蝽科/unKnowGenus/缘蝽科/'),
(56, 4, '丽绿刺蛾', '绿刺蛾、青刺蛾', 'Parasa lepida (Cramer)', '鳞翅目', '刺蛾科', '绿刺蛾属', '丽绿刺蛾是鳞翅目刺蛾科的一种昆虫。又名青刺蛾、绿刺蛾 [1] 。寄主包括 茶、梨、柿、枣、桑、油茶、油桐、苹果、芒果、核桃、咖啡、刺槐等。 幼虫食害叶片，低龄幼虫取食表皮或叶肉，致叶片呈半透明枯黄色斑块。大龄幼虫食叶呈较平直缺刻，严重的把叶片吃至只剩叶脉，甚至叶脉全无。分布于中国境内北起黑龙江，南至台湾、海南及广东、广西、云南，东起国境线，西自陕西、甘肃折入四川。', NULL, 'insect/鳞翅目/刺蛾科/绿刺蛾属/丽绿刺蛾/'),
(57, 12, '罗汉果蓟马', NULL, '罗汉果蓟马', '缨翅目', '蓟马科', NULL, '昆虫名，属缨翅目，蓟马科。为害罗汉果组培苗，在罗汉果生长前期发生较多，严重为害植株的幼苗生长。主要为害植株的嫩叶部分。一般是在叶背及叶腋间取食为害，受害的植株的顶芽不能正常生长、苗头僵硬，严重的会导致花叶病毒病的传播。', NULL, 'insect/缨翅目/蓟马科/unKnowGenus/罗汉果蓟马/'),
(58, 4, '牡丹芋双线天蛾', NULL, 'Theretra oldenlandiae (Fabricius)', '鳞翅目', '天蛾科', NULL, '昆虫名，属于鳞翅目，天蛾科。分布在华北、江苏、浙江、江西、广东、台湾等地区。以幼虫危害牡丹、凤仙花、水芋、葡萄、长春花、地锦、鸡冠花、三色堇、大丽花等多种花卉。以幼虫取食叶片为害，将叶片食成孔洞，发生严重时可将叶片吃光，仅剩主脉和枝条，甚至可使枝条枯死。', NULL, 'insect/鳞翅目/天蛾科/unKnowGenus/牡丹芋双线天蛾/'),
(59, 11, '马大头', NULL, 'Anax parthenope julius Brauer', '蜻蜓目', '蜓科', NULL, '昆虫名，为蜻蜓目，蜓科。寄主昆虫有害虫，主要危害水稻等作物。', NULL, 'insect/蜻蜓目/蜓科/unKnowGenus/马大头/'),
(60, 2, '蠋敌', NULL, 'Arma custos (Fabricius)', '半翅目', '蝽科', NULL, '昆虫名，为半翅目，蝽科。分布在黑龙江、内蒙古、河北、山西、陕西、新疆、江苏、浙江、江西、湖北、贵州、甘肃、安徽等。寄主昆虫有棉蚜、棉铃虫、棉小造桥虫、卷叶虫、象鼻虫，主要危害棉花作物。', NULL, 'insect/半翅目/蝽科/unKnowGenus/蠋敌/'),
(61, 9, '短刺刺腿食蚜蝇', NULL, 'Ischiodon scutellaris Fabricius', '双翅目', '食蚜蝇科', NULL, '昆虫名，为双翅目，食蚜蝇科。寄主昆虫有蚜虫等，主要危害水稻等作物。', NULL, 'insect/双翅目/食蚜蝇科/unKnowGenus/短刺刺腿食蚜蝇/'),
(62, 11, '后黑角柱灰蜻', NULL, 'Orthetrum triangulare melania Selys', '蜻蜓目', '蜻科', NULL, '昆虫名，为蜻蜓目，蜻科。分布在湖北、湖南等地。寄主昆虫为害虫，主要危害水稻、棉花等作物。', NULL, 'insect/蜻蜓目/蜻科/unKnowGenus/后黑角柱灰蜻/'),
(63, 6, '褐足大腿小蜂', NULL, 'Hockeria hakonensis Ashmead', '膜翅目', '小蜂科', '大腿小蜂属', '褐足大腿小蜂，Hockeria hakonensis Ashmead，为膜翅目小蜂科大腿小蜂属的一种昆虫。寄主昆虫有寄生蜂等，主要危害水稻作物。', NULL, 'insect/膜翅目/小蜂科/大腿小蜂属/褐足大腿小蜂/'),
(64, 2, '稻绿蝽', NULL, 'Nezara viridula Linnaeus', '半翅目', '蝽科', NULL, '昆虫名，为半翅目，蝽科。中国甜橘产区均有发生。除了危害柑橘外，还为害水稻、玉米、花生、棉花、豆类、十字花科蔬菜、油菜、芝麻、茄子、辣椒、马铃薯、桃、李、梨、苹果等。以成虫、若虫为害烟株，刺吸顶部嫩叶、嫩茎等汁液，常在叶片被刺吸部位先出现水渍状萎蔫，随后干枯。严重时上部叶片或烟株顶梢萎蔫。', NULL, 'insect/半翅目/蝽科/unKnowGenus/稻绿蝽/'),
(65, 10, '糠片蚧', NULL, 'Parlatoria Pergandii Comstock', '同翅目', '盾蚧科', NULL, '糠片蚧(ParlatoriaPergandiComstock)系多食性害虫，属于昆虫纲同翅目盾蚧科。主要危害作物寄主有多达189种植物，主要有柑橘、苹果、梨、梅、樱桃、椰子、柿、无花果、蔷薇、山茶、樟、月桂、大叶黄杨等。', NULL, 'insect/同翅目/盾蚧科/unKnowGenus/糠片蚧/'),
(66, 4, '粟麦蛾', NULL, '粟麦蛾', '鳞翅目', NULL, NULL, '昆虫名，为鳞翅目。分布华北、华东。主要危害粟（谷子）、黍、稷。幼虫由谷子等受害作物幼苗基部蛀入，先在蛀孔内横穿取食，后向上钻蛀食茎髓，幼苗出现枯心，蛀孔较粟灰螟小。', NULL, 'insect/鳞翅目/unKnowFamily/unKnowGenus/粟麦蛾/'),
(67, 4, '高粱穗隐斑螟', NULL, 'Cryptoblabes gnidiella(Milliere)', '鳞翅目', '螟蛾科', NULL, '昆虫名，为鳞翅目，螟蛾科。分布华东、华南、中南等。主要危害高粱。', NULL, 'insect/鳞翅目/螟蛾科/unKnowGenus/高粱穗隐斑螟/'),
(68, 2, '红脊长蝽', '黑斑红长蝽', 'Tropidothorax elegans Distant', '半翅目', '长蝽科', NULL, '昆虫名，为半翅目，长蝽科。分布在北京、天津、江苏、河南、浙江、江西、广东、广西、四川、云南和台湾。另外尚分布在日本。主要为害瓜类蔬菜。虫态有成虫、卵、若虫，以成虫、若虫刺吸植物汁液为害。成虫和幼虫群集于嫩茎、嫩瓜、嫩叶等部位，刺吸汁液，刺吸处呈褐 色斑点，严重时导致枯萎。成虫怕强光，以上午10点前和下午5点后取食较盛。', NULL, 'insect/半翅目/长蝽科/unKnowGenus/红脊长蝽/'),
(69, 2, '梨二叉蚜', NULL, 'Schizaphis piricola (Matsumura）', '半翅目', '蚜科', NULL, '昆虫名，为目：半翅目，蚜科。分布于北京、吉林、辽宁、河北、山东、山西、河南、江苏、四川、台湾等地。寄主有梨、白梨、棠梨、杜梨及狗尾草等多种果树及其他植物。成、若蚜群集于芽、叶、嫩梢和茎上吸食汁液。梨叶受害严重时由两侧向正面纵卷成筒状，早期脱落。', NULL, 'insect/半翅目/蚜科/unKnowGenus/梨二叉蚜/'),
(70, 13, '截形叶螨', '棉红蜘蛛、棉叶螨，玉米红蜘蛛', 'Tetranychus truncatus', '蜱螨目', '叶螨科', NULL, '昆虫名，为蜱螨目， 叶螨科。分布于中国各地区。成、若螨群聚叶背吸取汁液，使叶片呈灰白色或枯黄色细斑，严重时叶片干枯脱落，影响生长。危害棉花、玉米、蓼、小旋花、澳洲千里木、构树，桑树、刺槐、榆树、薯类，豆类、瓜类、茄子等。', NULL, 'insect/蜱螨目/叶螨科/unKnowGenus/截形叶螨/'),
(71, 8, '蓝边矛丽金龟', NULL, 'Callistethus plagiicollis', '鞘翅目', '丽金龟科', NULL, '昆虫名，属鞘翅目，丽金龟科。分布在河南、河北、山西、陕西、山东、江苏、浙江、湖北、江西、湖南等。 体长15mm左右；成虫体背部浅黄褐色具金属闪光，体腹面及足黑蓝色带金属光亮；前胸背板黄褐色，金属闪光很强，两侧缘具蓝黑色斑带；臀板黄褐色。全体光滑无毛。', NULL, 'insect/鞘翅目/丽金龟科/unKnowGenus/蓝边矛丽金龟/'),
(72, 8, '大麻花蚤', NULL, 'Mordellistena cannabisi Matsμmura', '鞘翅目', '花蚤科', NULL, '大麻花蚤，昆虫名，属鞘翅目，花蚤科。分布在宁夏一带西北麻区，是银川平原大麻的重要害虫。 寄主大麻、苍耳。幼虫蛀食嫩茎、顶梢，致受害部膨大呈虫瘿状，不仅品质降低，同时也影响产量。', NULL, 'insect/鞘翅目/花蚤科/unKnowGenus/大麻花蚤/'),
(73, 2, '微小花蝽', NULL, 'Oriu minuius Linnaeus', '半翅目', '花蝽科', NULL, '昆虫名，为半翅目，花蝽科。分布在辽宁、河北、山东、山西、陕西、河南、江苏、江西、安徽等。寄主昆虫有棉叶螨、棉蚜、棉蓟马、棉盲蝽、三点盲蝽、棉铃虫、红铃虫、金刚钻、棉小造桥虫、烟青虫等，主要危害棉花作物。', NULL, 'insect/半翅目/花蝽科/unKnowGenus/微小花蝽/'),
(74, 8, '稻红瓢虫', NULL, 'Micraspis discolor (Fabricius)', '鞘翅目', '瓢虫科', NULL, '昆虫名，为鞘翅目，瓢虫科。分布于浙江、江西、湖北、湖南、四川、福建、广东、广西、云南等。寄主昆虫有稻蚜等，主要危害水稻等作物。', NULL, 'insect/鞘翅目/瓢虫科/unKnowGenus/稻红瓢虫/'),
(75, 4, '蕾鹿蛾', '茶鹿蛾', 'Amata germana（Felder）', '鳞翅目', '鹿蛾科', NULL, '蕾鹿蛾，又称茶鹿蛾，属鹿蛾科。分布在中国的福建和云南；其他分布在日本和印度尼西亚等。此虫在福建南平1年发生3代，以幼虫越冬。翌年3且上旬越冬幼虫开始取食活动，4月下旬开始化蛹，5月中旬成虫羽化。该虫多发生在东南坡的幼林地，尤以中下坡及靠近林道两旁的幼林受害较重。', NULL, 'insect/鳞翅目/鹿蛾科/unKnowGenus/蕾鹿蛾/'),
(76, 12, '棉田花蓟马', NULL, 'Frankliniella intonsa(Trybom)', '缨翅目', '蓟马科', NULL, '昆虫名，为缨翅目（Thysanoptera），蓟马总科（Thripoidea），蓟马科（Thripidae）。分布在中国各地。主要危害棉花、甘蔗、稻、豆类及多种蔬菜。', NULL, 'insect/缨翅目/蓟马科/unKnowGenus/棉田花蓟马/'),
(77, 6, '纹胡蜂', NULL, 'Vespa crabroniformis Smith', '膜翅目', '胡蜂科', NULL, '昆虫名，为膜翅目，胡蜂科。分布于河北、河南、湖北、山东、江苏、四川等。寄主昆虫有棉小造桥虫、棉铃虫等，主要危害棉花等作物。', NULL, 'insect/膜翅目/胡蜂科/unKnowGenus/纹胡蜂/'),
(78, 6, '草蛉姬蜂', NULL, 'Brachycyrtus sp', '膜翅目', '姬蜂科', NULL, '昆虫名，为膜翅目，姬蜂科。分布于湖北等。寄主昆虫有大草蛉等，主要危害棉花等作物。', NULL, 'insect/膜翅目/姬蜂科/unKnowGenus/草蛉姬蜂/'),
(79, 7, '四节蜉科', NULL, 'Baetidae', '蜉蝣目', '四节蜉科', NULL, '四节蜉科（Baetidae）是蜉蝣目的一个科，稚虫英文俗称small minnow mayflies（小鱼型蜉）。我国所知的种类中，只有少数几种的成虫与稚虫都已报道，绝大部分种类只知成虫。而本科属级阶元的界定主要是依据稚虫。因此，对我国种类较详细而科学的研究有待于较大规模的饲养而将成虫与稚虫对应以及模式标本的核对。', NULL, 'insect/蜉蝣目/四节蜉科/unKnowGenus/四节蜉科/'),
(80, 8, '苹斑芫菁', NULL, 'Mylabris calida Pallas', '鞘翅目', '芫菁科', NULL, '昆虫名，为鞘翅目，芫菁科。分布于湖北、江苏、山东、河北、内蒙古、新疆、黑龙江等。寄主昆虫为蝗虫，危害作物又棉花等。在棉田捕食蝗卵。', NULL, 'insect/鞘翅目/芫菁科/unKnowGenus/苹斑芫菁/'),
(81, 2, '黑猎蝽', NULL, '黑猎蝽', '半翅目', '猎蝽科', NULL, '昆虫名，为半翅目，猎蝽科。分布在湖北等地区。寄主昆虫有棉蚜等，主要危害棉花等作物。', NULL, 'insect/半翅目/猎蝽科/unKnowGenus/黑猎蝽/'),
(82, 6, '侧沟茧蜂', NULL, 'Microplitis sp.', '膜翅目', '马蜂科', NULL, '侧沟茧蜂，昆虫名，为膜翅目，马蜂科。分布在陕西等地区。寄主昆虫有大地老虎、黄地老虎等，主要危害小麦等作物。', NULL, 'insect/膜翅目/马蜂科/unKnowGenus/侧沟茧蜂/'),
(83, 6, '夜蛾瘦姬蜂', NULL, 'Ophion luteus (Linnaeus)', '膜翅目', '姬蜂科', NULL, '昆虫名，为膜翅目，姬蜂科。分布在中国各地。寄主昆虫为小地老虎、大地老虎、甘蓝夜蛾等，主要危害棉花、玉米、甘蓝等。', NULL, 'insect/膜翅目/姬蜂科/unKnowGenus/夜蛾瘦姬蜂/'),
(84, 8, '黑背小毛瓢虫', NULL, 'Scymnus (Scymnus) sp', '鞘翅目', '瓢虫科', NULL, '昆虫名，为鞘翅目，瓢虫科。分布在福建、台湾、广东、广西、云南、四川、浙江、江苏、江西、湖北、湖南等地区。寄主昆虫有蚜虫等，主要危害棉花等作物。', NULL, 'insect/鞘翅目/瓢虫科/unKnowGenus/黑背小毛瓢虫/'),
(85, 8, '蓝尾迷萤叶甲', '蓝尾叶甲', 'Mimastra unicitarsis Laboissiere', '鞘翅目', '叶甲科', NULL, '昆虫名为，鞘翅目，叶甲科。分布在长江以南各省。 寄主于桑、榆、刺梨等。该虫在四川东部、南部地区为害桑树成灾。为害桑的春叶和夏叶，食成缺刻，严重时仅剩叶脉。', NULL, 'insect/鞘翅目/叶甲科/unKnowGenus/蓝尾迷萤叶甲/'),
(86, 10, '日本纽绵蚧', NULL, 'Takahashia japonica Cockerell', '同翅目', '绵蚧科', '纽绵蚧属', '日本纽绵蚧，Takahashia japonica Cockerell，属同翅目，绵蚧科纽绵蚧属的一种昆虫。分布在上海 福州、江苏、湖北、湖南等。寄主于天竺葵、合欢、三角枫、重阳木、枫香、刺槐、山核桃、榆、朴、桑树等。 以若虫和雌成虫在寄主枝上吸取汁液，尤其在嫩枝上危害严重，使开花程度和生长势明显下降，直至枝梢枯死。', NULL, 'insect/同翅目/绵蚧科/纽绵蚧属/日本纽绵蚧/'),
(87, 4, '麦穗夜蛾', '麦穗虫', 'Apamea sordens(Hüfnagel)', '鳞翅目', '夜蛾科', NULL, '昆虫名，为鳞翅目，夜蛾科。分布在内蒙古、甘肃、青海等省。主要危害小麦、大麦、青稞、冰草、马莲草等作物。以幼虫为害。初孵幼虫在麦穗的花器及子房内为害，2龄后在籽粒内取食，4龄后将小麦旗叶吐丝缀连卷成筒状，潜伏其中，日落后出来为害麦粒，仅残留种胚，致使小麦不能正常生长和结实。', NULL, 'insect/鳞翅目/夜蛾科/unKnowGenus/麦穗夜蛾/'),
(88, 10, '茄无网蚜', '茄无网长管蚜', 'Acyrthosiphon solani (Kaltenbach)', '同翅目', '蚜科', '无网蚜属', '茄无网蚜，Acyrthosiphon solani (Kaltenbach)，为同翅目蚜科无网蚜属的一种昆虫。分布于东北、内蒙占、青海、河北、山东、河南、四川等。寄主于茄科蔬菜、豆类、甜菜等多种农作物。成虫和若虫吸食蔬菜汁液并传播病毒病。', NULL, 'insect/同翅目/蚜科/无网蚜属/茄无网蚜/'),
(89, 10, '竹纵斑蚜', NULL, 'Takecallisarundinariae(Essig)', '同翅目', '斑蚜科', '凸唇斑蚜属', '昆虫名，为斑蚜科Callaphididae，凸唇斑蚜属Takecallis。分布于北京、山东、安徽、江苏、浙江、江西、福建。危害斑竹、金明竹、乌哺鸡竹、红竹、早竹等竹种。被害嫩竹叶出现萎缩、枯白，蚜虫分泌物粘落处滋生煤污病，特别是污染竹叶，影响光合作用和观赏性。', NULL, 'insect/同翅目/斑蚜科/凸唇斑蚜属/竹纵斑蚜/'),
(90, 4, '菜野螟', '白菜叶螟、甘蓝螟', 'Mesographe forficalis linnaeus', '鳞翅目', '螟蛾科', NULL, '昆虫名，为鳞翅目，螟蛾科。分布在黑龙江、内蒙古、河北、山东、山西、陕西、江苏、四川、广东、云南等省区。危害白菜、萝卜、甘蓝、西洋山嵛菜、芹菜、酸模、播娘蒿等。危害幼苗的心叶和叶片，使生长点被破坏而停止生长或萎蔫死亡，造成缺苗断垄。', NULL, 'insect/鳞翅目/螟蛾科/unKnowGenus/菜野螟/'),
(91, 6, '二化螟沟姬蜂', NULL, 'Gambrus wadal Uchida', '膜翅目', '姬蜂科', NULL, '昆虫名，为膜翅目，姬蜂科。分布于山东、江苏、浙江、安徽等。寄主昆虫为二化螟，危害作物有水稻等。', NULL, 'insect/膜翅目/姬蜂科/unKnowGenus/二化螟沟姬蜂/'),
(92, 6, '臭蚁亚科', NULL, 'Dolichoderinae', '膜翅目', '蚁科', NULL, '臭蚁亚科（Dolichoderinae）是主要分布在全球亚热带和热带地区的一种蚁类，其下分为六个属种。它们主要分布在全球亚热带和热带地区。六个属全世界有分布。', NULL, 'insect/膜翅目/蚁科/unKnowGenus/臭蚁亚科/'),
(93, 8, '柑橘溜皮虫', '缠皮虫', 'Agrilus spp', '鞘翅目', '吉丁虫科', NULL, '昆虫名，为鞘翅目，吉丁虫科。分布于浙江、福建、四川、广东和广西等。寄主植物也仅限于柑橘类，以山地果园发生较为严重。主要以幼虫蛀食枝条，造成螺旋形虫道，使枝条上部干枯，树势衰弱，影响产量。', NULL, 'insect/鞘翅目/吉丁虫科/unKnowGenus/柑橘溜皮虫/'),
(94, 2, '蝎蝽科', '水蝎、红娘华', 'Nepa chinensis Hoff', '半翅目', '蝎蝽科', NULL, '蝎蝽科是半翅目中的一个小科，半翅目蝎蝽科（Nepidae ）又叫水蝎、红娘华。这类昆虫生活在淡水域中，幼龄若虫捕食水蚤、孑孓等小虫，对消灭蚊虫起一定作用，但老龄若虫及成虫捕食鱼苗，又是淡水养殖事业的害虫。', NULL, 'insect/半翅目/蝎蝽科/unKnowGenus/蝎蝽科/'),
(95, 8, '绒毛金龟科', NULL, 'Glaphyridae MacLeay', '鞘翅目', '金龟总科', NULL, '绒毛金龟科（Glaphyridae MacLeay），是鳃角类中的一个小科，分布于甘肃、山西，种类不多。成虫危害植物的花器，如长角绒毛金龟。 [1]', NULL, 'insect/鞘翅目/金龟总科/unKnowGenus/绒毛金龟科/'),
(96, 6, '黄斑细脚胡蜂', NULL, 'Parapolybia sp', '膜翅目', '胡蜂科', '异腹胡蜂属', '黄斑细脚胡蜂，，为膜翅目，胡蜂科异腹胡蜂属的一种昆虫。分布于湖北等。寄主昆虫有棉小造桥虫、棉铃虫等，主要危害棉花等作物。', NULL, 'insect/膜翅目/胡蜂科/异腹胡蜂属/黄斑细脚胡蜂/'),
(97, 8, '台湾小瓢虫', NULL, 'Scymnus （Pullus） sodalis （Weise）', '鞘翅目', '瓢虫科', '小毛瓢虫属', '昆虫名，为鞘翅目，瓢虫科。分布于上海、安徽、四川、陕西、江苏、广东、台湾等。寄主昆虫有棉蚜等，主要危害棉花等作物。', NULL, 'insect/鞘翅目/瓢虫科/小毛瓢虫属/台湾小瓢虫/'),
(98, 8, '竹虎天牛', NULL, 'Chlorophorus annularis Fabricius', '鞘翅目', '天牛科', '绿虎天牛属', '竹虎天牛，Chlorophorus annularis Fabricius，属鞘翅目天牛科绿虎天牛属的一种昆虫。分布于福建、广东、广西、江西、湖南、台湾等地区，为害竹材。钻蛀已采伐的竹秆及充分干燥的竹材，竹材内部被蛀成蛀道，易折断。', NULL, 'insect/鞘翅目/天牛科/绿虎天牛属/竹虎天牛/'),
(99, 4, '毛胫夜蛾', '鱼藤毛胫夜蛾、云纹夜蛾', 'Mocis undata Fabricius', '鳞翅目', '夜蛾科', NULL, '昆虫名。为鳞翅目，夜蛾科。危害大豆、鱼藤等农作物，分布在中国浙江、江苏、江西、福建、台湾、广东、云南、河南、河北等省区。', NULL, 'insect/鳞翅目/夜蛾科/unKnowGenus/毛胫夜蛾/'),
(100, 2, '八节黑猎蝽', NULL, 'Ectrychotes andreae (Thunberg)', '半翅目', '猎蝽科', NULL, '昆虫名，为半翅目，猎蝽科。分布在北京、上海、江苏、浙江、湖北、四川、台湾、福建、广西等地区。寄主昆虫有棉铃虫、棉蚜等，主要危害棉花等作物。', NULL, 'insect/半翅目/猎蝽科/unKnowGenus/八节黑猎蝽/'),
(101, 6, '果马蜂', NULL, 'Polistes olivaceus (DeGeer)', '膜翅目', '胡蜂科', '长脚黄蜂属', '果马蜂Polistes olivaceus (DeGeer)是膜翅目胡蜂科长脚黄蜂属的一种昆虫。长约18毫米，大体黄色。头横形，接近胸宽，后头向前弧形凹入。两复眼顶部之间有一黑色横带贯串2个后单眼，另有2个黑斑分别自后单眼斜向前延伸，前单眼周围黑色。分布在陕西、甘肃、云南、四川、广东、广西等。主要危害棉花等作物。', NULL, 'insect/膜翅目/胡蜂科/长脚黄蜂属/果马蜂/'),
(102, 8, '十二斑兼食瓢虫', NULL, 'Verania sp', '鞘翅目', '瓢虫科', NULL, '昆虫名，为鞘翅目，瓢虫科。分布在湖南等地。寄主昆虫为蚜虫等。', NULL, 'insect/鞘翅目/瓢虫科/unKnowGenus/十二斑兼食瓢虫/'),
(103, 4, '金盏菊人纹污灯蛾', NULL, 'Spilarctia subcarnea （Walker）', '鳞翅目', '灯蛾科', NULL, '昆虫名，为鳞翅目，灯蛾科。在中国内外均有分布，寄主有金盏菊、芍药、萱草、鸢尾、菊花、月季等花卉，为害严重。主要以幼虫啃食叶肉，分散危害，蚕食叶片，造成叶片残缺不全和孔洞。仅剩主脉和叶柄。', NULL, 'insect/鳞翅目/灯蛾科/unKnowGenus/金盏菊人纹污灯蛾/'),
(104, 10, '茶树茶二叉蚜', '茶蚜、桔二叉蚜、可可蚜', 'Toxoptera aurantii (Boyer de Fonsco10mbe)', '同翅目', '蚜科', '声蚜属', '茶树茶二叉蚜，Toxoptera aurantii (Boyer de Fonsco10mbe)，为同翅目蚜科声蚜属的一种昆虫。分布安徽、江苏、广东、福建、云南、贵州、山东、陕西。除为害茶树、油茶外，还为害柑桔类、荔枝、香蕉、菠萝、可可、咖啡、胡椒等。成、若虫刺吸嫩梢、嫩叶汁液，被害叶多皱缩卷曲，严重时新梢不能抽出引起落果。排泄蜜露致煤污病发生。', NULL, 'insect/同翅目/蚜科/声蚜属/茶树茶二叉蚜/'),
(105, 4, '彩燕蛾', NULL, 'Urania ripheus', '鳞翅目', '燕蛾科', NULL, '鳞翅目燕蛾科中的一种漂亮的蛾子。不属于蝶类，但是比许多蝶都要美丽。与一般的蛾不同，会在白天时出没。', NULL, 'insect/鳞翅目/燕蛾科/unKnowGenus/彩燕蛾/'),
(106, 2, '横带红长蝽', NULL, 'Lygaeus　equestris (Linnaeus)', '半翅目', '长蝽科', NULL, '昆虫名为半翅目，长蝽科。分布于黑龙江、吉林、辽宁、内蒙古、河北、山西、陕西、宁夏等。寄主于白菜、油菜、甘蓝等十字花科蔬菜。成虫和若虫群集于嫩叶上刺吸汁液，导致叶片枯萎。', NULL, 'insect/半翅目/长蝽科/unKnowGenus/横带红长蝽/'),
(107, 10, '瓜叶菊李短尾蚜虫', NULL, '李圆尾蚜', '同翅目', '蚜科', NULL, '昆虫名，为同翅目，蚜科。寄主于瓜叶菊、金盏花等菊科植物及李、梅、杏、桃等果树。以成虫、若虫吸汁为害植株叶和嫩茎等，使植株生长衰落。', NULL, 'insect/同翅目/蚜科/unKnowGenus/瓜叶菊李短尾蚜虫/'),
(108, 4, '瓜绢野螟', NULL, 'Diaphania indica (Saunders)', '鳞翅目', '螟蛾科', '绢野螟属', '瓜绢野螟，Diaphania indica (Saunders)，为鳞翅目螟蛾科绢野螟属的一种昆虫。分布在福建、江西、江苏、山东、浙江、安徽、上海、台湾、湖南、湖北、广东、广西、海南、天津等。危害常春藤、木槿、冬葵、大叶黄杨等花木。以幼虫危害植株叶部，初龄幼虫先在叶背上取食叶肉，被害叶片上呈现出灰白色斑；三龄以后常将叶片左右卷起，以丝连缀；虫体栖居其中；取食时伸出头、胸部；蛹也在卷叶中。', NULL, 'insect/鳞翅目/螟蛾科/绢野螟属/瓜绢野螟/'),
(109, 3, '大丽花短额负蝗', NULL, '大丽花短额负蝗', '直翅目', '蝗总科', NULL, '昆虫名，为直翅目，蝗总科。分布很广，危害的花卉有凤仙花、鸡冠花、一串红、三色堇、金鱼草、千日红、金盏菊、百日草、雏菊、菊花、松果菊、月季、茉莉、扶桑、大丽花、栀子花等。初龄若虫喜群集食害叶部，被害叶片呈现网状，稍后即分散取食，造成叶片缺刻和孔洞，严重时整个叶片只留下主脉。', NULL, 'insect/直翅目/蝗总科/unKnowGenus/大丽花短额负蝗/'),
(110, 12, '非洲菊蓟马', NULL, 'Haplothrips Chinensis Priesner', '缨翅目', '蓟马科', NULL, '昆虫名，属缨翅目，蓟马科。分布广泛，在中国发生严重。寄主除有非洲菊外，还有菊花、玫瑰、白兰、桃、柑橘等。以成虫及若虫取食幼芽、嫩叶、花和幼果。嫩叶被害后有卷曲现象，芽、梢和花受害后则凋萎，严重影响正常生长。', NULL, 'insect/缨翅目/蓟马科/unKnowGenus/非洲菊蓟马/'),
(111, 4, '牧草粘虫', NULL, 'Mythimna separata（Walker）', '鳞翅目', '夜蛾科', NULL, '昆虫名，属鳞翅目，夜蛾科。是世界性禾本科植物的重要害虫。粘虫的幼虫食性很杂，尤其喜食禾本科植物，危害的牧草有黑麦草、苏丹草、鸭茅、狗尾草以及麦类、玉米、水稻等作物。幼虫咬食叶片，1-2龄幼虫仅吃叶肉，形成小园孔，3龄后形成缺刻，4-6龄达暴食期。危害严重时将叶片吃光，使植株形成光秆。', NULL, 'insect/鳞翅目/夜蛾科/unKnowGenus/牧草粘虫/'),
(112, 6, '污翅姬蜂属', NULL, '污翅姬蜂属', '膜翅目', '姬蜂科', '污翅姬蜂属', '污翅姬蜂属（拉丁文：Spilopteron Townes）是节肢动物门姬蜂科下一个科属，多为重要的农林害虫天敌资源，寄主为钻蛀性害虫，其上唇外露部分的长约为基部宽的0.4—0.8倍，肘间横脉与第二迥脉相联。全世界已知28种，主要分布于北美和东亚地区，中国地区已知22种。分布于东北和东南林区。该物种是由美国昆虫学家汉·唐克斯（H.Townes，1922年2月15日- ）于1960年建立并命名。', NULL, 'insect/膜翅目/姬蜂科/污翅姬蜂属/污翅姬蜂属/'),
(113, 4, '百合蝙蝠蛾', '疣纹蝙蝠蛾、柳蝙蝠蛾、东方蝙蝠蛾', 'Phassus excrescens Butler', '鳞翅目', '蝙蝠蛾科', '蝙蛾属', '百合蝙蝠蛾，Phassus excrescens Butler，属鳞翅目蝙蝠蛾科蝙蛾属的一种昆虫。食性较广且杂，主要分布在中国东北。寄主除有百合，还有丁香、大丽花、桃等。以幼虫在茎内钻蛀为害，该蛾蛀入时先吐丝结网将虫体隐蔽，然后边蛀食边将咬下的木屑送出，粘在丝网上，最后连缀成包，将洞口掩住。造成茎叶枯黄，影响植株的生长。', NULL, 'insect/鳞翅目/蝙蝠蛾科/蝙蛾属/百合蝙蝠蛾/'),
(114, 4, '金盏菊中金弧夜蛾', NULL, 'DiachrysiaintermixtaWarren', '鳞翅目', '夜蛾科', '金弧夜蛾属', '昆虫名，属鳞翅目， 夜蛾科。分布在河南及华东等地。寄主有金盏菊、菊花、翠菊、大丽菊、蓟等。该虫主要是以幼虫吸食叶片为害，影响植株的生长发育。进而影响经济发展。', NULL, 'insect/鳞翅目/夜蛾科/金弧夜蛾属/金盏菊中金弧夜蛾/'),
(115, 4, '枯安纽夜蛾', NULL, '名 Anua coronata Fabricius', '鳞翅目', '夜蛾科', NULL, '昆虫名，属鳞翅目，夜蛾科。分布在浙江、江西、广东、台湾。寄主于荔枝、龙眼、黄皮、枇杷、葡萄、桃、李、柿、番茄、柑橘等。成虫以其构造独特的虹吸式口器插入成熟果实吸取汁液，造成大量落果及贮运期间烂果。', NULL, 'insect/鳞翅目/夜蛾科/unKnowGenus/枯安纽夜蛾/'),
(116, 2, '桃瘤蚜', '桃瘤头蚜、桃纵卷瘤蚜', 'Tuberocephalusmomonis', '半翅目', '蚜科', NULL, '昆虫名，为半翅目，蚜科（以前归于同翅目）。中国分布较广，南、北方均有发生。其寄主植物有桃、樱桃、梅、梨等果树和艾蒿等菊科植物。以成虫、若虫群集在叶背吸食汁液，以嫩叶受害为重，受害叶片的边缘向背后纵向卷曲，卷曲处组织肥厚，似虫瘿，凸凹不平，初呈淡绿色，后变红色；严重时大部分叶片卷成细绳状，最后干枯脱落，严重影响桃树的生长发育。', NULL, 'insect/半翅目/蚜科/unKnowGenus/桃瘤蚜/'),
(117, 4, '卫矛尺蠖', '丝绵木金星尺蠖', '卫矛尺蠖', '鳞翅目', '尺蛾科', NULL, '昆虫名，为鳞翅目，尺蛾科。分布于东北、华北、华东、西北等地。寄主于木槿、卫矛、丝棉木、大叶黄杨、女贞、七里香、扶芳藤、大青叶、榔榆、杨、梆、榆、槐等。危害大叶黄杨、卫矛树等树木，既影响植物的正常生长，又降低植物的观赏效果，有严重的危害性。', NULL, 'insect/鳞翅目/尺蛾科/unKnowGenus/卫矛尺蠖/'),
(118, 8, '松纵坑切梢小蠹', NULL, 'Tomicus piniperda Linnaeus', '鞘翅目', '小蠹科', '切梢小蠹属', '昆虫名，为鞘翅目，小蠹科。分布于辽宁、河南、陕西、江苏、浙江、湖南、四川、云南等省，主要为害华山松、高山松、油松、云南松及其他松属树种。成幼虫钻蛀皮下为害，主要是树势衰弱或新移栽树木的枝干和嫩梢。', NULL, 'insect/鞘翅目/小蠹科/切梢小蠹属/松纵坑切梢小蠹/'),
(119, 4, '荔枝巢蛾', '荔枝巢蛾', 'ComoritisalbicapillaMoriuti', '鳞翅目', '巢蛾科', NULL, '昆虫名，为鳞翅目，巢蛾科。分布在广西、广东等省区和主要寄主植物有龙眼、荔枝、芒果等；以幼虫啃食果树主干和较粗大枝条的皮层，发生严重时，致使果株长势衰弱。', NULL, 'insect/鳞翅目/巢蛾科/unKnowGenus/荔枝巢蛾/'),
(120, 8, '美人蕉甘薯叶甲', '薯猿叶虫、蓝黑金花虫、甘薯金龟子', 'Colasposoma dauricum (auripenne) Mannerheim', '鞘翅目', '肖叶甲科', '甘薯肖叶甲属', '美人蕉甘薯叶甲，Colasposoma dauricum (auripenne) Mannerheim，为鞘翅目肖叶甲科甘薯肖叶甲属的一种甲虫。分布较广泛，在中国主要分布于东北及内蒙古、宁夏、河北、山东、山西、河南、陕西、甘肃、青海、新疆、江苏、安徽、湖北、四川等地，在日本、朝鲜等地，为害严重。以成虫食害顶端嫩叶、嫩茎，特别是在幼苗期，常使薯苗顶端折断，幼苗生长迟缓甚至整株枯死，造成缺株，甚至重插。幼虫主要蛀食土中根茎，被食成深浅不一，弯曲的伤痕。', NULL, 'insect/鞘翅目/肖叶甲科/甘薯肖叶甲属/美人蕉甘薯叶甲/'),
(121, 8, '黑负葬甲', NULL, 'Nicrophorus concolor Kraatz,1887', '鞘翅目', '葬甲科', NULL, '体大型，有些个体可达45mm长；复眼鼓凸，前胸背板中央明显隆拱，鞘翅平滑，纵肋纹几不可辨，后部近1/3处微向下弯折呈坡，末端2-3腹部背板外露。常飞到灯下，具有假死性。', NULL, 'insect/鞘翅目/葬甲科/unKnowGenus/黑负葬甲/'),
(122, 4, '宽带凤蝶东部亚种', '宽带美凤蝶，台湾白纹凤蝶', 'Papilio nephelus Chaonulus Fruhstorfer）', '鳞翅目', '凤蝶科', '凤蝶属', '宽带凤蝶东部亚种（ Papilio nephelus Chaonulus Fruhstorfer），属美凤蝶亚属，因此也称宽带美凤蝶东部亚种；台湾名：台湾白纹凤蝶。翅膀表面黑色，前翅腹面具4-5枚相邻的白色长斑， 外观近似玉斑凤蝶，但本种白斑较大，腹面后翅缘橙黄色斑纹而非玉斑凤蝶的橙红色斑，雌蝶翅膀颜色较淡，橙色弦月形斑较发达。本种幼虫以芸香科之飞龙掌血、贼仔树等植物寄主，普遍分布于低、中海拔山区，成虫于3 - 10 月出现，常见于向阳的花丛防花吸蜜。', NULL, 'insect/鳞翅目/凤蝶科/凤蝶属/宽带凤蝶东部亚种/'),
(123, 2, '双列圆龟蝽', NULL, 'Coptosoma bifaria', '半翅目', '龟蝽科', NULL, '昆虫名，属半翅目（Hemiptera），龟蝽科（Plataspidae）。分布于安徽、湖北、江西、湖南、福建、广西、重庆、四川、贵州等地。体小形，黑色具带有两个白色半点，带金属光泽，体圆形，背面隆起。小盾片极发达，覆盖整个腹部。为害多种植物。', NULL, 'insect/半翅目/龟蝽科/unKnowGenus/双列圆龟蝽/'),
(124, 6, '少脉蚜茧蜂', NULL, 'Diaeretiella sp', '膜翅目', '蚜茧蜂科', NULL, '少脉蚜茧蜂是节肢动物门，昆虫纲，膜翅目，蚜茧蜂科的一种昆虫。分布区域遍及全世界。寄主昆虫则主要有麦长管蚜等。少脉蚜茧蜂主要危害的农作物是水稻作物。雌雄的形态都有不同的特点。', NULL, 'insect/膜翅目/蚜茧蜂科/unKnowGenus/少脉蚜茧蜂/'),
(125, 8, '香石竹蛴螬', '白地蚕、土白蚕、地狗子、杂拉虫', '香石竹蛴螬', '鞘翅目', '金龟总科', NULL, '昆虫名，属鞘翅目，金龟总科。分布中国各地。寄主范围广。是金龟子的幼虫。成虫食叶，一夜间可把一片地上的花木叶片吃光。主要取食花卉根部，导致整株枯萎而死亡。', NULL, 'insect/鞘翅目/金龟总科/unKnowGenus/香石竹蛴螬/'),
(126, 6, '银花叶蜂', NULL, 'Tenthredinidae', '膜翅目', '叶蜂科', NULL, '昆虫名，属膜翅目，叶蜂科。分布在银花叶蜂幼虫为害叶片，初孵幼虫喜爬到嫩叶上取食，从叶的边缘向内取食，呈整齐的缺刻，全叶吃光后再转移到邻近叶片为害。发生严重时，可将全株叶片吃光，使植株不能开花，不但严重影响当年花的产量，而且使次年发叶较晚，致使受害枝条枯死。', NULL, 'insect/膜翅目/叶蜂科/unKnowGenus/银花叶蜂/'),
(127, 8, '黄粉虫', '面包虫', 'Tenebrio molitor', '鞘翅目', '拟步甲科', '粉甲属', '黄粉虫俗名面包虫，为鞘翅目拟步行科粉甲属的昆虫。黄粉虫是完全变态的昆虫，即成虫、卵、幼虫、蛹4种变态 [1] 。 成虫体长而扁，长1.4~1.8厘米，黑褐色具有金属光泽，头部为前口式，唇基两侧不超过触觉基部 [1] 。 成虫在羽化过程中，头、胸、足为淡棕色，腹部和鞘翅为乳白色，开始虫体稚嫩，不愿活动，4~5天后颜色变深，鞘翅变硬，灵活但不飞，爬行较快，经精心喂养后，成虫群体交尾、产卵 [1] 。', NULL, 'insect/鞘翅目/拟步甲科/粉甲属/黄粉虫/'),
(128, 8, '柑橘恶性叶甲', NULL, 'Clitea metallica', '鞘翅目', '叶甲科', NULL, '昆虫名，属鞘翅目，叶甲科。分布在浙江、湖南、四川、贵州、江西、福建、广东等。成虫食嫩叶、嫩茎、花和幼果；幼虫食嫩芽、嫩叶和嫩梢，分泌物和粪便污染致幼叶枯焦脱落。除叶片外，成虫还将幼果咬成孔洞，轻者果实造成伤痕，重者引起幼果大量脱落，影响产量和品质。', NULL, 'insect/鞘翅目/叶甲科/unKnowGenus/柑橘恶性叶甲/'),
(129, 3, '青螽嘶', '刺腿绿螽', 'Ducetia thymibolia (Fabricius)', '直翅目', '螽嘶科', NULL, '昆虫名，属直翅目，螽嘶科。分布在河南等省。寄主于白菜、瓜类、豆类等蔬菜。以成虫、若虫食叶。仅见中国东部发生。', NULL, 'insect/直翅目/螽嘶科/unKnowGenus/青螽嘶/'),
(130, 4, '栗透翅蛾', '赤腰透翅蛾、串皮虫', '栗透翅蛾', '鳞翅目', '透翅蛾科', NULL, '昆虫名，属鳞翅目，透翅蛾科。分布在山东泰山、蒙山、费县、临沭、招远等地栗园普遍发生。 以幼虫串食枝干韧皮层，尤以主干下部受害最重，常导致树势衰弱，甚至整株死亡。据山东部分栗园调查，干径20厘米以上的栗树受害株高达33.8%。该虫只危害板栗，是目前值得注意的危险性害虫。', NULL, 'insect/鳞翅目/透翅蛾科/unKnowGenus/栗透翅蛾/'),
(131, 10, '棉粉虱', '叫烟粉虱、小白蛾子', 'Bemisia tabaci Gennadius', '同翅目', '粉虱科', NULL, '昆虫名，为同翅目，粉虱科。黄河流域和长江流域棉区均有分布，可危害棉花、豌豆、青椒、番茄、瓜类、十子花科蔬菜和多种花卉等。成虫和若虫均能危害，以若虫危害更为严重。成、若虫群集在中、上部叶背吸食汁液，棉叶上出现褪绿斑点或黑红色斑点，棉株生长不良，重者引起蕾铃大量脱落，降低棉花常量和品质。', NULL, 'insect/同翅目/粉虱科/unKnowGenus/棉粉虱/'),
(132, 8, '多型虎甲红翅亚种', '红翅虎甲', 'Cicindela hybrida nitida Lichtenstein', '鞘翅目', '虎甲科', '虎甲属', '多型虎甲红翅亚种，也有简称其红翅虎甲的。内蒙古有多种这样的虎甲，色型多样，都很漂亮。 [1] 捕食棉铃虫、地老虎、红铃虫；危害棉花 [1] 。', NULL, 'insect/鞘翅目/虎甲科/虎甲属/多型虎甲红翅亚种/'),
(133, 2, '水稻白背飞虱', NULL, 'Sogatella furcifera(Horvath)', '半翅目', '飞虱科', NULL, '昆虫名，属同翅目，飞虱科。分布在中国英白、水稻种植区。寄主于水稻、英白、玉米、大麦、小麦、甘蔗、高粱、稗草、早熟禾等。以成、若虫群集于稻丛基部，刺吸茎叶组织汁液。虫量大，受害重时引起稻株瘫痪倒伏，俗称“冒穿”，导致严重减产或失收。', NULL, 'insect/半翅目/飞虱科/unKnowGenus/水稻白背飞虱/');

-- --------------------------------------------------------

--
-- 表的结构 `insect_class`
--

CREATE TABLE `insect_class` (
  `class_id` int(16) NOT NULL,
  `class_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `insect_class`
--

INSERT INTO `insect_class` (`class_id`, `class_name`) VALUES
(2, '半翅目'),
(3, '直翅目'),
(4, '鳞翅目'),
(5, '缨尾目'),
(6, '膜翅目'),
(7, '蜉蝣目'),
(8, '鞘翅目'),
(9, '双翅目'),
(10, '同翅目'),
(11, '蜻蜓目'),
(12, '缨翅目'),
(13, '蜱螨目');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `insects`
--
ALTER TABLE `insects`
  ADD PRIMARY KEY (`insect_id`);

--
-- Indexes for table `insect_class`
--
ALTER TABLE `insect_class`
  ADD PRIMARY KEY (`class_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `insects`
--
ALTER TABLE `insects`
  MODIFY `insect_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- 使用表AUTO_INCREMENT `insect_class`
--
ALTER TABLE `insect_class`
  MODIFY `class_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;