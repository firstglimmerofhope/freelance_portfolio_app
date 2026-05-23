import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  void showEmailMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening email app...'),
        duration: Duration(seconds: 1),
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
                    'contact',
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text(
                      'Send me an mail!',
                      style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 55),

                    const Text(
                      'The easiest and the fastest way to reach me is through email!\n'
                          'You can also message me through my social media, but I prefer'
                          'email because I frequently check my mail.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 55),

                    Image.asset(
                      'lib/images/mailbox.png',
                      width: 210,
                      height: 210,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 45),

                    const Text.rich(
                      TextSpan(
                        text: 'email me at ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                        children: [
                          TextSpan(
                            text: 'ryanbusiness876@gmail.com',
                            style: TextStyle(
                              color: Color(0xFFC6A100),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'or you can click the button to open your mail app',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: () {
                        showEmailMessage(context);
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD4AA1F),
                        foregroundColor: Colors.white,

                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 14,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      child: const Text(
                        'send me an email!',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}