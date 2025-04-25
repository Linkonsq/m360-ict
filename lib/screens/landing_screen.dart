import 'package:flutter/material.dart';
import 'package:m360_ict/main.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAF7),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top card with user info
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD6F1DD),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Good Morning',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Ahmed Ariyan',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                              text: 'You are in a ',
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: 'healthy',
                                  style: TextStyle(color: Colors.green),
                                ),
                                TextSpan(text: ' environment'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 44,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('My Places', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 16),

              // Home Card
              PlaceCard(
                placeName: 'Home',
                status: 'Good',
                ppm: '652',
                percentage: '13%',
                statusColor: Colors.green,
                peopleCount: 2,
              ),
              const SizedBox(height: 16),

              // Office Card
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
        borderRadius: BorderRadius.circular(16),
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
              Container(
                width: 70,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    ppm,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w300,
                      color: kPrimaryColor,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          percentage,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      if (placeName == 'Home')
                        SizedBox(
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
                        )
                      else
                        SizedBox(
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
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Text(
                          'View Details',
                          style: TextStyle(color: kPrimaryColor, fontSize: 10),
                        ),
                        Icon(Icons.arrow_right, size: 25, color: kPrimaryColor),
                      ],
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
