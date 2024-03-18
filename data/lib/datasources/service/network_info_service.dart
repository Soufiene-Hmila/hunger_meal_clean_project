import 'dart:io';

abstract class NetworkInfoService {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfoService {

  @override
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
  
}
