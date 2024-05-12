import 'package:ai_app/homepage/mytab.dart';
import 'package:flutter/material.dart';
import 'package:ai_app/user_page.dart';

class PoshanSathiPage extends StatefulWidget {
  @override
  _PoshanSathiPageState createState() => _PoshanSathiPageState();
}

class _PoshanSathiPageState extends State<PoshanSathiPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  MyTabBar()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Stack(
          children: [
            Positioned.fill(child: _buildBackgroundCurves()),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Welcome',
                  //   style: TextStyle(
                  //     fontSize: 34,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  // Add additional content here
                  Image.asset('assets/image/PoshanSathi.png'),
                  SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => const MyTabBar()),
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.white,
                  //   ),
                  //   child: Text('CONTINUE'),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundCurves() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: _CurvePainter(_animation.value),
          child: Container(),
        );
      },
    );
  }
}

class _CurvePainter extends CustomPainter {
  final double animationValue;

  _CurvePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 240, 240, 240)
      ..style = PaintingStyle.fill;

    final path = Path();
    final waveHeight =
        size.height * 0.2; // Adjusted to make the wave slightly lower

    path.moveTo(
        0, size.height * 0.6); // Adjusted the starting point to make it higher
    path.quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.6 -
            waveHeight *
                animationValue, // Adjusted the control point
        size.width * 0.5,
        size.height * 0.6); // Adjusted the end point
    path.quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.6 +
            waveHeight *
                animationValue, // Adjusted the control point
        size.width,
        size.height * 0.6); // Adjusted the end point

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}



