import 'package:meta/meta.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  /// Returns true if a internet connection is available
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  const NetworkInfoImpl({
    @required this.connectionChecker,
  });

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
