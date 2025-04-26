import 'package:flutter/material.dart';
import 'package:m360_ict/main.dart';

class CarbonEmissionScreen extends StatelessWidget {
  const CarbonEmissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Image.asset('assets/images/arrow_back.png'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '1300',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFFF5557),
                          ),
                        ),
                        TextSpan(
                          text: ' ppm',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFFF5557),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 40,
                    color: Color(0xFFFF5557),
                  ),
                  Row(
                    spacing: 6,
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
                ],
              ),
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Very Unhealthy: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFF5557),
                      ),
                    ),
                    TextSpan(
                      text: 'Your office is emitting a lot of Carbon Dioxide',
                      style: TextStyle(
                        fontSize: 16,
                        color: kGreyTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Color(0xFFD2FFE8),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 29,
                          width: 29,
                          child: Image.asset('assets/images/plants.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Plant',
                      style: TextStyle(
                        fontSize: 14,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '189 indoor plants',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Your office emits 2549ppm Carbon dioxide everyday',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFf797979),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Planted',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '23/189',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFf797979),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 12,
                        child: Stack(
                          children: [
                            LinearProgressIndicator(
                              value: 23 / 189,
                              minHeight: 12,
                              backgroundColor: Color(0xFFF2F2F2),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.transparent,
                              ),
                            ),
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [kPrimaryColor, Color(0xFF2Df28F)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.srcIn,
                              child: LinearProgressIndicator(
                                value: 23 / 189,
                                minHeight: 12,
                                backgroundColor: Colors.transparent,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(10),
                    //   child: LinearProgressIndicator(
                    //     value: 23 / 189,
                    //     minHeight: 12,
                    //     backgroundColor: Colors.grey.shade200,
                    //     valueColor: AlwaysStoppedAnimation<Color>(
                    //       Colors.green.shade400,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
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
}
