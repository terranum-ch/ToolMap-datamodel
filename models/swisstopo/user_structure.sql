-- layer_at1 --
CREATE TABLE `layer_at1` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `Status` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Rock_Typ` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Rock_Spe` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Orig_Descr` varchar(254) DEFAULT NULL, 
  `Protected` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at2 --
CREATE TABLE `layer_at2` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `Orig_Descr` varchar(254) DEFAULT NULL,
  `Buried_Out` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Composit` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Admixtur` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Structur` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Charact` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Morpholo` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Glac_Typ` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Ref_Year` varchar(254) DEFAULT NULL,
  `Thin_Cov` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at3 --
CREATE TABLE `layer_at3` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `Fm_Homog` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Orig_Descr` varchar(254) DEFAULT NULL,
  `Buried_Out` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Exotic_Ele` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Colour` varchar(254) DEFAULT NULL,
  `Main_Com` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Seco_Com` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Bond_Mat` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Bedding` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Sedi_Str` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Sedi_Tex` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Igne_Tex` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Grain_Si` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Affinity` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Full_Name` varchar(254) DEFAULT NULL,
  `Mineral` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Meta_Str` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at7 --
CREATE TABLE `layer_at7` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `Main_Mov` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at9 --
CREATE TABLE `layer_at9` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `Morai_Mo` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Glac_Typ` varchar(254) DEFAULT NULL,
  `Ice_M_P` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Ref_Year` int(11) DEFAULT NULL,
  `Source` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at13 --
CREATE TABLE `layer_at13` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `Ice_Cave` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at15 --
CREATE TABLE `layer_at15` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `Age` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at16 --
CREATE TABLE `layer_at16` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `Azimuth` int(11) DEFAULT NULL,
  `Plunge` int(11) DEFAULT NULL,
  `Fold_Typ` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Fold_For` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at18 --
CREATE TABLE `layer_at18` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `Type` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  `Gen_Rela` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at19 --
CREATE TABLE `layer_at19` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Fault_Mo` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Verti_Mo` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Horiz_Mo` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Lim_Tect_B` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Status` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Activity` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Meta_Sta` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Name` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at20 --
CREATE TABLE `layer_at20` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Fold_Typ` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Fold_For` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Phase` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Phase_Ref` varchar(254) DEFAULT NULL,
 `Plunge_Dir` int(11) DEFAULT NULL,
 `Plunge` int(11) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at21 --
CREATE TABLE `layer_at21` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Plunge_Dir` int(11) DEFAULT NULL,
 `Plunge` int(11) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at22 --
CREATE TABLE `layer_at22` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Polarity` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Phase` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Phase_Ref` varchar(254) DEFAULT NULL,
 `Ob_Dip_Slo` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Dip_Direct` int(11) DEFAULT NULL,
 `Dip` int(11) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at23 --
CREATE TABLE `layer_at23` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Type` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at24 --
CREATE TABLE `layer_at24` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Division` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `System` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Dat_Meth` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Status` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Protected` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
 
 -- layer_at25 --
CREATE TABLE `layer_at25` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Status` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Material` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Chemistry` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
 
  -- layer_at26 --
CREATE TABLE `layer_at26` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Chemistry` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

  -- layer_at27 --
CREATE TABLE `layer_at27` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Orient` int(11) DEFAULT NULL,	
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

 -- layer_at28 --
CREATE TABLE `layer_at28` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Strati` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Name` varchar(254) DEFAULT NULL,
 `Accessibil` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Protected` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at29 --
CREATE TABLE `layer_at29` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Cong_Spe` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Name_Horiz` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Orig_Descr` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at31 --
CREATE TABLE `layer_at31` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Status` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at32 --
CREATE TABLE `layer_at32` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Type` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Dip_Direct` int(11) DEFAULT NULL,
 `Dip` int(11) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
 
 -- layer_at33 --
CREATE TABLE `layer_at33` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Type` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Altitude` decimal (4,2) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at34 --
CREATE TABLE `layer_at34` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Dip_Direct` int(11) DEFAULT NULL,
 `Dip` int(11) DEFAULT NULL,
 `Height` decimal (4,2) DEFAULT NULL,
 `Mea_Period` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at35 --
CREATE TABLE `layer_at35` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Confine` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Altitude` decimal (4,2) DEFAULT NULL,
 `Wa_Table` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at36 --
CREATE TABLE `layer_at36` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Epoch` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Period` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Age` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Type` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at37 --
CREATE TABLE `layer_at37` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Epoch` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Period` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Age` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at38 --
CREATE TABLE `layer_at38` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Epoch` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Period` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Age` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at39 --
CREATE TABLE `layer_at39` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Status` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Depth_Tot` decimal (4,2) DEFAULT NULL,
 `Targ_Mat` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
 
 -- layer_at40 --
CREATE TABLE `layer_at40` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Status` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at41 --
CREATE TABLE `layer_at41` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Status` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Targ_Mat` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at42 --
CREATE TABLE `layer_at42` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Drill_Mo` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Depth_Bedr` decimal (4,2) DEFAULT NULL,
 `D_C_Underg` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Main_Tar` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Targ_Mat` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Depth_Tot` decimal (4,2) DEFAULT NULL,
 `Depth_Fm_A` decimal (4,2) DEFAULT NULL,
 `Depth_Fm_B` decimal (4,2) DEFAULT NULL,
 `Depth_WT` decimal (4,2) DEFAULT NULL,
 `Plunge_Dir` int(11) DEFAULT NULL,	
 `Plunge` int(11) DEFAULT NULL,	
 `Ref_Number` int(11) DEFAULT NULL,	
 `Link` int(11) DEFAULT NULL,	
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at44 --
CREATE TABLE `layer_at44` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Status` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Epoch` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Depth` decimal (3,2) DEFAULT NULL,
 `Depth_WT` decimal (3,2) DEFAULT NULL,
 `Mea_Period` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at45 --
CREATE TABLE `layer_at45` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Combi` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at46 --
CREATE TABLE `layer_at46` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Rel_Age` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Ref_Year` int(11) DEFAULT NULL,
 `Source` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at47 --
CREATE TABLE `layer_at47` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Combi` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- layer_at48 --
CREATE TABLE `layer_at48` (
 `OBJECT_ID` int(10) unsigned NOT NULL,
 `Status` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Flow_Con` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Type` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Dis_Loca` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Combi` int(11) DEFAULT NULL COMMENT 'ENUMERATION',
 `Temp` int(11) DEFAULT NULL,
 `Chemistry` varchar(254) DEFAULT NULL,
 `Azimuth` int(11) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `LAYER_ATX_FKIndex1` (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;