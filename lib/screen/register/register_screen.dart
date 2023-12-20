import 'package:auth_test/di/injection.dart';
import 'package:auth_test/screen/register/components/register_form.dart';
import 'package:auth_test/screen/register/cubit/register_cubit.dart';
import 'package:auth_test/utils/app_context.dart';
import 'package:auth_test/utils/app_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../components/app_bar.dart';
import '../../components/app_button.dart';
import '../../models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late final RegisterCubit _cubit;
  var isHiddenPassword = true;
  var isHiddenConfirmPassword = true;
  var _password = '';

  @override
  void initState() {
    _cubit = getIt<RegisterCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar('', showBackButton: true),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state.isSuccess) {
            context.snackbar.showSnackBar(const SnackBar(
              content: Text("Success Registered"),
            ));
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
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: contents.length,
          );
        },
      ),
    );
  }

  List<Widget> get contents => [
        Container(
          height: 100,
          alignment: Alignment.centerLeft,
          child: const Text(
            'Register',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        RegisterForm(_formKey, _password,
            isHiddenPassword: isHiddenPassword,
            isHiddenConfirmPassword: isHiddenConfirmPassword,
            onViewPassword: () => setState(() {
                  isHiddenPassword = !isHiddenPassword;
                }),
            onViewConfirmPassword: () => setState(() {
                  isHiddenConfirmPassword = !isHiddenConfirmPassword;
                }),
            onChanged: (value) {
              setState(() {
                if (value != null) {
                  _password = value;
                }
              });
            }),
        Column(
          children: [
            const SizedBox(height: 16),
            Text.rich(TextSpan(text: 'Have an account?', children: <TextSpan>[
              TextSpan(
                  text: ' Sign in.',
                  style: const TextStyle(color: Colors.blueAccent),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => AppRoute.back())
            ])),
            const SizedBox(height: 16),
            AppButton('Register',
                width: context.mediaSize.width, onclick: submit)
          ],
        )
      ];

  void submit() {
    final formKeyState = _formKey.currentState;
    if (formKeyState == null || !formKeyState.validate()) return;
    formKeyState.save();
    final user = User.fromJson(formKeyState.value);
    _cubit.register(user);
  }
}
