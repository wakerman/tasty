package com.taobao.tasty.common.constant;

import common.toolkit.java.constant.SymbolConstant;
import common.toolkit.java.util.StringUtil;

/**
 * 系统静态常量
 * @author nileader nileader@gmail.com
 * @date Sep 19, 2012
 */
public class SystemConstant {

	public static int PAGE_SIZE_OF_FEED = 10;
	
	public static int PAGE_SIZE_OF_COMMENT = 10;
	
	public static int PAGE_SIZE_DEFAULT 			= 10;
	
	public static String BASE_PATH_OF_PIC			= "/root/tasty/pic";
	
	public static String DEFAULT_LOG_TYPE = "ALL";

	public final static String AUTHENTICATION_TYPE = "digest";

	public static String envName = "ONLINE";

	public static int minsRateOfRealTimeStat = 15;
	
	/** 全局统计频率 */
	public static int minsRateOfGlobalStat = 10;

	public static int minsRateOfConnectionDiffStat = 30;
	
	public static int minsRateOfBizLogRuleDump = 2;

	public static int minsRateOfMonitorCore = 2;

	public static int minsRateOfNonTextGroupScanner = 60 * 12;

	public static int secondsRateOfConnectionStat = 60 * 5;

	public static int thresholdOfPushMonitorForTooManyClientError = 2;

	public static int thresholdOfPushMonitorForOneClientTooManyError = 10;

	public static int thresholdOfSDKConnection = 0;

	public static int thresholdOfTotalConnectionLoss = 0;

	public static int thresholdOfTotalSubscriberLoss = 0;

	public static int thresholdOfTotalPublisherLoss = 0;

	public final static String AUTHENTICATION_KEY = "yinshi.nc:taobao";

	public final static int SECONDS_RATE_OF_MONITOR_CORE = 30;

	public final static int MINS_RATE_OF_COLLECT_ZOOKEEPER = 1;
	public final static int MINS_RATE_OF_COLLECT_HOST_PERFORMANCE = 2;
	public final static int MINS_RATE_OF_DUMP_ZOOKEEPER_CLUSTER = 1;

	public final static String COMMAND_CONS = "echo cons | nc {0} {1}";
	public final static String COMMAND_STAT = "echo stat | nc {0} {1}";
	public final static String COMMAND_WCHS = "echo wchs | nc {0} {1}";
	public final static String COMMAND_WCHC = "echo wchc | nc {0} {1}";

	public final static String IncreasedDataReceiver_METAQ_TOPIC = "tlog-xu";
	public final static String IncreasedDataReceiver_METAQ_GROUP = "tlog-xu";
	
	
	//Tlog中订阅的数据是一个map，map中的key如下：
	public final static String KEY_NAME_OF_TLOG_METAQ_ROWKEY = "rowKey";
	public final static String KEY_NAME_OF_TLOG_METAQ_LOGTYPE = "logType";
	public final static String KEY_NAME_OF_TLOG_METAQ_OPER_TYPE = "operType";
	public final static String KEY_NAME_OF_TLOG_METAQ_OPER_CONTENT = "operContent";
	public final static String KEY_NAME_OF_TLOG_METAQ_LOG_TIME = "logTime";
	public final static String CHARSETNAME_OF_TLOG_METAQ_DATA = "UTF-8";
	
	
	public static int portOfSSH = 22;

	public static String dataStoreCategoryPath_clientStat = "/ZooKeeperClientThroughputStat/";
	public static String PREFIX_OF_ZOOKEEPER_CLIENT_STAT_FILE_NAME = "zookeeper-client-";

	public static String domainOfConfigServer = "commonconfig.config-host.taobao.com";

	public static String configOfMsgCenter = "";

	public static String serverOfMsgCenter = "";
	public static String sourceIdOfMsgCenter = "";
	public static String templateIdOfMsgCenter = "";
	public static String messageTypeIdOfMsgCenter = "";

	public void setConfigOfMsgCenter( String configOfMsgCenter ) {
		try {
			if ( StringUtil.isBlank( configOfMsgCenter ) )
				throw new Exception( "configOfMsgCenter can't be null" );

			String[] configOfMsgCenterArray = configOfMsgCenter.split( SymbolConstant.SLASH );
			if ( 4 != configOfMsgCenterArray.length )
				throw new Exception( "Illegal configOfMsgCenter formart" );

			SystemConstant.configOfMsgCenter = configOfMsgCenter;
			SystemConstant.serverOfMsgCenter = StringUtil.defaultIfBlank( configOfMsgCenterArray[0], SystemConstant.serverOfMsgCenter );
			SystemConstant.sourceIdOfMsgCenter = StringUtil.defaultIfBlank( configOfMsgCenterArray[1], SystemConstant.sourceIdOfMsgCenter );
			SystemConstant.templateIdOfMsgCenter = StringUtil.defaultIfBlank( configOfMsgCenterArray[2],
					SystemConstant.templateIdOfMsgCenter );
			SystemConstant.messageTypeIdOfMsgCenter = StringUtil.defaultIfBlank( configOfMsgCenterArray[3],
					SystemConstant.messageTypeIdOfMsgCenter );
		} catch ( Exception e ) {
			throw new RuntimeException( "Parse configOfMsgCenter( " + configOfMsgCenter
					+ " ) error, please config like this 1.2.3.4:9999,1.2.3.5:9999/a*b/3545656/67657" + e.getMessage(), e );
		}
	}

	public void setEnvName( String envName ) {
		SystemConstant.envName = envName;
	}

	public void setMinsRateOfRealTimeStat( int minsRateOfRealTimeStat ) {
		SystemConstant.minsRateOfRealTimeStat = minsRateOfRealTimeStat;
	}

	public void setMinsRateOfConnectionDiffStat( int minsRateOfConnectionDiffStat ) {
		SystemConstant.minsRateOfConnectionDiffStat = minsRateOfConnectionDiffStat;
	}

}
