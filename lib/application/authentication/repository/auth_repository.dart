import 'package:beauty_center/application/authentication/models/user_model.dart';
import 'package:beauty_center/configure_di.dart';
import 'package:beauty_center/core/data/new_remote/network_service.dart';
import 'package:beauty_center/core/data/new_remote/response_model.dart';

abstract class AuthRepo {
  Future logIn({required String phoneNumber, required String password});
}

class AuthRepoImpl implements AuthRepo {
  NetworkService networkService;
  AuthRepoImpl(this.networkService);
  @override
  Future logIn({
    required String phoneNumber,
    required String password,
  }) async {
    ResponseModel response = await getIt<NetworkService>().sendRequest(
        "auth/login",
        method: HttpMethod.post,
        bodyType: BodyType.formData,
        body: {
          "phone": phoneNumber,
          "password": password,
        });
    if (response.success == "true") {
      return UserModel.fromJson(response.content);
    }
  }
}
