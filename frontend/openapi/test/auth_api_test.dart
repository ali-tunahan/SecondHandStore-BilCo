import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    //Future<AuthorizeDTO> apiAuthAuthorizePost({ AuthorizeRequest authorizeRequest }) async
    test('test apiAuthAuthorizePost', () async {
      // TODO
    });

    //Future apiAuthIdGet(String id) async
    test('test apiAuthIdGet', () async {
      // TODO
    });

    //Future apiAuthIdPut(String id, { UserDTO userDTO }) async
    test('test apiAuthIdPut', () async {
      // TODO
    });

    //Future<AuthorizeDTO> apiAuthRefreshPost({ RefreshRequest refreshRequest }) async
    test('test apiAuthRefreshPost', () async {
      // TODO
    });

    //Future<User> apiAuthRegisterPost({ CreateUserDTO createUserDTO }) async
    test('test apiAuthRegisterPost', () async {
      // TODO
    });

    //Future apiAuthRevokePost({ String userId }) async
    test('test apiAuthRevokePost', () async {
      // TODO
    });

  });
}
