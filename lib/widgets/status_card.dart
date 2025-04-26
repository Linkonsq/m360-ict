import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String text;

  const StatusCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF47BA80),
            Color(0xFF42D588),
            Color(0xFF65D49C),
            Color(0xFF2DF28F),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
