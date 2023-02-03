import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../main.dart';
import '../models/auth_state.dart';
import '../models/user.dart';
import '../services/auth_service.dart';


final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final userBox = ref.watch(box);

  return AuthNotifier(
      AuthState(
          errorMessage: '',
          isLoad: false,
          isSuccess: false,
          user: userBox == null ? null :  User.fromJson(jsonDecode(userBox))
      ));
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(super.state);


   Future<void> userSignUp({
    required String username,
    required String email,
    required String password,
  }) async {
     state = state.copyWith(isLoad: true, errorMessage: '', isSuccess: false);
     final response = await AuthService.userSignUp(username: username, email: email, password: password);
     response.fold((l) {
       state = state.copyWith(isLoad: false, errorMessage: l, isSuccess: false);
     }, (r) {
       state = state.copyWith(isLoad: false, errorMessage: '', isSuccess: true);
     });
  }




    Future<void> userLogin({
    required String email,
    required String password
  }) async {
      state = state.copyWith(isLoad: true, errorMessage: '', isSuccess: false);
      final response = await AuthService.userLogin(email: email, password: password);
      response.fold((l) {
        state = state.copyWith(isLoad: false, errorMessage: l, isSuccess: false);
      }, (r) {
        state = state.copyWith(isLoad: false, errorMessage: '', isSuccess: true, user: r);
      });
  }



  void userLogOut()  {
    final box = Hive.box<String>('user');
    box.clear();
    state = state.copyWith(user: null);
  }






}