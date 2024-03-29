import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/errors/failure.dart';

import '../../data/entities/get_home_response.dart';

abstract class HomeRepo {

  Future<Either<Failure,GetHomeResponse>> getHome(String token);

  Future<Either<Failure,GetHomeResponse>> setHomeAd({
    required String token,
    required String sellerId,
    required String description,
    required XFile image,
  });

}