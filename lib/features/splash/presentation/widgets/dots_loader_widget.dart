import 'package:flutter/material.dart';

class DotsLoaderWidget extends StatefulWidget {
  const DotsLoaderWidget({super.key});

  @override
  State<DotsLoaderWidget> createState() => _DotsLoaderWidgetState();
}

class _DotsLoaderWidgetState extends State<DotsLoaderWidget>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200),
      );
    });

    _animations = _controllers.map((controller) {
      return TweenSequence<double>([
        TweenSequenceItem(tween: Tween<double>(begin: 0.6, end: 1.0), weight: 40),
        TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 0.6), weight: 40),
        TweenSequenceItem(tween: ConstantTween<double>(0.6), weight: 20),
      ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();

    for (int i = 0; i < 3; i++) {
      Future.delayed(Duration(milliseconds: i * 150), () {
        if (mounted) {
          _controllers[i].repeat();
        }
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              final val = _animations[index].value;
              return Transform.scale(
                scale: val,
                child: Opacity(
                  opacity: val,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD4AF37),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
