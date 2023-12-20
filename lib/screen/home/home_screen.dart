import 'package:auth_test/components/app_bar.dart';
import 'package:auth_test/components/app_button.dart';
import 'package:auth_test/screen/home/cubit/home_cubit.dart';
import 'package:auth_test/screen/login/login_screen.dart';
import 'package:auth_test/utils/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../utils/app_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<HomeCubit>();
    _cubit.initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(
          'AuthTest',
          showBackButton: false,
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
            bloc: _cubit,
            listener: (context, state) {
              if (state.isSuccess) {
                context.snackbar
                    .showSnackBar(SnackBar(content: Text(state.message)));
                AppRoute.clearAll(const LoginScreen());
              }
              if (state.isError) {
                context.snackbar
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return SizedBox(
                  width: context.mediaSize.width,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: context.mediaSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(state.user.name,
                          style: context.textTheme.headlineLarge),
                      const SizedBox(height: 10),
                      Text(
                        "Email: ${state.user.email} (${state.isVerified ? "Verified" : "Not Verified"})",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      AppButton(
                        'Logout',
                        onclick: _cubit.logout,
                        width: context.mediaSize.width,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
