import 'package:auth_test/components/app_bar.dart';
import 'package:auth_test/components/app_button.dart';
import 'package:auth_test/screen/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:auth_test/utils/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../components/app_textfield.dart';
import '../../di/injection.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late final ForgotPasswordCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<ForgotPasswordCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar('Forgot Password'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state.isSuccess) {
              context.snackbar
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state.isError) {
              context.snackbar
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Trouble logging in?",
                style: context.textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter your email address and we'll send you a link to get back into your account.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FormBuilder(
                  key: _formKey,
                  child: AppTextField(
                    'email',
                    label: 'Email',
                    hint: 'jhondoe@email.com',
                    validateMode: AutovalidateMode.onUserInteraction,
                    validators: [FormBuilderValidators.email()],
                  )),
              const SizedBox(height: 16),
              AppButton(
                'Send',
                onclick: submit,
                width: context.mediaSize.width,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit() {
    final formKeyState = _formKey.currentState;
    if (formKeyState == null || !formKeyState.validate()) return;
    formKeyState.save();
    final email = formKeyState.value['email'];
    _cubit.resetPassword(email);
  }
}
