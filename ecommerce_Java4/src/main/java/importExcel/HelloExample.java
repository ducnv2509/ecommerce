package importExcel;


import org.apache.logging.log4j.*;

public class HelloExample {
    final static Logger logger = LogManager.getLogger(HelloExample.class.getName());

    public static void main(String[] args) {
        logger.info("Click successfully");
        logger.error("DB connection failed");
        logger.info("Click successfully");
        logger.error("DB connection failed");
        logger.info("Click successfully");
        logger.error("DB connection failed");
//        logger.debug("This is debug");
//        logger.fatal("thi is fatal");
//        logger.info("Click successfully");
//        logger.error("DB connection failed");
//        logger.debug("This is debug");
//        logger.fatal("thi is fatal");
//        logger.info("Click successfully");
//        logger.error("DB connection failed");
//        logger.debug("This is debug");
//        logger.fatal("thi is fatal");
    }
//    public static void main(String[] args) {
//        HelloExample obj = new HelloExample();
//        obj.runMe("mkyong");
//
//    }

//    private void runMe(String parameter) {
//
//        if (logger.isDebugEnabled()) {
//            logger.debug("This is debug : " + parameter);
//        }
//
//        if (logger.isInfoEnabled()) {
//            logger.info("This is info : " + parameter);
//        }
//
//        logger.warn("This is warn : " + parameter);
//        logger.error("This is error : " + parameter);
//        logger.fatal("This is fatal : " + parameter);
//
//    }
}
