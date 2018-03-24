-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.17-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 proxypool 的数据库结构
CREATE DATABASE IF NOT EXISTS `proxypool` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `proxypool`;

-- 导出  表 proxypool.free_proxy 结构
CREATE TABLE IF NOT EXISTS `free_proxy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID，自增',
  `IP` varchar(50) NOT NULL COMMENT 'IP地址',
  `Port` int(11) NOT NULL COMMENT '端口',
  `ProxyType` int(11) NOT NULL COMMENT '代理的类型',
  `ProxyPriority` int(11) NOT NULL COMMENT '优先级',
  `IsValid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效，0：无效，1：有效',
  `VerifyTime` datetime NOT NULL COMMENT '验证时间',
  `UpdateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `ProxyPriority` (`ProxyPriority`,`VerifyTime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  proxypool.free_proxy 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `free_proxy` DISABLE KEYS */;
INSERT INTO `free_proxy` (`ID`, `IP`, `Port`, `ProxyType`, `ProxyPriority`, `IsValid`, `VerifyTime`, `UpdateTime`) VALUES
	(1, '192.168.1.1', 8080, 1, 1, 1, '2018-03-24 17:01:21', '2018-03-24 17:01:21'),
	(2, '192.168.1.3', 8080, 2, 1, 1, '2018-03-24 17:01:21', '2018-03-24 17:01:21'),
	(3, '192.168.1.4', 8080, 3, 1, 1, '2018-03-24 17:01:21', '2018-03-24 17:01:21');
/*!40000 ALTER TABLE `free_proxy` ENABLE KEYS */;

-- 导出  表 proxypool.proxy_log 结构
CREATE TABLE IF NOT EXISTS `proxy_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `Type` int(11) NOT NULL COMMENT '代理的类型',
  `Host` varchar(50) NOT NULL DEFAULT '' COMMENT '访问的域名',
  `ProxyID` int(11) NOT NULL COMMENT '代理ID',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '访问的时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录代理使用的日志';

-- 正在导出表  proxypool.proxy_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `proxy_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_log` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
