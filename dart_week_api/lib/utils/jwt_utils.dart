import 'package:dart_week_api/model/user_model.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class JwtUtils {
  static const String _jwtChavePrivada =
      'DuGru4jQvUMxP9eyTvDxwp8JhhMTnCXU8cG8YYu8g4jhpRermB5jHSk';

  static String generateTokenJWT(UserModel userModel) {
    final claimSet = JwtClaim(
      issuer: 'http://localhost',
      subject: userModel.id.toString(),
      otherClaims: <String, dynamic>{},
      maxAge: const Duration(
        days: 1,
      ),
    );

    final String token = 'Bearer ${issueJwtHS256(claimSet, _jwtChavePrivada)}';

    return token;
  }

  static JwtClaim verificationToken(String token) {
    return verifyJwtHS256Signature(token, _jwtChavePrivada);
  }
}
