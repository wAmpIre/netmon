-- phpMyAdmin SQL Dump
-- version 3.2.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 01, 2010 at 09:49 PM
-- Server version: 5.1.49
-- PHP Version: 5.3.2-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `freifunksql5`
--

-- --------------------------------------------------------

--
-- Table structure for table `chipsets`
--
-- Creation: Apr 27, 2010 at 08:43 PM
-- Last update: May 02, 2010 at 07:01 PM
-- Last check: Jul 05, 2010 at 11:43 PM
--

DROP TABLE IF EXISTS `chipsets`;
CREATE TABLE IF NOT EXISTS `chipsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crawl_batman_advanced_interfaces`
--
-- Creation: Apr 23, 2010 at 04:41 PM
-- Last update: Nov 01, 2010 at 09:48 PM
-- Last check: Sep 21, 2010 at 05:31 PM
--

DROP TABLE IF EXISTS `crawl_batman_advanced_interfaces`;
CREATE TABLE IF NOT EXISTS `crawl_batman_advanced_interfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `router_id` int(11) NOT NULL,
  `crawl_cycle_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `crawl_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crawl_batman_advanced_originators`
--
-- Creation: Apr 23, 2010 at 04:30 PM
-- Last update: Nov 01, 2010 at 09:45 PM
-- Last check: Sep 21, 2010 at 05:31 PM
--

DROP TABLE IF EXISTS `crawl_batman_advanced_originators`;
CREATE TABLE IF NOT EXISTS `crawl_batman_advanced_originators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `router_id` int(11) NOT NULL,
  `crawl_cycle_id` int(11) NOT NULL,
  `originators` text NOT NULL,
  `crawl_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crawl_cycle`
--
-- Creation: Apr 23, 2010 at 10:35 AM
-- Last update: Nov 01, 2010 at 09:45 PM
-- Last check: Sep 21, 2010 at 05:31 PM
--

DROP TABLE IF EXISTS `crawl_cycle`;
CREATE TABLE IF NOT EXISTS `crawl_cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crawl_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crawl_data`
--
-- Creation: Mar 13, 2010 at 07:11 PM
-- Last update: Jul 05, 2010 at 11:43 PM
-- Last check: Jul 05, 2010 at 11:43 PM
--

DROP TABLE IF EXISTS `crawl_data`;
CREATE TABLE IF NOT EXISTS `crawl_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `crawl_time` datetime NOT NULL,
  `ping` varchar(8) NOT NULL,
  `status` varchar(8) NOT NULL,
  `nickname` varchar(15) NOT NULL,
  `hostname` varchar(15) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `location` varchar(60) NOT NULL,
  `prefix` varchar(7) DEFAULT NULL,
  `ssid` varchar(30) DEFAULT NULL,
  `longitude` varchar(15) DEFAULT NULL,
  `latitude` varchar(15) DEFAULT NULL,
  `luciname` varchar(40) DEFAULT NULL,
  `luciversion` varchar(10) DEFAULT NULL,
  `distname` varchar(20) DEFAULT NULL,
  `distversion` varchar(30) DEFAULT NULL,
  `chipset` varchar(20) NOT NULL,
  `cpu` varchar(15) DEFAULT NULL,
  `network` text NOT NULL,
  `wireless_interfaces` text NOT NULL,
  `uptime` varchar(15) NOT NULL,
  `idletime` varchar(15) NOT NULL,
  `memory_total` varchar(8) NOT NULL,
  `memory_caching` varchar(8) NOT NULL,
  `memory_buffering` varchar(8) NOT NULL,
  `memory_free` varchar(8) NOT NULL,
  `loadavg` varchar(5) NOT NULL,
  `processes` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crawl_interfaces`
--
-- Creation: Jul 25, 2010 at 03:25 PM
-- Last update: Nov 01, 2010 at 09:49 PM
-- Last check: Sep 21, 2010 at 05:31 PM
--

DROP TABLE IF EXISTS `crawl_interfaces`;
CREATE TABLE IF NOT EXISTS `crawl_interfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crawl_id` int(11) NOT NULL,
  `router_id` int(11) NOT NULL,
  `crawl_cycle_id` int(11) NOT NULL,
  `crawl_date` datetime NOT NULL,
  `name` varchar(100) NOT NULL,
  `mac_addr` varchar(150) NOT NULL,
  `ipv4_addr` varchar(40) NOT NULL,
  `ipv6_addr` varchar(150) NOT NULL,
  `ipv6_link_local_addr` varchar(200) NOT NULL,
  `traffic_rx` int(11) NOT NULL,
  `traffic_tx` int(11) NOT NULL,
  `wlan_mode` varchar(20) NOT NULL,
  `wlan_frequency` varchar(10) NOT NULL,
  `wlan_essid` varchar(40) NOT NULL,
  `wlan_bssid` varchar(40) NOT NULL,
  `wlan_tx_power` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crawl_olsr`
--
-- Creation: May 02, 2010 at 04:02 PM
-- Last update: Jul 15, 2010 at 02:54 AM
-- Last check: Jul 15, 2010 at 02:54 AM
--

DROP TABLE IF EXISTS `crawl_olsr`;
CREATE TABLE IF NOT EXISTS `crawl_olsr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `router_id` int(11) NOT NULL,
  `crawl_cycle_id` int(11) NOT NULL,
  `olsrd_hna` text NOT NULL,
  `olsrd_neighbors` text NOT NULL,
  `olsrd_links` text NOT NULL,
  `olsrd_mid` text NOT NULL,
  `olsrd_routes` text NOT NULL,
  `olsrd_topology` text NOT NULL,
  `crawl_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crawl_routers`
--
-- Creation: May 19, 2010 at 06:52 PM
-- Last update: Nov 01, 2010 at 09:49 PM
-- Last check: Sep 21, 2010 at 05:31 PM
--

DROP TABLE IF EXISTS `crawl_routers`;
CREATE TABLE IF NOT EXISTS `crawl_routers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `router_id` int(11) NOT NULL,
  `crawl_cycle_id` int(11) NOT NULL,
  `crawl_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `ping` varchar(20) NOT NULL,
  `hostname` varchar(40) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(250) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `luciname` varchar(40) NOT NULL,
  `luciversion` varchar(40) NOT NULL,
  `distname` varchar(40) NOT NULL,
  `distversion` varchar(40) NOT NULL,
  `chipset` varchar(20) NOT NULL,
  `cpu` varchar(100) NOT NULL,
  `memory_total` varchar(15) NOT NULL,
  `memory_caching` varchar(15) NOT NULL,
  `memory_buffering` varchar(30) NOT NULL,
  `memory_free` varchar(15) NOT NULL,
  `loadavg` varchar(8) NOT NULL,
  `processes` varchar(8) NOT NULL,
  `uptime` varchar(15) NOT NULL,
  `idletime` varchar(15) NOT NULL,
  `local_time` varchar(60) NOT NULL,
  `community_essid` varchar(100) NOT NULL,
  `community_nickname` varchar(100) NOT NULL,
  `community_email` varchar(100) NOT NULL,
  `community_prefix` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--
-- Creation: Jul 26, 2010 at 10:43 PM
-- Last update: Nov 01, 2010 at 09:19 PM
-- Last check: Sep 21, 2010 at 05:31 PM
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crawl_cycle_id` int(11) NOT NULL,
  `object` varchar(20) NOT NULL,
  `object_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imagemaker_configs`
--
-- Creation: Mar 22, 2010 at 12:38 PM
-- Last update: Jul 27, 2010 at 12:27 AM
-- Last check: Jul 27, 2010 at 12:27 AM
--

DROP TABLE IF EXISTS `imagemaker_configs`;
CREATE TABLE IF NOT EXISTS `imagemaker_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imagemaker_images`
--
-- Creation: Mar 22, 2010 at 12:38 PM
-- Last update: Jul 27, 2010 at 12:27 AM
-- Last check: Jul 27, 2010 at 12:27 AM
--

DROP TABLE IF EXISTS `imagemaker_images`;
CREATE TABLE IF NOT EXISTS `imagemaker_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interfaces`
--
-- Creation: May 09, 2010 at 06:10 PM
-- Last update: Oct 19, 2010 at 06:18 PM
-- Last check: Sep 21, 2010 at 05:31 PM
--

DROP TABLE IF EXISTS `interfaces`;
CREATE TABLE IF NOT EXISTS `interfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `router_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `name` varchar(100) NOT NULL,
  `mac_addr` varchar(150) NOT NULL,
  `ipv4_addr` varchar(40) NOT NULL,
  `ipv6_addr` varchar(150) NOT NULL,
  `vpn_client_cert` text NOT NULL,
  `vpn_client_key` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ips`
--
-- Creation: Apr 19, 2010 at 08:35 PM
-- Last update: Jul 05, 2010 at 11:43 PM
-- Last check: Jul 05, 2010 at 11:43 PM
--

DROP TABLE IF EXISTS `ips`;
CREATE TABLE IF NOT EXISTS `ips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `router_id` int(11) NOT NULL,
  `subnet_id` int(3) NOT NULL,
  `ip` varchar(7) NOT NULL,
  `zone_start` varchar(7) NOT NULL,
  `zone_end` varchar(7) NOT NULL,
  `dhcp_host` varchar(15) NOT NULL,
  `dhcp_netmask` int(11) NOT NULL,
  `radius` int(11) NOT NULL,
  `vpn_client_cert` text NOT NULL,
  `vpn_client_key` text NOT NULL,
  `location` varchar(200) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `chipset` varchar(40) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `olsr_crawl_data`
--
-- Creation: Mar 13, 2010 at 06:34 PM
-- Last update: May 10, 2010 at 08:11 PM
-- Last check: Jul 05, 2010 at 11:43 PM
--

DROP TABLE IF EXISTS `olsr_crawl_data`;
CREATE TABLE IF NOT EXISTS `olsr_crawl_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crawl_id` int(11) NOT NULL,
  `olsrd_hna` text NOT NULL,
  `olsrd_neighbors` text NOT NULL,
  `olsrd_links` text NOT NULL,
  `olsrd_mid` text NOT NULL,
  `olsrd_routes` text NOT NULL,
  `olsrd_topology` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--
-- Creation: Aug 27, 2010 at 05:37 PM
-- Last update: Oct 19, 2010 at 06:18 PM
-- Last check: Sep 21, 2010 at 05:31 PM
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `is_wlan` tinyint(4) NOT NULL,
  `wlan_essid` varchar(200) NOT NULL,
  `wlan_bssid` varchar(100) NOT NULL,
  `wlan_channel` int(11) NOT NULL,
  `is_vpn` tinyint(4) NOT NULL,
  `vpn_server` varchar(100) NOT NULL,
  `vpn_server_port` int(11) NOT NULL,
  `vpn_server_device` varchar(20) NOT NULL,
  `vpn_server_proto` varchar(20) NOT NULL,
  `vpn_server_ca_crt` text NOT NULL,
  `vpn_server_ca_key` text NOT NULL,
  `vpn_server_pass` varchar(200) NOT NULL,
  `vpn_client_config` text NOT NULL,
  `vpn_client_config_needs_script` tinyint(4) NOT NULL,
  `vpn_client_config_script` text NOT NULL,
  `is_ccd_ftp_sync` tinyint(4) NOT NULL,
  `ccd_ftp_folder` varchar(250) NOT NULL,
  `ccd_ftp_username` varchar(100) NOT NULL,
  `ccd_ftp_password` varchar(200) NOT NULL,
  `is_olsr` tinyint(4) NOT NULL,
  `is_batman_adv` tinyint(4) NOT NULL,
  `is_ipv4` tinyint(1) NOT NULL,
  `ipv4_host` varchar(15) NOT NULL,
  `ipv4_netmask` varchar(10) NOT NULL,
  `ipv4_dhcp_kind` varchar(30) NOT NULL,
  `is_ipv6` tinyint(1) NOT NULL,
  `is_geo_specific` tinyint(4) NOT NULL,
  `geo_polygons` text NOT NULL,
  `dns_server` varchar(200) NOT NULL,
  `website` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `routers`
--
-- Creation: Aug 24, 2010 at 05:35 PM
-- Last update: Oct 26, 2010 at 04:08 PM
-- Last check: Sep 21, 2010 at 05:31 PM
--

DROP TABLE IF EXISTS `routers`;
CREATE TABLE IF NOT EXISTS `routers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `crawl_method` varchar(30) NOT NULL,
  `hostname` varchar(40) NOT NULL,
  `allow_router_auto_assign` tinyint(1) NOT NULL,
  `router_auto_assign_login_string` varchar(250) NOT NULL,
  `router_auto_assign_hash` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(250) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `chipset_id` int(20) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `notification_wait` int(11) NOT NULL,
  `notified` tinyint(1) NOT NULL,
  `last_notification` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--
-- Creation: Sep 15, 2010 at 05:50 PM
-- Last update: Sep 21, 2010 at 05:31 PM
-- Last check: Sep 21, 2010 at 05:31 PM
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `router_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `port` int(11) NOT NULL,
  `url_prefix` varchar(20) NOT NULL,
  `visible` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `notification_wait` int(11) NOT NULL,
  `notified` tinyint(1) NOT NULL,
  `last_notification` datetime NOT NULL,
  `use_netmons_url` tinyint(1) NOT NULL,
  `url` varchar(250) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subnets`
--
-- Creation: May 02, 2010 at 11:05 PM
-- Last update: Jul 05, 2010 at 11:43 PM
-- Last check: Jul 05, 2010 at 11:43 PM
--

DROP TABLE IF EXISTS `subnets`;
CREATE TABLE IF NOT EXISTS `subnets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subnet_type` varchar(10) NOT NULL,
  `host` varchar(15) NOT NULL,
  `netmask` int(11) NOT NULL,
  `real_host` varchar(15) NOT NULL,
  `real_netmask` int(11) NOT NULL,
  `dhcp_kind` varchar(7) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `essid` varchar(100) NOT NULL,
  `bssid` varchar(20) NOT NULL,
  `channel` int(11) NOT NULL,
  `website` varchar(200) NOT NULL,
  `polygons` text NOT NULL,
  `dns_server` varchar(200) NOT NULL,
  `vpn_server` varchar(100) DEFAULT NULL,
  `vpn_server_port` int(11) NOT NULL,
  `vpn_server_device` varchar(10) NOT NULL,
  `vpn_server_proto` varchar(10) NOT NULL,
  `vpn_server_ca_crt` text NOT NULL,
  `vpn_server_ca_key` text NOT NULL,
  `vpn_server_pass` varchar(255) NOT NULL,
  `ftp_sync` tinyint(4) NOT NULL,
  `ftp_ccd_folder` varchar(200) NOT NULL,
  `ftp_ccd_username` varchar(20) NOT NULL,
  `ftp_ccd_password` varchar(30) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- Creation: Jul 16, 2010 at 06:10 PM
-- Last update: Nov 01, 2010 at 09:45 PM
-- Last check: Sep 21, 2010 at 05:31 PM
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `openid` varchar(100) NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `strasse` varchar(50) NOT NULL,
  `plz` varchar(20) NOT NULL,
  `ort` varchar(50) NOT NULL,
  `telefon` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `jabber` varchar(50) NOT NULL,
  `icq` varchar(20) NOT NULL,
  `website` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `allow_node_delegation` tinyint(1) NOT NULL,
  `notification_method` varchar(20) NOT NULL,
  `permission` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `activated` varchar(32) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;
