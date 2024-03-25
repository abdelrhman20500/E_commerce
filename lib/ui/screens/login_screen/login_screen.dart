import 'package:e_commerce/domain/repos/auth_repo/auth_repo.dart';
import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/ui/screens/login_screen/login_view_model.dart';
import 'package:e_commerce/ui/uitlis/base_state.dart';
import 'package:e_commerce/ui/uitlis/dialogs.dart';
import 'package:e_commerce/ui/widgets/custom_bottom_widget.dart';
import 'package:e_commerce/ui/widgets/custom_text_fileed.dart';
import 'package:e_commerce/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/auth_repo_impl/auth_repo_impl.dart';


class LoginScreen extends StatefulWidget {
 static String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 LoginViewModel viewModel= LoginViewModel(
   LoginUseCase(AuthRepoImpl())
 );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff004182),
      body: BlocListener(
        bloc: viewModel,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/images/route_logo.png"),
                  const SizedBox(height: 85),
                  const Text("Welcome back to route", style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white
                  ),),
                  const SizedBox(height: 8),
                  const Text("please sign in with your email", style: TextStyle(
                      fontSize: 20, color: Colors.white
                  ),),
                  const SizedBox(height: 40),
                  FormLabel(label: "Email Address"),
                  const SizedBox(height: 24),
                  CustomTextFiled(
                      hintText: "please enter your email",
                      controller: viewModel.emailController,
                      /// check email is well.
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter email';
                        }
                        ///  لو عايز الايميل فيه حروف كبيرة وهكذا
                        var emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'Email format is not valid';
                        }
                        return null;
                      },
                      type: TextInputType.emailAddress,
                      isPassword: false
                  ),
                  const SizedBox(height: 32),
                  FormLabel(label: "password"),
                  const SizedBox(height: 24),
                  CustomTextFiled(
                      hintText: "please enter your password",
                      controller: viewModel.passwordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter password ';
                        }
                        if (text.length < 6) {
                          return 'Password should be at least 6 chrs.';
                        }
                        return null;
                      },
                      type:TextInputType.visiblePassword,
                      isPassword: true
                  ),
                  const SizedBox(height: 16),
                  CustomBottomWidget(
                      onPressed: (){
                        viewModel.login();
                      },
                      title: "Login"),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormLabel(label: " Don't have an account ? "),
                      const Text("Create an account", style: TextStyle(
                        color: Colors.white, fontSize: 18,
                      ),)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        listener: (context, state)
        {
          if(state is BaseLoadingState)
            {
              showLoading(context);
            }
        },
      ),
    );
  }
}
