import 'package:flutter/material.dart';
import 'package:m360_ict/main.dart';
import 'package:m360_ict/screens/carbon_emission_screen.dart';

class OfficeDetailsScreen extends StatefulWidget {
  const OfficeDetailsScreen({super.key});

  @override
  State<OfficeDetailsScreen> createState() => _OfficeDetailsScreenState();
}

class _OfficeDetailsScreenState extends State<OfficeDetailsScreen> {
  int people = 52;
  int rooms = 7;
  int area = 3700;
  int ac = 5;
  int refrigerator = 2;
  int computers = 60;
  int indoorPlants = 23;
  int kitchenBurner = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/arrow_back.png'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/office.png',
                      width: 28,
                      height: 28,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFADADAD), width: 1),
                      ),
                    ),
                    child: const Text(
                      'Office',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: kGreyTextColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildCounter(
                        "Total number of people",
                        people,
                        (val) => setState(() => people = val),
                      ),
                      _buildCounter(
                        "Total number of rooms",
                        rooms,
                        (val) => setState(() => rooms = val),
                      ),
                      _buildCounter(
                        "Total area",
                        area,
                        (val) => setState(() => area = val),
                        unit: "(sqft.)",
                      ),
                      _buildCounter(
                        "Total AC",
                        ac,
                        (val) => setState(() => ac = val),
                      ),
                      _buildCounter(
                        "Total Refrigerator",
                        refrigerator,
                        (val) => setState(() => refrigerator = val),
                      ),
                      _buildCounter(
                        "Total Computers",
                        computers,
                        (val) => setState(() => computers = val),
                      ),
                      _buildCounter(
                        "Total Indoor Plants",
                        indoorPlants,
                        (val) => setState(() => indoorPlants = val),
                      ),
                      _buildCounter(
                        "Total Kitchen Burner",
                        kitchenBurner,
                        (val) => setState(() => kitchenBurner = val),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarbonEmissionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Calculate Carbon Emission',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCounter(
    String title,
    int value,
    Function(int) onChanged, {
    String? unit,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            width: 19,
            height: 19,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                if (unit != null)
                  Text(
                    " $unit",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: kGreyTextColor,
                    ),
                  ),
              ],
            ),
          ),

          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.remove,
                size: 20,
                color: Color(0xFF797979),
              ),
              onPressed: () {
                if (value > 0) {
                  onChanged(value - 1);
                }
              },
              padding: EdgeInsets.zero,
            ),
          ),

          const SizedBox(width: 2),
          SizedBox(
            width: 60,
            child: Center(
              child: Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),

          const SizedBox(width: 2),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              icon: const Icon(Icons.add, size: 20, color: Color(0xFF797979)),
              onPressed: () {
                onChanged(value + 1);
              },
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
