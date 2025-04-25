import 'package:flutter/material.dart';
import 'package:m360_ict/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildCO2Reading(),
              const SizedBox(height: 30),
              _buildHistorySection(),
              const SizedBox(height: 30),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: _buildPersonsCard()),
                    const SizedBox(width: 16),
                    Expanded(child: _buildRoomsCard()),
                  ],
                ),
              ),
              Expanded(child: _buildPlantsCard()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.arrow_back_ios, color: kGreyTextColor),
            const SizedBox(width: 8),
            Image.asset('assets/images/home.png', width: 28, height: 28),
            const SizedBox(width: 8),
            const Text(
              'Home',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: kBoldTextColor,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            width: 70,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Good",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCO2Reading() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: 10),
            Row(
              children: [
                Text(
                  "652",
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w300,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    Container(
                      width: 49,
                      height: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                            size: 20,
                            color: Colors.white,
                          ),
                          Text(
                            "13%",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'ppm',
                      style: TextStyle(
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 10,
              width: 132,
              child: Row(
                spacing: 3,
                children: [
                  Expanded(
                    child: Container(
                      height: 7,
                      width: 24,
                      color: Color(0xFF7184FF),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 7,
                      width: 24,
                      color: Color(0xFFFF5557),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 7,
                      width: 24,
                      color: Color(0xFF2DF18F),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 7,
                      width: 24,
                      color: Color(0xFFEBED4D),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 7,
                      width: 24,
                      color: Color(0xFFFA9D5A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHistorySection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'History',
              style: TextStyle(
                fontSize: 16,
                color: kGreyTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                const Text(
                  'See all',
                  style: TextStyle(
                    color: Color(0xFFADADAD),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Icon(
                  Icons.arrow_right_sharp,
                  color: Colors.grey,
                  size: 22,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(height: 180, child: _buildHistoryChart()),
      ],
    );
  }

  Widget _buildHistoryChart() {
    return CustomPaint(
      size: const Size(double.infinity, 180),
      painter: ChartPainter(),
    );
  }

  Widget _buildPersonsCard() {
    return Container(
      width: 161,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Persons',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF4D4D4D),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 40,
            width: 130,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  child: _buildPersonAvatar(Colors.green.withOpacity(0.2)),
                ),
                Positioned(
                  left: 25, // Slightly overlapping
                  child: _buildPersonAvatar(Colors.blue.withOpacity(0.2)),
                ),
                Positioned(
                  left: 50, // Slightly overlapping
                  child: _buildPersonAvatar(Colors.amber.withOpacity(0.2)),
                ),
                Positioned(
                  left: 75, // Slightly overlapping
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '+2',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonAvatar(Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }

  Widget _buildRoomsCard() {
    return Container(
      width: 161,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Rooms',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const Text(
            '5',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: const Text(
          //     '2 of them requires action',
          //     style: TextStyle(
          //       color: Color(0xFF9EDEC6),
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildPlantsCard() {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Plants',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: kPrimaryColor,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/plants.png', width: 55, height: 55),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  '43',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFF9EDEC6)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

    final dotPaint =
        Paint()
          ..color = const Color(0xFF9EDEC6)
          ..style = PaintingStyle.fill;

    final path = Path();

    // Define chart data points (normalized between 0 and 1)
    List<Offset> points = [
      Offset(0, 0.7),
      Offset(size.width / 6, 0.5),
      Offset(size.width / 3, 0.2),
      Offset(size.width / 2, 0.1),
      Offset(2 * size.width / 3, 0.3),
      Offset(5 * size.width / 6, 0.2),
      Offset(size.width, 0.85),
    ];

    // Create the path from points
    path.moveTo(points[0].dx, size.height * points[0].dy);
    for (int i = 1; i < points.length; i++) {
      final p0 = i > 0 ? points[i - 1] : points[0];
      final p1 = points[i];

      // Calculate control points for the curve
      final cp1x = p0.dx + (p1.dx - p0.dx) / 2;
      final cp1y = p0.dy;
      final cp2x = p0.dx + (p1.dx - p0.dx) / 2;
      final cp2y = p1.dy;

      path.cubicTo(
        cp1x,
        size.height * cp1y,
        cp2x,
        size.height * cp2y,
        p1.dx,
        size.height * p1.dy,
      );
    }

    // Draw the path
    canvas.drawPath(path, paint);

    // Draw dots at each data point
    for (var point in points) {
      canvas.drawCircle(Offset(point.dx, size.height * point.dy), 5, dotPaint);

      // Draw vertical lines
      final linePaint =
          Paint()
            ..color = const Color(0xFF9EDEC6).withOpacity(0.3)
            ..strokeWidth = 1;

      canvas.drawLine(
        Offset(point.dx, size.height * point.dy),
        Offset(point.dx, size.height),
        linePaint,
      );
    }

    // Draw x-axis labels
    const months = [
      'Oct\n24',
      'Nov\n24',
      'Dec\n24',
      'Jan\n25',
      'Feb\n25',
      'Mar\n25',
      'Apr\n25',
    ];
    final textStyle = TextStyle(color: Colors.grey[400], fontSize: 12);
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    for (int i = 0; i < months.length; i++) {
      textPainter.text = TextSpan(text: months[i], style: textStyle);
      textPainter.layout(minWidth: 0, maxWidth: size.width / 7);
      final xPos = (i * size.width / 6);
      textPainter.paint(
        canvas,
        Offset(xPos - textPainter.width / 2, size.height + 5),
      );
    }

    // Draw horizontal grid lines
    final gridPaint =
        Paint()
          ..color = Colors.grey[300]!
          ..strokeWidth = 0.5;

    for (int i = 1; i <= 4; i++) {
      double y = (i * size.height / 5);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
