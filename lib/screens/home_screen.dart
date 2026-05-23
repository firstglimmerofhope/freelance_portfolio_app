import 'package:flutter/material.dart';

import 'about_screen.dart';
import 'links_screen.dart';
import 'work_screen.dart';
import 'contact_screen.dart';
import 'services_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This function opens another screen
  void openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(
            color: const Color(0xFFF6F6F6),
          ),

          // Wavy blue corner image
          Positioned(
            bottom: -30,
            right: 0,
            left: 0,

            child: Transform.rotate(
              angle: 1.5708, // 90 degrees

              child: Image.asset(
                'lib/images/corner.png',

                // Increase this if you want the wave taller
                height: 450,

                width: double.infinity,

                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main page content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile icon circle
                  const CircleAvatar(
                    radius: 58,
                    backgroundColor: Color(0xFF81C9F7),

                    child: Icon(
                      Icons.person_outline,
                      size: 80,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Name/title text
                  const Text(
                    "Hi! I'm Ryan",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Freelance Mobile & Web Developer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 35),

                  // First row of buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeMenuButton(
                        imagePath: 'lib/images/message.png',
                        label: 'about',
                        onTap: () => openPage(
                          context,
                          const AboutScreen(),
                        ),
                      ),

                      HomeMenuButton(
                        imagePath: 'lib/images/link.png',
                        label: 'links',
                        onTap: () => openPage(
                          context,
                          const LinksScreen(),
                        ),
                      ),

                      HomeMenuButton(
                        imagePath: 'lib/images/document.png',
                        label: 'work',
                        onTap: () => openPage(
                          context,
                          const WorkScreen(),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Second row of buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeMenuButton(
                        imagePath: 'lib/images/mail.png',
                        label: 'contact',
                        onTap: () => openPage(
                          context,
                          const ContactScreen(),
                        ),
                      ),

                      const SizedBox(width: 35),

                      HomeMenuButton(
                        imagePath: 'lib/images/services.png',
                        label: 'service',
                        onTap: () => openPage(
                          context,
                          const ServicesScreen(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeMenuButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const HomeMenuButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,

          child: Container(
            width: 78,
            height: 78,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),

              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),

            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}