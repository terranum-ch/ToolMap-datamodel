-- DATABASE STRUCTURE --
-- dmn_attribut_value --
CREATE TABLE `dmn_attribut_value` (
  `ATTRIBUT_ID` int(11) NOT NULL,
  `CATALOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ATTRIBUT_ID`,`CATALOG_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- dmn_catalog --
CREATE TABLE `dmn_catalog` (
  `CATALOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) DEFAULT NULL,
  `DESCRIPTION_0` varchar(255) DEFAULT NULL,
  `DESCRIPTION_1` varchar(255) DEFAULT NULL,
  `DESCRIPTION_2` varchar(255) DEFAULT NULL,
  `DESCRIPTION_3` varchar(255) DEFAULT NULL,
  `DESCRIPTION_4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CATALOG_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8

-- dmn_layer_attribut --
CREATE TABLE `dmn_layer_attribut` (
  `ATTRIBUT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAYER_INDEX` int(11) NOT NULL,
  `ATTRIBUT_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTRIBUT_ID`,`LAYER_INDEX`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8

-- dmn_layer_object --
CREATE TABLE `dmn_layer_object` (
  `OBJECT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OBJECT_CD` int(10) unsigned NOT NULL COMMENT 'Feature code',
  `OBJECT_TYPE_CD` int(10) unsigned NOT NULL COMMENT 'Spatial object code',
  `THEMATIC_LAYERS_LAYER_INDEX` int(10) unsigned NOT NULL COMMENT 'Associated thematic layer',
  `OBJECT_DESC_0` varchar(255) NOT NULL COMMENT 'Feature description',
  `OBJECT_DESC_1` varchar(255) DEFAULT NULL,
  `OBJECT_DESC_2` varchar(255) DEFAULT NULL,
  `OBJECT_DESC_3` varchar(255) DEFAULT NULL,
  `OBJECT_DESC_4` varchar(255) DEFAULT NULL,
  `OBJECT_ISFREQ` tinyint(1) NOT NULL DEFAULT '0',
  `SYMBOL_CD` varchar(20) DEFAULT NULL COMMENT 'Feature symbology',
  `RANK` int(11) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OBJECT_ID`),
  KEY `DMN_LAYER_OBJECT_FKIndex2` (`THEMATIC_LAYERS_LAYER_INDEX`,`OBJECT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8

-- dmn_layer_type --
CREATE TABLE `dmn_layer_type` (
  `TYPE_CD` int(10) unsigned NOT NULL COMMENT 'Layer type code',
  `TYPE_DESCRIPTION` varchar(20) NOT NULL COMMENT 'Layer type description',
  PRIMARY KEY (`TYPE_CD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8


INSERT INTO dmn_layer_type VALUES(0,"Line");
INSERT INTO dmn_layer_type VALUES(1,"Point");
INSERT INTO dmn_layer_type VALUES(2,"Polygon");


-- dmn_shortcut_key --
CREATE TABLE `dmn_shortcut_key` (
  `SHORTCUT_CD` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SHORTCUT_KEY` varchar(20) NOT NULL,
  `SHORTCUT_DESC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SHORTCUT_CD`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8

INSERT INTO dmn_shortcut_key VALUES(1,"F1","");
INSERT INTO dmn_shortcut_key VALUES(2,"F2","");
INSERT INTO dmn_shortcut_key VALUES(3,"F3","");
INSERT INTO dmn_shortcut_key VALUES(4,"F4","");
INSERT INTO dmn_shortcut_key VALUES(5,"F5","");
INSERT INTO dmn_shortcut_key VALUES(6,"F6","");
INSERT INTO dmn_shortcut_key VALUES(7,"F7","");
INSERT INTO dmn_shortcut_key VALUES(8,"F8","");
INSERT INTO dmn_shortcut_key VALUES(9,"F9","");
INSERT INTO dmn_shortcut_key VALUES(10,"F10","");
INSERT INTO dmn_shortcut_key VALUES(11,"F11","");
INSERT INTO dmn_shortcut_key VALUES(12,"F12","");


-- export_poly --
CREATE TABLE `export_poly` (
  `LAYER_INDEX` int(11) NOT NULL,
  `RASTER_FACTOR` double DEFAULT NULL,
  `NB_EXPORT` int(11) DEFAULT NULL,
  `PERCENT_SKIPPED` double DEFAULT NULL,
  PRIMARY KEY (`LAYER_INDEX`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- generic_aat --
CREATE TABLE `generic_aat` (
  `OBJECT_VAL_ID` int(10) unsigned NOT NULL,
  `OBJECT_GEOM_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`OBJECT_VAL_ID`,`OBJECT_GEOM_ID`),
  KEY `GENERIC_LINES_has_DMN_LAYER_OBJECT_FKIndex1` (`OBJECT_VAL_ID`),
  KEY `GENERIC_LINES_has_DMN_LAYER_OBJECT_FKIndex2` (`OBJECT_GEOM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- generic_dmn --
CREATE TABLE `generic_dmn` (
  `CODE` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Code value',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'Code description',
  PRIMARY KEY (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- generic_frame --
CREATE TABLE `generic_frame` (
  `OBJECT_ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Feature identifier',
  `OBJECT_GEOMETRY` linestring NOT NULL COMMENT 'Feature geometry',
  PRIMARY KEY (`OBJECT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8

-- generic_labels --
CREATE TABLE `generic_labels` (
  `OBJECT_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OBJECT_GEOMETRY` multipoint NOT NULL,
  PRIMARY KEY (`OBJECT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8

-- generic_lat --
CREATE TABLE `generic_lat` (
  `OBJECT_VAL_ID` int(10) unsigned NOT NULL,
  `OBJECT_GEOM_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`OBJECT_VAL_ID`,`OBJECT_GEOM_ID`),
  KEY `GENERIC_LABELS_has_DMN_LAYER_OBJECT_FKIndex1` (`OBJECT_VAL_ID`),
  KEY `GENERIC_LABELS_has_DMN_LAYER_OBJECT_FKIndex2` (`OBJECT_GEOM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- generic_lines --
CREATE TABLE `generic_lines` (
  `OBJECT_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OBJECT_GEOMETRY` linestring NOT NULL,
  PRIMARY KEY (`OBJECT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=602 DEFAULT CHARSET=utf8

-- generic_notes --
CREATE TABLE `generic_notes` (
  `OBJECT_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OBJECT_GEOMETRY` multipoint NOT NULL,
  `PRIORITY_CD` tinyint(4) DEFAULT '0',
  `CODE_CD` tinyint(4) DEFAULT '0',
  `AUTHOR` varchar(255) DEFAULT NULL,
  `NOTE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DESCRIPTION` text,
  `ISFIXED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`OBJECT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- generic_pat --
CREATE TABLE `generic_pat` (
  `OBJECT_VAL_ID` int(10) unsigned NOT NULL,
  `OBJECT_GEOM_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`OBJECT_VAL_ID`,`OBJECT_GEOM_ID`),
  KEY `GENERIC_POINTS_has_DMN_LAYER_OBJECT_FKIndex1` (`OBJECT_VAL_ID`),
  KEY `GENERIC_POINTS_has_DMN_LAYER_OBJECT_FKIndex2` (`OBJECT_GEOM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- generic_points --
CREATE TABLE `generic_points` (
  `OBJECT_ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Feature identifier',
  `OBJECT_GEOMETRY` multipoint NOT NULL COMMENT 'Feature geometry',
  PRIMARY KEY (`OBJECT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8

-- lang_def --
CREATE TABLE `lang_def` (
  `LANG_ID` int(11) NOT NULL,
  `LANG_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LANG_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8


INSERT INTO lang_def VALUES(0,"Undefined");
INSERT INTO lang_def VALUES(1,"Undefined");
INSERT INTO lang_def VALUES(2,"Undefined");
INSERT INTO lang_def VALUES(3,"Undefined");
INSERT INTO lang_def VALUES(4,"Undefined");


-- prj_queries --
CREATE TABLE `prj_queries` (
  `QUERIES_ID` int(11) NOT NULL AUTO_INCREMENT,
  `QUERIES_TARGET` int(11) NOT NULL,
  `QUERIES_NAME` varchar(255) NOT NULL,
  `QUERIES_CODE` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`QUERIES_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8

INSERT INTO prj_queries VALUES(1,0,"Lines without attribution","SELECT o.OBJECT_ID FROM generic_lines AS o WHERE o.OBJECT_ID NOT IN (SELECT a.OBJECT_GEOM_ID FROM generic_aat AS a)");
INSERT INTO prj_queries VALUES(2,1,"Points without attribution","SELECT o.OBJECT_ID FROM generic_points AS o WHERE o.OBJECT_ID NOT IN (SELECT a.OBJECT_GEOM_ID FROM generic_pat AS a)");
INSERT INTO prj_queries VALUES(3,2,"Labels without attribution","SELECT o.OBJECT_ID FROM generic_labels AS o WHERE o.OBJECT_ID NOT IN (SELECT a.OBJECT_GEOM_ID FROM generic_lat AS a)");


-- prj_settings --
CREATE TABLE `prj_settings` (
  `SETTING_DBK` int(11) NOT NULL AUTO_INCREMENT,
  `PRJ_UNIT` varchar(10) NOT NULL,
  `PRJ_PROJECTION` varchar(45) NOT NULL,
  `PRJ_NAME` varchar(45) NOT NULL,
  `PRJ_VERSION` int(11) NOT NULL,
  `PRJ_EXPORT_PATH` varchar(255) DEFAULT NULL,
  `PRJ_EXPORT_TYPE` int(11) DEFAULT '0',
  `PRJ_BACKUP_PATH` varchar(255) DEFAULT NULL,
  `PRJ_AUTHORS` varchar(255) DEFAULT NULL,
  `PRJ_SUMMARY` text,
  `PRJ_SNAP_TOLERENCE` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`SETTING_DBK`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8


INSERT INTO prj_settings VALUES(1,"Meters","No projection","Combioula_complet",224,"/Users/lucien/DATA/PRJ/TOOLMAP2/projects/test_prjaout/export",0,"/Users/lucien/DATA/PRJ/TOOLMAP2/projects/test_prjaout/backups","CREALP",0);

-- prj_snapping --
CREATE TABLE `prj_snapping` (
  `TOC_ID` int(11) NOT NULL,
  `SNAPPING_TYPE` int(11) NOT NULL,
  PRIMARY KEY (`TOC_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- prj_stats --
CREATE TABLE `prj_stats` (
  `STAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_START` datetime NOT NULL,
  `CLICK` bigint(20) unsigned DEFAULT '0',
  `ATTRIBUTION` bigint(20) unsigned DEFAULT '0',
  `INTERSECTION` bigint(20) unsigned DEFAULT '0',
  `DATE_END` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`STAT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

-- prj_toc --
CREATE TABLE `prj_toc` (
  `CONTENT_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE_CD` int(10) unsigned NOT NULL,
  `CONTENT_PATH` varchar(255) DEFAULT NULL,
  `CONTENT_NAME` varchar(255) DEFAULT NULL,
  `CONTENT_STATUS` tinyint(1) DEFAULT '1',
  `GENERIC_LAYERS` tinyint(4) DEFAULT '100',
  `RANK` int(11) DEFAULT NULL,
  `SYMBOLOGY` mediumtext,
  `VERTEX_FLAGS` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`CONTENT_ID`),
  KEY `PRJ_TOC_FKIndex1` (`TYPE_CD`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8


INSERT INTO prj_toc VALUES(1,0,"","Lines",1,0,1,0);
INSERT INTO prj_toc VALUES(2,1,"","Points",1,1,2,0);
INSERT INTO prj_toc VALUES(3,1,"","Labels",1,2,3,0);
INSERT INTO prj_toc VALUES(4,1,"","Notes",0,3,4,0);
INSERT INTO prj_toc VALUES(5,0,"","Frame",1,4,5,0);


-- shortcut_list --
CREATE TABLE `shortcut_list` (
  `OBJECT_ID` int(10) unsigned NOT NULL,
  `SHORTCUT_CD` int(10) unsigned NOT NULL,
  PRIMARY KEY (`OBJECT_ID`,`SHORTCUT_CD`),
  KEY `SHORTCUT_KEYS_has_DMN_LAYER_OBJECT_FKIndex2` (`OBJECT_ID`),
  KEY `SHORTCUT_LIST_FKIndex2` (`SHORTCUT_CD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

-- thematic_layers --
CREATE TABLE `thematic_layers` (
  `LAYER_INDEX` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme index',
  `TYPE_CD` int(10) unsigned NOT NULL,
  `LAYER_NAME` varchar(255) NOT NULL COMMENT 'Theme name',
  `LAYER_DESC` varchar(255) DEFAULT NULL COMMENT 'Theme description',
  `REMARK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LAYER_INDEX`),
  KEY `THEMATIC_LAYERS_FKIndex1` (`TYPE_CD`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8

-- zoom_level --
CREATE TABLE `zoom_level` (
  `ZOOM_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SCALE_VALUE` int(10) unsigned NOT NULL,
  `RANK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZOOM_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8

INSERT INTO zoom_level VALUES(1,5000,2);
INSERT INTO zoom_level VALUES(2,10000,3);
INSERT INTO zoom_level VALUES(3,25000,4);
INSERT INTO zoom_level VALUES(4,50000,5);
INSERT INTO zoom_level VALUES(5,1000,0);
INSERT INTO zoom_level VALUES(6,2000,1);

