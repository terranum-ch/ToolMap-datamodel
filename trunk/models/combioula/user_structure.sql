-- layer_at1 --
CREATE TABLE `layer_at1` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `D_C_UNDERG` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `MAIN_TARG` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `DEPTH_TOT` int(11) DEFAULT NULL,
  `FM_A` int(11) DEFAULT NULL,
  `DEPTH_FM_A` int(11) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- layer_at2 --
CREATE TABLE `layer_at2` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `STATUS` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `TYPE` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `TEMP` int(11) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- layer_at3 --
CREATE TABLE `layer_at3` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `PHASE` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `DIP_DIRECT` int(11) DEFAULT NULL COMMENT 'ORIENTATION',
  `DIP` int(11) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- layer_at4 --
CREATE TABLE `layer_at4` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `PHASE` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `PLUNGE_DIR` int(11) DEFAULT NULL COMMENT 'ORIENTATION',
  `PLUNGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- layer_at7 --
CREATE TABLE `layer_at7` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `LIM_TECT_U` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `STATUS` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `ACTIVITY` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- layer_at9 --
CREATE TABLE `layer_at9` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `STATUS` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8
