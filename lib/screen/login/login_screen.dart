import 'package:auth_test/components/app_button.dart';
import 'package:auth_test/screen/forgot_password/forgot_password_screen.dart';
import 'package:auth_test/screen/home/home_screen.dart';
import 'package:auth_test/screen/login/components/form_login.dart';
import 'package:auth_test/screen/login/cubit/login_cubit.dart';
import 'package:auth_test/screen/register/register_screen.dart';
import 'package:auth_test/utils/app_context.dart';
import 'package:auth_test/utils/app_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../di/injection.dart';
import '../../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late final LoginCubit _cubit;
  var isHiddenPassword = true;

  @override
  void initState() {
    _cubit = getIt<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state.isSuccess) {
            AppRoute.clearAll(const HomeScreen());
          }
          if (state.isError) {
            context.snackbar.showSnackBar(SnackBar(
              content: Text(state.errorMessage),
            ));
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) => contents[index],
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 8),
              itemCount: contents.length);
        },
      ),
    );
  }

  List<Widget> get contents => [
        Container(
          height: 150,
          alignment: Alignment.centerLeft,
          child: const Text(
            'Login',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        FormLogin(_formKey,
            isHiddenPassword: isHiddenPassword,
            onViewPassword: () => setState(() {
                  isHiddenPassword = !isHiddenPassword;
                })),
        Column(
          children: [
            Container(
              width: context.mediaSize.width,
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => AppRoute.to(const ForgotPasswordScreen()),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
            AppButton('Login', width: context.mediaSize.width, onclick: submit),
            const SizedBox(height: 16),
            Text.rich(
                TextSpan(text: 'Don\'t have an account?', children: <TextSpan>[
              TextSpan(
                  text: ' Sign up.',
                  style: const TextStyle(color: Colors.blueAccent),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => AppRoute.to(const RegisterScreen()))
            ])),
          ],
        )
      ];

  void submit() {
    final formKeyState = _formKey.currentState;
    if (formKeyState == null || !formKeyState.validate()) return;
    formKeyState.save();
    final User(:email, :password) = User.fromJson(formKeyState.value);
    _cubit.login(email, password);
  }
}
