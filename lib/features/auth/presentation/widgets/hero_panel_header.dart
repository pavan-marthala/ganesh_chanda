import 'package:flutter/material.dart';

class HeroPanelHeader extends StatelessWidget {
  const HeroPanelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 56,
        left: 20,
        right: 20,
        bottom: 44,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(36)),
        gradient: RadialGradient(
          center: Alignment(0.0, -0.6),
          radius: 1.2,
          colors: [
            Color(0xFFFF9A2E),
            Color(0xFFF97316),
            Color(0xFFE4650F),
          ],
          stops: [0.0, 0.6, 1.0],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background subtle circular line decorations
          Positioned(
            top: -50,
            right: -40,
            child: Opacity(
              opacity: 0.14,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: Center(
                  child: Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Opacity(
              opacity: 0.14,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
              ),
            ),
          ),

          // Central Mark and Text
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.35),
                  ),
                ),
                child: Center(
                  child: CustomPaint(
                    size: const Size(40, 40),
                    painter: _HeaderModakPainter(),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontFamily: 'Inter Tight',
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Sign in to manage your committee',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderModakPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final paintFull = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final paintMuted = Paint()
      ..color = Colors.white.withValues(alpha: 0.55)
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
