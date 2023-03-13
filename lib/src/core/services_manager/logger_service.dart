import 'package:logger/logger.dart';

abstract class LoggerService {
  void printVerboseLog(String log);

  void printDebugLog(String log);

  void printInfoLog(String log);

  void printWarningLog(String log);

  void printErrorLog(String log);

  void printWtfLog(String log);
}

class LoggerServiceImpl implements LoggerService {
  Logger logger = Logger(
    // ignore: avoid_redundant_argument_values
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    // ignore: avoid_redundant_argument_values
    output: null,
  );

  @override
  void printVerboseLog(String log) {
    logger.v(log);
  }

  @override
  void printDebugLog(String log) {
    logger.d(log);
  }

  @override
  void printInfoLog(String log) {
    logger.i(log);
  }

  @override
  void printWarningLog(String log) {
    logger.w(log);
  }

  @override
  void printErrorLog(String log) {
    logger.e(log);
  }

  @override
  void printWtfLog(String log) {
    logger.wtf(log);
  }
}
