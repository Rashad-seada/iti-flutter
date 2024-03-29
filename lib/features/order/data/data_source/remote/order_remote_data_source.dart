import 'package:smart_soft/features/order/data/entities/create_order_response.dart';

abstract class OrderRemoteDataSource {


  Future<CreateOrderResponse> createOrder();

}

//
// class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
//
//
//
// }