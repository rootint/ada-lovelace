import 'dart:developer';

class Logger {
  static final List<Log> _logs = [];

  static List<Log> get logs => _logs;

  static void addToLog(String message) {
    var time = DateTime.now();
    _logs.add(Log(time: time, message: message));
    log('${time.toIso8601String()}: $message');
  }
}

class Log {
  DateTime time;
  String message;

  Log({
    required this.time,
    required this.message,
  });
}