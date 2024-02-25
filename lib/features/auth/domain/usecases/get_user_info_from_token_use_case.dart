import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../core/errors/failure.dart';

class GetUserInfoFromJwt {

  Future<Either<Failure, dynamic>> call(String token) async {
    Map<String, dynamic>? decodedToken = JwtDecoder.decode(token);

    // Access the decoded token data
    return right(null);
  }

}