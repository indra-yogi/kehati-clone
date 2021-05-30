import 'package:get/get.dart';
import 'package:practice_test/controllers/auth/auth_controller.dart';
import 'package:practice_test/states/auth/login_states.dart';

class LoginController extends GetxController {
  final AuthController _authController = Get.find();
  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  void login(String email, String password) async {
    _loginStateStream.value = LoginLoading();

    try {
      await _authController.signIn(email, password);
      _loginStateStream.value = LoginState();
    } on AuthenticationException catch(e) {
      _loginStateStream.value = LoginFailure(error: e.msg);
    }
  }
}