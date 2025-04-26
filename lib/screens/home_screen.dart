import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:m360_ict/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 16,
            bottom: 16,
          ),
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildCO2Reading(),
              const SizedBox(height: 30),
              _buildHistorySection(),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(child: _buildPersonsCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildRoomsCard()),
                ],
              ),
              const SizedBox(height: 30),
              _buildPlantsCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/images/arrow_back.png'),
            ),
            const SizedBox(width: 14),
            Image.asset('assets/images/home.png', width: 28, height: 28),
            const SizedBox(width: 14),
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
          children: [
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
              width: 132,
              child: Column(
                children: [
                  Icon(Icons.arrow_drop_down, color: kPrimaryColor),
                  Row(
                    spacing: 3,
                    children: [
                      Container(height: 7, width: 24, color: Color(0xFF7184FF)),
                      Container(height: 7, width: 24, color: Color(0xFFFF5557)),
                      Container(height: 7, width: 24, color: Color(0xFF2DF18F)),
                      Container(height: 7, width: 24, color: Color(0xFFEBED4D)),
                      Container(height: 7, width: 24, color: Color(0xFFFA9D5A)),
                    ],
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
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: Colors.grey.withOpacity(0.1), strokeWidth: 1);
          },
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final months = [
                  'Sept',
                  'Oct',
                  'Nov',
                  'Dec',
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                ];
                final years = ['24', '24', '24', '24', '25', '25', '25', '25'];

                if (value.toInt() > 0 && value.toInt() < months.length) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        months[value.toInt()],
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFADADAD),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        years[value.toInt()],
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFADADAD),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
              reservedSize: 36,
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            left: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
            bottom: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
            top: BorderSide.none,
            right: BorderSide.none,
          ),
        ),
        minX: 0,
        maxX: 7,
        minY: 1,
        maxY: 7,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(1, 3),
              FlSpot(2, 4),
              FlSpot(3, 5),
              FlSpot(4, 4.4),
              FlSpot(5, 4.4),
              FlSpot(6, 4.7),
              FlSpot(7, 2.3),
            ],
            isCurved: true,
            color: Color(0xFF2FED8E),
            barWidth: 1,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: Color(0xFF2FED8E),
                );
              },
            ),
            belowBarData: BarAreaData(show: false),
          ),
          ...[
            FlSpot(1, 3),
            FlSpot(2, 4),
            FlSpot(3, 5),
            FlSpot(4, 4.4),
            FlSpot(5, 4.4),
            FlSpot(6, 4.7),
            FlSpot(7, 2.3),
          ].map((spot) {
            return LineChartBarData(
              spots: [FlSpot(spot.x, 1), FlSpot(spot.x, spot.y - 0.2)],
              isCurved: false,
              barWidth: 1,
              color: Color(0xFF2FED8E),
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPersonsCard() {
    return Container(
      width: 161,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
          SizedBox(height: 25),
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
                          '+2',
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
    );
  }

  Widget _buildRoomsCard() {
    return Container(
      width: 161,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        //color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Color(0xFF6Ec194), Color(0xFF9BF7C8)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '2 of them requires action',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlantsCard() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Plants',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 10),
                Image.asset('assets/images/plants.png', width: 55, height: 55),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [Color(0xFF6Ec194), Color(0xFF9BF7C8)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
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
          ),
        ],
      ),
    );
  }
}
