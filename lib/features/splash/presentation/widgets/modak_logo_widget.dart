import 'package:flutter/material.dart';

class ModakLogoWidget extends StatelessWidget {
  const ModakLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 104,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF8A00), Color(0xFFD4AF37)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 50,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Center(
        child: CustomPaint(
          size: const Size(56, 56),
          painter: _ModakIconPainter(),
        ),
      ),
    );
  }
}

class _ModakIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final paintFull = Paint()
      ..color = const Color(0xFF3A1000)
      ..style = PaintingStyle.fill;

    final paintMuted = Paint()
      ..color = const Color(0xFF3A1000).withValues(alpha: 0.55)
      ..style = PaintingStyle.fill;

    // Top tip
    final pathTop = Path();
    pathTop.moveTo(12 * scaleX, 2 * scaleY);
    pathTop.cubicTo(13.1 * scaleX, 3.6 * scaleY, 13.8 * scaleX, 4.9 * scaleY, 13.8 * scaleX, 6.1 * scaleY);
    pathTop.cubicTo(13.8 * scaleX, 7.1 * scaleY, 13 * scaleX, 7.8 * scaleY, 12 * scaleX, 7.8 * scaleY);
    pathTop.cubicTo(11 * scaleX, 7.8 * scaleY, 10.2 * scaleX, 7.1 * scaleY, 10.2 * scaleX, 6.1 * scaleY);
    pathTop.cubicTo(10.2 * scaleX, 4.9 * scaleY, 10.9 * scaleX, 3.6 * scaleY, 12 * scaleX, 2 * scaleY);
    canvas.drawPath(pathTop, paintFull);

    // Middle body
    final pathMid = Path();
    pathMid.moveTo(6 * scaleX, 9.5 * scaleY);
    pathMid.cubicTo(6 * scaleX, 8.1 * scaleY, 8.7 * scaleX, 7 * scaleY, 12 * scaleX, 7 * scaleY);
    pathMid.cubicTo(15.3 * scaleX, 7 * scaleY, 18 * scaleX, 8.1 * scaleY, 18 * scaleX, 9.5 * scaleY);
    pathMid.cubicTo(18 * scaleX, 10.3 * scaleY, 17.1 * scaleX, 10.9 * scaleY, 15.8 * scaleX, 11.3 * scaleY);
    pathMid.cubicTo(16.8 * scaleX, 11.8 * scaleY, 17.4 * scaleX, 12.5 * scaleY, 17.4 * scaleX, 13.3 * scaleY);
    pathMid.cubicTo(17.4 * scaleX, 15.5 * scaleY, 15 * scaleX, 16.7 * scaleY, 12 * scaleX, 16.7 * scaleY);
    pathMid.cubicTo(9 * scaleX, 16.7 * scaleY, 6.6 * scaleX, 15.5 * scaleY, 6.6 * scaleX, 13.3 * scaleY);
    pathMid.cubicTo(6.6 * scaleX, 12.5 * scaleY, 7.2 * scaleX, 11.8 * scaleY, 8.2 * scaleX, 11.3 * scaleY);
    pathMid.cubicTo(6.9 * scaleX, 10.9 * scaleY, 6 * scaleX, 10.3 * scaleY, 6 * scaleX, 9.5 * scaleY);
    canvas.drawPath(pathMid, paintMuted);

    // Base kalash bottom
    final pathBottom = Path();
    pathBottom.moveTo(8.3 * scaleX, 15.9 * scaleY);
    pathBottom.cubicTo(9.2 * scaleX, 16.9 * scaleY, 10.5 * scaleX, 17.5 * scaleY, 12 * scaleX, 17.5 * scaleY);
    pathBottom.cubicTo(13.5 * scaleX, 17.5 * scaleY, 14.8 * scaleX, 16.9 * scaleY, 15.7 * scaleX, 15.9 * scaleY);
    pathBottom.cubicTo(16.7 * scaleX, 17.6 * scaleY, 17.3 * scaleX, 19.1 * scaleY, 17.3 * scaleX, 20.2 * scaleY);
    pathBottom.cubicTo(17.3 * scaleX, 21.8 * scaleY, 14.9 * scaleX, 23 * scaleY, 12 * scaleX, 23 * scaleY);
    pathBottom.cubicTo(9.1 * scaleX, 23 * scaleY, 6.7 * scaleX, 21.8 * scaleY, 6.7 * scaleX, 20.2 * scaleY);
    pathBottom.cubicTo(6.7 * scaleX, 19.1 * scaleY, 7.3 * scaleX, 17.6 * scaleY, 8.3 * scaleX, 15.9 * scaleY);
    canvas.drawPath(pathBottom, paintFull);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
