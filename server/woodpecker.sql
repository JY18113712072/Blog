-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2022-10-10 16:15:38
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28
#设置客户端连接服务器端的编码
set names utf8;
#丢弃数据库 如果存在
drop database if exists woodpeckerdb;
#创建数据库
create database woodpeckerdb charset=utf8;
#进入数据库
use woodpeckerdb;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00"; 


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `woodpeckerdb`
--

-- --------------------------------------------------------

--
-- 表的结构 `address`
--

CREATE TABLE `address` (
  `aid` int(11) NOT NULL COMMENT '地址ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `phone` varchar(11) CHARACTER SET utf8 NOT NULL COMMENT '手机号',
  `province` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '省份',
  `city` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '城市',
  `county` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '县',
  `address` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '详细地址',
  `isDefault` int(11) DEFAULT '1' COMMENT '是否默认地址',
  `areaCode` varchar(32)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `cid` varchar(15) NOT NULL COMMENT '服务类ID',
  `classid` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '职能id',
  `cname` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '服务类别'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`cid`, `classid`, `cname`) VALUES
('c01', 'cl3', '家电清洁'),
('c02', 'cl1', '家电维修'),
('c03', 'cl1', '管道疏通'),
('c04', 'cl1', '水电维修'),
('c05', 'cl3', '清洁杀菌'),
('c06', 'cl2', '商用设备'),
('c07', 'cl1', '防水补漏'),
('c08', 'cl3', '门窗维保'),
('c09', 'cl3', '家居维保 '),
('c10', 'cl2', '家电安装'),
('c11', 'cl2', '瓷砖地板'),
('c12', 'cl2', '厨卫改造');

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE `comments` (
  `coid` int(11) NOT NULL COMMENT '评价ID',
  `pid` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '服务ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `satisfaction` int(11) NOT NULL COMMENT '满意度',
  `comment` mediumtext CHARACTER SET utf8 COMMENT '评价详情',
  `pictrue` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片',
  `publishTime` datetime NOT NULL COMMENT '发布时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`coid`, `pid`, `uid`, `satisfaction`, `comment`, `pictrue`, `publishTime`) VALUES
(1, 's01', 1, 4, '服务态度很好，下次还会再下单！', 'commentimg/jiadian/01_01.jpg', '2021-12-23 00:00:00'),
(2, 's01', 2, 3, '服务态度太差了，永不再下单！', 'commentimg/jiadian/01_02.jpg', '2021-04-11 00:00:00'),
(3, 's01', 3, 5, '哈哈哈哈哈哈哈哈哈哈哈，太好用了吧，推荐！', 'commentimg/jiadian/01_01.jpg', '2021-04-11 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `emp`
--

CREATE TABLE `emp` (
  `eid` int(11) NOT NULL COMMENT '员工ID',
  `ename` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '员工名',
  `phone` varchar(11) CHARACTER SET utf8 NOT NULL COMMENT '手机号',
  `classid` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '职能ID',
  `ordercount` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '接单数量',
  `isBlack` int(11) NOT NULL DEFAULT '0' COMMENT '是否拉黑'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `emp`
--

INSERT INTO `emp` (`eid`, `ename`, `phone`, `classid`, `ordercount`, `isBlack`) VALUES
(1, '西门吹风', '15213540421', 'cl1', '4', 0),
(2, '赵三枪', '14313540422', 'cl1', '2', 0),
(3, '马尔扎哈', '15213540421', 'cl1', '1', 0),
(4, '德莱厄斯', '13213540421', 'cl1', '3', 1),
(5, '盖伦', '17213540421', 'cl1', '0', 1),
(6, '卡兹克', '1598658225', 'cl3', '2', 0),
(7, '沃里克', '1396552586', 'cl3', '2', 0),
(8, '李青', '1553220255', 'cl3', '2', 0),
(9, '亚索', '15986245879', 'cl3', '2', 0),
(10, '遁地兽', '13365897520', 'cl3', '2', 0),
(11, '迅捷蟹', '15223654789', 'cl2', '2', 0),
(12, '马里奥', '18156425892', 'cl2', '2', 0),
(13, '奥恩', '15987456325', 'cl2', '2', 0),
(14, '稻草人', '13125648695', 'cl2', '2', 0),
(15, '楚雨荨', '15478952456', 'cl2', '2', 0);

-- --------------------------------------------------------

--
-- 表的结构 `homepage`
--

CREATE TABLE `homepage` (
  `hid` int(11) NOT NULL COMMENT 'ID',
  `cid` varchar(15) NOT NULL COMMENT '服务ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `guarTime` varchar(15) NOT NULL COMMENT '保修时间',
  `detail` text NOT NULL COMMENT '描述',
  `price` varchar(15) NOT NULL COMMENT '价格',
  `pictrue` varchar(30) NOT NULL COMMENT '图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `homepage`
--

INSERT INTO `homepage` (`hid`, `cid`, `title`, `guarTime`, `detail`, `price`, `pictrue`) VALUES
(1, 'c01', '油烟机清洗（拆机洗）', '保修30天', '【强力除油污】告别油垢顽渍，尽享烹饪乐趣。', '198.00', 'img/homepages/yyjqx.jpg'),
(2, 'c01', '波轮洗衣机清洗（拆机）', '保修30天', '【除霉除污垢】去除洗衣桶内壁细菌，杜绝衣物二次污染', '189.00', 'img/homepages/blxyjqx.png'),
(3, 'c01', '滚筒洗衣机清洗（不拆机）', '保修30天', '【除冰祛异味】冰箱定期洗，食材才新鲜！', '158.00', 'img/homepages/gtxyjqx.jpg'),
(4, 'c01', '冰箱清洗【单/双（上下）开门】', '保修30天', '【除冰祛异味】冰箱定期洗，食材才新鲜！', '138.00', 'img/homepages/bxqx.jpg'),
(5, 'c02', '燃气热水器维修', '保修90天', '保修90天·快速响应·维修计价器报价·修不好不收费', '88.', 'img/homepages/rqrsqwx.jpg'),
(6, 'c02', '电视维修', '保修90天', '保修90天·快速响应·维修计价器报价·修不好不收费', '98', 'img/homepages/dswx.jpg'),
(7, 'c02', '燃气灶维修', '保修90天', '保修90天·快速响应·维修计价器报价·修不好不收费', '78', 'img/homepages/rqzwx.jpg'),
(8, 'c02', '微波炉维修', '保修90天', '保修90天·快速响应·维修计价器报价·修不好不收费', '30', 'img/homepages/wblwx.jpg'),
(9, 'c03', '地漏疏通', '标准报价', '不通不收费·快速响应·维修计价器报价', '156.00', 'img/homepages/dlst.jpg'),
(10, 'c03', '马桶疏通', '标准报价', '不通不收费·快速响应·维修计价器报价', '156.00', 'img/homepages/mtst.png'),
(11, 'c03', '洗菜盆疏通', '标准报价', '不通不收费·快速响应·维修计价器报价', '156.00', 'img/homepages/xcpst.jpg'),
(12, 'c03', '蹲便疏通', '标准报价', '不通不收费·快速响应·维修计价器报价', '156.00', 'img/homepages/dbst.jpg'),
(13, 'c04', '管道工程业务', '保修30天', '不通不收费  ·快速响应·维修计价器报价', '30', 'img/homepages/gdgcyw.jpg'),
(14, 'c04', '水管维修', '保修30天', '上门费30元，线上预约服务无需支付任何费用，具体价格工程师上门后，请您使用计价器核算。', '30', 'img/homepages/sgwx.png'),
(15, 'c04', '电路安装维修', '保修30天', '保修30天·快速响应·维修计价器报价·修不好不收费', '30', 'img/homepages/dlazwx.jpg'),
(16, 'c04', '开关插座安装、维修', '保修30天', '保修30天·快速响应·维修计价器报价', '30', 'img/homepages/kgcz.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `oid` int(15) NOT NULL COMMENT '订单ID',
  `pid` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '服务类ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `eid` int(11) DEFAULT NULL COMMENT '员工ID',
  `cid` varchar(15) NOT NULL COMMENT '服务类ID',
  `orderState` int(2) DEFAULT '0' COMMENT '订单状态',
  `createTime` datetime DEFAULT NULL COMMENT '订单创建时间',
  `oaddress` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单地址',
  `subscribeTime` datetime DEFAULT NULL COMMENT '预约时间',
  `note` text CHARACTER SET utf8 COMMENT '备注',
  `finishTimer` datetime DEFAULT NULL COMMENT '订单完成时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`oid`, `pid`, `uid`, `eid`, `cid`, `orderState`, `createTime`, `oaddress`, `subscribeTime`, `note`, `finishTimer`) VALUES
(1, 's01', 1, 1, 'c01', 3, '2022-01-04 11:30:00', '四川省成都市双流区温哥华花园23栋1205', '2022-01-05 11:30:00', '晚点上门，如果没人请打电话', '2022-01-06 11:30:00'),
(2, 's01', 1, 1, 'c01', 2, '2022-01-04 11:30:00', '四川省成都市双流区温哥华花园23栋1205', '2022-01-05 11:30:00', '晚点上门，如果没人请打电话', '2022-01-06 11:30:00'),
(3, 's02', 2, 2, 'c02', 1, '2022-02-06 03:18:59', '四川省攀枝花市双流区温哥华花园23栋1205', '2022-02-07 03:18:59', '如果没人请打电话', '2022-02-08 03:18:59'),
(4, 's03', 3, 1, 'c03', 1, '2022-03-16 04:23:23', '四川省攀枝花市双流区温哥华花园23栋1205', '2022-03-17 04:23:23', '如果没人请打电话!', '2022-03-18 04:23:23'),
(5, 's04', 4, 2, 'c05', 3, '2022-04-16 03:18:59', '重庆市攀枝花市双流区温哥华花园23栋1205', '2022-04-17 03:18:59', '早点上门，不早上门差评！', '2022-04-18 03:18:59'),
(6, 's05', 5, 1, 'c11', 2, '2022-05-23 18:45:59', '贵州省贵阳市双流区温哥华花园23栋1205', '2022-05-24 18:45:59', '家里有工具，不用带了！', '2022-05-24 18:45:59'),
(7, 's06', 6, 2, 'c03', 2, '2022-06-21 03:13:00', '海南省贵阳市双流区温哥华花园23栋1205', '2022-06-22 03:13:00', '带点洗衣液上来', '2022-06-23 03:13:00');

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `pid` varchar(15) NOT NULL COMMENT '服务ID',
  `cid` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '服务类ID',
  `pname` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '服务名称',
  `isHot` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '是否热销',
  `detail` text CHARACTER SET utf8 COMMENT '描述',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `pictrue` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片',
  `hotPictrue` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '热销图片',
  `banPic` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '轮播图片',
  `dePic` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '详情 图片',
  `isOnline` varchar(2) CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '是否上线'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`pid`, `cid`, `pname`, `isHot`, `detail`, `price`, `pictrue`, `hotPictrue`, `banPic`, `dePic`, `isOnline`) VALUES
('s01', 'c02', '空调', '家电报修', '', 265, 'img/jiadian/kt.png', 'img/jiadian/ktwx.png', '/cimg/jiadian/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s02', 'c02', '冰箱', '家电报修', '冰箱结冰/漏水/不制冷/发烫/加制冷剂等故障上门检测上门检测维修', 269, 'img/jiadian/bx.png', 'img/jiadian/bxwx.png', '/cimg/jiadian/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s03', 'c02', '洗衣机', '家电报修', '洗衣机不进水/不存水/不脱水/开机跳闸等故障上门检测维修', 225, 'img/jiadian/xyj.png', 'img/jiadian/xyjwx.png', '/cimg/jiadian/03.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/03.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s04', 'c02', '电视', '拒绝小病大修', '电视黑屏/图像异常/系统升级/屏幕损坏/声音异常等故障上门检测维修', 200, 'img/jiadian/ds.png', 'img/jiadian/dswx.png', '/cimg/jiadian/04.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/04.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s05', 'c02', '热水器', '拒绝小病大修', '', 198, 'img/jiadian/rsq.png', 'img/jiadian/rsqwx.png', '/cimg/jiadian/05.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/05.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s06', 'c02', '燃气灶', '拒绝小病大修', '燃气灶打不着火/自动熄灭/漏气等故障上门检测维修', 269, 'img/jiadian/rqz.png', 'img/jiadian/rqzwx.png', '/cimg/jiadian/06.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/06.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s07', 'c02', '油烟机', '清洗单品', '油烟机噪音大/不抽烟/漏油等故障上门检测维修', 225, 'img/jiadian/yyj.png', 'img/jiadian/yyjqx.png', '/cimg/jiadian/07.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/07.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s08', 'c02', '微波炉', '', '', 186, 'img/jiadian/wbl.png', '', '/cimg/jiadian/08.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/08.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s09', 'c02', '饮水机', '', '', 152, 'img/jiadian/ysj.png', '', '/cimg/jiadian/09.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/09.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s10', 'c02', '电饭煲', '', '', 186, 'img/jiadian/dfb.png', '', '/cimg/jiadian/10.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/10.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s100', 'c03', '洗菜盆疏通', '', '', 265, 'img/guandao/01.png', '', '/cimg/guandao/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/guandao/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s101', 'c03', '洗手盆疏通', '', '', 269, 'img/guandao/02.png', '', '/cimg/guandao/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/guandao/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s102', 'c03', '蹲便', '', '', 265, 'img/guandao/03.png', '', '/cimg/guandao/03.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/guandao/03.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s103', 'c03', '马桶疏通', '', '', 269, 'img/guandao/04.png', '', '/cimg/guandao/04.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/guandao/04.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s104', 'c03', '地漏', '', '', 265, 'img/guandao/05.png', '', '/cimg/guandao/05.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/guandao/05.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s105', 'c03', '管道', '', '', 269, 'img/guandao/06.png', '', '/cimg/guandao/06.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/guandao/06.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s106', 'c03', '浴缸疏通', '', '', 265, 'img/guandao/07.png', '', '/cimg/guandao/07.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/guandao/07.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s107', 'c03', '水管清洗', '', '', 269, 'img/guandao/08.png', '', '/cimg/guandao/08.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/guandao/08.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s108', 'c03', '小便斗疏通', '', '', 265, 'img/guandao/09.png', '', '/cimg/guandao/09.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/guandao/09.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s109', 'c10', '空调', '清洗单品', '', 265, 'img/jiadian/kt.png', 'img/jiadian/gtxyj.png', '/cimg/jdanzhuang/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s11', 'c02', '蒸包机', '', '', 125, 'img/jiadian/zbj.png', '', '/cimg/jiadian/11.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/11.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s110', 'c10', '冰箱', '除湿除霉享清洁', '上门费30元，线上预约服务无需支付任何费用，具体价格由工程师上门后按照统一标准报价', 269, 'img/jiadian/bx.png', 'img/jiadian/ktqx.png', '/cimg/jdanzhuang/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s111', 'c10', '洗衣机', '清洗单品', '上门费30元，具体价格见价格表或工程师报价。疫情期间，有门禁限制的用户，请提前协调确认工程师可上门', 265, 'img/jiadian/xyj.png', 'img/jiadian/xyjqx.png', '/cimg/jdanzhuang/03.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/03.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s112', 'c10', '电视', '', '上门费30元，线上预约服务无需支付任何费用，具体价格由工程师上门后按照统一标准报价', 186, 'img/jiadian/ds.png', '', '/cimg/jdanzhuang/04.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/04.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s113', 'c10', '热水器', '除湿除霉享清洁', '', 225, 'img/jiadian/rsq.png', 'img/jiadian/drsqqx.png', '/cimg/jdanzhuang/05.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/05.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s114', 'c10', '燃气灶', '', '', 186, 'img/jiadian/rqz.png', '', '/cimg/jdanzhuang/06.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/06.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s115', 'c10', '油烟机', '除湿除霉享清洁', '上门费30元，线上预约服务无需支付任何费用，具体价格由工程师上门后按照统一标准报价', 265, 'img/jiadian/yyj.png', 'img/jiadian/rqrsqqx.png', '/cimg/jdanzhuang/07.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/07.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s116', 'c10', '洗碗机', '', '', 186, 'img/jiadian/xwj.png', '', '/cimg/jdanzhuang/08.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/08.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s117', 'c10', '消毒柜', '', '', 198, 'img/jiadian/xdg.png', '', '/cimg/jdanzhuang/09.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/09.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s118', 'c10', '电热水龙头', '', '', 186, 'img/jiadian/slt.png', '', '/cimg/jdanzhuang/10.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/10.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s119', 'c10', '净水器', '', '', 225, 'img/jiadian/jsq.png', '', '/cimg/jdanzhuang/11.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/11.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s12', 'c02', '消毒柜', '', '', 150, 'img/jiadian/xdg.png', '', '/cimg/jiadian/12.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/12.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s120', 'c10', '干手器', '', '', 166, 'img/jiadian/gsq.png', '', '/cimg/jdanzhuang/12.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/12.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s121', 'c10', '按摩椅', '', '', 225, 'img/jiadian/amy.png', '', '/cimg/jdanzhuang/13.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/13.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s122', 'c10', '跑步机', '', '', 186, 'img/jiadian/pbj.png', '', '/cimg/jdanzhuang/14.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdanzhuang/14.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s123', 'c11', '瓷砖修补', '', '', 286, 'img/cizhuan/01.jpg', '', '/cimg/cizhuan/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/cizhuan/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s124', 'c11', '瓷砖美缝', '', '', 269, 'img/cizhuan/02.png', '', '/cimg/cizhuan/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/cizhuan/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s125', 'c11', '木地板修复', '', '', 265, 'img/cizhuan/03.jpg', '', '/cimg/cizhuan/03.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/cizhuan/03.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s126', 'c11', '石材修复', '', '', 269, 'img/cizhuan/04.jpg', '', '/cimg/cizhuan/04.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/cizhuan/04.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s127', 'c11', '踢脚线更换', '', '', 265, 'img/cizhuan/05.jpg', '', '/cimg/cizhuan/05.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/cizhuan/05.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s128', 'c12', '卫生间整体改造', '房屋维修', '', 589, 'img/chuwei/01.jpg', 'img/chuwei/qmjusx.png', '/cimg/chuwei/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/chuwei/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s129', 'c12', '卫生间局部改造', '房屋维修', '', 569, 'img/chuwei/02.jpg', 'img/chuwei/smjc.png', '/cimg/chuwei/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/chuwei/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s13', 'c02', '咖啡机', '', '', 142, 'img/jiadian/kfj.png', '', '/cimg/jiadian/11.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/11.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s130', 'c12', '厨房整体改造', '房屋维修', '', 689, 'img/chuwei/03.jpg', 'img/chuwei/wsjbj.png', '/cimg/chuwei/03.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/chuwei/03.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s131', 'c12', '厨房局部改造', '', '', 599, 'img/chuwei/04.jpg', '', '/cimg/chuwei/04.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/chuwei/04.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s14', 'c02', '空气净化器', '', '', 166, 'img/jiadian/kqjhq.png', '', '/cimg/jiadian/14.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/14.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s15', 'c02', '地暖', '', '', 265, 'img/jiadian/dn.png', '', '/cimg/jiadian/15.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/15.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s16', 'c02', '甩干机', '', '', 186, 'img/jiadian/sgj.png', '', '/cimg/jiadian/16.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/16.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s17', 'c02', '吸尘器', '', '', 123, 'img/jiadian/xcq.png', '', '/cimg/jiadian/17.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/17.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s18', 'c02', '取暖器', '', '', 110, 'img/jiadian/qnq.png', '', '/cimg/jiadian/18.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/18.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s19', 'c02', '净水器', '', '', 150, 'img/jiadian/jsq.png', '', '/cimg/jiadian/19.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/19.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s20', 'c02', '空调扇', '', '', 150, 'img/jiadian/kts.png', '', '/cimg/jiadian/20.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/20.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s21', 'c02', '回水器', '', '', 265, 'img/jiadian/hsq.png', '', '/cimg/jiadian/21.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/21.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s22', 'c02', '按摩椅', '', '', 166, 'img/jiadian/amy.png', '', '/cimg/jiadian/22.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/22.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s23', 'c02', '跑步机', '', '', 220, 'img/jiadian/pbj.png', '', '/cimg/jiadian/23.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/23.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s24', 'c02', '冰柜', '', '', 166, 'img/jiadian/bg.png', '', '/cimg/jiadian/24.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/24.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s25', 'c02', '冷藏展示柜', '', '', 198, 'img/jiadian/lczsg.png', '', '/cimg/jiadian/25.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/25.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s26', 'c02', '自动贩卖机', '', '', 166, 'img/jiadian/zdfmj.png', '', '/cimg/jiadian/26.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jiadian/26.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s27', 'c01', '空调', '', '', 225, 'img/jiadian/kt.png', '', '/cimg/jdqj/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s28', 'c01', '冰箱', '', '', 190, 'img/jiadian/bx.png', '', '/cimg/jdqj/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s29', 'c01', '洗衣机', '', '', 198, 'img/jiadian/xyj.png', '', '/cimg/jdqj/03.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/03.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s30', 'c01', '热水器', '', '', 252, 'img/jiadian/rsq.png', '', '/cimg/jdqj/04.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/04.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s31', 'c01', '燃气灶', '', '', 225, 'img/jiadian/rqz.png', '', '/cimg/jdqj/05.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/05.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s32', 'c01', '油烟机', '', '', 230, 'img/jiadian/yyj.png', '', '/cimg/jdqj/06.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/06.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s33', 'c01', '微波炉', '', '', 198, 'img/jiadian/wbl.png', '', '/cimg/jdqj/07.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/07.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s34', 'c01', '饮水机', '', '', 99, 'img/jiadian/ysj.png', '', '/cimg/jdqj/08.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/08.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s35', 'c01', '地暖', '', '', 225, 'img/jiadian/dn.png', '', '/cimg/jdqj/09.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/09.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s36', 'c01', '空调套餐', '', '', 369, 'img/jiadian/kttc.png', '', '/cimg/jdqj/10.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/10.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s37', 'c01', '厨房套餐', '', '', 389, 'img/jiadian/cftc.png', '', '/cimg/jdqj/11.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/11.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s38', 'c01', '任意组合套餐', '', '', 588, 'img/jiadian/ryzhtc.png', '', '/cimg/jdqj/12.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/jdqj/12.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s39', 'c09', '电脑桌', '', '', 178, 'img/jiadian/dnz.png', '', '/cimg/weibao/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/weibao/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s40', 'c09', '餐桌', '', '', 150, 'img/jiadian/cz.png', '', '/cimg/weibao/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/weibao/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s41', 'c09', '化妆桌', '', '', 152, 'img/jiadian/hzz.png', '', '/cimg/weibao/03.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/weibao/03.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s42', 'c09', '沙发翻新', '', '', 264, 'img/jiadian/sffx.png', '', '/cimg/weibao/04.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/weibao/04.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s43', 'c09', '桌椅补漆', '', '', 265, 'img/jiadian/zybq.png', '', '/cimg/weibao/05.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/weibao/05.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s44', 'c09', '柜类补漆', '', '', 269, 'img/jiadian/glbq.png', '', '/cimg/weibao/06.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/weibao/06.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s45', 'c08', '纱窗', '', '', 198, 'img/menchuang/sc.png', '', '/cimg/menchuang/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s46', 'c08', '木窗', '', '', 186, 'img/menchuang/mc.png', '', '/cimg/menchuang/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s47', 'c08', '铝合金窗', '', '', 152, 'img/menchuang/lhjc.png', '', '/cimg/menchuang/03.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/03.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s48', 'c08', '塑料(钢)门窗组装', '', '', 235, 'img/menchuang/slg.png', '', '/cimg/menchuang/04.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/04.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s49', 'c08', '木门', '', '', 289, 'img/menchuang/mm.png', '', '/cimg/menchuang/05.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/05.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s50', 'c08', '防盗门', '', '', 589, 'img/menchuang/fdm.png', '', '/cimg/menchuang/06.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/06.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s51', 'c08', '折叠门', '', '', 489, 'img/menchuang/zdm.png', '', '/cimg/menchuang/07.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/07.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s52', 'c08', '玻璃门', '', '', 498, 'img/menchuang/blm.png', '', '/cimg/menchuang/08.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/08.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s53', 'c08', '铝合金门', '', '', 488, 'img/menchuang/lhjm.png', '', '/cimg/menchuang/09.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/09.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s54', 'c08', '防火门', '', '', 566, 'img/menchuang/fhm.png', '', '/cimg/menchuang/10.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/10.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s55', 'c08', '旋转门', '', '', 265, 'img/menchuang/xzm.png', '', '/cimg/menchuang/11.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/11.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s56', 'c08', '推拉门', '', '', 555, 'img/menchuang/tlm.png', '', '/cimg/menchuang/12.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/menchuang/12.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s57', 'c05', '除甲醛', '', '', 125, 'img/qingjie/01.png', '', '/cimg/qingjie/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/qingjie/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s58', 'c05', '虫害防治', '', '', 169, 'img/qingjie/02.png', '', '/cimg/qingjie/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/qingjie/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s59', 'c06', '制冷设备安装', '', '', 300, 'img/shangyong/zlsb.png', '', '/cimg/shangyong/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shangyong/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s60', 'c06', '制冷设备', '', '', 189, 'img/shangyong/zlsb.png', '', '/cimg/shangyong/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shangyong/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s61', 'c06', '工业产品', '', '', 199, 'img/shangyong/gycp.png', '', '/cimg/shangyong/03.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shangyong/03.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s62', 'c06', '热水设备', '', '', 199, 'img/shangyong/rssb.png', '', '/cimg/shangyong/04.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shangyong/04.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s63', 'c06', '厨房设备', '', '', 369, 'img/shangyong/cfsb.png', '', '/cimg/shangyong/05.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shangyong/05.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s64', 'c06', '制冷设备维修', '', '', 259, 'img/shangyong/zlsb.png', '', '/cimg/shangyong/6.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shangyong/06.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s65', 'c06', '热水设备维修', '', '', 299, 'img/shangyong/rssb.png', '', '/cimg/shangyong/07.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shangyong/07.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s66', 'c06', '厨房设备维修', '', '', 269, 'img/shangyong/cfsb.png', '', '/cimg/shangyong/08.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shangyong/08.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s67', 'c06', '中央空调维保', '', '', 269, 'img/shangyong/zykt.png', '', '/cimg/shangyong/09.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shangyong/09.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s68', 'c07', '游泳池防水', '', '', 423, 'img/fangshui/01.png', '', '/cimg/fangshui/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s69', 'c07', '其他工程防水', '', '', 459, 'img/fangshui/02.png', '', '/cimg/fangshui/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s70', 'c07', '卫生间防水', '', '', 300, 'img/fangshui/03.jpg', '', '/cimg/fangshui/03.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/03.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s71', 'c07', '厨房防水', '', '', 321, 'img/fangshui/04.jpg', '', '/cimg/fangshui/04.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/04.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s72', 'c07', '阳台防水', '', '', 300, 'img/fangshui/05.jpg', '', '/cimg/fangshui/05.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/05.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s73', 'c07', '窗台防水', '', '', 300, 'img/fangshui/06.png', '', '/cimg/fangshui/06.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/06.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s74', 'c07', '屋顶防水', '', '', 265, 'img/fangshui/07.jpg', '', '/cimg/fangshui/07.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/07.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s75', 'c07', '外墙防水', '', '', 589, 'img/fangshui/08.png', '', '/cimg/fangshui/08.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/08.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s76', 'c07', '地下室防水', '', '', 456, 'img/fangshui/09.png', '', '/cimg/fangshui/09.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/09.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s77', 'c07', '其他防水', '', '', 456, 'img/fangshui/10.jpg', '', '/cimg/fangshui/10.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/10.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s78', 'c07', '精准侧漏', '', '', 465, 'img/fangshui/11.png', '', '/cimg/fangshui/11.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/11.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s79', 'c07', '外墙平台防水', '', '', 695, 'img/fangshui/12.jpg', '', '/cimg/fangshui/12.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/fangshui/12.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s80', 'c04', '淋浴房', '', '', 299, 'img/shuidian/lyf.png', '', '/cimg/shuidian/01.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/01.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s81', 'c04', '淋浴花洒', '', '', 169, 'img/shuidian/lyhs.png', '', '/cimg/shuidian/02.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/02.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s82', 'c04', '洗菜盆', '', '', 125, 'img/shuidian/xcp.png', '', '/cimg/shuidian/03.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/03.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s83', 'c04', '洗手盆', '安装拆卸维修', '', 125, 'img/shuidian/xsp.png', 'img/shuidian/xspwx.png', '/cimg/shuidian/04.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/04.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s84', 'c04', '洗衣槽', '', '', 125, 'img/shuidian/xyc.png', '', '/cimg/shuidian/05.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/05.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s85', 'c04', '浴缸', '', '', 136, 'img/shuidian/yg.png', '', '/cimg/shuidian/06.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/06.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s86', 'c04', '浴室柜', '', '', 139, 'img/shuidian/ysg.png', '', '/cimg/shuidian/07.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/07.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s87', 'c04', '洗漱台', '', '', 139, 'img/shuidian/xst.png', '', '/cimg/shuidian/08.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/08.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s88', 'c04', '电路', '安装拆卸维修', '', 264, 'img/shuidian/dl.png', 'img/shuidian/dlwx.png', '/cimg/shuidian/09.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/09.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s89', 'c04', '灯具', '', '', 148, 'img/shuidian/dj.png', '', '/cimg/shuidian/10.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/10.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s90', 'c04', '110V的电压电器', '', '', 189, 'img/shuidian/dydq.png', '', '/cimg/shuidian/11.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/11.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s91', 'c04', '浴霸', '', '', 120, 'img/shuidian/yb.png', '', '/cimg/shuidian/12.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/12.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s92', 'c04', '水管', '', '', 150, 'img/shuidian/sg.png', '', '/cimg/shuidian/13.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/13.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s93', 'c04', '马桶', '安装拆卸维修', '', 156, 'img/shuidian/mt.png', 'img/chuwei/mtaz.png', '/cimg/shuidian/14.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '', '1'),
('s94', 'c04', '小便器', '', '', 189, 'img/shuidian/xbq.png', '', '/cimg/shuidian/15.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/15.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s95', 'c04', '蹲便器', '', '', 169, 'img/shuidian/dbq.png', '', '/cimg/shuidian/16.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/16.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s96', 'c04', '换气扇', '', '', 125, 'img/shuidian/hqs.png', '', '/cimg/shuidian/17.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/17.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s97', 'c04', '晾衣杆', '', '', 110, 'img/shuidian/lyg.png', '', '/cimg/shuidian/18.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/18.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s98', 'c04', '窗帘浴帘', '', '', 265, 'img/shuidian/cl.png', '', '/cimg/shuidian/19.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/19.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1'),
('s99', 'c04', '五金挂件', '', '', 186, 'img/shuidian/gj.png', '', '/cimg/shuidian/20.jpg;/cimg/common/01.jpg;/cimg/common/02.jpg;/cimg/common/03.jpg', '/dimg/shuidian/20.jpg;/dimg/common/01.jpg;/dimg/common/02.jpg;/dimg/common/03.jpg;/dimg/common/04.jpg;/dimg/common/05.jpg', '1');


-- --------------------------------------------------------

--
-- 表的结构 `productspec`
--

CREATE TABLE `productspec` (
  `psid` int(11) NOT NULL COMMENT 'ID',
  `pid` varchar(15) NOT NULL COMMENT '产品ID',
  `classify` int(11) DEFAULT '0' COMMENT '类型',
  `item` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `productspec`
--

INSERT INTO `productspec` (`psid`, `pid`, `classify`, `item`) VALUES
(1, 's01', 0, '简单维修+98~148元/台'),
(2, 's01', 1, '漏电保护器+118元/个'),
(3, 's02', 0, '简单维修+88~218元/台'),
(4, 's02', 1, '厨卫保鲜盒+28~48元/包'),
(5, 's03', 0, '简单维修+88~158元/台'),
(6, 's03', 1, '漏电保护器+118元/个');

-- --------------------------------------------------------

--
-- 表的结构 `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `gid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` varchar(15) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `shoppingcart`
--

INSERT INTO `shoppingcart` (`gid`, `uid`, `pid`) VALUES
(1, 1, 's01'),
(2, 1, 's02'),
(3, 1, 's03'),
(4, 1, 's04'),
(5, 2, 's05'),
(6, 2, 's06'),
(7, 2, 's07'),
(8, 2, 's08');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `uname` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `upwd` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 NOT NULL COMMENT '手机号',
  `email` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '邮箱',
  `genter` varchar(4) CHARACTER SET utf8 NOT NULL COMMENT '性别',
  `isBlack` int(11) NOT NULL DEFAULT '0' COMMENT '是否拉黑'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `uname`, `upwd`, `phone`, `email`, `genter`, `isBlack`) VALUES
(1, '我们一起看月亮爬上来', '123456', '17745107810', '3433215922@qq.com', '0', 0),
(2, '失眠飞行', '123456', '16645107811', '1433215921@qq.com', '0', 0),
(3, '开心得像个200斤的孩子', '123456', '17745107812', '2433215923@qq.com', '0', 1),
(4, '脉动的脉搏', '123456', '18845107813', '6433215924@qq.com', '0', 0),
(5, '啊对对对', '123456', '13345107814', '1433215925@qq.com', '1', 0),
(6, '价钱50%，给你五彩斑斓的黑', '123456', '14245107815', '4433215926@qq.com', '1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`coid`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `homepage`
--
ALTER TABLE `homepage`
  ADD PRIMARY KEY (`hid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `productspec`
--
ALTER TABLE `productspec`
  ADD PRIMARY KEY (`psid`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `address`
--
ALTER TABLE `address`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址ID';
--
-- 使用表AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `coid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `emp`
--
ALTER TABLE `emp`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工ID', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `homepage`
--
ALTER TABLE `homepage`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int(15) NOT NULL AUTO_INCREMENT COMMENT '订单ID', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `productspec`
--
ALTER TABLE `productspec`
  MODIFY `psid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `shoppingcart`
--
ALTER TABLE `shoppingcart`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- 插入地址表值
insert into address values(null,1,'爸爸','17745107810','河北省','石家庄市','长安区','明日之子小区B栋6-12',1,'130102');
insert into address values(null,1,'妈妈','17745107810','北京市','北京市','西城区','幸福小区A栋6-12',0,'110102');
insert into address values(null,1,'孩子','17745107810','天津市','天津市','和平区','天鹅湖小区23栋0102',0,'120101');
insert into address values(null,1,'奶奶','17745107810','北京市','北京市','西城区','西航港街道A栋',0,'110102');
