import 'package:flutter/material.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/features/splash/presentation/widgets/dots_loader_widget.dart';
import 'package:ganesh_chanda/features/splash/presentation/widgets/modak_logo_widget.dart';
import 'package:ganesh_chanda/features/splash/presentation/widgets/rangoli_bg_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.2),
            radius: 1.2,
            colors: [Color(0xFFB23A2E), Color(0xFF8B1E2D), Color(0xFF5C1220)],
            stops: [0.0, 0.55, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Spinning Rangoli background motif
              const Positioned(child: RangoliBgWidget()),

              // Brand Mark & Titles
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ModakLogoWidget(),
                  const SizedBox(height: 28),
                  Text(
                    'Ganesh Chanda',
                    style: context.appTypography.headlineLarge.copyWith(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'COMMITTEE & CHANDA MANAGER',
                    style: context.appTypography.labelSmall.copyWith(
                      color: const Color(0xFFFFF8F1).withValues(alpha: 0.7),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.8,
                    ),
                  ),
                ],
              ),

              // Loading animation
              const Positioned(bottom: 64, child: DotsLoaderWidget()),

              // Footer credit
              Positioned(
                bottom: 24,
                child: Text(
                  'Shree Ganesh Utsav Mandal Suite',
                  style: context.appTypography.caption.copyWith(
                    color: const Color(0xFFFFF8F1).withValues(alpha: 0.45),
                    fontSize: 11,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
