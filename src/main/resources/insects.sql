
DROP TABLE IF EXISTS `insects`;

CREATE TABLE insects (
    `insect_id` int(16) NOT NULL AUTO_INCREMENT,
    `class_id` int(16) NOT NULL,
    `insect_name` varchar(64) NOT NULL,
    `insect_alias` varchar(128),
    `scientific_name` varchar(128),
    `order` varchar(64),
    `family` varchar(64),
    `genus` varchar(64),
    `description` varchar(1024) NOT NULL,
    `html` varchar(1024),
    `pic` varchar(256),
    PRIMARY KEY (`insect_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `insect_class`;

CREATE TABLE insect_class (
    `class_id` int(16) NOT NULL AUTO_INCREMENT,
    `class_name` varchar(64) NOT NULL,
    PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
