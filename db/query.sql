SELECT * FROM category;
desc project;
ALTER TABLE project CHANGE COLUMN enableComment enable_comment ENUM("yes","no") NOT NULL DEFAULT "yes";
ALTER TABLE project CHANGE COLUMN enableTest enable_test ENUM("yes","no") NOT NULL DEFAULT "no";
DROP TABLE audio;
CREATE TABLE audio(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  category_id INT NOT NULL ,
  user_id INT NOT NULL ,
  title VARCHAR(64) NOT NULL COMMENT '标题',
  resource_url VARCHAR(128) NOT NULL COMMENT '视频文件路径',
  praise_count int(11) NOT NULL DEFAULT '0' COMMENT '赞同数',
  view_count int(11) NOT NULL DEFAULT '0' COMMENT '浏览人数',
  collect_count int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP ,
  KEY `fk_audio_category_idx` (category_id),
  CONSTRAINT `fk_audio_category_idx` FOREIGN KEY (category_id) REFERENCES category (id),
  KEY `fk_audio_user_idx` (user_id),
  CONSTRAINT `fk_audio_user_idx` FOREIGN KEY (user_id) REFERENCES user (id)
)ENGINE=InnoDB DEFAULT CHAR SET utf8;

DROP TABLE exam;
CREATE TABLE exam(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  category_id INT NOT NULL ,
  user_id INT NOT NULL ,
  title VARCHAR(64) NOT NULL COMMENT '标题',
  content TEXT COMMENT '补充',
  answer TEXT NOT NULL COMMENT '答案json字符串',
  test_type enum('single','multiple','other') NOT NULL,
  praise_count int(11) NOT NULL DEFAULT '0' COMMENT '赞同数',
  view_count int(11) NOT NULL DEFAULT '0' COMMENT '浏览人数',
  collect_count int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP ,
  KEY `fk_exam_category_idx` (category_id),
  CONSTRAINT `fk_exam_category_idx` FOREIGN KEY (category_id) REFERENCES category (id),
  KEY `fk_exam_user_idx` (user_id),
  CONSTRAINT `fk_exam_user_idx` FOREIGN KEY (user_id) REFERENCES user (id)
) ENGINE=InnoDB DEFAULT CHAR SET utf8;

CREATE TABLE video(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  category_id INT NOT NULL ,
  user_id INT NOT NULL ,
  title VARCHAR(64) NOT NULL COMMENT '标题',
  content TEXT COMMENT '补充',
  resource_url  varchar(255) NOT NULL ,
  thumbnail varchar(255) NOT NULL ,
  praise_count int(11) NOT NULL DEFAULT '0' COMMENT '赞同数',
  view_count int(11) NOT NULL DEFAULT '0' COMMENT '浏览人数',
  collect_count int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP ,
  KEY `fk_video_category_idx` (category_id),
  CONSTRAINT `fk_video_category_idx` FOREIGN KEY (category_id) REFERENCES category (id),
  KEY `fk_video_user_idx` (user_id),
  CONSTRAINT `fk_video_user_idx` FOREIGN KEY (user_id) REFERENCES user (id)
)ENGINE=InnoDB DEFAULT CHAR SET utf8;

CREATE TABLE article(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  category_id INT NOT NULL ,
  user_id INT NOT NULL ,
  title VARCHAR(64) NOT NULL COMMENT '标题',
  content TEXT COMMENT '正文',
  description TEXT COMMENT '摘要',
  praise_count int(11) NOT NULL DEFAULT '0' COMMENT '赞同数',
  view_count int(11) NOT NULL DEFAULT '0' COMMENT '浏览人数',
  collect_count int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP ,
  KEY `fk_article_category_idx` (category_id),
  CONSTRAINT `fk_article_category_idx` FOREIGN KEY (category_id) REFERENCES category (id),
  KEY `fk_article_user_idx` (user_id),
  CONSTRAINT `fk_article_user_idx` FOREIGN KEY (user_id) REFERENCES user (id)
)ENGINE=InnoDB DEFAULT CHAR SET utf8;


SELECT * FROM project WHERE type='article';

DROP TABLE praise;
CREATE TABLE praise(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  user_id INT NOT NULL ,
  project_id int(11) NOT NULL,
  type ENUM('normal','exam','article','image','audio','video') NOT NULL ,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  updated_at timestamp NULL DEFAULT NULL,
  KEY `fk_praise_user_idx` (`user_id`),
  CONSTRAINT `fk_praise_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHAR SET utf8;
DROP TABLE collect;
CREATE TABLE collect(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  user_id INT NOT NULL ,
  project_id int(11) NOT NULL,
  type ENUM('normal','exam','article','image','audio','video') NOT NULL ,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  updated_at timestamp NULL DEFAULT NULL,
  KEY `fk_collect_user_idx` (`user_id`),
  CONSTRAINT `fk_collect_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHAR SET utf8;
DROP TABLE view;
CREATE TABLE view(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  user_id INT NOT NULL ,
  project_id int(11) NOT NULL,
  type ENUM('normal','exam','article','image','audio','video') NOT NULL ,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  updated_at timestamp NULL DEFAULT NULL,
  KEY `fk_view_user_idx` (`user_id`),
  CONSTRAINT `fk_view_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHAR SET utf8;

SHOW create TABLE project;

CREATE TABLE video_qst(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  video_id INT NOT NULL ,
  title VARCHAR(64) NOT NULL COMMENT '问题',
  answer VARCHAR(64) NOT NULL COMMENT '解答',
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  updated_at timestamp NULL DEFAULT NULL,
  KEY fk_vq_video_idx (video_id),
  CONSTRAINT fk_vq_video_idx FOREIGN KEY (video_id) REFERENCES video(id)
)ENGINE=InnoDB DEFAULT CHAR SET utf8;

SELECT * FROM user;

SELECT * FROM video_qst;
SELECT * FROM video;

ALTER TABLE `slsxpt`.`video_qst`
DROP FOREIGN KEY `fk_vq_video_idx`;

ALTER TABLE `slsxpt`.`video_qst`
CHANGE COLUMN `video_id` `video_id` INT(11) NULL ;

ALTER TABLE `slsxpt`.`video_qst`
ADD CONSTRAINT `fk_vq_video_idx`
FOREIGN KEY (`video_id`)
REFERENCES `slsxpt`.`video` (`id`);

DELETE FROM video_qst WHERE id<7;


SELECT  * FROM category;

SELECT * FROM video;

select
  this_.id as id1_12_1_, this_.category_id as categor11_12_1_, this_.collect_count as collect_2_12_1_, this_.content as content3_12_1_, this_.created_at as created_4_12_1_, this_.praise_count as praise_c5_12_1_, this_.resource_url as resource6_12_1_, this_.thumbnail as thumbnai7_12_1_, this_.title as title8_12_1_, this_.updated_at as updated_9_12_1_, this_.user_id as user_id12_12_1_, this_.view_count as view_co10_12_1_, userentity2_.id as id1_11_0_, userentity2_.avatar as avatar2_11_0_, userentity2_.code as code3_11_0_, userentity2_.created_at as created_4_11_0_, userentity2_.email as email5_11_0_, userentity2_.gold as gold6_11_0_, userentity2_.name as name7_11_0_, userentity2_.password as password8_11_0_, userentity2_.phone as phone9_11_0_, userentity2_.progress as progres10_11_0_, userentity2_.salt as salt11_11_0_, userentity2_.type as type12_11_0_, userentity2_.updated_at as updated13_11_0_, userentity2_.username as usernam14_11_0_
from slsxpt.video this_
  left outer join slsxpt.user userentity2_ on this_.user_id=userentity2_.id;

ALTER TABLE video_qst RENAME project_qst;
DROP TABLE video_video_qst;

ALTER TABLE project_qst ADD COLUMN type ENUM('normal','exam','video','audio','article') NOT NULL DEFAULT 'normal' COMMENT '项目类型';
ALTER TABLE project_qst CHANGE COLUMN video_id project_id INT NOT NULL COMMENT '相关项目的ID';
SELECT * FROM project_qst;
UPDATE project_qst SET type='video';


-- 问答模板
CREATE TABLE qst_tpl (
  id         INT                  AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(64) NOT NULL
  COMMENT '模板名称',
  created_at TIMESTAMP   NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP
) DEFAULT CHARACTER SET utf8;

DROP TABLE qst_tpl_item;
-- 模板项
CREATE TABLE qst_tpl_item(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  qst_tpl_id INT NOT NULL COMMENT '所属模板',
  title VARCHAR(255) NOT NULL COMMENT '题干',
  answer TEXT COMMENT '参考',
  created_at TIMESTAMP   NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP
) DEFAULT CHAR SET utf8;


ALTER TABLE category ADD COLUMN qst_tpl_id INT NOT NULL DEFAULT 0 COMMENT '问答模板ID';


SELECT * FROM qst_tpl;
INSERT INTO qst_tpl(name) VALUES ('五种技术'),('三个问题');
INSERT INTO qst_tpl(name) VALUES ('沙盘三个问题');
SELECT * FROM qst_tpl_item;
INSERT INTO qst_tpl_item(qst_tpl_id, title, answer)
VALUES
  (1,'若使用重复技术技术，你可能的回应是？',''),
  (1,'若使用内容反应技术技术，你可能的回应是？',''),
  (1,'若使用情感反应技术技术，你可能的回应是？',''),
  (1,'若使用具体化技术技术，你可能的回应是？',''),
  (1,'若使用共情技术技术，你可能的回应是？','');

INSERT INTO qst_tpl_item(qst_tpl_id, title, answer)
VALUES
  (2,'这幅画的特征有哪些？',''),
  (2,'通过画的特征，你的解释是什么？',''),
  (2,'综合你所发现的，你该如何回应给绘画者?','');

INSERT INTO qst_tpl_item(qst_tpl_id, title, answer)
VALUES
  (3,'这个沙盘的特征有哪些？',''),
  (3,'通过观察沙盘的特征，你的解释是什么？',''),
  (3,'综合你所发现的，你该如何回应给摆沙盘者。','');

SELECT * FROM project_qst;

SELECT * FROM qst_tpl;
SELECT * FROM  video;
SELECT * FROM category;


ALTER TABLE category
ADD CONSTRAINT fk_category_tpl
FOREIGN KEY (qst_tpl_id)
REFERENCES qst_tpl(id);

ALTER TABLE category DROP FOREIGN KEY fk_category_tpl;

UPDATE category SET qst_tpl_id=NULL WHERE qst_tpl_id=0;


DELETE FROM project_qst WHERE project_id not IN (
  select id FROM video
) and type="video";


alter TABLE project_qst RENAME video_qst;
ALTER TABLE video_qst DROP COLUMN type;
ALTER TABLE video_qst DROP FOREIGN KEY FK_6ywuhd49vo60o7w9rsmcehx26;
ALTER TABLE video_qst DROP INDEX FK_6ywuhd49vo60o7w9rsmcehx26;

ALTER TABLE video_qst CHANGE COLUMN video_id video_id INT NOT NULL ;
ALTER TABLE video_qst ADD CONSTRAINT fk_video_qst_video_idx FOREIGN KEY (video_id) REFERENCES video(id);

DELETE FROM video_qst WHERE video_id not IN (
  select id FROM video
) OR video_id = null;

DELETE FROM video_qst WHERE video_id IS NULL ;


SELECT * FROM qst_tpl_item;
CREATE TABLE audio_qst(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  audio_id INT NOT NULL ,
  title VARCHAR(64),
  answer VARCHAR(64),
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP ,
  KEY fk_aq_audio_idx (audio_id),
  CONSTRAINT fk_aq_audio_idx FOREIGN KEY (audio_id) REFERENCES audio(id)
)ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


select concat('drop table ',table_name,';') from TABLES where table_schema='qdm155063477_db' INTO OUTFILE 'drop.sql';


drop table category;
drop table collect;
drop table customer;
drop table praise;
drop table project;
drop table tb_blogcategories;
drop table tb_blogcomments;
drop table tb_blogs;
drop table tb_groups;
drop table tb_groups_access;
drop table tb_logs;
drop table tb_menu;
drop table tb_module;
drop table tb_pages;
drop table tb_users;
drop table user_test;

SELECT * FROM audio_qst;
SELECT * FROM audio;

create TABLE exam_qst(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  exam_id INT NOT NULL ,
  title VARCHAR(64),
  answer VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP,
  KEY fk_eq_exam_idx(exam_id),
  CONSTRAINT fk_eq_exam_idx FOREIGN KEY (exam_id) REFERENCES exam(id)
)ENGINE = InnoDB DEFAULT CHARACTER SET utf8;

ALTER TABLE exam CHANGE COLUMN test_type test_type ENUM('single', 'multiple', 'qa', 'other') NOT NULL DEFAULT 'other';

SELECT * FROM exam;

create TABLE college
(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(50) NOT NULL COMMENT  '学院名',
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP
)engine=innodb default charset=utf8;

ALTER TABLE user ADD COLUMN college_id int NULL COMMENT 'college表的外键';
ALTER TABLE user
ADD CONSTRAINT fk_user_college
FOREIGN KEY (college_id)
REFERENCES college(id);

INSERT INTO college(name)
VALUES
  ('医学院'),
('第一中西临床学院'),
('中西医结合学院'),
('药学院人文社科学院'),
('国际教育学院'),
('成人教育学院'),
('社会科学部'),
('护理学院'),
('中医学院第二中医临床医学院'),
('针灸推拿学院'),
('管理与信息工程学院'),
('临床医学院'),
('湘杏学院'),
('研究生院'),
('体育艺术部');

DESC user;

ALTER TABLE user ADD COLUMN clazz VARCHAR(64) NULL COMMENT '班级名' AFTER name;
ALTER TABLE user ADD COLUMN label VARCHAR(255) NULL COMMENT '个性签名' AFTER clazz;
