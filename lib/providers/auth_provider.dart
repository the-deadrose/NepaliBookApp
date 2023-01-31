import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui/common/firebase_instances.dart';
import 'package:image_picker/image_picker.dart';
import '../models/auth_state.dart';
import '../services/auth_service.dart';


final authStream = StreamProvider((ref) => FirebaseInstances.firebaseAuth.authStateChanges());
final usersStream = StreamProvider((ref) => FirebaseInstances.firebaseChat.users());

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(AuthState.empty()));

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(super.state);

  Future<void> userSignUp(
      {required String username,
      required String email,
      required String password,
      required XFile image}) async {
    state = state.copyWith(isLoad: true, errorMessage: '', isSuccess: false);
    final response = await AuthService.userSignUp(
        username: username, email: email, password: password, image: image);
    response.fold((l) {
      state = state.copyWith(isLoad: false, errorMessage: l, isSuccess: false);
    }, (r) {
      state = state.copyWith(isLoad: false, errorMessage: '', isSuccess: true);
    });
  }

  Future<void> userLogin(
      {required String email, required String password}) async {
    state = state.copyWith(isLoad: true, errorMessage: '', isSuccess: false);
    final response =
        await AuthService.userLogin(email: email, password: password);
    response.fold((l) {
      state = state.copyWith(isLoad: false, errorMessage: l, isSuccess: false);
    }, (r) {
      state = state.copyWith(isLoad: false, errorMessage: '', isSuccess: true);
    });
  }

  Future<void> userLogOut() async {
    state = state.copyWith(isLoad: true, errorMessage: '', isSuccess: false);
    final response = await AuthService.userLogOut();
    response.fold((l) {
      state = state.copyWith(isLoad: false, errorMessage: l, isSuccess: false);
    }, (r) {
      state = state.copyWith(isLoad: false, errorMessage: '', isSuccess: true);
    });
  }
}
