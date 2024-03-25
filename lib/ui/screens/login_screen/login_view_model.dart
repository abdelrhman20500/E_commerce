import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../domain/use_cases/base_use_case.dart';
import '../../uitlis/base_state.dart';

class LoginViewModel extends Cubit{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 // AuthRepo repo= AuthRepo();
 LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase):super(BaseInitialState());

  void login() {
    if(! formKey.currentState!.validate()) return;
    emit(BaseLoadingState());
    loginUseCase.execute(emailController.text, passwordController.text);
  }
}

