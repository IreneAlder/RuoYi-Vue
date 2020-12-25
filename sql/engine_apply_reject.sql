/*
 Navicat Premium Data Transfer

 Source Server         : DEVELOP_10.50.22.10
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : 10.50.22.10:3306
 Source Schema         : dw_gds

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : 65001

 Date: 24/12/2020 16:45:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for engine_apply_reject
-- ----------------------------
DROP TABLE IF EXISTS `engine_apply_reject`;
CREATE TABLE `engine_apply_reject`  (
  `SERIALNUM` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '业务交易流水码',
  `PROD_CODE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品编码',
  `CUSTOMERNO` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '客户编码',
  `REJECT_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '拒绝码',
  `REJECT_EXPLAIN` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '拒绝码解释',
  `CREATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`SERIALNUM`, `PROD_CODE`, `CUSTOMERNO`, `REJECT_CODE`, `CREATE_DATE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '拒件客户详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for engine_cust_prod
-- ----------------------------
DROP TABLE IF EXISTS `engine_cust_prod`;
CREATE TABLE `engine_cust_prod`  (
  `PROD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品CODE',
  `PROD_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品名称',
  `PAYMENT_WAY` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '还款方式',
  `CREDIT_TERM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品额度有效期',
  `PROD_RATE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品日利率',
  `EFFECT_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '生效日期',
  `END_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '失效日期',
  `CREATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建日期',
  `LAST_UPDATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`PROD_CODE`, `EFFECT_DATE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '客户产品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for engine_cust_prod_quota
-- ----------------------------
DROP TABLE IF EXISTS `engine_cust_prod_quota`;
CREATE TABLE `engine_cust_prod_quota`  (
  `SERIALNUM` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '业务交易流水码',
  `PROD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品CODE',
  `CUST_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户类型 01 个人 02 企业',
  `CUSTOMERNO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '客户编号',
  `CUST_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '个人客户/法人名称',
  `CUST_CERT_NO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户/法人证件号码',
  `COMPANY_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业公司名称',
  `QUOTA_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '额度类型：01 基础额度 02 临时额度 03 冻结额度',
  `QUOTA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度',
  `QUOTA_TERM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度有效期：按月 1M 3M 6M 12M',
  `QUOTA_START_DATE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度生效日',
  `QUOTA_ENDD_DATE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度到期日',
  `CREATE_TIME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`SERIALNUM`, `PROD_CODE`, `CUSTOMERNO`, `QUOTA_TYPE`, `CREATE_TIME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '客户产品额度' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for engine_cust_prod_quota_h
-- ----------------------------
DROP TABLE IF EXISTS `engine_cust_prod_quota_h`;
CREATE TABLE `engine_cust_prod_quota_h`  (
  `QUOTA_H_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '历史流水ID',
  `SERIALNUM` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '业务交易流水码',
  `PROD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品CODE',
  `CUST_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户类型 01 个人 02 企业',
  `CUSTOMERNO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户编号',
  `CUST_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '个人客户/法人名称',
  `CUST_CERT_NO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户/法人证件号码',
  `COMPANY_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业公司名称',
  `QUOTA_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度类型：01 加 02 减',
  `QUOTA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度',
  `QUOTA_TERM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度有效期：按月 1M 3M 6M 12M',
  `QUOTA_START_DATE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度生效日',
  `QUOTA_ENDD_DATE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度到期日',
  `CREATE_TIME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`QUOTA_H_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '客户产品额度历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for engine_flow_param
-- ----------------------------
DROP TABLE IF EXISTS `engine_flow_param`;
CREATE TABLE `engine_flow_param`  (
  `PARAM_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '配置ID',
  `FLOW_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程ID',
  `PROD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品CODE',
  `FLOW_NODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程节点',
  `PARAM_KEY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '参数KEY',
  `PARAM_VAL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '参数值',
  `CREATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`PARAM_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '产品流程配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for engine_flow_return
-- ----------------------------
DROP TABLE IF EXISTS `engine_flow_return`;
CREATE TABLE `engine_flow_return`  (
  `RETURN_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '配置ID',
  `FLOW_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程ID',
  `PROD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品CODE',
  `FLOW_NODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程节点',
  `RETURN_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '返回类型 01 入参 02 出参 09 固定值',
  `RETURN_KEY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '返回KEY',
  `RETURN_VAL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '返回值',
  `CREATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`RETURN_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '产品流程返回数据配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of engine_flow_return
-- ----------------------------
INSERT INTO `engine_flow_return` VALUES ('ENGINE_INSIDE_RULE_001', 'FLOW_001', 'P010102', 'ENGINE_INSIDE_RULE', '02', 'rejectCode', 'rejectCode', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('ENGINE_INSIDE_RULE_002', 'FLOW_001', 'P010102', 'ENGINE_INSIDE_RULE', '01', 'custId', '$.header.custId', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('ENGINE_INSIDE_RULE_003', 'FLOW_001', 'P010102', 'ENGINE_INSIDE_RULE', '02', 'forbiddenOpenDays', 'forbiddenOpenDays', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('ENGINE_INSIDE_RULE_004', 'FLOW_001', 'P010102', 'ENGINE_INSIDE_RULE', '02', 'openEntranceStatus', 'openEntranceStatus', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('ENGINE_INSIDE_RULE_005', 'FLOW_001', 'P010102', 'ENGINE_INSIDE_RULE', '09', 'toCmsStp01', '000', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_INSIDE_RULE_001', 'NGD0001', 'P010103', 'NGD_INSIDE_RULE', '02', 'rejectCode', 'rejectCode', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_INSIDE_RULE_002', 'NGD0001', 'P010103', 'NGD_INSIDE_RULE', '01', 'custId', '$.header.custId', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_INSIDE_RULE_003', 'NGD0001', 'P010103', 'NGD_INSIDE_RULE', '02', 'forbiddenOpenDays', 'forbiddenOpenDays', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_INSIDE_RULE_004', 'NGD0001', 'P010103', 'NGD_INSIDE_RULE', '02', 'openEntranceStatus', 'openEntranceStatus', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_INSIDE_RULE_005', 'NGD0001', 'P010103', 'NGD_INSIDE_RULE', '02', 'toCmsStp01', 'toCmsStp01', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_OTHER_RULE1_001', 'NGD0002', 'P010103', 'NGD_OTHER_RULE', '02', 'rejectCode', 'rejectCode', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_OTHER_RULE1_002', 'NGD0002', 'P010103', 'NGD_OTHER_RULE', '01', 'custId', '$.header.custId', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_OTHER_RULE1_003', 'NGD0002', 'P010103', 'NGD_OTHER_RULE', '02', 'forbiddenOpenDays', 'forbiddenOpenDays', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_OTHER_RULE1_004', 'NGD0002', 'P010103', 'NGD_OTHER_RULE', '02', 'openEntranceStatus', 'openEntranceStatus', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_OTHER_RULE1_005', 'NGD0002', 'P010103', 'NGD_OTHER_RULE', '09', 'toCmsStp01', '000', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_OTHER_RULE2_001', 'NGD0003', 'P010103', 'NGD_OTHER_RULE', '02', 'rejectCode', 'rejectCode', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_OTHER_RULE2_002', 'NGD0003', 'P010103', 'NGD_OTHER_RULE', '01', 'custId', '$.header.custId', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_OTHER_RULE2_003', 'NGD0003', 'P010103', 'NGD_OTHER_RULE', '02', 'forbiddenOpenDays', 'forbiddenOpenDays', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_OTHER_RULE2_004', 'NGD0003', 'P010103', 'NGD_OTHER_RULE', '02', 'openEntranceStatus', 'openEntranceStatus', '2020-04-20');
INSERT INTO `engine_flow_return` VALUES ('NGD_OTHER_RULE2_005', 'NGD0003', 'P010103', 'NGD_OTHER_RULE', '09', 'toCmsStp01', '000', '2020-04-20');

-- ----------------------------
-- Table structure for engine_flow_variable
-- ----------------------------
DROP TABLE IF EXISTS `engine_flow_variable`;
CREATE TABLE `engine_flow_variable`  (
  `VARIABLE_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '变量配置ID',
  `FLOW_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程ID',
  `PROD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品CODE',
  `FLOW_NODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程节点',
  `VAR_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '变量类型：\r\n01 全量变量 \r\n02 私有变量',
  `VARIABLE_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '衍生变量类型 01 入参 02 函数 09 固定值',
  `PARAM_KEY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '参数KEY',
  `PARAM_VAL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '参数值',
  `VARIABLE_FUNCTION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '衍生函数',
  `DEFAULT_VAL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '默认值',
  `CREATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建日期',
  `LAST_UPDATA` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`VARIABLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '衍生变量信息配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of engine_flow_variable
-- ----------------------------
INSERT INTO `engine_flow_variable` VALUES ('00001', 'FLOW_001', 'P010102', 'ENGINE_INSIDE_RULE', '02', '01', 'active_score', '$.params.gfMakeData.active_score', NULL, NULL, '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00002', 'FLOW_001', 'P010102', 'ENGINE_INSIDE_RULE', '02', '09', 'isXD', '', NULL, '0', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00003', 'FLOW_001', 'P010102', 'ENGINE_INSIDE_RULE', '02', '01', 'trd_amt_1month', '$.params.gfMakeData.trd_amt_1month', NULL, '0', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00004', 'FLOW_001', 'P010102', 'ENGINE_INSIDE_RULE', '02', '01', 'rejectCode', '$.params.gfMakeData.reject_code', NULL, NULL, '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00005', 'FLOW_001', '00003', 'ENGINE_INSIDE_RULE', '02', '01', 'overdue_max_days', '$.params.gfMakeData[?(@.overdue_max_days)].overdue_max_days', NULL, NULL, '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00006', 'FLOW_001', 'P010102', 'ENGINE_INSIDE_RULE', '02', '01', 'overdue_hismax_days', '$.params.gfMakeData[?(@.overdue_hismax_days)].overdue_hismax_days', NULL, NULL, '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00007', 'FLOW_001', 'P010102', 'ENGINE_INSIDE_RULE', '02', '01', 'is_term_chg', '$.params.gfMakeData[?(@.is_term_chg)].is_term_chg', NULL, NULL, '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00008', 'NGD0001', 'P010103', 'NGD_INSIDE_RULE', '02', '01', 'isSupplementInfo', '$.params.single.isSupplementInfo', NULL, '0', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00009', 'NGD0001', 'P010103', 'NGD_INSIDE_RULE', '02', '01', 'isPbccrc', '$.params.single.isPbccrc', NULL, '0', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00010', 'NGD0001', 'P010103', 'NGD_INSIDE_RULE', '02', '01', 'isCredit', '$.params.single.isCredit', NULL, '0', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00011', 'NGD0001', 'P010103', 'NGD_INSIDE_RULE', '02', '01', 'isOnTrial', '$.params.single.isOnTrial', NULL, '0', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00012', 'NGD0001', 'P010103', 'NGD_INSIDE_RULE', '02', '01', 'isCustList', '$.params.single.isCustList', NULL, '0', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00013', 'NGD0002', 'P010103', 'NGD_OTHER_RULE', '02', '02', 'com.newhope.rule.utils.FunctionUtils', '', 'otherDataFunction', '', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00014', 'NGD0003', 'P010103', 'NGD_OTHER_RULE', '02', '02', 'com.newhope.rule.utils.FunctionUtils', '', 'otherDataFunction', '', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00015', 'NGD0002', 'P010103', 'NGD_OTHER_RULE', '02', '01', 'risk_scr1', '$.params.creditDataModel.risk_scr1', '', '', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00016', 'NGD0003', 'P010103', 'NGD_OTHER_RULE', '02', '01', 'risk_scr1', '$.params.creditDataModel.risk_scr1', '', '', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00017', 'NGD0002', 'P010103', 'NGD_OTHER_RULE', '02', '01', 'toRuleStp', '$.header.toRuleStp', '', '', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00018', 'NGD0002', 'P010103', 'NGD_OTHER_RULE', '02', '01', 'custType', '$.params.single.custType', '', '', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00019', 'NGD0003', 'P010103', 'NGD_OTHER_RULE', '02', '01', 'toRuleStp', '$.header.toRuleStp', '', '', '2020-04-16', NULL);
INSERT INTO `engine_flow_variable` VALUES ('00020', 'NGD0003', 'P010103', 'NGD_OTHER_RULE', '02', '01', 'custType', '$.params.single.custType', '', '', '2020-04-16', NULL);

-- ----------------------------
-- Table structure for engine_prod_flow
-- ----------------------------
DROP TABLE IF EXISTS `engine_prod_flow`;
CREATE TABLE `engine_prod_flow`  (
  `FLOW_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程ID',
  `PROD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品CODE',
  `TO_RULE_STP` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程步骤',
  `FLOW_NODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程节点',
  `FLOW_EXP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流程描述',
  `FLOW_CONDITION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流程条件',
  `IS_WHITE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否白名单 1是 0 否',
  `IS_BLACK` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否需要过黑名单 1是 0 否',
  `IS_EPIDEMIC` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否需要过疫情圈 1是 0 否',
  `IS_REDIS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否缓存获取数据 1是 0 否',
  `FLOW_REDIS_KEY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流程缓存KEY',
  PRIMARY KEY (`FLOW_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '产品流程信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of engine_prod_flow
-- ----------------------------
INSERT INTO `engine_prod_flow` VALUES ('FLOW_001', 'P010102', 'insideRule', 'ENGINE_INSIDE_RULE', '规则流测试', '$.header[?(!@.toRuleStp==\'insideRule\')].piecesNoId', '0', '0', '0', '0', '');
INSERT INTO `engine_prod_flow` VALUES ('NGD0001', 'P010103', 'insideRule', 'NGD_INSIDE_RULE', '农耕贷-内部策略', '$.header[?(!@.toRuleStp==\'insideRule\')].piecesNoId', '0', '0', '0', '0', '');
INSERT INTO `engine_prod_flow` VALUES ('NGD0002', 'P010103', 'otherRule1', 'NGD_OTHER_RULE', '农耕贷-三方策略1', '$.header[?(!@.toRuleStp==\'otherRule1\')].piecesNoId', '0', '0', '0', '0', '');
INSERT INTO `engine_prod_flow` VALUES ('NGD0003', 'P010103', 'otherRule2', 'NGD_OTHER_RULE', '农耕贷-三方策略2', '$.header[?(!@.toRuleStp==\'otherRule2\')].piecesNoId', '0', '0', '0', '0', '');

-- ----------------------------
-- Table structure for engine_prod_info
-- ----------------------------
DROP TABLE IF EXISTS `engine_prod_info`;
CREATE TABLE `engine_prod_info`  (
  `PROD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品CODE',
  `PROD_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品名称',
  `PAYMENT_WAY` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '还款方式',
  `CREDIT_TERM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品额度有效期',
  `PROD_RATE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品日利率',
  `EFFECT_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '生效日期',
  `END_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '失效日期',
  `IS_SUPPLEMENTINFO` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否补充经营信息:1 是 0 否',
  `IS_FACE_RECO` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否需要人脸通过:1 是 0 否',
  `CREATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建日期',
  `LAST_UPDATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`PROD_CODE`, `EFFECT_DATE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '产品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of engine_prod_info
-- ----------------------------
INSERT INTO `engine_prod_info` VALUES ('P010102', '股份-老客', '7', '12M', '0.035', '2020-04-16', '2021-04-16', '0', '0', '2021-04-16', '2020-04-23 15:31:25');
INSERT INTO `engine_prod_info` VALUES ('P010103', '农耕贷', '5', '12M', '0.038', '2020-04-16', '2021-04-16', '0', '0', '2021-04-16', '2020-04-23 15:31:25');

-- ----------------------------
-- Table structure for engine_query_white_param
-- ----------------------------
DROP TABLE IF EXISTS `engine_query_white_param`;
CREATE TABLE `engine_query_white_param`  (
  `PROD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品Code',
  `IS_ENCRYPTION` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否加密 1是 0 否',
  `ENCRYPTION_EXP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '加密扩展数据',
  `ENCRYPTION_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '加密类型{ 01：MD5 02：DES}',
  `PARAM_KEY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '参数KEY',
  `PARAM_VAL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '参数值',
  PRIMARY KEY (`PROD_CODE`, `PARAM_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '风险白名单查询配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for engine_quota_detailed
-- ----------------------------
DROP TABLE IF EXISTS `engine_quota_detailed`;
CREATE TABLE `engine_quota_detailed`  (
  `QUOTA_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流水ID,随机生成码',
  `SERIALNUM` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '业务交易流水码',
  `PROD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品CODE',
  `CUST_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '客户类型 01 个人 02 企业',
  `CUSTOMERNO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户编号',
  `CUST_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '个人客户/法人名称',
  `CUST_CERT_NO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户/法人证件号码',
  `COMPANY_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业公司名称：客户为企业有值',
  `QUOTA_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度类型：01 基础额度 02 临时额度 03 冻结额度',
  `QUOTA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度',
  `QUOTA_TERM` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度有效期：按月 1M 3M 6M 12M',
  `QUOTA_START_DATE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度生效日',
  `QUOTA_ENDD_DATE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度到期日',
  `CHANNEL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '渠道',
  `CREATE_TIME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`QUOTA_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '额度流水表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for engine_reject_info
-- ----------------------------
DROP TABLE IF EXISTS `engine_reject_info`;
CREATE TABLE `engine_reject_info`  (
  `REJECT_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '拒绝码',
  `REJECT_EXPLAIN` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '拒绝码解释',
  `EFFECT_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生效日期',
  `END_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '失效日期',
  `IS_EFFECT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否生效:1 生效 0 失效',
  `CREATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建日期',
  `LAST_UPDATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`REJECT_CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '客户产品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for engine_reject_open_status
-- ----------------------------
DROP TABLE IF EXISTS `engine_reject_open_status`;
CREATE TABLE `engine_reject_open_status`  (
  `PROD_CODE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品编码',
  `REJECT_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '拒绝码',
  `OPEN_STATUS` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否开放:01',
  `FORBIDDEN_OPEN_DAYS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '禁止开放天数',
  `EFFECT_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生效日期',
  `END_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '失效日期',
  `CREATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建日期',
  `LAST_UPDATE_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`PROD_CODE`, `REJECT_CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '拒绝码开放日期管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of engine_reject_open_status
-- ----------------------------
INSERT INTO `engine_reject_open_status` VALUES ('P010102', 'R_bs_02', '001', '30', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010102', 'r_gufen_05', '001', '33', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010102', 'r_gufen_06', '001', '34', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010102', 'r_gufen_age_01', '001', '32', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010102', 'r_gufen_age_02', '001', '31', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010102', 'r_gufen_xd_01', '001', '35', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010102', 'r_gufen_xd_02', '001', '36', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010103', 'R_bs_02', '001', '30', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010103', 'r_gufen_05', '001', '33', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010103', 'r_gufen_06', '001', '34', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010103', 'r_gufen_age_01', '001', '32', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010103', 'r_gufen_age_02', '001', '31', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010103', 'r_gufen_xd_01', '001', '35', '2020-04-16', '2021-04-16', '2020-04-16', NULL);
INSERT INTO `engine_reject_open_status` VALUES ('P010103', 'r_gufen_xd_02', '001', '36', '2020-04-16', '2021-04-16', '2020-04-16', NULL);

-- ----------------------------
-- Table structure for engine_risk_white
-- ----------------------------
DROP TABLE IF EXISTS `engine_risk_white`;
CREATE TABLE `engine_risk_white`  (
  `CUSTOMERNO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '客户编号',
  `ID_TYPE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '证件类型',
  `ID_NO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '证件号码',
  `CREDITCRD` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '授信额度',
  `RATE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '利率（日）',
  `PAYMENTWAY` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '还款方式',
  `CREDITTERM` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额度期限',
  `CUST_TYPE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户类型 01 个人 02 企业',
  `EFFECT_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '生效日期',
  `END_DATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '失效日期',
  `CREDITNO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业信用代码',
  `COMPANYNAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业名称',
  `CREDITSCORE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '风险系数',
  `BUILD_DATE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据日期',
  `IS_EFFECT` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否生效',
  `PROD_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品Code',
  PRIMARY KEY (`CUSTOMERNO`, `EFFECT_DATE`, `IS_EFFECT`, `PROD_CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '风险白名单' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
