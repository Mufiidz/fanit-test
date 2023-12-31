import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AppTextField extends StatelessWidget {
  final String name;
  final String? label;
  final String? hint;
  final bool isObscureText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final List<String? Function(String?)>? validators;
  final Function(String?)? onChanged;
  final Widget? suffixIcon;
  final String? initialValue;
  final AutovalidateMode? validateMode;
  const AppTextField(this.name,
      {Key? key,
      this.label,
      this.hint,
      this.isObscureText = false,
      this.keyboardType = TextInputType.text,
      this.textCapitalization = TextCapitalization.none,
      this.validators,
      this.onChanged,
      this.suffixIcon,
      this.initialValue, this.validateMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      autovalidateMode: validateMode,
      initialValue: initialValue,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      obscureText: isObscureText,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2),
        ),
        hintText: hint,
      ),
      validator: FormBuilderValidators.compose(_getValidators(validators)),
      onChanged: onChanged,
    );
  }

  List<FormFieldValidator<String>> _getValidators(
      List<String? Function(String? p1)>? validators) {
    List<FormFieldValidator<String>> listValidators = [];
    listValidators.add(
      FormBuilderValidators.required(),
    );
    if (validators != null && validators.isNotEmpty) {
      listValidators.addAll(validators);
    }

    return listValidators;
  }
}