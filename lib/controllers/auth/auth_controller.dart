import 'package:get/get.dart';
import 'package:practice_test/states/auth/auth_states.dart';

class AuthController extends GetxController {
  final AuthService _authService;
  final _authStateStream = AuthState().obs;

  AuthState get state => _authStateStream.value;

  AuthController(this._authService);

  // Called immediately after the controller is allocated in memory
  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  Future<void> signIn(String email, String password) async {
    final user = await _authService.signInWithEmailAndPassword(email, password);
    _authStateStream.value = Authenticated(user: user);
  }

  void signOut() async {
    await _authService.signOut();
    _authStateStream.value = Unauthenticated();
  }

  void _getAuthenticatedUser() async {
    _authStateStream.value = AuthLoading();

    final user = await _authService.getCurrentUser();

    if(user == null) {
      _authStateStream.value = Unauthenticated();
    } else {
      _authStateStream.value = Authenticated(user: user);
    }
  }
}