import 'package:e_commerce/data/repo/auth_repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../uitlis/base_state.dart';

class LoginViewModel extends Cubit{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 AuthRepo repo= AuthRepo();
  LoginViewModel():super(BaseInitialState());

  void login() {
    if(! formKey.currentState!.validate()) return;
    emit(BaseLoadingState());
    repo.login(emailController.text, passwordController.text);
  }
}

