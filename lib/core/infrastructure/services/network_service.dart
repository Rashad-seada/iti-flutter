import 'package:connectivity_plus/connectivity_plus.dart';
import '../../errors/exception.dart';

abstract class NetworkService {

  Future<bool> get isConnected;

}

class NetworkServiceImpl implements NetworkService {


  @override
  Future<bool> get isConnected async {
    try {

      final connectivityResult = await Connectivity().checkConnectivity();

      if(connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw ServiceException("There was unexpected error, please try again");
    }
  }

}