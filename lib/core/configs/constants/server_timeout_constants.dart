class ServerTimeoutConstants {
  const ServerTimeoutConstants._();
  static const timeOut = Duration(milliseconds: 15000);
  static const connectTimeoutInMs = Duration(milliseconds: 30000);
  static const receiveTimeoutInMs = Duration(milliseconds: 30000);
  static const sendTimeoutInMs = Duration(milliseconds: 30000);
}
