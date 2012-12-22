package com.taobao.tasty.web;

import java.util.Properties;

import javax.servlet.Servlet;
import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.taobao.tasty.common.constant.SystemConstant;
import common.toolkit.java.util.ObjectUtil;
import common.toolkit.java.util.StringUtil;
import common.toolkit.java.util.db.DbcpUtil;
import common.toolkit.java.util.number.IntegerUtil;
import common.toolkit.java.util.system.SystemUtil;

/**
 * Description: System Initialization
 * 
 * @author yinshi.nc
 * @Date 2011-10-27
 */
public class Initialization extends HttpServlet implements Servlet {

	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LoggerFactory.getLogger( Initialization.class );

	public void init() {

		initSystem();
		/** Start monitor core */
		// timer.schedule( new MonitorCore(), 2000,
		// BaseConstant.MILLISECONDS_OF_ONE_MINUTE *
		// SystemConstant.minsRateOfMonitorCore );

		// if( isOk ){
		// ThreadUtil.startThread( new TbMessageSender( new Message( "nileader",
		// "Config-Ops Startup Success", "Config-Ops Startup Success",
		// Message.MessageType.WANGWANG ) ) );
		// LOG.info( "*********************************************************"
		// );
		// LOG.info(
		// "****************Config-Ops Startup Success****************" );
		// LOG.info( "*********************************************************"
		// );
		// }else{
		// ThreadUtil.startThread( new TbMessageSender( new Message( "nileader",
		// "Config-Ops Startup Error", "Config-Ops Startup Error",
		// Message.MessageType.WANGWANG ) ) );
		// LOG.info( "*********************************************************"
		// );
		// LOG.info( "****************Config-Ops Startup Error****************"
		// );
		// LOG.info( "*********************************************************"
		// );
		// }
	}

	/**
	 * 从数据库加载并初始化系统配置
	 */
	private void initSystem() {

		Properties properties = null;
		try {
			properties = SystemUtil.loadProperty();
			if ( ObjectUtil.isBlank( properties ) )
				throw new Exception(
						"Please defined,such as -DconfigFilePath=\"W:\\TaoKeeper\\taokeeper\\config\\config-test.properties\"" );
		} catch ( Exception e ) {
			LOG.error( e.getMessage() );
			throw new RuntimeException( e.getMessage(), e.getCause() );
		}

		DbcpUtil.driverClassName = StringUtil.defaultIfBlank( properties.getProperty( "dbcp.driverClassName" ),
				"com.mysql.jdbc.Driver" );
		DbcpUtil.dbJDBCUrl = StringUtil.defaultIfBlank( properties.getProperty( "dbcp.dbJDBCUrl" ),
				"jdbc:mysql://127.0.0.1:3306/taokeeper" );
		DbcpUtil.characterEncoding = StringUtil.defaultIfBlank( properties.getProperty( "dbcp.characterEncoding" ),
				"UTF-8" );
		DbcpUtil.username = StringUtil.trimToEmpty( properties.getProperty( "dbcp.username" ) );
		DbcpUtil.password = StringUtil.trimToEmpty( properties.getProperty( "dbcp.password" ) );
		DbcpUtil.maxActive = IntegerUtil.defaultIfError( properties.getProperty( "dbcp.maxActive" ), 30 );
		DbcpUtil.maxIdle = IntegerUtil.defaultIfError( properties.getProperty( "dbcp.maxIdle" ), 10 );
		DbcpUtil.maxWait = IntegerUtil.defaultIfError( properties.getProperty( "dbcp.maxWait" ), 10000 );
		
		SystemConstant.BASE_PATH_OF_PIC = StringUtil.defaultIfBlank( properties.getProperty( "basePathOfPic" ), "/root/tasty/pic" );
		
		LOG.warn( ">>>>>>Finish load the properties: " + properties );

	}

}
