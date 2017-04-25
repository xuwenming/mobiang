/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50613
Source Host           : localhost:3306
Source Database       : mb

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2017-04-25 20:30:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for api_test
-- ----------------------------
DROP TABLE IF EXISTS `api_test`;
CREATE TABLE `api_test` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `complete_url` varchar(500) DEFAULT NULL COMMENT '接口url加上参数的完整地址',
  `info` varchar(255) DEFAULT NULL COMMENT '接口信息说明',
  `is_success` int(11) DEFAULT NULL COMMENT '0接口调试成功1失败',
  `name` varchar(255) NOT NULL COMMENT '接口名称',
  `param` longtext COMMENT '参数',
  `param_des` longtext COMMENT '参数说明',
  `project_mark` varchar(255) DEFAULT NULL COMMENT '项目标记',
  `remark` longtext COMMENT '备注',
  `result` longtext COMMENT '返回结果',
  `result_des` longtext COMMENT '返回结果说明',
  `url` varchar(255) NOT NULL COMMENT '接口url地址',
  `method` varchar(255) DEFAULT NULL COMMENT '方法POST/GET',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_test
-- ----------------------------
INSERT INTO `api_test` VALUES ('00ed7a2b-a916-4fb0-af44-001dfe055ab8', null, null, '0', '用户端-预定巴士-巴士预约', 'sid=sess_57602147b1b5f&uid=3&schedul_id=33&adult_count=2&child_count=3', 'schedul_id	Int	Y	排班ID\nadult_count	Int	Y	成人人数\nchild_count	Int	Y	儿童人数\n', 'FIT', '', '{\n    \"order_id\": 301,\n    \"succeed\": 1\n}', 'order_id	Int	Y	订单ID\n', 'bus/appointmentbus', 'POST');
INSERT INTO `api_test` VALUES ('01e2a585-417e-46bd-a56c-8c6cbdec0a29', null, null, '0', '用户端-我的-用户信息获取', 'sid=sess_575d864fc3ed7&uid=3&language=cn', '', 'FIT', 'UI上需要返回生日日期（格式：yyyy-MM-dd）\n增加生日，原age保留', '{\n    \"user\": {\n        \"id\": \"3\",\n        \"user_group\": \"1\",\n        \"nickname\": \"test999\",\n        \"email\": \"test999@163.com\",\n        \"mobile\": \"15866668888\",\n        \"username\": \"\",\n        \"name\": \"张莉\",\n        \"gender\": \"1\",\n        \"age\": \"27\",\n        \"birthday\": \"\",\n        \"avatar\": \"/public//uploadFile/avatar/empty.png\",\n        \"joined_at\": \"2016-05-03 10:15:53\"\n    },\n    \"succeed\": 1\n}', 'user	Array	Y	用户信息\nid	Int	Y	用户ID\nuser_group	Int	Y	用户角色\n1：普通用户\n2：专车车主\nnickname	String	Y	昵称\nemail	String	Y	邮箱\nmobile	String	Y	手机号\nname	String	Y	姓名\nusername	String	Y	用户名\ngender	Int	Y	性别\n0：男\n1：女\nage	Int	Y	年龄\navatar	String	Y	头像URL\n', 'user/info', 'POST');
INSERT INTO `api_test` VALUES ('0387ca58-6f14-4a54-91d2-14abf53a523d', null, null, '1', '司机端-我的-我的钱包-银行卡删除', 'sid=sess_576a92b2f2c60&uid=33&language=cn&card_id=6', 'card_id	int	Y	银行ID\n\n\n\n', 'FIT', '1、接口错误', '{\n    \"succeed\": 0,\n    \"error_code\": 500,\n    \"error_desc\": \"服务器内部错误\"\n}', '\n\n\n\n\n', 'driver/deletebankcard', 'POST');
INSERT INTO `api_test` VALUES ('08648f65-2029-490e-81a6-51d705b1cc28', null, null, '1', '用户端-我的-用户信息修改', 'sid=sess_576a9818d131b&uid=3&language=cn&nickname=小五&gender=1&age=28&birthday=1990-10-12&gender=0', 'nickname	String	N	昵称. \nemail	String	N	邮箱\nname	String	N	姓名\ngender	Int	N	性别\n0：男\n1：女\nage	Int	N	年龄\nmobile	String	N	手机号\nverify_code	String	N	手机验证码（修改手机号时必须）\n', 'FIT', '年龄应该改为生日日期修改？\n增加生日，原age保留', '{\n    \"succeed\": 0,\n    \"error_code\": 500,\n    \"error_desc\": \"服务器内部错误\"\n}', 'user	Array	Y	用户信息\nid	Int	Y	用户ID\nuser_group	Int	Y	用户角色\n1：普通用户\n2：专车车主\nnickname	String	Y	昵称\nemail	String	Y	邮箱\nmobile	String	Y	手机号\nname	String	Y	姓名\ngender	Int	Y	性别\n0：男\n1：女\nage	Int	Y	年龄\navatar	String	Y	头像URL\njoined_at	String	Y	注册时间\n', 'user/changeprofile', 'POST');
INSERT INTO `api_test` VALUES ('0a9fbf72-c97a-47ab-9e50-5086b62c6f83', null, null, '0', '用户端-我的-我的收藏', 'sid=sess_57694a629d3c9&uid=3&page=1&page_count=10', '', 'FIT', '1、返回数据待确认？\n--\n返回数据增加了车辆的简介和车辆的照片，收藏列表显示车辆照片，车牌，和简介\n\n1、接口错误 已解决\n2、文档中返回的信息不全（参考UI）--待确定\n最初讨论需求是对某个bus进行收藏，但是同一辆bus可以有有很多排班，可以有不同的出发地和目的地，所以收藏列表是否只显示车辆基本信息？', '{\n    \"totalPage\": 1,\n    \"favorite\": [\n        {\n            \"id\": \"5\",\n            \"car_id\": \"47\",\n            \"plate\": \"沪BCCC\",\n            \"brief\": \"非常好的一辆车\",\n            \"photo\": \"/travel/public/uploadFile/carphoto/47_photo.jpg\",\n            \"time\": \"2016-05-26 11:07:39\"\n        }\n    ],\n    \"succeed\": 1\n}', '\n', 'user/myfavorite', 'POST');
INSERT INTO `api_test` VALUES ('15280bc4-912c-436e-bec2-dbd9e35c6ecf', null, null, '0', '用户端-登录注册-退出', 'sid=sess_5755405732021&uid=35', '', 'FIT', '', '{\n    \"succeed\": 1\n}', '', 'user/signout', 'POST');
INSERT INTO `api_test` VALUES ('20f1a875-1918-4d0a-b74f-02f34c334163', null, null, '1', '通用-照片上传', '', 'photo	File	Y	照片文件. \ntype	Int	Y	1：头像2：身份证正面照3：身份证反面照4：驾照正面照\n', 'FIT', '照片上传请点击右下角，上传返回服务器内部错误！', '{\n    \"succeed\": 0,\n    \"error_code\": 1,\n    \"error_desc\": \"授权过期\"\n}', 'url	照片URL', 'user/photoupload', 'POST');
INSERT INTO `api_test` VALUES ('31884935-cc46-45d4-98d5-673d28314e62', null, null, '0', '用户端-我的-优惠券', 'sid=sess_575ffd923e8ae&uid=3&status=2&page=1&page_count=10', 'status	Int	Y	状态\n2：未使用\n3：已使用\n4：已过期\npage	Int	Y	页码\npage_count	Int	Y	每页条数\n', 'FIT', '接口未完成\n-------\n接口已完成\n2016-06-13 16:43:45', '{\n    \"totalPage\": 1,\n    \"coupons\": [\n        {\n            \"id\": \"8\",\n            \"name\": \"专车优惠券\",\n            \"couponcode\": \"8C120738A74ADFA8BBA5\",\n            \"type\": \"25\",\n            \"amounts\": \"10.50\",\n            \"use_condition\": \"50.00\",\n            \"status\": \"2\",\n            \"used_time\": \"\",\n            \"valid_day\": \"30\",\n            \"provide_time\": \"2016-06-07\",\n            \"expired_time\": \"2016-07-07\"\n        },\n        {\n            \"id\": \"7\",\n            \"name\": \"专车优惠券\",\n            \"couponcode\": \"47B98EBA62D146F7F20E\",\n            \"type\": \"25\",\n            \"amounts\": \"10.50\",\n            \"use_condition\": \"50.00\",\n            \"status\": \"2\",\n            \"used_time\": \"\",\n            \"valid_day\": \"30\",\n            \"provide_time\": \"2016-06-07\",\n            \"expired_time\": \"2016-07-07\"\n        }\n    ],\n    \"succeed\": 1\n}', 'totalPage	Int	Y	总页数\ncoupons	Array	Y	优惠券list\nid	Int	Y	Id\nname	String	Y	优惠券名称\ncouponcode	String	Y	券码\ntype	String	Y	优惠券类型ID\namounts	String	Y	金额\nuse_condition	String	Y	使用条件\nstatus	Int	Y	状态\n2：未使用\n3：已使用\n4：已过期\nused_time	String	Y	使用时间\nvalid_day	String	Y	有效天数\nprovide_time	String	Y	发放时间（得到优惠券的时间）\nexpired_time	String	Y	过期时间\n', 'coupon/mycoupon', 'POST');
INSERT INTO `api_test` VALUES ('40700d4a-492d-4263-853b-cba7acd8c0b5', null, null, '0', '司机端-我的-订单列表', 'sid=sess_575ff7737808d&uid=33&language=cn&type=3&page=1&page_count=10', 'type	Int	Y	1：服务中 2：待服务3：已服务\npage	Int	Y	页码\npage_count	Int	Y	每页条数', 'FIT', '1、缺少服务类型（实时、预定）？\n----------\n司机实时用车是没有预定的，只有实时抢单，UI搞错了。2016-06-15 13:16:02\n\n无权限，是否因为刚注册未认证？-- 后台审核失败\n是的  刚注册的司机需要认证通过才可以进行各种操作，http://travel.1000ding.net/登录后台认证一下就可以了 ，后台用户名密码是  admin  111111 \n', '{\n    \"totalPage\": 1,\n    \"orders\": [\n        {\n            \"id\": \"214\",\n            \"order_sn\": \"2016052012030020\",\n            \"pay_sn\": \"SN_UW8278193672693\",\n            \"user_avatar\": \"\",\n            \"name\": \"李小莉\",\n            \"username\": \"admin\",\n            \"usermobile\": \"13985458745\",\n            \"start_location\": \"test1\",\n            \"end_location\": \"test2\",\n            \"status\": \"7\",\n            \"type\": \"3\",\n            \"amount\": \"21.00\",\n            \"start_time\": \"\",\n            \"accept_time\": \"2016-05-20 13:24:31\"\n        },\n        {\n            \"id\": \"213\",\n            \"order_sn\": \"2016052012030019\",\n            \"pay_sn\": \"SN_UW8278193672692\",\n            \"user_avatar\": \"\",\n            \"name\": \"张莉\",\n            \"username\": \"\",\n            \"usermobile\": \"15866668888\",\n            \"start_location\": \"test1\",\n            \"end_location\": \"test2\",\n            \"status\": \"4\",\n            \"type\": \"3\",\n            \"amount\": \"21.00\",\n            \"start_time\": \"\",\n            \"accept_time\": \"2016-05-20 13:24:31\"\n        },\n        {\n            \"id\": \"212\",\n            \"order_sn\": \"2016052012030018\",\n            \"pay_sn\": \"SN_UW8278193672691\",\n            \"user_avatar\": \"\",\n            \"name\": \"\",\n            \"username\": \"qq_qiao\",\n            \"usermobile\": \"\",\n            \"start_location\": \"test1\",\n            \"end_location\": \"test2\",\n            \"status\": \"4\",\n            \"type\": \"3\",\n            \"amount\": \"21.00\",\n            \"start_time\": \"\",\n            \"accept_time\": \"2016-05-20 13:24:31\"\n        },\n        {\n            \"id\": \"211\",\n            \"order_sn\": \"2016052012030017\",\n            \"pay_sn\": \"SN_UW8278193672690\",\n            \"user_avatar\": \"\",\n            \"name\": \"张莉\",\n            \"username\": \"\",\n            \"usermobile\": \"15866668888\",\n            \"start_location\": \"test1\",\n            \"end_location\": \"test2\",\n            \"status\": \"3\",\n            \"type\": \"3\",\n            \"amount\": \"21.00\",\n            \"start_time\": \"\",\n            \"accept_time\": \"2016-05-20 13:24:31\"\n        },\n        {\n            \"id\": \"210\",\n            \"order_sn\": \"2016052012030016\",\n            \"pay_sn\": \"SN_UW8278193672689\",\n            \"user_avatar\": \"\",\n            \"name\": \"\",\n            \"username\": \"\",\n            \"usermobile\": \"15866667777\",\n            \"start_location\": \"test1\",\n            \"end_location\": \"test2\",\n            \"status\": \"2\",\n            \"type\": \"3\",\n            \"amount\": \"21.00\",\n            \"start_time\": \"\",\n            \"accept_time\": \"2016-05-20 13:24:31\"\n        }\n    ],\n    \"succeed\": 1\n}', 'totalPage	Int	Y	总页数\norders	Array	Y	订单list\nid	Int	Y	订单ID\norder_sn	String	Y	订单序列号\npay_sn	String	Y	支付流水号\nuser_avatar	String	Y	乘客头像\nname	String	Y	乘客姓名\nusername	String	Y	乘客用户名\nusermobile	String	Y	乘客手机号\nstart_location	String	Y	出发地\nend_location	String	Y	目的地\nstatus			订单状态\n1：等待接单\n2：已接单\n3：取消订单\n4：开始服务\n5：服务完成\n6：未支付\n7：已支付\ntype	Int	Y	订单类型\n1：待服务\n2：已服务\namount	String	Y	订单金额\naccept_time	String	Y	接单时间\n\n', 'order/driverorders', 'POST');
INSERT INTO `api_test` VALUES ('41b2a2c2-f329-4f28-8786-6404010bb717', null, null, '1', '司机端-我的-我的钱包-银行卡添加', 'sid=sess_576a92b2f2c60&uid=33&language=cn&card_number=123456789&card_user=wang&bank_type=32&remark=111', 'card_number	String	Y	银行卡号/支付宝号/微信号等\ncard_user	String	Y	持卡人姓名\nbank_type	int	Y	银行类型（基础数据type= BANK_TYPE的ID）\nremark	String	N	备注\n\n\n\n\n\n', 'FIT', '1、接口错误\n\n-------------------------------------\n1、是否区分类型：信用卡、储蓄卡？\n2、没有删除银行卡？\n--------\n1.没有区分\n2.添加driver/deletebankcard删除银行卡接口\n2016-06-22 18:20:49', '{\n    \"succeed\": 0,\n    \"error_code\": 500,\n    \"error_desc\": \"服务器内部错误\"\n}', '\n\n\n\n\n', 'driver/addbankcard', 'POST');
INSERT INTO `api_test` VALUES ('4239614d-15dd-4578-9a88-a16cf60e2e18', null, null, '0', '司机端-登录注册-车辆资料获取', 'sid=sess_57518e1d54ddd&uid=34&language=cn', '', 'FIT', '', '{\n    \"drivercar\": {\n        \"city\": \"12\",\n        \"plate\": \"A88888\",\n        \"manned_number\": \"5\",\n        \"car_brands\": \"1\",\n        \"car_model\": \"6\",\n        \"city_name\": \"上海\",\n        \"car_brands_name\": \"大众\",\n        \"car_model_name\": \"微型车\"\n    },\n    \"succeed\": 1\n}', 'drivercar	Array	Y	车主车辆资料\ncity	Int	N	城市id. \nplate	String	N	车牌号\nmanned_number	Int	N	载客数\ncar_brands	Int	N	汽车品牌id\ncar_model	Int	N	车型id\ncity_name	String	N	城市名称\ncar_brands_name	String	N	汽车品牌名称\ncar_model_name	String	N	车型名称\n', 'driver/getdrivercar', 'POST');
INSERT INTO `api_test` VALUES ('43bc162c-7fec-4a28-94c7-64097c0c27ff', null, null, '0', '通用-基础数据查询', 'type=CITY', 'type分类：\nCAR_BRANDS：汽车品牌\nCAR_MODEL：车型\nCITY：城市\nCOUPON_TYPE：优惠券类型\nSTATION：站点\nBANK_TYPE：银行', 'FIT', '1、所有汽车品牌的车型都一样吗？\n2、热门城市有哪些？城市搜索匹配只在客户端实现吗？\n---------------------\n这个只是作为下拉框用的，其他地方像司机所在的城市，传的都是这里的id，返回信息，比如车型，也都是返回的ID\n2016-06-12 14:47:35', '{\n    \"domains\": [\n        {\n            \"id\": \"11\",\n            \"name\": \"北京\"\n        },\n        {\n            \"id\": \"12\",\n            \"name\": \"上海\"\n        },\n        {\n            \"id\": \"13\",\n            \"name\": \"苏州\"\n        },\n        {\n            \"id\": \"14\",\n            \"name\": \"南京\"\n        },\n        {\n            \"id\": \"15\",\n            \"name\": \"天津\"\n        },\n        {\n            \"id\": \"21\",\n            \"name\": \"江苏\"\n        },\n        {\n            \"id\": \"23\",\n            \"name\": \"浙江\"\n        }\n    ],\n    \"succeed\": 1\n}', '', 'system/getdomain', 'POST');
INSERT INTO `api_test` VALUES ('43db5c19-b0d3-462f-9b7e-18bb44dbfa12', null, null, '0', '用户端-我的-我的评价', 'sid=sess_57600232df342&uid=3&type=1&page=1&page_count=10', 'type	Int	Y	1：我给别人的评价2：别人给我的评价\npage	Int	Y	页码\npage_count	Int	Y	每页条数', 'FIT', '1、接口错误；\n2、没有找到对应的UI，UI上有待评价页面！\n是comment不是comments', '{\n    \"totalPage\": 2,\n    \"comments\": [\n        {\n            \"id\": \"15\",\n            \"type\": \"1\",\n            \"content\": \"司机人很好\",\n            \"time\": \"2016-06-02 13:40:56\",\n            \"order_id\": \"121\",\n            \"order_sn\": \"2016052012030012\",\n            \"car_id\": null,\n            \"car_plate\": null,\n            \"s_user_id\": \"3\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"o_user_id\": \"0\",\n            \"o_user_mobile\": null,\n            \"o_user_name\": null\n        },\n        {\n            \"id\": \"14\",\n            \"type\": \"1\",\n            \"content\": \"司机人很好\",\n            \"time\": \"2016-06-02 13:39:58\",\n            \"order_id\": \"121\",\n            \"order_sn\": \"2016052012030012\",\n            \"car_id\": null,\n            \"car_plate\": null,\n            \"s_user_id\": \"3\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"o_user_id\": \"0\",\n            \"o_user_mobile\": null,\n            \"o_user_name\": null\n        },\n        {\n            \"id\": \"13\",\n            \"type\": \"2\",\n            \"content\": \"test评论13\",\n            \"time\": \"2016-05-26 10:25:44\",\n            \"order_id\": \"0\",\n            \"order_sn\": null,\n            \"car_id\": \"50\",\n            \"car_plate\": null,\n            \"s_user_id\": \"3\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"o_user_id\": \"0\",\n            \"o_user_mobile\": null,\n            \"o_user_name\": null\n        },\n        {\n            \"id\": \"12\",\n            \"type\": \"2\",\n            \"content\": \"test评论12\",\n            \"time\": \"2016-05-26 10:25:43\",\n            \"order_id\": \"0\",\n            \"order_sn\": null,\n            \"car_id\": \"50\",\n            \"car_plate\": null,\n            \"s_user_id\": \"3\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"o_user_id\": \"0\",\n            \"o_user_mobile\": null,\n            \"o_user_name\": null\n        },\n        {\n            \"id\": \"11\",\n            \"type\": \"2\",\n            \"content\": \"test评论11\",\n            \"time\": \"2016-05-26 10:25:42\",\n            \"order_id\": \"0\",\n            \"order_sn\": null,\n            \"car_id\": \"50\",\n            \"car_plate\": null,\n            \"s_user_id\": \"3\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"o_user_id\": \"0\",\n            \"o_user_mobile\": null,\n            \"o_user_name\": null\n        },\n        {\n            \"id\": \"10\",\n            \"type\": \"2\",\n            \"content\": \"test评论10\",\n            \"time\": \"2016-05-26 10:25:42\",\n            \"order_id\": \"0\",\n            \"order_sn\": null,\n            \"car_id\": \"50\",\n            \"car_plate\": null,\n            \"s_user_id\": \"3\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"o_user_id\": \"0\",\n            \"o_user_mobile\": null,\n            \"o_user_name\": null\n        },\n        {\n            \"id\": \"9\",\n            \"type\": \"2\",\n            \"content\": \"test评论9\",\n            \"time\": \"2016-05-26 10:25:39\",\n            \"order_id\": \"0\",\n            \"order_sn\": null,\n            \"car_id\": \"50\",\n            \"car_plate\": null,\n            \"s_user_id\": \"3\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"o_user_id\": \"0\",\n            \"o_user_mobile\": null,\n            \"o_user_name\": null\n        },\n        {\n            \"id\": \"8\",\n            \"type\": \"2\",\n            \"content\": \"test评论8\",\n            \"time\": \"2016-05-26 10:25:39\",\n            \"order_id\": \"0\",\n            \"order_sn\": null,\n            \"car_id\": \"50\",\n            \"car_plate\": null,\n            \"s_user_id\": \"3\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"o_user_id\": \"0\",\n            \"o_user_mobile\": null,\n            \"o_user_name\": null\n        },\n        {\n            \"id\": \"7\",\n            \"type\": \"1\",\n            \"content\": \"test评论7\",\n            \"time\": \"2016-05-26 10:27:09\",\n            \"order_id\": \"223\",\n            \"order_sn\": \"2016052012030029\",\n            \"car_id\": null,\n            \"car_plate\": null,\n            \"s_user_id\": \"3\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"o_user_id\": \"11\",\n            \"o_user_mobile\": \"18965685455\",\n            \"o_user_name\": \"\"\n        },\n        {\n            \"id\": \"6\",\n            \"type\": \"1\",\n            \"content\": \"test评论6\",\n            \"time\": \"2016-05-26 10:27:08\",\n            \"order_id\": \"223\",\n            \"order_sn\": \"2016052012030029\",\n            \"car_id\": null,\n            \"car_plate\": null,\n            \"s_user_id\": \"3\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"o_user_id\": \"11\",\n            \"o_user_mobile\": \"18965685455\",\n            \"o_user_name\": \"\"\n        }\n    ],\n    \"succeed\": 1\n}', '\n', 'user/comment', 'POST');
INSERT INTO `api_test` VALUES ('4558352f-0e3c-4417-ae74-c72af9487f6c', null, null, '0', '用户端-我的-用户位置获取(司机端)', 'sid=sess_575a6808677a1&uid=3&userId=3', 'userId	Int	Y	对象用户ID', 'FIT', '此接口使用场景？\n需要获取用户位置的时候使用', '{\n    \"lon\": \"31.12432\",\n    \"lat\": \"121.32442\",\n    \"succeed\": 1\n}', '\nlon	String	Y	经度\nlat	String	Y	纬度\n', 'user/getuserlocation', 'POST');
INSERT INTO `api_test` VALUES ('4570754a-1184-4c5f-86db-41dfcb4fa75b', null, null, '0', '通用-广告详情获取', 'banner_id=9', 'banner_id	Int	Y	广告ID\n', 'FIT', '', '{\n    \"banner\": {\n        \"id\": \"9\",\n        \"cover\": \"/travel/public/uploadFile/adsbanner/82b95e88e33f1ea3197b8f741d7682e05760b21b07ee1.jpg\",\n        \"title\": \"2222222\",\n        \"content\": \"<p style=\\\"line-height: 16px;\\\"><img style=\\\"margin-right: 2px; vertical-align: middle;\\\" src=\\\"http://localhost/travel/public/backend/lib/ueditor/dialogs/attachment/fileTypeImages/icon_mp3.gif\\\"/><a title=\\\"1.1.1.mp3\\\" style=\\\"color: rgb(0, 102, 204); font-size: 12px;\\\" href=\\\"/travel/public/uploadFile/ueditor/file/20160615/1465954772613375.mp3\\\">1.1.1.mp3</a></p><p style=\\\"line-height: 16px;\\\"><img style=\\\"margin-right: 2px; vertical-align: middle;\\\" src=\\\"http://localhost/travel/public/backend/lib/ueditor/dialogs/attachment/fileTypeImages/icon_txt.gif\\\"/><a title=\\\"222.wma\\\" style=\\\"color: rgb(0, 102, 204); font-size: 12px;\\\" href=\\\"/travel/public/uploadFile/ueditor/file/20160615/1465954772273854.wma\\\">222.wma</a></p><p style=\\\"line-height: 16px;\\\"><img style=\\\"margin-right: 2px; vertical-align: middle;\\\" src=\\\"http://localhost/travel/public/backend/lib/ueditor/dialogs/attachment/fileTypeImages/icon_txt.gif\\\"/><a title=\\\"333.wav\\\" style=\\\"color: rgb(0, 102, 204); font-size: 12px;\\\" href=\\\"/travel/public/uploadFile/ueditor/file/20160615/1465954772251563.wav\\\">333.wav</a></p><p style=\\\"line-height: 16px;\\\"><img style=\\\"margin-right: 2px; vertical-align: middle;\\\" src=\\\"http://localhost/travel/public/backend/lib/ueditor/dialogs/attachment/fileTypeImages/icon_txt.gif\\\"/><a title=\\\"444.amr\\\" style=\\\"color: rgb(0, 102, 204); font-size: 12px;\\\" href=\\\"/travel/public/uploadFile/ueditor/file/20160615/1465954772531700.amr\\\">444.amr</a></p><p>&nbsp;</p>\",\n        \"time\": \"2016-06-15 09:40:43\"\n    },\n    \"succeed\": 1\n}', 'banner	Array	Y	旅游攻略详情\nid	int	Y	ID\ncover	String	Y	封面图URL\ntitle	String	Y	标题\ncontent	String	Y	内容\ntime	String	Y	时间\n\n\n\n', 'system/bannerinfo', 'POST');
INSERT INTO `api_test` VALUES ('48aff365-44ad-4a91-9310-5df661a890ce', null, null, '0', '用户端-登录注册-动态登录', 'mobile=15866668888&verify_code=999999&platform=android', '', 'FIT', '', '{\n    \"sid\": \"sess_575d83f58e58f\",\n    \"user\": {\n        \"id\": \"3\",\n        \"user_group\": \"1\",\n        \"nickname\": \"test999\",\n        \"email\": \"test999@163.com\",\n        \"mobile\": \"15866668888\",\n        \"username\": \"\",\n        \"name\": \"张莉\",\n        \"gender\": \"1\",\n        \"age\": \"27\",\n        \"birthday\": \"\",\n        \"avatar\": \"/public//uploadFile/avatar/empty.png\",\n        \"joined_at\": \"2016-05-03 10:15:53\"\n    },\n    \"succeed\": 1\n}', '\n', 'user/verifycodesignin', 'POST');
INSERT INTO `api_test` VALUES ('4ad1a591-917b-462c-9dc8-bedbf87bb0ea', null, null, '0', '司机端-我的-在线状态获取', 'sid=sess_57543fea30eb5&uid=34&language=cn', '\n', 'FIT', 'UI暂无设置状态？', '{\n    \"status\": \"1\",\n    \"succeed\": 1\n}', '\nstatus	1：在线 2：离线', 'driver/getonoffline', 'POST');
INSERT INTO `api_test` VALUES ('4f5fb1c7-1f61-4155-a237-a12bcfb5ef13', null, null, '0', '2016-06-14-问题列表', '', '', 'FIT', '', '', '1、缺少接口：\n   司机端-接单（推送接单消息、列表、详情）\n   司机端-我的钱包\n   司机端-订单详情\n\n   用户端-待评论订单列表\n   用户端-预定巴士-评论列表\n2、用户端-预定巴士中获取巴士排班和UI逻辑不相符，是否需要调整UI？\n3、是否所有汽车品牌的车型都一样？\n---------------\n1.  司机端-接单->更新订单状态（order/updateorderstatus）\n   抢单列表->driver/mygraborders\n  详情->order/orderinfo(关于订单详情的都用这个)\n\n\n  司机端-我的钱包->driver /mywallet\n   司机端-订单详情->order/orderinfo\n\n   用户端-待评论订单列表->  order/nocommentorders \n   用户端-预定巴士-评论列表->bus/appointmentbus,bus/buscomment,bus/getbuscomment\n2.需要调整UI，把bus的排班表查出来，由用户选择一个排班\n3.是的，这个车型不是厂家的型号，是微型车，中型车这些通用的型号\n', '2016-06-14-问题列表', 'POST');
INSERT INTO `api_test` VALUES ('55286bc8-e6d6-4856-b54e-3e0c7679cd5d', null, null, '0', '司机端-我的-我的钱包-提现申请', 'sid=sess_576a4a8f42c1f&uid=33&language=cn&amount=1&card_id=6', 'amount	Number	Y	提现金额\ncard_id	Int	Y	银行卡ID（银行卡列表中选择的ID）\n\n\n\n\n\n', 'FIT', '1、提现金额单位是什么?（包括涉及到金额的单位）\n--------------\n人民币（元）\n2016-06-22 19:06:18', '{\n    \"succeed\": 0,\n    \"error_code\": 1014,\n    \"error_desc\": \"余额不足\"\n}', '\n\n\n\n', 'driver/applywithdraw', 'POST');
INSERT INTO `api_test` VALUES ('57a02fde-35cb-4ee1-9b72-6fba116bb047', null, null, '0', '用户端-预定巴士-获取巴士排班', 'bus_id=49&date=2016-06-14&page=1&page_count=10', 'bus_id	String	N	巴士ID', 'FIT', '', '{\n    \"totalPage\": 1,\n    \"scheduls\": [\n        {\n            \"id\": \"33\",\n            \"departure_time\": \"2016-06-14 06:10:00\",\n            \"start_location\": \"17\",\n            \"end_location\": \"18\",\n            \"start_location_name\": \"上海动物园\",\n            \"end_location_name\": \"上海欢乐谷\",\n            \"adult_fare\": \"20.00\",\n            \"child_fare\": \"15.00\",\n            \"surplus_seat\": \"25\"\n        }\n    ],\n    \"succeed\": 1\n}', 'totalPage	Int	Y	总页数\nscheduls	Array	Y	优惠券list\nid	Int	Y	Id\ndeparture_time	String	Y	发车时间\nstart_location	String	Y	起点ID\nend_location	String	Y	终点ID\nstart_location_name	String	Y	起点名称\nend_location_name	String	Y	终点名称\nadult_fare	String	Y	成人票价\nchild_fare	String	Y	儿童票价\nsurplus_seat	Int	Y	剩余座位\n\n', 'bus/busschedul', 'POST');
INSERT INTO `api_test` VALUES ('58e27e85-b015-4769-b56b-1c2474cc0a5a', null, null, '0', '通用-引导页图片获取', 'type=1', 'type	int	Y	引导页类型\n1：用户端\n2：司机端\n', 'FIT', '', '{\n    \"screens\": [\n        {\n            \"id\": \"2\",\n            \"sort\": \"2\",\n            \"url\": \"/travel/public/uploadFile/initialscreen/e5f5d61c5c7b8bdbd211bcb9ae2d056b575e171aa9f34.jpg\"\n        }\n    ],\n    \"succeed\": 1\n}', 'screens	Array	Y	引导页面图片列表\nid	int	Y	ID\nsort	String	Y	排序\nurl	String	Y	图片URL\n\n', 'system/getinitialscreen', 'POST');
INSERT INTO `api_test` VALUES ('5972cccb-9d1e-41e6-8f3c-b27fef38cac4', null, null, '0', '司机端-登录注册-车主资料获取', 'sid=sess_575d8039b3a10&uid=34&language=cn', '', 'FIT', '', '{\n    \"user\": {\n        \"id\": \"34\",\n        \"user_group\": \"2\",\n        \"name\": \"snow\",\n        \"identity_card\": \"485458545878545854\",\n        \"mobile\": \"18701959799\",\n        \"driving_age\": \"7\",\n        \"address\": \"shanghai\",\n        \"gender\": \"0\",\n        \"age\": \"28\",\n        \"birthday\": \"1990-10-12\",\n        \"avatar\": \"\",\n        \"identity_card_front\": \"\",\n        \"identity_card_back\": \"\",\n        \"driver_license_front\": \"\",\n        \"status\": \"1\",\n        \"reson\": \"\",\n        \"joined_at\": \"2016-06-12 13:57:40\"\n    },\n    \"succeed\": 1\n}', 'user	Array	Y	车主信息\nid	Int	Y	用户ID\nuser_group	Int	Y	用户角色\n1：普通用户\n2：专车车主\nname	String	Y	姓名\nidentity_card	String	Y	身份证\nmobile	String	Y	手机号\ndriving_age	Int	Y	驾龄\naddress	String	Y	联系地址\ngender	Int	Y	性别\n0：男\n1：女\nage	Int	Y	年龄\navatar	String	Y	头像URL\nidentity_card_front	String	Y	身份证正面照\nidentity_card_back	String	Y	身份证反面照\ndriver_license_front	String	Y	驾驶证正面照\nstatus	Int	Y	审核状态\n1：待审核\n2：审核通过\n3：审核不通过\nreson	String	Y	审核原因\njoined_at	String	Y	注册时间\n', 'driver/getdriver', 'POST');
INSERT INTO `api_test` VALUES ('5c9094bc-b5e5-40c4-8cdb-eb5dee71895b', null, null, '0', '用户端-预定巴士-收藏', 'sid=sess_5760e9399c8f7&uid=3&car_id=1', 'car_id	Int	Y	车辆ID（巴士ID）', 'FIT', '没有取消收藏吗？ \n是否只有一种收藏类型？\n已增加取消收藏接口   现在只有对BUS车辆进行收藏  ', '{\n    \"succeed\": 1\n}', '\n', 'user/favorite', 'POST');
INSERT INTO `api_test` VALUES ('6059ed41-5a60-4e5b-95ef-64907b1076fe', null, null, '0', '用户端-订单-订单列表', 'sid=sess_576a3a149b87e&uid=3&status=3&type=1&page=1&page_count=10', 'status	Int	Y	订单状态99：全部 2：待服务/已接单 6：待付款 7：已付款/已完成 3：已取消\ntype	Int	Y	1：专车实时订单2：BUS订单\npage	Int	Y	页码\npage_count	Int	Y	每页条数', 'FIT', '1、接口错误\n2、缺少待评论订单列表（个人中心需要）\n---------\n接口已修正，最新的API文档中已有待评价订单接口（order/nocommentorders）\n2016-06-15 13:11:48', '{\n    \"totalPage\": 1,\n    \"orders\": [\n        {\n            \"id\": \"211\",\n            \"order_sn\": \"2016052012030017\",\n            \"pay_sn\": \"SN_UW8278193672690\",\n            \"plate\": \"\",\n            \"start_location\": \"test1\",\n            \"end_location\": \"test2\",\n            \"departure_time\": \"\",\n            \"status\": \"3\",\n            \"type\": \"1\",\n            \"amount\": \"21.00\",\n            \"is_comment\": \"\",\n            \"order_time\": \"2016-05-20 13:24:31\"\n        }\n    ],\n    \"succeed\": 1\n}', 'totalPage	Int	Y	总页数\norders	Array	Y	订单list\nid	Int	Y	订单ID\norder_sn	String	Y	订单序列号\npay_sn	String	Y	支付流水号\npeople_count	Int	Y	预定人数（巴士订单）\ndeparture_time	String	Y	出发时间\nplate	String	Y	车牌\nstart_location	String	Y	出发地\nend_location	String	Y	目的地\nstatus			订单状态\n1：等待接单\n2：已接单\n3：取消订单\n4：开始服务\n5：服务完成\n6：未支付\n7：已支付\ntype	Int	Y	订单类型\n1：专车实时订单\n2：BUS订单\namount	String	Y	订单金额\norder_time	String	Y	订单时间\n', 'order/userorders', 'POST');
INSERT INTO `api_test` VALUES ('672ab6a9-7837-4778-851e-12c3f1ad0f17', null, null, '0', '用户端-我的-用户位置更新(司机端)', 'sid=sess_575a6808677a1&uid=3&lon=31.42343&lat=121.21378', 'lon	String	Y	经度\nlat	String	Y	纬度\n', 'FIT', '此接口使用场景？\n用户在发布专车订单的时候，需要更新位置，司机接单后可以看到用户的位置。\n司机需要实时更新位置，乘客发布订单时需要查询附近的司机时候用。', '{\n    \"succeed\": 1\n}', '\n', 'user/updatelocation', 'POST');
INSERT INTO `api_test` VALUES ('6ca7c585-7f17-48d3-b8f7-4675e1f4d0a7', null, null, '0', '用户端-我的-我的积分', 'sid=sess_575d83f58e58f&uid=3&page=1&page_count=10', '', 'FIT', '除了积分总值之外，还应该有积分获取列表（参考UI设计）！\n已修正', '{\n    \"memberpoints\": \"281\",\n    \"totalPage\": 1,\n    \"pointhistorys\": [\n        {\n            \"user_id\": \"3\",\n            \"points\": \"-10\",\n            \"reson\": \"兑换减10积分\",\n            \"time\": \"2016-06-12 13:28:42\"\n        },\n        {\n            \"user_id\": \"3\",\n            \"points\": \"10\",\n            \"reson\": \"注册增加10积分\",\n            \"time\": \"2016-06-12 13:28:42\"\n        }\n    ],\n    \"succeed\": 1\n}', 'memberpoints	Int	Y	我的积分', 'user/memberpoints', 'POST');
INSERT INTO `api_test` VALUES ('6d4f4021-0d07-4c8a-8e8c-0db918faf2f0', null, null, '0', '2016-06-22-问题列表(IOS)', '', '', 'FIT', '', '', '问题写在此处（写完点击下方保存按钮即可）：', '2016-06-22-问题列表(IOS)', 'POST');
INSERT INTO `api_test` VALUES ('762a0b75-93c5-4f4d-a446-a1267afe2ed4', null, null, '0', '用户端-登录注册-注册', 'mobile=13671775421&verify_code=999999&password=123456&platform=android', 'mobile:手机号\nverify_code：短信验证码\npassword：密码\nplatform：平台类型（ios,android）', 'FIT', '同一个手机号能否同时注册用户端和司机端？\n不行', '{\n    \"sid\": \"sess_57553f7fcfa6a\",\n    \"uid\": 35,\n    \"succeed\": 1\n}', '', 'user/signup', 'POST');
INSERT INTO `api_test` VALUES ('76f5a8b0-f34a-4a9e-9adb-0a1923e01388', null, null, '0', '通用-获取短信验证码', 'mobile=15866668888', 'mobile:手机号', 'FIT', '短信验证码有效时间是多久？\n目前是10分钟', '{\n    \"succeed\": 1\n}', '', 'system/verifycode', 'POST');
INSERT INTO `api_test` VALUES ('799c8f5b-cca0-4ecf-ab1c-df879dc793d0', null, null, '0', '通用-意见反馈', 'sid=sess_57602147b1b5f&uid=3&content=我是来测试的', 'content	String	Y	反馈内容. ', 'FIT', '', '{\n    \"succeed\": 1\n}', '', 'system/feedback', 'POST');
INSERT INTO `api_test` VALUES ('7b1b29c2-90a3-4e2f-ab97-e6c0aef4a966', null, null, '0', '司机端-登录注册-注册', 'mobile=18701959799&verify_code=999999&password=111111&platform=android', 'mobile:注册手机号.\npassword：密码\nplatform：平台类型（ios,android）', 'FIT', '', '{\n    \"sid\": \"sess_57518a72f26bf\",\n    \"uid\": 34,\n    \"succeed\": 1\n}', '\n', 'driver/signup', 'POST');
INSERT INTO `api_test` VALUES ('7d19ce36-b6f7-46ad-b77d-eecf0e5f3383', null, null, '0', '用户端-登录注册-忘记密码', 'mobile=15866668888&verify_code=999999&new_password=111111&language=cn', 'mobile	Int	Y	注册手机号. \nverify_code	String	Y	手机验证码\nnew_password	String	Y	新密码\n', 'FIT', '1、接口错误\n2、车主忘记密码是否也调用此接口？\n已修正，车主可以调用\n', '{\n    \"succeed\": 0,\n    \"error_code\": 10015,\n    \"error_desc\": \"还未获取手机验证码\"\n}', '', 'user/resetpassword', 'POST');
INSERT INTO `api_test` VALUES ('7db4d3c7-19d5-47c6-94f6-a1257b086406', null, null, '0', '司机端-接单-接单列表', 'sid=sess_576a7eda299d5&uid=33&language=cn&page=1&page_count=10', 'page	Int	Y	页码\npage_count	Int	Y	每页条数\n\n\n\n\n', 'FIT', '1、目前没有数据？\n2、是指用户呼叫的专车还在等待接单的数据吗？\n-----------\ndriver/mygraborders是抢单列表，用户呼叫专车而且推送给了该司机的还没有被接单的订单', '{\n    \"totalPage\": 0,\n    \"orders\": [],\n    \"succeed\": 1\n}', 'totalPage	Int	Y	总页数\norders	Array	Y	订单list\nid	Int	Y	订单ID\norder_sn	String	Y	订单序列号\nname	String	Y	乘客姓名\nusername	String	Y	乘客用户名\nusermobile	String	Y	乘客手机号\ndeparture_time	String	Y	出发时间\nstart_location	String	Y	出发地\nend_location	String	Y	目的地\nstatus			订单状态\n1：等待接单\n2：已接单\n3：取消订单\n4：开始服务\n5：服务完成\n6：未支付\n7：已支付\nremark	String	Y	备注\namount	String	Y	订单预估金额\norder_time	String	Y	发布订单时间\n\n\n', 'driver/mygraborders', 'POST');
INSERT INTO `api_test` VALUES ('7e4b16b8-7aa1-4a31-ac6c-97f2fb3f1fff', null, null, '0', '用户端-订单-订单评价', 'sid=sess_57623bdb00087&uid=3&order_id=121&content=测试', 'order_id	Int	Y	订单ID\ncontent	String	Y	评价内容', 'FIT', '1、接口错误\n-----\n已修正\n2016-06-15 13:11:38', '{\n    \"succeed\": 1\n}', '', 'order/ordercomment', 'POST');
INSERT INTO `api_test` VALUES ('7fadc06d-f1fd-425f-a453-c5691bd364b7', null, null, '0', '用户端-我的-我的消息', 'sid=sess_575a6808677a1&uid=3&type=1&page=1&page_count=10', 'type	Int	Y	1：系统消息2：订单消息3：个人消息\npage	Int	Y	页码\npage_count	Int	Y	每页条数\n', 'FIT', '没有找到对应的UI，接口返回信息暂不确定！\n-----------\n如果新的UI不做我的消息模块的话，无视此接口 ', '{\n    \"totalPage\": 2,\n    \"messages\": [\n        {\n            \"id\": \"38\",\n            \"type\": \"1\",\n            \"content\": \"test1\",\n            \"time\": \"2016-05-25 10:51:25\"\n        },\n        {\n            \"id\": \"37\",\n            \"type\": \"1\",\n            \"content\": \"test1\",\n            \"time\": \"2016-05-25 10:51:25\"\n        },\n        {\n            \"id\": \"11\",\n            \"type\": \"1\",\n            \"content\": \"test1\",\n            \"time\": \"2016-05-25 10:51:25\"\n        },\n        {\n            \"id\": \"10\",\n            \"type\": \"1\",\n            \"content\": \"test1\",\n            \"time\": \"2016-05-25 10:51:25\"\n        },\n        {\n            \"id\": \"9\",\n            \"type\": \"1\",\n            \"content\": \"test1\",\n            \"time\": \"2016-05-25 10:51:25\"\n        },\n        {\n            \"id\": \"8\",\n            \"type\": \"1\",\n            \"content\": \"test1\",\n            \"time\": \"2016-05-25 10:51:25\"\n        },\n        {\n            \"id\": \"7\",\n            \"type\": \"1\",\n            \"content\": \"test1\",\n            \"time\": \"2016-05-25 10:51:25\"\n        },\n        {\n            \"id\": \"6\",\n            \"type\": \"1\",\n            \"content\": \"test1\",\n            \"time\": \"2016-05-25 10:51:25\"\n        },\n        {\n            \"id\": \"5\",\n            \"type\": \"1\",\n            \"content\": \"test1\",\n            \"time\": \"2016-05-25 10:51:25\"\n        },\n        {\n            \"id\": \"4\",\n            \"type\": \"1\",\n            \"content\": \"test1\",\n            \"time\": \"2016-05-25 10:51:25\"\n        }\n    ],\n    \"succeed\": 1\n}', 'totalPage	  Int	Y	总页数\nmessages	Array	Y	消息列表\nid	int	Y	消息ID\ntype	Int	Y	消息类型\n1：系统消息\n2：订单消息\n3：个人消息\ntime	String	Y	消息时间\ncontent	String	Y	消息内容\n', 'user/message', 'POST');
INSERT INTO `api_test` VALUES ('814a1fc4-622b-4517-a36a-2aec56d304f2', null, null, '0', '用户端-立即用车-呼叫专车', 'sid=sess_57602147b1b5f&uid=3&start_lon=106.486654&start_lat=29.490295&end_lon=106.581515&end_lat=29.615467&est_price=29.6', 'start_location	String	Y	起点\nstart_lon	String	Y	起点经度\nstart_lat	String	Y	起点纬度\nend_location	String	Y	终点\nend_lon	String	Y	终点经度\nend_lat	String	Y	终点纬度\ncar_model	Int	Y	车型ID (不传或传空就搜索所有车辆)\nstart_time	String	Y	预计出发时间\nest_price	String	Y	预估价格\nremark	String	N	备注\n\n\n', 'FIT', '', '{\n    \"order_id\": 300,\n    \"succeed\": 1\n}', 'order_id	Int	Y	订单ID\n', 'scar/callscar', 'POST');
INSERT INTO `api_test` VALUES ('8cfbe1d2-ea6a-4af8-959e-cc1210362b94', null, null, '0', '司机端-登录注册-车主资料(添加/修改)', 'sid=sess_5760e8a77160e&uid=33&language=cn&name=snow&identity_card=485458545878545854&driving_age=7&address=shanghai&gender=0&age=28&birthday=1990-10-12&nickname=测试', 'name	Int	N	姓名. \nidentity_card	String	N	身份证\ndriving_age	Int	N	驾龄\naddress	String	N	联系地址\ngender	Int	N	性别0：男1：女\nage	Int	N	年龄\n', 'FIT', '1、昵称字段不详？\n---\nnickname是昵称，最新的API接口文档已经有了', '{\n    \"succeed\": 1\n}', '', 'driver/updatedriver', 'POST');
INSERT INTO `api_test` VALUES ('94a51657-fc21-4003-b2c5-2b1a2775396f', null, null, '0', '用户端-预定巴士-巴士评价获取', 'sid=sess_576a92ba3dce6&uid=3&bus_id=49&page=1&page_count=10', 'bus_id	Int	Y	订单ID\ncontent	String	Y	评价内容\n', 'FIT', '1、是否缺少评论人头像？\n----\n返回数据已添加头像字段2016-06-22 18:29:47', '{\n    \"totalPage\": 2,\n    \"comments\": [\n        {\n            \"id\": \"43\",\n            \"content\": \"bbbbb\",\n            \"time\": \"2016-06-22 21:37:32\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"s_user_avatar\": \"\"\n        },\n        {\n            \"id\": \"42\",\n            \"content\": \"bbbbb\",\n            \"time\": \"2016-06-22 14:33:30\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"s_user_avatar\": \"\"\n        },\n        {\n            \"id\": \"41\",\n            \"content\": \"?????\",\n            \"time\": \"2016-06-22 14:28:51\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"s_user_avatar\": \"\"\n        },\n        {\n            \"id\": \"40\",\n            \"content\": \"?????\",\n            \"time\": \"2016-06-22 14:28:39\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"s_user_avatar\": \"\"\n        },\n        {\n            \"id\": \"39\",\n            \"content\": \"?????????\",\n            \"time\": \"2016-06-22 14:26:42\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"s_user_avatar\": \"\"\n        },\n        {\n            \"id\": \"38\",\n            \"content\": \"?????????\",\n            \"time\": \"2016-06-22 14:23:27\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"s_user_avatar\": \"\"\n        },\n        {\n            \"id\": \"37\",\n            \"content\": \"?????????\",\n            \"time\": \"2016-06-22 14:20:03\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"s_user_avatar\": \"\"\n        },\n        {\n            \"id\": \"36\",\n            \"content\": \"?????????\",\n            \"time\": \"2016-06-22 14:17:31\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"s_user_avatar\": \"\"\n        },\n        {\n            \"id\": \"35\",\n            \"content\": \"?????????111\",\n            \"time\": \"2016-06-22 14:15:44\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"s_user_avatar\": \"\"\n        },\n        {\n            \"id\": \"34\",\n            \"content\": \"?????????111\",\n            \"time\": \"2016-06-22 14:12:04\",\n            \"s_user_mobile\": \"15866668888\",\n            \"s_user_name\": \"\",\n            \"s_user_avatar\": \"\"\n        }\n    ],\n    \"succeed\": 1\n}', 'totalPage	Int	Y	总页数\ncomments	Array	Y	评价列表\nId	Int	Y	评价id\ntime	String	Y	评价时间\ncontent	String	Y	评价内容\ns_user_mobile	String	Y	评论人手机号\ns_user_name	String	Y	评论人用户名\ns_user_avatar	String	Y	评论人头像\n', 'bus/getbuscomment', 'POST');
INSERT INTO `api_test` VALUES ('97058f51-178b-4f5b-b9aa-50a37d73e26f', null, null, '0', '用户端-预定巴士-巴士列表', 'page=1&page_count=10', 'start_location	String	N	起点\nend_location	String	N	终点\ndate	String	N	日期\npage	Int	Y	页码\npage_count	Int	Y	每页条数\n\n', 'FIT', '', '{\n    \"totalPage\": 1,\n    \"buses\": [\n        {\n            \"id\": \"49\",\n            \"plate\": \"沪AAACCC\",\n            \"car_model\": \"10\",\n            \"photo\": \"/travel/public/uploadFile/carphoto/49_photo.jpg\",\n            \"brief\": \"简介简介简介简介简介简介简介简介简介简介简介简介\"\n        }\n    ],\n    \"succeed\": 1\n}', '\ntotalPage	Int	Y	总页数\nbuses	Array	Y	巴士列表\nid	Int	Y	巴士ID\nplate	String	Y	车牌\ncar_model	Int	Y	车型ID\nphoto	String	Y	照片URL\nbrief	String	Y	简介\n', 'bus/buslist', 'POST');
INSERT INTO `api_test` VALUES ('9d70723d-baad-432e-b18c-ed7f1f549531', null, null, '0', '用户端-预定巴士-巴士评价获取', 'sid=sess_57602147b1b5f&uid=3&bus_id=49&page=1&page_count=10', 'bus_id	Int	Y	订单ID\ncontent	String	Y	评价内容\n', 'FIT', '', '{\n    \"succeed\": 0,\n    \"error_code\": 1,\n    \"error_desc\": \"授权过期\"\n}', '\n', 'order/getordercomment', 'POST');
INSERT INTO `api_test` VALUES ('a08604f1-da5c-4793-9394-f9750645cc0a', null, null, '0', '司机端-登录注册-登录', 'mobile=13917651089&password=111111&platform=android', 'mobile:注册手机号.\npassword：密码\nplatform：平台类型（ios,android）', 'FIT', '', '{\n    \"sid\": \"sess_576a984071d7f\",\n    \"user\": {\n        \"id\": \"33\",\n        \"user_group\": \"2\",\n        \"name\": \"李三\",\n        \"identity_card\": \"485458545878545854\",\n        \"mobile\": \"13917651089\",\n        \"driving_age\": \"5\",\n        \"address\": \"上海市闵行区\",\n        \"gender\": \"1\",\n        \"age\": \"27\",\n        \"birthday\": \"1985-10-10\",\n        \"avatar\": \"\",\n        \"identity_card_front\": \"\",\n        \"identity_card_back\": \"\",\n        \"driver_license_front\": \"\",\n        \"status\": \"2\",\n        \"reson\": \"\",\n        \"joined_at\": \"2016-05-26 13:36:00\"\n    },\n    \"succeed\": 1\n}', 'sid	String	Y	SessonId（TOKEN）\nuser	Array	Y	车主信息\nid	Int	Y	用户ID\nuser_group	Int	Y	用户角色\n1：普通用户\n2：专车车主\nname	String	Y	姓名\nidentity_card	String	Y	身份证\nmobile	String	Y	手机号\ndriving_age	Int	Y	驾龄\naddress	String	Y	联系地址\ngender	Int	Y	性别\n0：男\n1：女\nage	Int	Y	年龄\navatar	String	Y	头像URL\nidentity_card_front	String	Y	身份证正面照\nidentity_card_back	String	Y	身份证反面照\ndriver_license_front	String	Y	驾驶证正面照\nstatus	Int	Y	审核状态\n1：待审核\n2：审核通过\n3：审核不通过\nreson	String	Y	审核原因\njoined_at	String	Y	注册时间\n', 'driver/signin', 'POST');
INSERT INTO `api_test` VALUES ('a43bbee8-d12a-4cba-86dc-b22830d9cbbc', null, null, '0', '司机端-我的-当天订单统计', 'sid=sess_575cfdeb2c2cf&uid=34&language=cn', '\n', 'FIT', 'UI上有今日车费，无返回？\n返回已加上todayfare今日车费', '{\n    \"all_count\": 0,\n    \"unfinish_count\": 0,\n    \"finish_count\": \"0\",\n    \"todayfare\": \"0\",\n    \"succeed\": 1\n}', 'all_count	Int	Y	当天订单总数量\nunfinish_count	Int	Y	待服务订单数量\nfinish_count	Int	Y	已服务订单数量\n', 'driver/thatdaystatistical', 'POST');
INSERT INTO `api_test` VALUES ('a5cb48a2-dd5c-478e-a568-2c0f972ae0f4', null, null, '0', '通用-广告列表获取', 'type=1', 'type	Int	Y	广告类型\n1：首页顶部广告\n2：旅游攻略页顶部广告\n', 'FIT', '', '{\n    \"banners\": [\n        {\n            \"id\": \"9\",\n            \"cover\": \"/travel/public/uploadFile/adsbanner/82b95e88e33f1ea3197b8f741d7682e05760b21b07ee1.jpg\",\n            \"title\": \"2222222\",\n            \"link_url\": \"\"\n        },\n        {\n            \"id\": \"8\",\n            \"cover\": \"/travel/public/uploadFile/adsbanner/c5007b52d1fc0a9d3668e7b00cde9d6f5760b09027868.jpg\",\n            \"title\": \"123\",\n            \"link_url\": \"123\"\n        },\n        {\n            \"id\": \"7\",\n            \"cover\": \"/travel/public/uploadFile/adsbanner/82d49eeb7d61fa92a26b528f2dd521ea575e4dd890349.jpg\",\n            \"title\": \"344545\",\n            \"link_url\": \"\"\n        },\n        {\n            \"id\": \"5\",\n            \"cover\": \"/travel/public/uploadFile/adsbanner/ac12e775772c8ef1f16371ab0fee3fbf575e4aff5d7ec.jpg\",\n            \"title\": \"12345\",\n            \"link_url\": \"\"\n        },\n        {\n            \"id\": \"4\",\n            \"cover\": \"/travel/public/uploadFile/adsbanner/d9aa3e1045aaa5a37d79b7eea78be38e575e44cf1e5b6.jpg\",\n            \"title\": \"上海欢乐谷\",\n            \"link_url\": \"\"\n        }\n    ],\n    \"succeed\": 1\n}', 'banners	Array	Y	广告列表\nid	int	Y	ID\ncover	String	Y	封面图URL\ntitle	String	Y	标题\nlink_url	String	Y	链接地址\n（如为空，点击显示内容，9.9获取广告详情）\n\n\n', 'system/getbanners', 'POST');
INSERT INTO `api_test` VALUES ('a77b01e4-29d1-433e-8860-5450080e82f6', null, null, '0', '用户端-立即用车-附近专车位置查询', 'sid=sess_57602147b1b5f&uid=3&start_lon=106.486654&start_lat=29.490295', 'start_location	String	Y	起点\nstart_lon	String	Y	起点经度\nstart_lat	String	Y	起点纬度\n', 'FIT', '', '{\n    \"scars\": [\n        {\n            \"user_id\": \"33\",\n            \"lon\": \"106.43504074066\",\n            \"lat\": \"29.44536880139\"\n        },\n        {\n            \"user_id\": \"11\",\n            \"lon\": \"106.45504074066\",\n            \"lat\": \"29.44536880139\"\n        },\n        {\n            \"user_id\": \"10\",\n            \"lon\": \"106.43504074066\",\n            \"lat\": \"29.44536880139\"\n        },\n        {\n            \"user_id\": \"9\",\n            \"lon\": \"106.53826725934\",\n            \"lat\": \"29.53522119861\"\n        }\n    ],\n    \"succeed\": 1\n}', '\n', 'scar/nearbyscar', 'POST');
INSERT INTO `api_test` VALUES ('aae7a445-a38d-41f8-9dfc-0753ce3f820e', null, null, '1', '用户端-我的-待评价', 'sid=sess_5769487c8f37b&uid=3&type=1&page=2&page_count=10', 'type	Int	Y	1：专车实时订单 2：BUS订单\npage	Int	Y	页码\npage_count	Int	Y	每页条数', 'FIT', '1、待评价不分类型,能不能不传type查所有？\n-----------------------\n是否也像我的订单里面弄两个tab显示呢？ 专车订单和巴士订单的有些信息是从不同的表中查询出来的，合在一起就无法分页了。2016-06-22 19:05:55', '{\n    \"totalPage\": 0,\n    \"orders\": [],\n    \"succeed\": 1\n}', 'totalPage	Int	Y	总页数\norders	Array	Y	订单list\nid	Int	Y	订单ID\norder_sn	String	Y	订单序列号\npay_sn	String	Y	支付流水号\npeople_count	Int	Y	预定人数（巴士订单）\ndeparture_time	String	Y	出发时间\nplate	String	Y	车牌\nstart_location	String	Y	出发地\nend_location	String	Y	目的地\nstatus			订单状态\n1：等待接单\n2：已接单\n3：取消订单\n4：开始服务\n5：服务完成\n6：未支付\n7：已支付\ntype	Int	Y	订单类型\n1：专车实时订单\n2：BUS订单\namount	String	Y	订单金额\nis_comment	Int	Y	是否已经评论\n0：未评论\n1：已评论\norder_time	String	Y	订单时间\n\n', 'order/nocommentorders', 'POST');
INSERT INTO `api_test` VALUES ('ac04e24b-2f66-4930-b4d4-03f1f9505b78', null, null, '0', '【通用】自定义市场接口', 'area=100&name=南昌菜市场&tokenId=1D96DACB84F21890ED9F4928FA8B352B', '', 'FM', '', '传入接口地址或参数有误！', '', 'api/apiFmMarketController/add', 'POST');
INSERT INTO `api_test` VALUES ('b22f11a4-2cf7-4531-94ab-2fa6e468563d', null, null, '0', '2016-06-22-问题列表(Android)', '', '', 'FIT', '', '', '问题写在此处（写完点击下方保存按钮即可）：', '2016-06-22-问题列表(Android)', 'POST');
INSERT INTO `api_test` VALUES ('b83125b0-0d07-4497-a315-25c0149cea3a', null, null, '0', '司机端-接单-订单位置更新', 'sid=sess_576a37d19d762&uid=33&language=cn&order_id=290&lon=122.356341&lat=35.928712', 'order_id	Int	Y	订单ID\nlon	String	Y	经度\nlat	String	Y	纬度\n\n\n', 'FIT', '说明：\n1、司机开始服务开始调用，结束服务停止调用，开始和结束的时候必须更新一次\n2、根据需要可以设置5秒至10秒内更新一次', '{\n    \"succeed\": 1\n}', '\n', 'order/updateorderlocation', 'POST');
INSERT INTO `api_test` VALUES ('be3dcc33-9803-48f2-8850-4a94cad8a28a', null, null, '0', '用户端-登录注册-登录', 'mobile=15866668888&type=1&password=111111&platform=android', 'mobile:注册手机号. (type=1时必须)\nusername：用户名(type=2、3、4时必须)\npassword：密码(type=1时必须)\ntype：用户类型1：手机号；2：QQ；3：微信；4：微博\nplatform：平台类型（ios,android）', 'FIT', '', '{\n    \"sid\": \"sess_576a9818d131b\",\n    \"user\": {\n        \"id\": \"3\",\n        \"user_group\": \"1\",\n        \"nickname\": \"小五\",\n        \"email\": \"test999@163.com\",\n        \"mobile\": \"15866668888\",\n        \"username\": \"\",\n        \"name\": \"张莉\",\n        \"gender\": \"1\",\n        \"age\": \"28\",\n        \"birthday\": \"1990-10-12\",\n        \"avatar\": \"/public//uploadFile/avatar/empty.png\",\n        \"joined_at\": \"2016-05-03 10:15:53\"\n    },\n    \"succeed\": 1\n}', 'sid	SessonId（TOKEN）\nuser	用户信息\nid	用户ID\nuser_group	用户角色1：普通用户；2：专车车主\nnickname	昵称\nemail	邮箱\nmobile	手机号\nname	姓名\ngender	性别0：男；1：女\nage	年龄\navatar	头像URL\njoined_at	注册时间\n', 'user/signin', 'POST');
INSERT INTO `api_test` VALUES ('c0ad9cb4-d3f8-4ecd-8e9e-7517937b714e', null, null, '0', '司机端-登录注册-车辆资料(添加/修改)', 'sid=sess_57518e1d54ddd&uid=34&language=cn&city=12&plate=A88888&manned_number=5&car_brands=1&car_model=6', '', 'FIT', '', '{\n    \"succeed\": 1\n}', '', 'driver/updatedrivercar', 'POST');
INSERT INTO `api_test` VALUES ('c77fda78-8f9a-4854-9999-9cf51763c729', null, null, '0', '司机端-我的-收入统计', 'sid=sess_57543fea30eb5&uid=34&language=cn&date=201605', 'date	String	Y	年月（YYYYMM）', 'FIT', '此接口对应UI哪部分？\n-------\n这个是对应老的UI的我的账单，现在写了一个新的接口我的账单driver/mybills\n2016-06-13 16:42:48', '{\n    \"order_count\": \"0\",\n    \"amount\": null,\n    \"succeed\": 1\n}', '\norder_count	Int	N	订单数量\namount	String	N	总金额\n', 'driver/incomestatistical', 'POST');
INSERT INTO `api_test` VALUES ('cf5e755b-5424-4595-95e1-4438e7bcb5b2', null, null, '1', '司机端-我的-我的钱包-银行卡列表', 'sid=sess_576a92b2f2c60&uid=33&language=cn', '\n\n\n\n\n', 'FIT', '1、接口错误', '{\n    \"succeed\": 0,\n    \"error_code\": 500,\n    \"error_desc\": \"服务器内部错误\"\n}', 'cards	Array	Y	银行卡列表\nid	Int	Y	银行卡ID\ncard_number	String	Y	卡号/支付宝号/微信号等\ncard_user	String	Y	持卡人姓名\nbank_name	String	Y	银行名称\nremark	String	Y	备注\n\n\n\n\n', 'driver/mybankcard', 'POST');
INSERT INTO `api_test` VALUES ('d54c9db1-2cee-4642-a6f7-ebda00c94002', null, null, '0', '用户端-立即用车-专车预估价格查询', 'sid=sess_57602147b1b5f&uid=3&start_lon=106.486654&start_lat=29.490295&end_lon=106.581515&end_lat=29.615467', 'start_lon	String	Y	起点经度\nstart_lat	String	Y	起点纬度\nend_lon	String	Y	终点经度\nend_lat	String	Y	终点纬度\n\n', 'FIT', '', '{\n    \"est_price\": 82.9,\n    \"distance\": 23688,\n    \"succeed\": 1\n}', 'est_price	String	Y	预估价格\ndistance	String	Y	距离（米）\n\n', 'scar/scarestprice', 'POST');
INSERT INTO `api_test` VALUES ('d6fbce16-3616-44de-a847-801bc0c242a7', null, null, '0', '司机端-我的-我的钱包', 'sid=sess_576a7eda299d5&uid=33&language=cn', '\n\n\n\n\n', 'FIT', '1、是否可以将null处理为数值0.00？\n-----------\n已修正 2016-06-22 18:19:32', '{\n    \"pending_withdraw\": 0,\n    \"succeed_withdraw\": 0,\n    \"balance\": \"0.00\",\n    \"total_revenue\": 0,\n    \"succeed\": 1\n}', 'pending_withdraw	String	Y	处理中的提现金额（即将到账）\nsucceed_withdraw	String	Y	提现成功的金额（已提现）\nbalance	String	Y	账户余额\ntotal_revenue	String	Y	总收入\n\n\n\n', 'driver/mywallet', 'POST');
INSERT INTO `api_test` VALUES ('d77cf3d3-2a09-47c6-b824-ecee2830c4e0', null, null, '0', '用户端-预定巴士-巴士详情', 'bus_id=49', 'bus_id	String	N	巴士ID', 'FIT', '和UI设计对比缺数据\n------------\nUI的车辆页下面显示introduce车辆介绍就行了，车辆介绍是富文本\n', '{\n    \"bus\": {\n        \"id\": \"49\",\n        \"plate\": \"沪AAACCC\",\n        \"car_model\": \"10\",\n        \"photo\": \"/travel/public/uploadFile/carphoto/49_photo.jpg\",\n        \"brief\": \"简介简介简介简介简介简介简介简介简介简介简介简介\",\n        \"introduce\": \"<p>12312321</p>\"\n    },\n    \"succeed\": 1\n}', 'bus	Array	Y	巴士详情\nid	Int	Y	巴士ID\nplate	String	Y	车牌\ncar_model	Int	Y	车型ID\nphoto	String	Y	照片URL\nbrief	String	Y	简介\nintroduce	String	Y	车辆介绍\n\n', 'bus/businfo', 'POST');
INSERT INTO `api_test` VALUES ('dc4fd1ee-0aa5-4a81-b377-7584457dd0ed', null, null, '0', '通用-文案查询', 'key=NEW_USER_WELFARE', 'key	String	Y	文案KEY. ', 'FIT', 'key具体有哪些？\n----------\n目前有\nWANT_TO_COOPERATE	我要合作\nFIT_NOTICE	FIT区服务须知\nDRIVER_WELFARE	司机福利\nDRIVER_SIGN_NOTICE	同意\"服务条款\"和\"网络隐私保护权利\"\n\n可以登录travel.1000ding.net后台管理里查看和添加新的key', '{\n    \"title\": \"新会员福利\",\n    \"content\": \"<p>新会员福利</p><p><br/></p><p>新会员可以领取优惠券。</p><p><br/></p>\",\n    \"succeed\": 1\n}', 'title	String	Y	标题\ncontent	String	Y	内容\n', 'system/getarticle', 'POST');
INSERT INTO `api_test` VALUES ('deb9cf89-f2fe-482a-8eb9-ffe5387c864d', null, null, '0', '用户端-首页-旅游攻略查询', 'page=1&page_count=10', 'key	String	Y	文案KEY. ', 'FIT', '', '{\n    \"totalPage\": 1,\n    \"guides\": [\n        {\n            \"id\": \"14\",\n            \"cover\": \"/travel/public/uploadFile/guides/e26a7817867ad5bff8930ec0c87ad33e57554e49e7fcd.jpg\",\n            \"title\": \"123213\",\n            \"time\": \"2016-06-06 17:51:46\"\n        }\n    ],\n    \"succeed\": 1\n}', 'totalPage	Int	Y	总页数\nguides	Array	Y	旅游攻略列表\nid	int	Y	ID\ncover	String	Y	封面图URL\ntitle	String	Y	标题\ntime	String	Y	时间\n\n', 'system/getguides', 'POST');
INSERT INTO `api_test` VALUES ('e1c4cd8f-05e4-44fd-bdc4-65035f651ca7', null, null, '1', '2016-06-22-问题列表', '', '', 'FIT', '', '{\n    \"succeed\": 0,\n    \"error_code\": 404,\n    \"error_desc\": \"服务器内部错误\"\n}', '1、司机端注册缺热门城市接口？\n2、用户端修改性别gender=0，修改后gender值还是1\n\n===============\n1、司机端注册缺热门城市接口？ 就是system/getdomain的CITY 类型\n2、已修正，（司机端和用户端）\n2016-06-22 18:19:40\n\n==============\n追问问题1、UI上有热门和其他城市之分', '2016-06-22-问题列表', 'POST');
INSERT INTO `api_test` VALUES ('e3d3b48b-02d2-4d56-9808-98b828b784ab', null, null, '0', '司机端-我的-我的钱包-提现记录', 'sid=sess_576a4a8f42c1f&uid=33&language=cn&page=1&page_count=10', 'page	Int	Y	页码\npage_count	Int	Y	每页条数\n\n\n\n\n\n\n', 'FIT', '', '{\n    \"totalPage\": 0,\n    \"withdraws\": [],\n    \"succeed\": 1\n}', 'totalPage	Int	Y	总页数\nwithdraws	Array	Y	提现记录列表\nid	Int	Y	ID\namount	String	Y	提现金额\nstatus	Int	Y	状态\n1：处理中\n2：提现成功\n3：提现失败\nremark	String	Y	备注/提现失败原因\nprocess_time	String	Y	提现受理时间\napply_time	String	Y	申请提现时间\ncard_number	String	Y	银行卡号/支付宝号/微信号等\ncard_user	String	Y	持卡人姓名\nbank_name	String	Y	银行名称\nname	String	Y	提现人姓名\nmobile	String	Y	提现人电话\n\n\n\n\n', 'driver/mywithdraws', 'POST');
INSERT INTO `api_test` VALUES ('e5c61aa8-d4c3-41ab-95a7-6d6f79c4f49a', null, null, '0', '用户端-预定巴士-收藏取消', 'sid=sess_576a92ba3dce6&uid=3&car_id=1', 'car_id	Int	Y	车辆ID', 'FIT', '如果找不到该用户收藏表中该car_id的搜藏，就会出现服务器内部错误，\n现在改成如果找不到直接返回code=-1\n2016-06-22 18:33:29', '{\n    \"succeed\": 1\n}', '\n', 'user/deletefavoritebycarid', 'POST');
INSERT INTO `api_test` VALUES ('e7d71b2d-981a-49a9-b447-305ba14525db', null, null, '0', '用户端-订单-订单详情(司机端)', 'sid=sess_576000e6accc8&uid=3&order_id=211', 'order_id	Int	Y	订单ID\n', 'FIT', '说明：用户端订单详情、司机端订单详情、司机端接单详情皆调用此接口\n\n1、文档返回描述错误\n2、信息不全（如乘客信息等）\n--------\n返回信息增加乘客信息\n2016-06-12 14:46:47', '{\n    \"order\": {\n        \"id\": \"211\",\n        \"order_sn\": \"2016052012030017\",\n        \"pay_sn\": \"SN_UW8278193672690\",\n        \"name\": \"张莉\",\n        \"username\": \"\",\n        \"usermobile\": \"15866668888\",\n        \"start_location\": \"test1\",\n        \"end_location\": \"test2\",\n        \"departure_time\": \"\",\n        \"car_model\": \"\",\n        \"plate\": \"\",\n        \"status\": \"3\",\n        \"type\": \"1\",\n        \"amount\": \"21.00\",\n        \"order_time\": \"2016-05-20 13:24:31\"\n    },\n    \"succeed\": 1\n}', 'order	Array	Y	订单list\nid	Int	Y	订单ID\norder_sn	String	Y	订单序列号\npay_sn	String	Y	支付流水号\nname	String	Y	姓名\nusername	String	Y	用户名\nusermobile	String	Y	手机号\nadult_count	Int	Y	成人人数（巴士订单）\nchild_count	Int	Y	儿童人数（巴士订单）\ndeparture_time	String	Y	出发时间\nstart_location	String	Y	起点\nend_location	String	Y	终点\ncar_model	String	Y	车型\nplate	String	Y	车牌\nstatus			订单状态\n1：等待接单\n2：已接单\n3：取消订单\n4：开始服务\n5：服务完成\n6：未支付\n7：已支付\ntype	Int	Y	订单类型\n1：专车实时订单\n2：BUS订单\namount	String	Y	订单金额\norder_time	String	Y	订单时间\n', 'order/orderinfo', 'POST');
INSERT INTO `api_test` VALUES ('ebaa617e-6aef-420d-86e8-7eb79765e2a0', null, null, '0', '司机端-我的-在线状态更新', 'sid=sess_57543fea30eb5&uid=34&language=cn&status=1', 'status	1：在线 2：离线\n', 'FIT', 'UI暂无设置状态？\n-------------\n新的UI没有设定状态，可以无视此接口', '{\n    \"succeed\": 1\n}', '\n', 'driver/onoffline', 'POST');
INSERT INTO `api_test` VALUES ('ec5bb99b-baac-419d-a975-9d5a295d0d30', null, null, '0', '用户端-预定巴士-巴士评价', 'sid=sess_576a92ba3dce6&uid=3&bus_id=49&content=bbbbb', 'bus_id	Int	Y	订单ID\ncontent	String	Y	评价内容\n', 'FIT', '1、评论不需要授权吗？\n-----\n需要，已修正 2016-06-22 18:26:58', '{\n    \"succeed\": 1\n}', '\n', 'bus/buscomment', 'POST');
INSERT INTO `api_test` VALUES ('ed11abf2-d4f0-414f-8b36-fcfe4dbc9057', null, null, '0', '司机端-接单-订单实时价格', 'sid=sess_576a37d19d762&uid=33&language=cn&order_id=290', 'order_id	Int	Y	订单ID\n\n\n\n', 'FIT', '说明：结束服务前调用获取实时价格，此接口结束服务后不可调用', '{\n    \"realtime_price\": 495.2,\n    \"distance\": 90039,\n    \"succeed\": 1\n}', 'realtime_price	String	Y	实时价格\ndistance	String	Y	距离（米）\n\n', 'order/realtimeprice', 'POST');
INSERT INTO `api_test` VALUES ('f05df9ad-9e94-4330-b221-a8632ad30332', null, null, '0', '司机端-我的-我的账单', 'sid=sess_575ff7737808d&uid=33&language=cn&type=4&date=2016-05-20', 'type 类型1：所有账单2：年度账单3：月度账单4：日账单\ndate	日期type=1：不传或空 type=2：YYYY type=3：YYYY-MM type=4：YYYY-MM-DD\n', 'FIT', '', '{\n    \"bills\": [\n        {\n            \"id\": \"214\",\n            \"order_sn\": \"2016052012030020\",\n            \"pay_sn\": \"SN_UW8278193672693\",\n            \"user_avatar\": \"\",\n            \"name\": \"李小莉\",\n            \"username\": \"admin\",\n            \"usermobile\": \"13985458745\",\n            \"start_location\": \"test1\",\n            \"end_location\": \"test2\",\n            \"amount\": \"21.00\",\n            \"accept_time\": \"2016-05-20 13:24:31\"\n        }\n    ],\n    \"succeed\": 1\n}', 'bills	Array	Y	账单\nyear	String	Y	年份（type=1时）\nmonth	String	Y	月份（type=2时）\nday	String	Y	日（type=3时）\namounts	String	Y	总金额（type=1、2、3时）\nid	Int	Y	订单ID（type=4时）\norder_sn	String	Y	订单序列号（type=4时）\npay_sn	String	Y	支付流水号（type=4时）\nuser_avatar	String	Y	乘客头像（type=4时）\nname	String	Y	乘客姓名（type=4时）\nusername	String	Y	乘客用户名（type=4时）\nusermobile	String	Y	乘客手机号（type=4时）\nstart_location	String	Y	出发地（type=4时）\nend_location	String	Y	目的地（type=4时）\namount	String	Y	订单金额（type=4时）\naccept_time	String	Y	接单时间（type=4时）\n', 'driver/mybills', 'POST');
INSERT INTO `api_test` VALUES ('f5e9007f-b7ff-473e-88f7-205403c07439', null, null, '0', '1-原型地址', '', '', 'FIT', '', '', '用户端：\nhttps://modao.cc/app/64daaab074b266e3c0ad1bd68914695893644bea\n\n\n司机端：\nhttps://modao.cc/app/8099b42041df4fc6188514f11e2c7d54ac12933d', '1-原型地址', 'POST');
INSERT INTO `api_test` VALUES ('f97ea691-d614-477d-a586-ce163eb5ea60', null, null, '0', '用户端-预定巴士-收藏取消（废弃）', 'sid=sess_57600232df342&uid=3&id=5', 'id	Int	Y	收藏ID', 'FIT', '1、取消收藏参数应该也是对应的车辆ID（巴士ID），否则在巴士详情页无法取消收藏\n----\n增加了一个新的接口user/deletefavoritebycarid，原来的保留\n2016-06-15 13:30:26', '{\n    \"succeed\": 1\n}', '\n', 'user/deletefavorite', 'POST');
INSERT INTO `api_test` VALUES ('fd76a48d-7795-436c-819d-70d0a105e945', null, null, '0', '用户端-我的-FIT中心', 'sid=sess_575d83f58e58f&uid=3&language=cn', '', 'FIT', '', '{\n    \"fits\": [\n        {\n            \"timepoint\": \"2016-06-07 20:02:24\",\n            \"num\": \"A001\",\n            \"time\": 7428,\n            \"fit_name\": \"上海南站FIT中心\"\n        },\n        {\n            \"timepoint\": \"2016-06-07 20:02:07\",\n            \"num\": \"A003\",\n            \"time\": 7428,\n            \"fit_name\": \"上海南站FIT中心\"\n        }\n    ],\n    \"succeed\": 1\n}', 'timepoint	String	Y	寄存时间点\nnum	String	Y	寄存号码\ntime	String	Y	寄存时间\nfit_name	String	Y	FIT中心名称\n', 'user/fitcenter', 'POST');
INSERT INTO `api_test` VALUES ('fd88ba63-f543-4409-a657-33903d489157', null, null, '0', '司机端-接单-更新订单状态(用户端)', 'sid=sess_576a37d19d762&uid=33&language=cn&order_id=290&status=5', 'order_id	Int	Y	订单ID\nstatus	Int	Y	2：已接单\n3：取消订单\n4：开始服务\n5：服务完成（待支付）\n\n', 'FIT', '说明：用户端的取消订单也调用此接口\n', '{\n    \"succeed\": 1\n}', '\n', 'order/updateorderstatus', 'POST');
INSERT INTO `api_test` VALUES ('fdd6a654-7e74-44b6-89e0-94b1c17f545e', null, null, '0', '用户端-首页-旅游攻略详情', 'guide_id=14', 'guide_id	Int	Y	旅游攻略ID', 'FIT', '', '{\n    \"guide\": {\n        \"id\": \"14\",\n        \"cover\": \"/travel/public/uploadFile/guides/e26a7817867ad5bff8930ec0c87ad33e57554e49e7fcd.jpg\",\n        \"title\": \"123213\",\n        \"content\": \"<p>123123</p>\",\n        \"time\": \"2016-06-06 17:51:46\"\n    },\n    \"succeed\": 1\n}', 'guide	Array	Y	旅游攻略详情\nid	int	Y	ID\ncover	String	Y	封面图URL\ntitle	String	Y	标题\ncontent	String	Y	内容\ntime	String	Y	时间\n\n\n', 'system/guideinfo', 'POST');
INSERT INTO `api_test` VALUES ('fe793a36-c6d0-456c-98cd-7386d2407fab', null, null, '0', '用户端-我的-二维码生成', 'sid=sess_575d83f58e58f&uid=3&language=cn', '', 'FIT', '', '{\n    \"qrurl\": \"/public/storage/qrcode/3_qrcode.png\",\n    \"succeed\": 1\n}', 'qrurl	String	Y	二维码URL', 'user/qrcode', 'POST');
INSERT INTO `api_test` VALUES ('ffa0df94-81ba-4ebe-a11a-7c2f081e107b', null, null, '0', '司机端-登录注册-退出', 'sid=sess_57518c1e559ad&uid=34', '', 'FIT', '', '{\n    \"succeed\": 1\n}', '', 'driver/signout', 'POST');

-- ----------------------------
-- Table structure for tbasedata
-- ----------------------------
DROP TABLE IF EXISTS `tbasedata`;
CREATE TABLE `tbasedata` (
  `id` varchar(32) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `basetype_code` varchar(2) NOT NULL,
  `icon` longtext,
  PRIMARY KEY (`id`),
  KEY `FK_2olwoajkvhsgxrdsrbnua811r` (`basetype_code`),
  CONSTRAINT `FK_2olwoajkvhsgxrdsrbnua811r` FOREIGN KEY (`basetype_code`) REFERENCES `tbasetype` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbasedata
-- ----------------------------
INSERT INTO `tbasedata` VALUES ('EX0001', '全局系统异常提示', '系统繁忙！', null, '1', 'EX', null);
INSERT INTO `tbasedata` VALUES ('FIT', '自由行FIT项目服务器接口api', 'http://travel.1000ding.net/public/api/', '', '100', 'AP', 'uploadfiles/basedata/AP/FIT_jgOy1466603369598.docx');
INSERT INTO `tbasedata` VALUES ('FM', '', 'http://114.55.59.141:8080/farming/', '', '100', 'AP', null);
INSERT INTO `tbasedata` VALUES ('IM010', '以下图片配置不可以随便删除，只能修改', '首页背景图片', '', '100', 'IM', 'uploadfiles/basedata/IM/IM010_OdSv1452778637624.jpg');
INSERT INTO `tbasedata` VALUES ('IM020', '', '案例背景图片', '', '100', 'IM', 'uploadfiles/basedata/IM/IM020_KkdG1452778662578.jpg');
INSERT INTO `tbasedata` VALUES ('IM030', '该项已废弃，合作客户、关于我们、合作伙伴、联系我们图片配置请在菜单配置（一级菜单）中上传。', '其他背景图片', '', '100', 'IM', 'uploadfiles/basedata/IM/IM030_CUcM1452778683062.jpg');
INSERT INTO `tbasedata` VALUES ('IM040', '', '案例快捷广告栏', '', '100', 'IM', 'uploadfiles/basedata/IM/IM040_Eb1f1452778703875.jpg');
INSERT INTO `tbasedata` VALUES ('IM050', '', '莫辩logo', '', '100', 'IM', 'uploadfiles/basedata/IM/IM050_H0pB1452778736266.png');
INSERT INTO `tbasedata` VALUES ('MU100', '{url:\"websiteController/showMenu?type=1\",status:1}', '经典案例', '', '100', 'MU', null);
INSERT INTO `tbasedata` VALUES ('MU110', '{name_en:\"APP DESIGN\",name_zh:\"APP设计\"}', 'APP设计', 'MU100', '110', 'MU', 'uploadfiles/basedata/MU/MU110_4Bw81452778807080.png');
INSERT INTO `tbasedata` VALUES ('MU120', '{name_en:\"WeChat\",name_zh:\"微信开发\",status:1}', '微信开发', 'MU100', '120', 'MU', 'uploadfiles/basedata/MU/MU120_sHUo1452778815345.png');
INSERT INTO `tbasedata` VALUES ('MU130', '{name_en:\"Software\",name_zh:\"软件定制\",status:1}', '软件定制', 'MU100', '130', 'MU', 'uploadfiles/basedata/MU/MU130_zqC51452778823392.png');
INSERT INTO `tbasedata` VALUES ('MU140', '{name_en:\"Platform\",name_zh:\"管理平台\",status:1}', '管理平台', 'MU100', '140', 'MU', 'uploadfiles/basedata/MU/MU140_O0Qh1452778860408.png');
INSERT INTO `tbasedata` VALUES ('MU200', '{name_en:\"CLIENT\",name_zh:\"合作客户\",url:\"websiteController/showMenu?type=3\",status:1}', '合作客户', '', '200', 'MU', null);
INSERT INTO `tbasedata` VALUES ('MU210', '', '客户', 'MU200', '210', 'MU', null);
INSERT INTO `tbasedata` VALUES ('MU300', '{name_en:\"About us\",name_zh:\"关于我们\",url:\"websiteController/showMenu?type=3\",status:1}', '关于我们', '', '300', 'MU', 'uploadfiles/basedata/MU/MU300_5Blh1457355443779.jpg');
INSERT INTO `tbasedata` VALUES ('MU310', '', '公司简介', 'MU300', '310', 'MU', null);
INSERT INTO `tbasedata` VALUES ('MU400', '{name_en:\"COOPERATOR\",name_zh:\"合作伙伴\",url:\"websiteController/showMenu?type=3\",status:1}', '合作伙伴', '', '400', 'MU', null);
INSERT INTO `tbasedata` VALUES ('MU410', '', '合作', 'MU400', '410', 'MU', null);
INSERT INTO `tbasedata` VALUES ('MU500', '{url:\"websiteController/showMenu?type=3\",status:1,name_en:\"Contact us\",name_zh:\"联系我们\"}', '联系我们', '', '500', 'MU', null);
INSERT INTO `tbasedata` VALUES ('MU510', '', '联系我们', 'MU500', '510', 'MU', null);
INSERT INTO `tbasedata` VALUES ('MU600', '{url:\"http://wpa.qq.com/msgrd?v=3&uin=1507920406&site=qq&menu=yes\",status:1,target:\"_blank\",extLink:true}', '在线留言', '', '600', 'MU', null);
INSERT INTO `tbasedata` VALUES ('MU610', '', '在线留言', 'MU600', '610', 'MU', null);
INSERT INTO `tbasedata` VALUES ('ST01', '', '上架', '', '100', 'ST', null);
INSERT INTO `tbasedata` VALUES ('ST02', '', '下架', '', '100', 'ST', null);
INSERT INTO `tbasedata` VALUES ('SV001', '系统title', '莫辩科技管理平台', '', '100', 'SV', null);
INSERT INTO `tbasedata` VALUES ('SV002', '版权所有', '版权所有@上海莫辩信息科技有限公司', '', '100', 'SV', null);
INSERT INTO `tbasedata` VALUES ('SV003', 'welcome', '欢迎使用莫辩科技管理平台', '', '100', 'SV', null);
INSERT INTO `tbasedata` VALUES ('SV004', '0：开发，1：测试，2：生产', '2', null, '4', 'SV', null);
INSERT INTO `tbasedata` VALUES ('SV100', '经典案例封面数量', '4', '', '100', 'SV', null);

-- ----------------------------
-- Table structure for tbasetype
-- ----------------------------
DROP TABLE IF EXISTS `tbasetype`;
CREATE TABLE `tbasetype` (
  `code` varchar(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbasetype
-- ----------------------------
INSERT INTO `tbasetype` VALUES ('AP', '接口配置', '0');
INSERT INTO `tbasetype` VALUES ('EX', '异常', '0');
INSERT INTO `tbasetype` VALUES ('IM', '图片配置', '0');
INSERT INTO `tbasetype` VALUES ('MU', '菜单配置', '0');
INSERT INTO `tbasetype` VALUES ('ST', '业务状态', '0');
INSERT INTO `tbasetype` VALUES ('SV', '系统环境变量', '0');

-- ----------------------------
-- Table structure for tbug
-- ----------------------------
DROP TABLE IF EXISTS `tbug`;
CREATE TABLE `tbug` (
  `ID` varchar(36) NOT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `MODIFYDATETIME` datetime DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `NOTE` longtext,
  `BUGTYPE_ID` varchar(36) DEFAULT NULL,
  `file_path` varchar(128) DEFAULT NULL,
  `phone_model` varchar(128) DEFAULT NULL,
  `system_type` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_q8x2eyh7d65rv7vcd7iw2h8yf` (`BUGTYPE_ID`),
  CONSTRAINT `FK_q8x2eyh7d65rv7vcd7iw2h8yf` FOREIGN KEY (`BUGTYPE_ID`) REFERENCES `tbugtype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbug
-- ----------------------------
INSERT INTO `tbug` VALUES ('16127c34-2fde-4af2-8256-7161da6c4aad', '2016-01-20 16:31:10', null, '页面标题修改', '<p>\r\n	【首页】 &nbsp;取公司名，如：上海莫辩信息科技有限公司\r\n</p>\r\n<p>\r\n	【其他页面】 取主导航名称，如：关于我们、合作伙伴\r\n</p>', '0', null, null, null);
INSERT INTO `tbug` VALUES ('b66d90f2-7846-4799-a67e-7365b54a1c54', '2016-02-23 12:39:46', '2016-02-23 12:50:07', 'bug管理', '<p>\r\n	1. 新增/查询条件/查询列表 &nbsp; 增加字段：负责人、bug状态（新建/修改中/已修改/驳回/已挂起/已关闭）\r\n</p>\r\n<p>\r\n	2. bug类型换成“级别”， &nbsp; 轻微/一般/严重/致命， &nbsp;<span>新增/查询条件/查询列表都需要显示这个字段</span>\r\n</p>\r\n<p>\r\n	3.系统类型&amp;手机型号 &nbsp; &nbsp; 两个字段都去掉\r\n</p>\r\n<p>\r\n	4.创建人、修改人 两个字段\r\n</p>', '0', null, null, null);

-- ----------------------------
-- Table structure for tbugtype
-- ----------------------------
DROP TABLE IF EXISTS `tbugtype`;
CREATE TABLE `tbugtype` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbugtype
-- ----------------------------
INSERT INTO `tbugtype` VALUES ('0', '错误');
INSERT INTO `tbugtype` VALUES ('1', '功能');

-- ----------------------------
-- Table structure for tresource
-- ----------------------------
DROP TABLE IF EXISTS `tresource`;
CREATE TABLE `tresource` (
  `ID` varchar(36) NOT NULL,
  `ICON` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `PID` varchar(36) DEFAULT NULL,
  `TRESOURCETYPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_m0i6pj14hcg1mleojnl7igg6o` (`PID`),
  KEY `FK_6w0sgqbec1o81uqqjsmejg57p` (`TRESOURCETYPE_ID`),
  CONSTRAINT `FK_6w0sgqbec1o81uqqjsmejg57p` FOREIGN KEY (`TRESOURCETYPE_ID`) REFERENCES `tresourcetype` (`ID`),
  CONSTRAINT `FK_m0i6pj14hcg1mleojnl7igg6o` FOREIGN KEY (`PID`) REFERENCES `tresource` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tresource
-- ----------------------------
INSERT INTO `tresource` VALUES ('328A6F6CA08C402383A611F147BE3506', null, '官网数据配置', null, '100', '/websiteDataController/manager', null, '0');
INSERT INTO `tresource` VALUES ('331A0008CAB44F2A916CC96A954910C8', null, '查看官网数据配置', null, '35', '/websiteDataController/view', '328A6F6CA08C402383A611F147BE3506', '1');
INSERT INTO `tresource` VALUES ('34F8B260F6D1460C82C0DB8AFAD5375C', null, '添加官网数据配置页面', null, '10', '/websiteDataController/addPage', '328A6F6CA08C402383A611F147BE3506', '1');
INSERT INTO `tresource` VALUES ('49DD652644554332879385D80B2A10D9', null, '修改官网数据配置页面', null, '25', '/websiteDataController/edit', '328A6F6CA08C402383A611F147BE3506', '1');
INSERT INTO `tresource` VALUES ('74D31CD83D0F4C3EB9BFC9B19979EFAC', null, '下载官网数据配置', null, '40', '/websiteDataController/download', '328A6F6CA08C402383A611F147BE3506', '1');
INSERT INTO `tresource` VALUES ('94C2ED06E5E441F397F76FED12934092', null, '官网数据配置列表查询', null, '5', '/websiteDataController/dataGrid', '328A6F6CA08C402383A611F147BE3506', '1');
INSERT INTO `tresource` VALUES ('autoAdd', null, '生成资源权限', null, '1', '/autoController/add', 'autoDev', '1');
INSERT INTO `tresource` VALUES ('autoDev', 'cog', '自动化开发', null, '4', '/autoController/manager', 'xtgl', '0');
INSERT INTO `tresource` VALUES ('BC43837B8ACC44B2866B069FAD2A99FB', null, '删除官网数据配置', null, '30', '/websiteDataController/delete', '328A6F6CA08C402383A611F147BE3506', '1');
INSERT INTO `tresource` VALUES ('bdgl', 'database', '数据字典', null, '4', '/basedataController/manager', 'xtgl', '0');
INSERT INTO `tresource` VALUES ('bdglAdd', null, '添加基础数据', null, '3', '/basedataController/basedataAdd', 'bdgl', '1');
INSERT INTO `tresource` VALUES ('bdglAddPage', null, '添加基础数据页面', null, '2', '/basedataController/basedataAddPage', 'bdgl', '1');
INSERT INTO `tresource` VALUES ('bdglDateGrid', null, '基础数据表格', null, '1', '/basedataController/basedataDataGrid', 'bdgl', '1');
INSERT INTO `tresource` VALUES ('bdglDelete', null, '删除基础数据', null, '6', '/basedataController/basedatadelete', 'bdgl', '1');
INSERT INTO `tresource` VALUES ('bdglEdit', null, '编辑基础数据', null, '5', '/basedataController/basedataEdit', 'bdgl', '1');
INSERT INTO `tresource` VALUES ('bdglEditPage', null, '编辑基础数据页面', null, '3', '/basedataController/basedataEditPage', 'bdgl', '1');
INSERT INTO `tresource` VALUES ('bdtyAdd', null, '添加基础类型', null, '7', '/basedataController/basetypeAdd', 'bdgl', '1');
INSERT INTO `tresource` VALUES ('bdtyAddPage', null, '添加基础类型页面', null, '8', '/basedataController/basetypeAddPage', 'bdgl', '1');
INSERT INTO `tresource` VALUES ('bdtyDelete', null, '删除基础类型', null, '10', '/basedataController/basetypedelete', 'bdgl', '1');
INSERT INTO `tresource` VALUES ('bdtyEdit', null, '编辑基础类型', null, '15', '/basedataController/basetypeEdit', 'bdgl', '1');
INSERT INTO `tresource` VALUES ('bdtyTree', null, '基础类型树', null, '20', '/basedataController/treeGrid', 'bdgl', '1');
INSERT INTO `tresource` VALUES ('buggl', 'bug', 'BUG管理', null, '5', '/bugController/manager', 'xtgl', '0');
INSERT INTO `tresource` VALUES ('bugglAdd', 'bug_add', '添加BUG', null, '3', '/bugController/add', 'buggl', '1');
INSERT INTO `tresource` VALUES ('bugglAddPage', 'bug_add', '添加BUG页面', null, '2', '/bugController/addPage', 'buggl', '1');
INSERT INTO `tresource` VALUES ('bugglDateGrid', 'bug_link', 'BUG表格', null, '1', '/bugController/dataGrid', 'buggl', '1');
INSERT INTO `tresource` VALUES ('bugglDelete', 'bug_delete', '删除BUG', null, '6', '/bugController/delete', 'buggl', '1');
INSERT INTO `tresource` VALUES ('bugglEdit', 'bug_edit', '编辑BUG', null, '5', '/bugController/edit', 'buggl', '1');
INSERT INTO `tresource` VALUES ('bugglEditPage', 'bug_edit', '编辑BUG页面', null, '4', '/bugController/editPage', 'buggl', '1');
INSERT INTO `tresource` VALUES ('bugglView', 'bug_link', '查看BUG', null, '7', '/bugController/view', 'buggl', '1');
INSERT INTO `tresource` VALUES ('C7BE5DC439D540EFBBC30A9AA246AAD2', null, '添加官网数据配置', null, '15', '/websiteDataController/add', '328A6F6CA08C402383A611F147BE3506', '1');
INSERT INTO `tresource` VALUES ('F829FFB047E3434F99AE8FE619973874', null, '修改官网数据配置页面', null, '20', '/websiteDataController/editPage', '328A6F6CA08C402383A611F147BE3506', '1');
INSERT INTO `tresource` VALUES ('jsgl', 'tux', '角色管理', null, '2', '/roleController/manager', 'xtgl', '0');
INSERT INTO `tresource` VALUES ('jsglAdd', 'wrench', '添加角色', null, '3', '/roleController/add', 'jsgl', '1');
INSERT INTO `tresource` VALUES ('jsglAddPage', 'wrench', '添加角色页面', null, '2', '/roleController/addPage', 'jsgl', '1');
INSERT INTO `tresource` VALUES ('jsglDelete', 'wrench', '删除角色', null, '6', '/roleController/delete', 'jsgl', '1');
INSERT INTO `tresource` VALUES ('jsglEdit', 'wrench', '编辑角色', null, '5', '/roleController/edit', 'jsgl', '1');
INSERT INTO `tresource` VALUES ('jsglEditPage', 'wrench', '编辑角色页面', null, '4', '/roleController/editPage', 'jsgl', '1');
INSERT INTO `tresource` VALUES ('jsglGrant', 'wrench', '角色授权', null, '8', '/roleController/grant', 'jsgl', '1');
INSERT INTO `tresource` VALUES ('jsglGrantPage', 'wrench', '角色授权页面', null, '7', '/roleController/grantPage', 'jsgl', '1');
INSERT INTO `tresource` VALUES ('jsglTreeGrid', 'wrench', '角色表格', null, '1', '/roleController/treeGrid', 'jsgl', '1');
INSERT INTO `tresource` VALUES ('wjgl', 'server_database', '文件管理', null, '6', '', 'xtgl', '1');
INSERT INTO `tresource` VALUES ('wjglDownload', 'server_database', '上传下载', null, '3', '/fileController/download', 'wjgl', '1');
INSERT INTO `tresource` VALUES ('wjglUpload', 'server_database', '上传文件', null, '2', '/fileController/upload', 'wjgl', '1');
INSERT INTO `tresource` VALUES ('wjglView', 'server_database', '浏览服务器文件', null, '1', '/fileController/fileManage', 'wjgl', '1');
INSERT INTO `tresource` VALUES ('xtgl', 'plugin', '系统管理', null, '0', null, null, '0');
INSERT INTO `tresource` VALUES ('yhgl', 'status_online', '用户管理', null, '3', '/userController/manager', 'xtgl', '0');
INSERT INTO `tresource` VALUES ('yhglAdd', 'wrench', '添加用户', null, '3', '/userController/add', 'yhgl', '1');
INSERT INTO `tresource` VALUES ('yhglAddPage', 'wrench', '添加用户页面', null, '2', '/userController/addPage', 'yhgl', '1');
INSERT INTO `tresource` VALUES ('yhglBatchDelete', 'wrench', '批量删除用户', null, '7', '/userController/batchDelete', 'yhgl', '1');
INSERT INTO `tresource` VALUES ('yhglDateGrid', 'wrench', '用户表格', null, '1', '/userController/dataGrid', 'yhgl', '1');
INSERT INTO `tresource` VALUES ('yhglDelete', 'wrench', '删除用户', null, '6', '/userController/delete', 'yhgl', '1');
INSERT INTO `tresource` VALUES ('yhglEdit', 'wrench', '编辑用户', null, '5', '/userController/edit', 'yhgl', '1');
INSERT INTO `tresource` VALUES ('yhglEditPage', 'wrench', '编辑用户页面', null, '4', '/userController/editPage', 'yhgl', '1');
INSERT INTO `tresource` VALUES ('yhglEditPwd', 'wrench', '用户修改密码', null, '11', '/userController/editPwd', 'yhgl', '1');
INSERT INTO `tresource` VALUES ('yhglEditPwdPage', 'wrench', '用户修改密码页面', null, '10', '/userController/editPwdPage', 'yhgl', '1');
INSERT INTO `tresource` VALUES ('yhglGrant', 'wrench', '用户授权', null, '9', '/userController/grant', 'yhgl', '1');
INSERT INTO `tresource` VALUES ('yhglGrantPage', 'wrench', '用户授权页面', null, '8', '/userController/grantPage', 'yhgl', '1');
INSERT INTO `tresource` VALUES ('zygl', 'database_gear', '资源管理', '管理系统中所有的菜单或功能', '1', '/resourceController/manager', 'xtgl', '0');
INSERT INTO `tresource` VALUES ('zyglAdd', 'wrench', '添加资源', null, '4', '/resourceController/add', 'zygl', '1');
INSERT INTO `tresource` VALUES ('zyglAddPage', 'wrench', '添加资源页面', null, '3', '/resourceController/addPage', 'zygl', '1');
INSERT INTO `tresource` VALUES ('zyglDelete', 'wrench', '删除资源', null, '7', '/resourceController/delete', 'zygl', '1');
INSERT INTO `tresource` VALUES ('zyglEdit', 'wrench', '编辑资源', null, '6', '/resourceController/edit', 'zygl', '1');
INSERT INTO `tresource` VALUES ('zyglEditPage', 'wrench', '编辑资源页面', null, '5', '/resourceController/editPage', 'zygl', '1');
INSERT INTO `tresource` VALUES ('zyglMenu', 'wrench', '功能菜单', null, '2', '/resourceController/tree', 'zygl', '1');
INSERT INTO `tresource` VALUES ('zyglTreeGrid', 'wrench', '资源表格', '显示资源列表', '1', '/resourceController/treeGrid', 'zygl', '1');

-- ----------------------------
-- Table structure for tresourcetype
-- ----------------------------
DROP TABLE IF EXISTS `tresourcetype`;
CREATE TABLE `tresourcetype` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tresourcetype
-- ----------------------------
INSERT INTO `tresourcetype` VALUES ('0', '菜单');
INSERT INTO `tresourcetype` VALUES ('1', '功能');

-- ----------------------------
-- Table structure for trole
-- ----------------------------
DROP TABLE IF EXISTS `trole`;
CREATE TABLE `trole` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `PID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_3qq9eyhwbhblv83lt270gxbik` (`PID`),
  CONSTRAINT `FK_3qq9eyhwbhblv83lt270gxbik` FOREIGN KEY (`PID`) REFERENCES `trole` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trole
-- ----------------------------
INSERT INTO `trole` VALUES ('0', '超管', '超级管理员角色，拥有系统中所有的资源访问权限', '0', null);
INSERT INTO `trole` VALUES ('2e347d7b-97d6-4961-ab01-7710a1fcfae7', '配置管理员', '', '100', null);
INSERT INTO `trole` VALUES ('bugAdmin', 'BUG管理员', null, '5', '0');
INSERT INTO `trole` VALUES ('guest', 'Guest', '只拥有只看的权限', '1', null);
INSERT INTO `trole` VALUES ('jsAdmin', '角色管理员', null, '2', '0');
INSERT INTO `trole` VALUES ('sjyAdmin', '数据源管理员', null, '4', '0');
INSERT INTO `trole` VALUES ('yhAdmin', '用户管理员', null, '3', '0');
INSERT INTO `trole` VALUES ('zyAdmin', '资源管理员', null, '1', '0');

-- ----------------------------
-- Table structure for trole_tresource
-- ----------------------------
DROP TABLE IF EXISTS `trole_tresource`;
CREATE TABLE `trole_tresource` (
  `TROLE_ID` varchar(36) NOT NULL,
  `TRESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`TRESOURCE_ID`,`TROLE_ID`),
  KEY `FK_18oms8g4ib4h67dqx0f3fwaed` (`TRESOURCE_ID`),
  KEY `FK_aunc1ssqh18meky8cxl48i4m9` (`TROLE_ID`),
  CONSTRAINT `FK_18oms8g4ib4h67dqx0f3fwaed` FOREIGN KEY (`TRESOURCE_ID`) REFERENCES `tresource` (`ID`),
  CONSTRAINT `FK_aunc1ssqh18meky8cxl48i4m9` FOREIGN KEY (`TROLE_ID`) REFERENCES `trole` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trole_tresource
-- ----------------------------
INSERT INTO `trole_tresource` VALUES ('0', '328A6F6CA08C402383A611F147BE3506');
INSERT INTO `trole_tresource` VALUES ('2e347d7b-97d6-4961-ab01-7710a1fcfae7', '328A6F6CA08C402383A611F147BE3506');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', '328A6F6CA08C402383A611F147BE3506');
INSERT INTO `trole_tresource` VALUES ('guest', '328A6F6CA08C402383A611F147BE3506');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', '328A6F6CA08C402383A611F147BE3506');
INSERT INTO `trole_tresource` VALUES ('sjyAdmin', '328A6F6CA08C402383A611F147BE3506');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', '328A6F6CA08C402383A611F147BE3506');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', '328A6F6CA08C402383A611F147BE3506');
INSERT INTO `trole_tresource` VALUES ('0', '331A0008CAB44F2A916CC96A954910C8');
INSERT INTO `trole_tresource` VALUES ('2e347d7b-97d6-4961-ab01-7710a1fcfae7', '331A0008CAB44F2A916CC96A954910C8');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', '331A0008CAB44F2A916CC96A954910C8');
INSERT INTO `trole_tresource` VALUES ('guest', '331A0008CAB44F2A916CC96A954910C8');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', '331A0008CAB44F2A916CC96A954910C8');
INSERT INTO `trole_tresource` VALUES ('sjyAdmin', '331A0008CAB44F2A916CC96A954910C8');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', '331A0008CAB44F2A916CC96A954910C8');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', '331A0008CAB44F2A916CC96A954910C8');
INSERT INTO `trole_tresource` VALUES ('0', '34F8B260F6D1460C82C0DB8AFAD5375C');
INSERT INTO `trole_tresource` VALUES ('2e347d7b-97d6-4961-ab01-7710a1fcfae7', '34F8B260F6D1460C82C0DB8AFAD5375C');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', '34F8B260F6D1460C82C0DB8AFAD5375C');
INSERT INTO `trole_tresource` VALUES ('guest', '34F8B260F6D1460C82C0DB8AFAD5375C');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', '34F8B260F6D1460C82C0DB8AFAD5375C');
INSERT INTO `trole_tresource` VALUES ('sjyAdmin', '34F8B260F6D1460C82C0DB8AFAD5375C');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', '34F8B260F6D1460C82C0DB8AFAD5375C');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', '34F8B260F6D1460C82C0DB8AFAD5375C');
INSERT INTO `trole_tresource` VALUES ('0', '49DD652644554332879385D80B2A10D9');
INSERT INTO `trole_tresource` VALUES ('2e347d7b-97d6-4961-ab01-7710a1fcfae7', '49DD652644554332879385D80B2A10D9');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', '49DD652644554332879385D80B2A10D9');
INSERT INTO `trole_tresource` VALUES ('guest', '49DD652644554332879385D80B2A10D9');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', '49DD652644554332879385D80B2A10D9');
INSERT INTO `trole_tresource` VALUES ('sjyAdmin', '49DD652644554332879385D80B2A10D9');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', '49DD652644554332879385D80B2A10D9');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', '49DD652644554332879385D80B2A10D9');
INSERT INTO `trole_tresource` VALUES ('0', '74D31CD83D0F4C3EB9BFC9B19979EFAC');
INSERT INTO `trole_tresource` VALUES ('2e347d7b-97d6-4961-ab01-7710a1fcfae7', '74D31CD83D0F4C3EB9BFC9B19979EFAC');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', '74D31CD83D0F4C3EB9BFC9B19979EFAC');
INSERT INTO `trole_tresource` VALUES ('guest', '74D31CD83D0F4C3EB9BFC9B19979EFAC');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', '74D31CD83D0F4C3EB9BFC9B19979EFAC');
INSERT INTO `trole_tresource` VALUES ('sjyAdmin', '74D31CD83D0F4C3EB9BFC9B19979EFAC');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', '74D31CD83D0F4C3EB9BFC9B19979EFAC');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', '74D31CD83D0F4C3EB9BFC9B19979EFAC');
INSERT INTO `trole_tresource` VALUES ('0', '94C2ED06E5E441F397F76FED12934092');
INSERT INTO `trole_tresource` VALUES ('2e347d7b-97d6-4961-ab01-7710a1fcfae7', '94C2ED06E5E441F397F76FED12934092');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', '94C2ED06E5E441F397F76FED12934092');
INSERT INTO `trole_tresource` VALUES ('guest', '94C2ED06E5E441F397F76FED12934092');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', '94C2ED06E5E441F397F76FED12934092');
INSERT INTO `trole_tresource` VALUES ('sjyAdmin', '94C2ED06E5E441F397F76FED12934092');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', '94C2ED06E5E441F397F76FED12934092');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', '94C2ED06E5E441F397F76FED12934092');
INSERT INTO `trole_tresource` VALUES ('0', 'autoAdd');
INSERT INTO `trole_tresource` VALUES ('0', 'autoDev');
INSERT INTO `trole_tresource` VALUES ('0', 'BC43837B8ACC44B2866B069FAD2A99FB');
INSERT INTO `trole_tresource` VALUES ('2e347d7b-97d6-4961-ab01-7710a1fcfae7', 'BC43837B8ACC44B2866B069FAD2A99FB');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', 'BC43837B8ACC44B2866B069FAD2A99FB');
INSERT INTO `trole_tresource` VALUES ('guest', 'BC43837B8ACC44B2866B069FAD2A99FB');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'BC43837B8ACC44B2866B069FAD2A99FB');
INSERT INTO `trole_tresource` VALUES ('sjyAdmin', 'BC43837B8ACC44B2866B069FAD2A99FB');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'BC43837B8ACC44B2866B069FAD2A99FB');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', 'BC43837B8ACC44B2866B069FAD2A99FB');
INSERT INTO `trole_tresource` VALUES ('0', 'bdgl');
INSERT INTO `trole_tresource` VALUES ('0', 'bdglAdd');
INSERT INTO `trole_tresource` VALUES ('0', 'bdglAddPage');
INSERT INTO `trole_tresource` VALUES ('0', 'bdglDateGrid');
INSERT INTO `trole_tresource` VALUES ('0', 'bdglDelete');
INSERT INTO `trole_tresource` VALUES ('0', 'bdglEdit');
INSERT INTO `trole_tresource` VALUES ('0', 'bdglEditPage');
INSERT INTO `trole_tresource` VALUES ('0', 'bdtyAdd');
INSERT INTO `trole_tresource` VALUES ('0', 'bdtyAddPage');
INSERT INTO `trole_tresource` VALUES ('0', 'bdtyDelete');
INSERT INTO `trole_tresource` VALUES ('0', 'bdtyEdit');
INSERT INTO `trole_tresource` VALUES ('0', 'bdtyTree');
INSERT INTO `trole_tresource` VALUES ('0', 'buggl');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', 'buggl');
INSERT INTO `trole_tresource` VALUES ('0', 'bugglAdd');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', 'bugglAdd');
INSERT INTO `trole_tresource` VALUES ('0', 'bugglAddPage');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', 'bugglAddPage');
INSERT INTO `trole_tresource` VALUES ('0', 'bugglDateGrid');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', 'bugglDateGrid');
INSERT INTO `trole_tresource` VALUES ('0', 'bugglDelete');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', 'bugglDelete');
INSERT INTO `trole_tresource` VALUES ('0', 'bugglEdit');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', 'bugglEdit');
INSERT INTO `trole_tresource` VALUES ('0', 'bugglEditPage');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', 'bugglEditPage');
INSERT INTO `trole_tresource` VALUES ('0', 'bugglView');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', 'bugglView');
INSERT INTO `trole_tresource` VALUES ('0', 'C7BE5DC439D540EFBBC30A9AA246AAD2');
INSERT INTO `trole_tresource` VALUES ('2e347d7b-97d6-4961-ab01-7710a1fcfae7', 'C7BE5DC439D540EFBBC30A9AA246AAD2');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', 'C7BE5DC439D540EFBBC30A9AA246AAD2');
INSERT INTO `trole_tresource` VALUES ('guest', 'C7BE5DC439D540EFBBC30A9AA246AAD2');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'C7BE5DC439D540EFBBC30A9AA246AAD2');
INSERT INTO `trole_tresource` VALUES ('sjyAdmin', 'C7BE5DC439D540EFBBC30A9AA246AAD2');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'C7BE5DC439D540EFBBC30A9AA246AAD2');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', 'C7BE5DC439D540EFBBC30A9AA246AAD2');
INSERT INTO `trole_tresource` VALUES ('0', 'F829FFB047E3434F99AE8FE619973874');
INSERT INTO `trole_tresource` VALUES ('2e347d7b-97d6-4961-ab01-7710a1fcfae7', 'F829FFB047E3434F99AE8FE619973874');
INSERT INTO `trole_tresource` VALUES ('bugAdmin', 'F829FFB047E3434F99AE8FE619973874');
INSERT INTO `trole_tresource` VALUES ('guest', 'F829FFB047E3434F99AE8FE619973874');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'F829FFB047E3434F99AE8FE619973874');
INSERT INTO `trole_tresource` VALUES ('sjyAdmin', 'F829FFB047E3434F99AE8FE619973874');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'F829FFB047E3434F99AE8FE619973874');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', 'F829FFB047E3434F99AE8FE619973874');
INSERT INTO `trole_tresource` VALUES ('0', 'jsgl');
INSERT INTO `trole_tresource` VALUES ('guest', 'jsgl');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'jsgl');
INSERT INTO `trole_tresource` VALUES ('0', 'jsglAdd');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'jsglAdd');
INSERT INTO `trole_tresource` VALUES ('0', 'jsglAddPage');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'jsglAddPage');
INSERT INTO `trole_tresource` VALUES ('0', 'jsglDelete');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'jsglDelete');
INSERT INTO `trole_tresource` VALUES ('0', 'jsglEdit');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'jsglEdit');
INSERT INTO `trole_tresource` VALUES ('0', 'jsglEditPage');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'jsglEditPage');
INSERT INTO `trole_tresource` VALUES ('0', 'jsglGrant');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'jsglGrant');
INSERT INTO `trole_tresource` VALUES ('0', 'jsglGrantPage');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'jsglGrantPage');
INSERT INTO `trole_tresource` VALUES ('0', 'jsglTreeGrid');
INSERT INTO `trole_tresource` VALUES ('guest', 'jsglTreeGrid');
INSERT INTO `trole_tresource` VALUES ('jsAdmin', 'jsglTreeGrid');
INSERT INTO `trole_tresource` VALUES ('0', 'wjgl');
INSERT INTO `trole_tresource` VALUES ('0', 'wjglDownload');
INSERT INTO `trole_tresource` VALUES ('0', 'wjglUpload');
INSERT INTO `trole_tresource` VALUES ('0', 'wjglView');
INSERT INTO `trole_tresource` VALUES ('0', 'xtgl');
INSERT INTO `trole_tresource` VALUES ('guest', 'xtgl');
INSERT INTO `trole_tresource` VALUES ('0', 'yhgl');
INSERT INTO `trole_tresource` VALUES ('guest', 'yhgl');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhgl');
INSERT INTO `trole_tresource` VALUES ('0', 'yhglAdd');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhglAdd');
INSERT INTO `trole_tresource` VALUES ('0', 'yhglAddPage');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhglAddPage');
INSERT INTO `trole_tresource` VALUES ('0', 'yhglBatchDelete');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhglBatchDelete');
INSERT INTO `trole_tresource` VALUES ('0', 'yhglDateGrid');
INSERT INTO `trole_tresource` VALUES ('guest', 'yhglDateGrid');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhglDateGrid');
INSERT INTO `trole_tresource` VALUES ('0', 'yhglDelete');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhglDelete');
INSERT INTO `trole_tresource` VALUES ('0', 'yhglEdit');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhglEdit');
INSERT INTO `trole_tresource` VALUES ('0', 'yhglEditPage');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhglEditPage');
INSERT INTO `trole_tresource` VALUES ('0', 'yhglEditPwd');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhglEditPwd');
INSERT INTO `trole_tresource` VALUES ('0', 'yhglEditPwdPage');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhglEditPwdPage');
INSERT INTO `trole_tresource` VALUES ('0', 'yhglGrant');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhglGrant');
INSERT INTO `trole_tresource` VALUES ('0', 'yhglGrantPage');
INSERT INTO `trole_tresource` VALUES ('yhAdmin', 'yhglGrantPage');
INSERT INTO `trole_tresource` VALUES ('0', 'zygl');
INSERT INTO `trole_tresource` VALUES ('guest', 'zygl');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', 'zygl');
INSERT INTO `trole_tresource` VALUES ('0', 'zyglAdd');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', 'zyglAdd');
INSERT INTO `trole_tresource` VALUES ('0', 'zyglAddPage');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', 'zyglAddPage');
INSERT INTO `trole_tresource` VALUES ('0', 'zyglDelete');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', 'zyglDelete');
INSERT INTO `trole_tresource` VALUES ('0', 'zyglEdit');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', 'zyglEdit');
INSERT INTO `trole_tresource` VALUES ('0', 'zyglEditPage');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', 'zyglEditPage');
INSERT INTO `trole_tresource` VALUES ('0', 'zyglMenu');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', 'zyglMenu');
INSERT INTO `trole_tresource` VALUES ('0', 'zyglTreeGrid');
INSERT INTO `trole_tresource` VALUES ('guest', 'zyglTreeGrid');
INSERT INTO `trole_tresource` VALUES ('zyAdmin', 'zyglTreeGrid');

-- ----------------------------
-- Table structure for tuser
-- ----------------------------
DROP TABLE IF EXISTS `tuser`;
CREATE TABLE `tuser` (
  `ID` varchar(36) NOT NULL,
  `areaCode` varchar(36) DEFAULT NULL,
  `bardian` varchar(128) DEFAULT NULL,
  `birthday` varchar(18) DEFAULT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `head_image` varchar(256) DEFAULT NULL,
  `isStar` tinyint(1) DEFAULT NULL,
  `isTarento` tinyint(1) DEFAULT NULL,
  `member_v` varchar(4) DEFAULT NULL,
  `MODIFYDATETIME` datetime DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `nickname` varchar(36) DEFAULT NULL,
  `PWD` varchar(100) NOT NULL,
  `third_user` varchar(36) DEFAULT NULL,
  `utype` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_doflky41g81kf7ydx6y0a99nm` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuser
-- ----------------------------
INSERT INTO `tuser` VALUES ('0', null, null, null, '2015-07-26 01:11:36', null, null, null, null, '2016-01-28 00:08:09', 'admin', null, '92d7ddd2a010c59511dc2905b7e14f64', null, null);
INSERT INTO `tuser` VALUES ('1', null, null, null, '2015-07-26 01:11:37', null, null, null, null, null, 'admin1', null, 'e10adc3949ba59abbe56e057f20f883e', null, null);
INSERT INTO `tuser` VALUES ('2', null, null, null, '2015-07-26 01:11:37', null, null, null, null, null, 'admin2', null, 'e10adc3949ba59abbe56e057f20f883e', null, null);
INSERT INTO `tuser` VALUES ('3', null, null, null, '2015-07-26 01:11:37', null, null, null, null, null, 'admin3', null, 'e10adc3949ba59abbe56e057f20f883e', null, null);
INSERT INTO `tuser` VALUES ('4', null, null, null, '2015-07-26 01:11:37', null, null, null, null, null, 'admin4', null, 'e10adc3949ba59abbe56e057f20f883e', null, null);
INSERT INTO `tuser` VALUES ('5', null, null, null, '2015-07-26 01:11:37', null, null, null, null, null, 'admin5', null, 'e10adc3949ba59abbe56e057f20f883e', null, null);
INSERT INTO `tuser` VALUES ('8109bdc2-5780-4662-8c1c-4d6bfbc851c1', null, null, null, '2016-01-25 21:06:37', null, null, null, null, null, 'liyu', null, 'e10adc3949ba59abbe56e057f20f883e', null, null);
INSERT INTO `tuser` VALUES ('guest', null, null, null, '2015-07-26 01:11:37', null, null, null, null, null, 'guest', null, 'e10adc3949ba59abbe56e057f20f883e', null, null);

-- ----------------------------
-- Table structure for tuser_trole
-- ----------------------------
DROP TABLE IF EXISTS `tuser_trole`;
CREATE TABLE `tuser_trole` (
  `TUSER_ID` varchar(36) NOT NULL,
  `TROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`TROLE_ID`,`TUSER_ID`),
  KEY `FK_30t0khk63muiwisjpp0h7e57l` (`TROLE_ID`),
  KEY `FK_mipcojqd9xymdghov18fobf7e` (`TUSER_ID`),
  CONSTRAINT `FK_30t0khk63muiwisjpp0h7e57l` FOREIGN KEY (`TROLE_ID`) REFERENCES `trole` (`ID`),
  CONSTRAINT `FK_mipcojqd9xymdghov18fobf7e` FOREIGN KEY (`TUSER_ID`) REFERENCES `tuser` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuser_trole
-- ----------------------------
INSERT INTO `tuser_trole` VALUES ('0', '0');
INSERT INTO `tuser_trole` VALUES ('0', '2e347d7b-97d6-4961-ab01-7710a1fcfae7');
INSERT INTO `tuser_trole` VALUES ('8109bdc2-5780-4662-8c1c-4d6bfbc851c1', '2e347d7b-97d6-4961-ab01-7710a1fcfae7');
INSERT INTO `tuser_trole` VALUES ('0', 'bugAdmin');
INSERT INTO `tuser_trole` VALUES ('5', 'bugAdmin');
INSERT INTO `tuser_trole` VALUES ('0', 'guest');
INSERT INTO `tuser_trole` VALUES ('guest', 'guest');
INSERT INTO `tuser_trole` VALUES ('0', 'jsAdmin');
INSERT INTO `tuser_trole` VALUES ('2', 'jsAdmin');
INSERT INTO `tuser_trole` VALUES ('0', 'sjyAdmin');
INSERT INTO `tuser_trole` VALUES ('4', 'sjyAdmin');
INSERT INTO `tuser_trole` VALUES ('0', 'yhAdmin');
INSERT INTO `tuser_trole` VALUES ('3', 'yhAdmin');
INSERT INTO `tuser_trole` VALUES ('0', 'zyAdmin');
INSERT INTO `tuser_trole` VALUES ('1', 'zyAdmin');

-- ----------------------------
-- Table structure for website_data
-- ----------------------------
DROP TABLE IF EXISTS `website_data`;
CREATE TABLE `website_data` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `icon` longtext COMMENT '封面',
  `menu` char(6) DEFAULT NULL COMMENT '所属导航菜单',
  `type` char(6) DEFAULT NULL COMMENT '分类',
  `content` longtext COMMENT '内容',
  `seq` int(11) DEFAULT NULL COMMENT '排序',
  `status` char(4) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website_data
-- ----------------------------
INSERT INTO `website_data` VALUES ('0f28b7ec-7ea5-4c6f-9e3e-fa7ff8185bd3', '合作伙伴', null, 'MU400', 'MU410', '<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/attached/image/2016/01/14/e8f625d7-cbb9-41a6-9cf9-2e23bd74d377.png\" width=\"200\" height=\"55\" alt=\"\" /><span style=\"color:#222222;font-family:Consolas, \'Lucida Console\', monospace;line-height:normal;background-color:#FFFFFF;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span>&nbsp;<img src=\"http://www.ptcent.com/images/ptLogo.png\" width=\"200\" height=\"55\" alt=\"\" /><span id=\"__kindeditor_bookmark_start_75__\"></span> \r\n</p>', '100', 'ST01', '2016-01-14 00:39:44');
INSERT INTO `website_data` VALUES ('1f3ab7d4-6b62-4e4c-b31e-89a81285969b', '柚美理财', 'uploadfiles/store/MU120/website_2RKP1453191884021.jpg', 'MU100', 'MU120', '<p>\r\n	<span style=\"font-family:微软雅黑;font-size:13px;line-height:24px;color:#E53333;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;柚美理财</span><span style=\"font-size:13px;line-height:24px;font-family:\'Microsoft YaHei\';color:#5B5A5A;background-color:#FFFFFF;\">是上海柚美信息科技有限公司推出的专注于提供安全、低风险金融产品的金融服务平台。提供优质核心企业P2B供应链金融、票据理财与基金产品三大金融产品，着力为投资者建设一个安全、收益和高流动性的互联网投资平台。同时，借助移动互联网和大数据创新风控技术，通过建立一个便捷、高效、透明的互联网金融平台，让理财成为生活习惯，推动普惠金融的发展。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:13px;line-height:24px;font-family:\'Microsoft YaHei\';color:#5B5A5A;background-color:#FFFFFF;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp;&nbsp;<img src=\"/attached/image/2016/01/19/2f6675c5-f0c5-4477-a8e0-77bb625d4b3b.jpg\" width=\"323\" height=\"574\" alt=\"\" />&nbsp;&nbsp;<img src=\"/attached/image/2016/01/19/dc292028-ed54-457e-bc94-894907b2c374.jpg\" width=\"323\" height=\"574\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp;&nbsp;<img src=\"/attached/image/2016/01/19/d9b4ea16-7555-44f7-b16d-84c0de3a1885.jpg\" width=\"323\" height=\"574\" alt=\"\" />&nbsp;&nbsp;<img src=\"/attached/image/2016/01/19/75d60f4c-316e-47ad-819b-0aa027ffcea4.jpg\" width=\"323\" height=\"574\" alt=\"\" /> \r\n</p>', '100', 'ST01', '2016-01-19 16:24:44');
INSERT INTO `website_data` VALUES ('225b101f-2fe5-4be7-b595-d86b4e676b27', '联系我们', null, 'MU500', 'MU510', '<p style=\"text-indent:2em;color:#6E6C6C;font-family:微软雅黑, Arial, Helvetica, sans-serif;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:2em;color:#6E6C6C;font-family:微软雅黑, Arial, Helvetica, sans-serif;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-indent:2em;color:#6E6C6C;font-family:微软雅黑, Arial, Helvetica, sans-serif;background-color:#FFFFFF;\">\r\n	地址：上海市浦星公路1969号42幢6015室\r\n</p>\r\n<p style=\"text-indent:2em;color:#6E6C6C;font-family:微软雅黑, Arial, Helvetica, sans-serif;background-color:#FFFFFF;\">\r\n	------------------------------------------------\r\n</p>\r\n<p style=\"text-indent:2em;color:#6E6C6C;font-family:微软雅黑, Arial, Helvetica, sans-serif;background-color:#FFFFFF;\">\r\n	电话：+86-15300609633\r\n</p>\r\n<p style=\"text-indent:2em;color:#6E6C6C;font-family:微软雅黑, Arial, Helvetica, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"color:#6E6C6C;font-family:微软雅黑, Arial, Helvetica, sans-serif;background-color:#FFFFFF;\">------------------------------------------------</span> \r\n</p>\r\n<p style=\"text-indent:2em;color:#6E6C6C;font-family:微软雅黑, Arial, Helvetica, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"line-height:1.5;\">邮编：200000</span> \r\n</p>\r\n<p style=\"text-indent:2em;color:#6E6C6C;font-family:微软雅黑, Arial, Helvetica, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"line-height:1.5;\"><span style=\"color:#6E6C6C;font-family:微软雅黑, Arial, Helvetica, sans-serif;background-color:#FFFFFF;\">------------------------------------------------</span><br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:2em;color:#6E6C6C;font-family:微软雅黑, Arial, Helvetica, sans-serif;background-color:#FFFFFF;\">\r\n	销售联系：<a href=\"mailto:Ryan.Li@mobiang.com\">Ryan.Li@mobiang.com</a> \r\n</p>', '100', 'ST01', '2016-01-14 00:41:52');
INSERT INTO `website_data` VALUES ('2cc601da-e7a3-4070-b61b-ea85abf36952', '红星美凯龙电商', 'uploadfiles/store/MU120/website_JW5k1453189929883.png', 'MU100', 'MU120', '<p>\r\n	&nbsp; &nbsp; &nbsp;&nbsp;<img src=\"/attached/image/2016/01/19/fb1bda21-7c47-4400-84f6-f80209d2e8f0.png\" width=\"323\" height=\"574\" alt=\"\" />&nbsp; &nbsp; &nbsp;<img src=\"/attached/image/2016/01/19/99b7c181-dea7-4e57-a45e-2c40ccbaec64.jpg\" width=\"323\" height=\"574\" alt=\"\" /> \r\n</p>', '100', 'ST01', '2016-01-14 00:31:49');
INSERT INTO `website_data` VALUES ('54309ea0-0209-4d50-80ff-ae660eb92429', '合作客户', null, 'MU200', 'MU210', '<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<a href=\"http://www.chinaredstar.com/\" target=\"_blank>\"><img src=\"http://www.chinaredstar.com/images/logo.jpg\" width=\"200\" height=\"55\" alt=\"\" /></a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"http://www.ymeilicai.com/\" target=\"_blank>\"><img src=\"/attached/image/2016/01/28/8208575c-fceb-4bc3-8832-af2a0daacbe9.png\" width=\"200\" height=\"55\" alt=\"\" /></a>&nbsp;<span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"http://www.amway.com.cn/default.html\" target=\"_blank>\"><img src=\"/attached/image/2016/01/14/e0cba2d3-5cfa-4b97-971b-3965b6e8bd65.png\" width=\"200\" height=\"55\" alt=\"\" /></a></span> \r\n</p>', '100', 'ST01', '2016-01-14 00:36:30');
INSERT INTO `website_data` VALUES ('55e2c78d-1a44-4430-9ac2-7a47fd0417e6', 'JBase', 'uploadfiles/store/MU140/website_BCiP1453193478963.png', 'MU100', 'MU140', '<p>\r\n	&nbsp; &nbsp; &nbsp; <span style=\"color:#E53333;\"><strong>JBase</strong></span>是JavaBase的简称，它是上海莫辩信息科技开发的快速开发框架。框架集成了资源管理、角色管理、用户管理等功能，更是提供<span style=\"color:#E53333;\"><strong>自动化开发</strong></span>模块，能够自动生成业务代码(只需按约定配置好表即可)。<span style=\"line-height:1.5;\">同时还集成了<span style=\"color:#E53333;\"><strong>API在线调试记录</strong></span>功能。实施过IT项目人都深知，当前后端开发人员（尤其是当两家企业之间）需要通过接口协调工作时候，未提供文档、文档更新跟不上接口调整速度等问题，使得工作效率极其低下。JBase就很好的解决了这个问题。</span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">&nbsp; &nbsp; &nbsp;&nbsp;<img src=\"/attached/image/2016/01/19/cae73ff5-692a-4940-a3ec-afa608a3107a.png\" width=\"900\" height=\"450\" alt=\"\" /></span> \r\n</p>', '100', 'ST01', '2016-01-19 16:51:19');
INSERT INTO `website_data` VALUES ('9c8a2e13-915e-44d1-b6f3-cd768bb45946', '微区', 'uploadfiles/store/MU130/website_ZQUJ1453192418950.png', 'MU100', 'MU130', '&nbsp; &nbsp; &nbsp;&nbsp;<img src=\"/attached/image/2016/01/19/a13bc3c7-5501-4c25-9245-710e88855689.jpg\" width=\"900\" height=\"470\" alt=\"\" />', '100', 'ST01', '2016-01-14 00:32:21');
INSERT INTO `website_data` VALUES ('a10466b1-ea19-4e9c-bf0d-0496f9bb7468', '柚美理财', 'uploadfiles/store/MU110/website_mqqf1453191152433.jpg', 'MU100', 'MU110', '<p>\r\n	<span style=\"font-family:微软雅黑;font-size:13px;line-height:24px;color:#E53333;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;柚美理财</span><span style=\"font-size:13px;line-height:24px;font-family:\'Microsoft YaHei\';color:#5B5A5A;background-color:#FFFFFF;\">是上海柚美信息科技有限公司推出的专注于提供安全、低风险金融产品的金融服务平台。提供优质核心企业P2B供应链金融、票据理财与基金产品三大金融产品，着力为投资者建设一个安全、收益和高流动性的互联网投资平台。同时，借助移动互联网和大数据创新风控技术，通过建立一个便捷、高效、透明的互联网金融平台，让理财成为生活习惯，推动普惠金融的发展</span>。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp;&nbsp;<img src=\"/attached/image/2016/01/19/62ae6fbb-63ba-47c8-a4d6-ccdd3dc09c45.jpg\" width=\"323\" height=\"574\" alt=\"\" />&nbsp;&nbsp;<img src=\"/attached/image/2016/01/19/caa482b4-510c-4471-b7b1-366f92a4fb2b.jpg\" width=\"323\" height=\"574\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp;&nbsp;<img src=\"/attached/image/2016/01/19/03b38bfc-5f19-4745-8076-de6d3c0d7119.jpg\" width=\"323\" height=\"574\" alt=\"\" />&nbsp;&nbsp;<img src=\"/attached/image/2016/01/19/ff76ff61-487d-416d-9434-51bd72a22a73.jpg\" width=\"323\" height=\"574\" alt=\"\" /> \r\n</p>', '102', 'ST01', '2016-01-12 21:11:59');
INSERT INTO `website_data` VALUES ('ac779617-f59d-4a19-8eab-12e3dd6c39bc', '公司简介', null, 'MU300', 'MU310', '<p>\r\n	<span style=\"color:#3D3D3D;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#3D3D3D;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\">&nbsp; &nbsp; &nbsp; &nbsp; <span style=\"color:#E53333;\"><strong>上海莫辩信息科技有限公司</strong></span>(简称\"莫辩科技\")成立于2015年，是一家专业的互联网应用提供商。我们团队的核心成员都在互联网行业奋斗多年，积累了优秀的管理和技术经验。我们不断探索提高效率和质量理论和方法，现已积累</span><b>代码自动生成框架、接口发布系统、热部署</b><span style=\"color:#3D3D3D;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\">等高质高效的产品。软件是一个复杂的过程，我们在这些积累基础之上还在努力探索，这使得我们团队内部配合相当高效，为我们服务好客户奠定了非常坚实的基础。</span> \r\n</p>\r\n<span style=\"color:#3D3D3D;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b>主要服务对象：</b><span style=\"color:#3D3D3D;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\">创业团队/个人、中小型企业</span><br />\r\n<span style=\"color:#3D3D3D;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b>莫辩文化：</b><span style=\"color:#3D3D3D;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\">立德厚技</span><br />\r\n<span style=\"color:#3D3D3D;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b>公司愿景：</b><span style=\"color:#3D3D3D;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\">让企业和个人能享受低价高质高效的互联网应用定制服务</span><br />\r\n<span style=\"color:#3D3D3D;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b>莫辩目标：</b><span style=\"color:#3D3D3D;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\">互联网应用一流提供商</span>', '100', 'ST01', '2016-01-13 22:57:19');
