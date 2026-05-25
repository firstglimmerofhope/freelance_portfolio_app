import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  static final List<ServiceItem> services = [
    ServiceItem(
      imagePath: 'lib/images/service_mobile.png',
      title: 'Mobile App Development',
      description:
      'I build clean and simple mobile apps using Flutter with smooth navigation and modern layouts.',
      tools: ['Flutter', 'Dart', 'Firebase'],
    ),
    ServiceItem(
      imagePath: 'lib/images/service_web.png',
      title: 'Website Development',
      description:
      'I create responsive websites and portfolio pages for small businesses, students, and personal brands.',
      tools: ['HTML', 'CSS', 'JavaScript'],
    ),
    ServiceItem(
      imagePath: 'lib/images/service_firebase.png',
      title: 'Firebase Integration',
      description:
      'I connect apps to Firebase Firestore so data can be stored, updated, and displayed dynamically.',
      tools: ['Firebase', 'Firestore', 'Database'],
    ),
    ServiceItem(
      imagePath: 'lib/images/service_ui.png',
      title: 'UI Design',
      description:
      'I design user-friendly app screens with clean layouts, simple colors, and easy navigation.',
      tools: ['Figma', 'UI Design', 'Prototyping'],
    ),
    ServiceItem(
      imagePath: 'lib/images/service_game.png',
      title: 'Mini Game Prototypes',
      description:
      'I build small interactive apps and simple game prototypes for demos, learning, or class projects.',
      tools: ['Flutter', 'Dart', 'Game UI'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'service',
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'lib/images/home.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      const Text(
                        'What I can do for you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Here are the main services I provide for clients, small businesses, and personal projects.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 35),
                      ...services.map((service) {
                        return ServiceCard(
                          imagePath: service.imagePath,
                          title: service.title,
                          description: service.description,
                          tools: service.tools,
                        );
                      }),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceItem {
  final String imagePath;
  final String title;
  final String description;
  final List<String> tools;

  const ServiceItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.tools,
  });
}

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<String> tools;

  const ServiceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.tools,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Image.asset(
              imagePath,
              height: 165,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 165,
                  width: double.infinity,
                  color: const Color(0xFFE9EEF2),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_outlined,
                    size: 48,
                    color: Colors.black38,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: tools.map((tool) => ToolChip(label: tool)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ToolChip extends StatelessWidget {
  final String label;

  const ToolChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD7C7FF),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}