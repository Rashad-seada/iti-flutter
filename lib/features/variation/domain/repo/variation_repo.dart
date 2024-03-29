import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/errors/failure.dart';

import '../../data/entities/get_all_sellers_response.dart';
import '../../data/entities/get_button_response.dart';
import '../../data/entities/get_chest_response.dart';
import '../../data/entities/get_collar_response.dart';
import '../../data/entities/get_embroidery_response.dart';
import '../../data/entities/get_fabric_response.dart';
import '../../data/entities/get_front_pocket_response.dart';
import '../../data/entities/get_sleeve_response.dart';

abstract class VariationRepo {


  Future<Either<Failure,GetAllSellersResponse>> getAllSellers();

  Future<Either<Failure,GetAllSellersResponse>> getSellersByLocationId(int id);

  Future<Either<Failure,GetFabricResponse>> getFabricBySellerId(int id);

  Future<Either<Failure,GetCollarResponse>> getCollarBySellerId(int id);

  Future<Either<Failure,GetChestResponse>> getChestBySellerId(int id);

  Future<Either<Failure,GetFrontPocketResponse>> getFrontPocketBySellerId(int id);

  Future<Either<Failure,GetSleeveResponse>> getSleeveBySellerId(int id);

  Future<Either<Failure,GetButtonResponse>> getButtonBySellerId(int id);

  Future<Either<Failure,GetEmbroideryResponse>> getEmbroideryBySellerId(int id);


}