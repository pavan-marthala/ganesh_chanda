import 'dart:math' as math;
import 'package:flutter/material.dart';

class RangoliBgWidget extends StatefulWidget {
  const RangoliBgWidget({super.key});

  @override
  State<RangoliBgWidget> createState() => _RangoliBgWidgetState();
}

class _RangoliBgWidgetState extends State<RangoliBgWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: CustomPaint(
            size: const Size(520, 520),
            painter: _RangoliPainter(),
          ),
        );
      },
    );
  }
}

class _RangoliPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = const Color(0xFFFFF8F1).withValues(alpha: 0.10)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Concentric circles
    canvas.drawCircle(center, 230, paint);
    canvas.drawCircle(center, 180, paint);
    canvas.drawCircle(center, 130, paint);

    // Petal geometry (12 points)
    final path = Path();
    path.moveTo(0, -230);
    path.lineTo(15, -150);
    path.lineTo(0, -110);
    path.lineTo(-15, -150);
    path.close();

    for (int i = 0; i < 12; i++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(i * (math.pi / 6));
      canvas.drawPath(path, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
