import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final void Function()? onclick;
  final bool isChecked;

  const AppButton(
    this.name, {
    Key? key,
    this.onclick,
    this.width,
    this.height,
    this.isChecked = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isChecked ? onclick : null,
        style: ElevatedButton.styleFrom(
            elevation: 6,
            fixedSize: Size(width ?? 100, height ?? 50),
            shape: const StadiumBorder()),
        child: Text(name,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18)));
  }
}
