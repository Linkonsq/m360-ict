import 'package:flutter/material.dart';
import 'package:m360_ict/main.dart';

class PpmInfo extends StatelessWidget {
  final String value;
  final String percentage;

  const PpmInfo({super.key, required this.value, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
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
                  Icon(Icons.arrow_drop_down, size: 20, color: Colors.white),
                  Text(
                    percentage,
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
    );
  }
}
