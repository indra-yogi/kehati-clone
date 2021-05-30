import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<User> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
}