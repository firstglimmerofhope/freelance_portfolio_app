import 'package:flutter/material.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({super.key});

  // Shows a small message when a link is clicked
  void showLinkMessage(BuildContext context, String platform) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening $platform...'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 10,
              ),

              color: Colors.white,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  const Text(
                    'links',
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

            const SizedBox(height: 90),

            // Link buttons
            LinkButton(
              imagePath: 'lib/images/twitter.png',
              title: 'Twitter',
              onTap: () => showLinkMessage(context, 'Twitter'),
            ),

            LinkButton(
              imagePath: 'lib/images/instagram.png',
              title: 'Instagram',
              onTap: () => showLinkMessage(context, 'Instagram'),
            ),

            LinkButton(
              imagePath: 'lib/images/facebook.png',
              title: 'Facebook',
              onTap: () => showLinkMessage(context, 'Facebook'),
            ),

            LinkButton(
              imagePath: 'lib/images/github.png',
              title: 'GitHub',
              onTap: () => showLinkMessage(context, 'GitHub'),
            ),

            LinkButton(
              imagePath: 'lib/images/discord.png',
              title: 'Discord',
              onTap: () => showLinkMessage(context, 'Discord'),
            ),
          ],
        ),
      ),
    );
  }
}

class LinkButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const LinkButton({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 26,
      ),

      child: GestureDetector(
        onTap: onTap,

        child: Container(
          height: 84,

          padding: const EdgeInsets.symmetric(horizontal: 30),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(12),

            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),

          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 55,
                height: 55,
                fit: BoxFit.contain,
              ),

              const SizedBox(width: 35),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}