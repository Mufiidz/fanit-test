import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../components/app_textfield.dart';

typedef OnViewPassword = Function();
typedef OnViewConfirmPassword = Function();

class RegisterForm extends StatelessWidget {
  final Key? formKey;
  final String password;
  final Function(String?) onChanged;
  final bool isHiddenPassword;
  final bool isHiddenConfirmPassword;
  final OnViewPassword onViewPassword;
  final OnViewConfirmPassword onViewConfirmPassword;
  const RegisterForm(this.formKey, this.password,
      {super.key,
      required this.isHiddenPassword,
      required this.isHiddenConfirmPassword,
      required this.onViewPassword,
      required this.onViewConfirmPassword,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextField(
                'name',
                label: 'Name',
                hint: 'Jhon Doe',
                textCapitalization: TextCapitalization.words,
                validateMode: AutovalidateMode.onUserInteraction,
                validators: [
                  FormBuilderValidators.minLength(3),
                  FormBuilderValidators.maxLength(50)
                ],
              ),
              const SizedBox(height: 8),
              AppTextField(
                'email',
                label: 'Email',
                hint: 'jhondoe@email.com',
                validateMode: AutovalidateMode.onUserInteraction,
                validators: [FormBuilderValidators.email()],
              ),
              const SizedBox(height: 8),
              AppTextField(
                'password',
                label: 'Password',
                isObscureText: isHiddenPassword,
                validateMode: AutovalidateMode.onUserInteraction,
                onChanged: onChanged,
                suffixIcon: IconButton(
                    onPressed: onViewPassword,
                    icon: Icon(isHiddenPassword
                        ? Icons.remove_red_eye
                        : Icons.visibility_off)),
                validators: [
                  FormBuilderValidators.minLength(8),
                  FormBuilderValidators.match(r'\d',
                      errorText: 'Must contain a number'),
                  FormBuilderValidators.match(r'[A-Z]',
                      errorText: 'Must contain an uppercase character'),
                  FormBuilderValidators.match(r'[a-z]',
                      errorText: 'Must contain a lowercase character'),
                ],
              ),
              const SizedBox(height: 8),
              AppTextField('confirm_password',
                  label: 'Confirm Password',
                  isObscureText: isHiddenConfirmPassword,
                  suffixIcon: IconButton(
                      onPressed: onViewConfirmPassword,
                      icon: Icon(isHiddenConfirmPassword
                          ? Icons.remove_red_eye
                          : Icons.visibility_off)),
                  validateMode: AutovalidateMode.onUserInteraction,
                  validators: [
                    FormBuilderValidators.equal(password,
                        errorText:
                            "This field value must be same with password."),
                  ]),
            ]));
  }
}
