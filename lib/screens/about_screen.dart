import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  List<String> getStringList(dynamic value) {
    if (value == null) {
      return [];
    }

    return List<String>.from(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      body: SafeArea(
        child: Column(
          children: [
            // Top bar
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
                    'about',
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
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('about')
                    .doc('main')
                    .snapshots(),

                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final data =
                  snapshot.data!.data() as Map<String, dynamic>;

                  final name = data['name'] ?? '';
                  final role = data['role'] ?? '';
                  final intro = data['intro'] ?? '';
                  final goal = data['goal'] ?? '';

                  final focuses = getStringList(data['focuses']);
                  final programmingSkills =
                  getStringList(data['programmingskills']);
                  final mobileWebSkills =
                  getStringList(data['mobileWebSkills']);
                  final databaseTools =
                  getStringList(data['databaseTools']);
                  final languages = getStringList(data['languages']);
                  final interests = getStringList(data['interests']);

                  final education1Degree =
                      data['education1Degree'] ?? '';
                  final education1School =
                      data['education1School'] ?? '';
                  final education1Year =
                      data['education1Year'] ?? '';

                  final education2Degree =
                      data['education2Degree'] ?? '';
                  final education2School =
                      data['education2School'] ?? '';
                  final education2Year =
                      data['education2Year'] ?? '';

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 55),

                        // Profile image
                        const CircleAvatar(
                          radius: 75,
                          backgroundColor: Color(0xFF81C9F7),
                          child: Icon(
                            Icons.person_outline,
                            size: 95,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 28),

                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 40,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC6A100),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          role,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),

                        const SizedBox(height: 35),

                        const Divider(height: 1),

                        Padding(
                          padding: const EdgeInsets.all(28),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                intro,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),

                              const SizedBox(height: 20),

                              Text(
                                focuses
                                    .map((item) => '> $item')
                                    .join('\n'),
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.6,
                                ),
                              ),

                              const SizedBox(height: 25),

                              Text(
                                goal,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),

                              const SizedBox(height: 30),

                              const SectionTitle(title: 'Education'),

                              const SizedBox(height: 20),

                              EducationItem(
                                degree: education1Degree,
                                school: education1School,
                                year: education1Year,
                              ),

                              const SizedBox(height: 22),

                              EducationItem(
                                degree: education2Degree,
                                school: education2School,
                                year: education2Year,
                              ),

                              const SizedBox(height: 45),

                              const SectionTitle(title: 'Skills'),

                              const SizedBox(height: 25),

                              SkillGroup(
                                title: 'Programming:',
                                skills: programmingSkills,
                                color: const Color(0xFFC76363),
                              ),

                              const SizedBox(height: 28),

                              SkillGroup(
                                title: 'Mobile & Web:',
                                skills: mobileWebSkills,
                                color: const Color(0xFFC17A2A),
                              ),

                              const SizedBox(height: 28),

                              SkillGroup(
                                title: 'Database & Tools:',
                                skills: databaseTools,
                                color: const Color(0xFFB15BA8),
                              ),

                              const SizedBox(height: 45),

                              const SectionTitle(title: 'Language'),

                              const SizedBox(height: 25),

                              Text(
                                'I have native fluency in ${languages.join(' and ')}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black54,
                                ),
                              ),

                              const SizedBox(height: 45),

                              const SectionTitle(title: 'Interests'),

                              const SizedBox(height: 25),

                              Text(
                                interests
                                    .map((item) => '> $item')
                                    .join('   '),
                                style: const TextStyle(
                                  fontSize: 15,
                                  height: 1.6,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black54,
                                ),
                              ),

                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.black,
      ),
    );
  }
}

class EducationItem extends StatelessWidget {
  final String degree;
  final String school;
  final String year;

  const EducationItem({
    super.key,
    required this.degree,
    required this.school,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            degree,
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            school,
            style: const TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            year,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class SkillGroup extends StatelessWidget {
  final String title;
  final List<String> skills;
  final Color color;

  const SkillGroup({
    super.key,
    required this.title,
    required this.skills,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),

          const SizedBox(height: 18),

          Padding(
            padding: const EdgeInsets.only(left: 32),

            child: Text(
              skills.join('\n'),
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: color,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}