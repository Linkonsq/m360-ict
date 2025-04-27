import 'package:flutter/material.dart';
import 'package:m360_ict/main.dart';
import 'package:m360_ict/screens/home_details_screen.dart';
import 'package:m360_ict/screens/office_details_screen.dart';
import 'package:m360_ict/widgets/ppm_info.dart';
import 'package:m360_ict/widgets/status_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAF7),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 206,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Stack(
                children: [
                  CustomPaint(
                    size: const Size(double.infinity, double.infinity),
                    painter: DiagonalBackgroundPainter(),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Good Morning",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kGreyTextColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const Text(
                                "Ahmed Ariyan",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: kTitleTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 97,
                              width: 97,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/images/profile.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 25,
                    left: 20,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: kGreyTextColor,
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          const TextSpan(text: "You are in a "),
                          TextSpan(
                            text: "healthy",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: " environment"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('My Places', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 16),

                PlaceCard(
                  placeName: 'Home',
                  status: 'Good',
                  ppm: '652',
                  percentage: '13%',
                  statusColor: Colors.green,
                  peopleCount: 2,
                ),

                const SizedBox(height: 16),

                PlaceCard(
                  placeName: 'Office',
                  status: 'Healthy',
                  ppm: '447',
                  percentage: '37%',
                  statusColor: Colors.green,
                  peopleCount: 47,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String placeName;
  final String status;
  final String ppm;
  final String percentage;
  final Color statusColor;
  final int peopleCount;

  const PlaceCard({
    super.key,
    required this.placeName,
    required this.status,
    required this.ppm,
    required this.percentage,
    required this.statusColor,
    required this.peopleCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  placeName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: StatusCard(text: status),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PpmInfo(value: ppm, percentage: percentage),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      if (placeName == 'Home')
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SizedBox(
                            width: 36 + (4 - 1) * 18.0,
                            height: 36,
                            child: Stack(
                              children: [
                                for (int i = 1; i <= 3; i++)
                                  Positioned(
                                    left: (i - 1) * 18.0,
                                    child: Container(
                                      height: 39,
                                      width: 39,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                          'assets/images/person_$i.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                Positioned(
                                  left: (4 - 1) * 18.0,
                                  child: Container(
                                    height: 39,
                                    width: 39,
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xFFD9D9D9),
                                      child: Text(
                                        '+$peopleCount',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SizedBox(
                            width: 36 + (6 - 1) * 18.0,
                            height: 36,
                            child: Stack(
                              children: [
                                for (int i = 4; i <= 8; i++)
                                  Positioned(
                                    left: (i - 4) * 18.0,
                                    child: Container(
                                      height: 39,
                                      width: 39,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                          'assets/images/person_$i.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                Positioned(
                                  left: (9 - 4) * 18.0,
                                  child: Container(
                                    height: 39,
                                    width: 39,
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xFFD9D9D9),
                                      child: Text(
                                        '+$peopleCount',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      var route =
                          placeName == 'Home'
                              ? HomeDetailsScreen()
                              : OfficeDetailsScreen();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => route),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: const [
                          Text(
                            'View Details',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.arrow_right, color: kPrimaryColor),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DiagonalBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double topSplitX = size.width * 0.45;
    final double bottomSplitX = size.width * 0.75;

    final leftPaint = Paint()..color = Color(0xFFE8F6EE);

    final leftPath =
        Path()
          ..moveTo(0, 0)
          ..lineTo(topSplitX, 0)
          ..lineTo(bottomSplitX, size.height)
          ..lineTo(0, size.height)
          ..close();

    canvas.drawPath(leftPath, leftPaint);

    final rightPaint = Paint()..color = Color(0xFFD4F9E5);

    final rightPath =
        Path()
          ..moveTo(topSplitX, 0)
          ..lineTo(size.width, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(bottomSplitX, size.height)
          ..close();

    canvas.drawPath(rightPath, rightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
