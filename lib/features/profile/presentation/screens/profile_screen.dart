import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_buitton.dart';
import 'package:ganesh_chanda/features/auth/presentation/bloc/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return Center(
                  child: AppButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        AuthEvent.signOutRequested(),
                      );
                    },
                    text: "Sign Out",
                    color: context.appColors.secondary,
                    icon: Icon(
                      Icons.exit_to_app,
                      color: context.appColors.white,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
