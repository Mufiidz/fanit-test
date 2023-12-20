import 'package:flutter/material.dart';

import '../utils/app_route.dart';

typedef BackPressCallback = Function()?;

class DefaultAppBar extends AppBar {
  final String name;
  final BackPressCallback onBackPressed;
  final bool showBackButton;
  final bool isEnabledBackButton;

  DefaultAppBar(
    this.name, {
    super.key,
    super.actions,
    this.onBackPressed,
    this.showBackButton = true,
    this.isEnabledBackButton = true,
  }) : super(
            title: Text(name),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            leading: showBackButton
                ? AppBack(
                    onClick: isEnabledBackButton ? onBackPressed : () {},
                  )
                : null);
}

class AppBack extends StatelessWidget {
  final Function()? onClick;
  const AppBack({Key? key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onClick ?? AppRoute.back(),
        icon: const Icon(Icons.arrow_back));
  }
}
