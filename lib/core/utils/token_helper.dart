import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:smart_soft/core/errors/exception.dart';
import 'package:smart_soft/features/auth/data/entities/user_entity.dart';

abstract class TokenHelper {

  UserEntity userFromToken(String token);

}

class TokenHelperImpl implements TokenHelper {

  @override
  UserEntity userFromToken(String token) {
    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      return UserEntity(
        token: token,
        role: decodedToken["role"],
        id: decodedToken["id"],
      );
    } catch (e) {
      throw InternalException(e.toString());
    }

  }


}