-- layer_at7 --
CREATE TABLE `layer_at7` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `CAT` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
   PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at9 --
CREATE TABLE `layer_at9` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `PROD` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `CRIT_EXC` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at10 --
CREATE TABLE `layer_at10` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `PROD` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `CRIT_EXC` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

