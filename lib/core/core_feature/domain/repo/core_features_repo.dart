import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/errors/failure.dart';

import '../../data/entities/get_all_cities_response.dart';

abstract class CoreFeaturesRepo {

  Future<Either<Failure,GetAllCitiesResponse>> getAllCities();


}