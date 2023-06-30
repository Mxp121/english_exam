import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final List<Map<String, dynamic>> quizLevels = [
    {
      'title': 'Beginner',
      'subtitle': 'Level 1 - 10 questions',
      'color': Colors.blue,
      'progress': 0.5,
      'levels': [
        {'title': 'Level 1', 'subtitle': '10 questions'},
        {'title': 'Level 2', 'subtitle': '15 questions'},
        {'title': 'Level 3', 'subtitle': '20 questions'},
      ],
    },
    {
      'title': 'Intermediate',
      'subtitle': 'Level 2 - 20 questions',
      'color': Colors.green,
      'progress': 0.2,
      'levels': [
        {'title': 'Level 1', 'subtitle': '20 questions'},
        {'title': 'Level 2', 'subtitle': '25 questions'},
        {'title': 'Level 3', 'subtitle': '30 questions'},
      ],
    },
    {
      'title': 'Advanced',
      'subtitle': 'Level 3 - 30 questions',
      'color': Colors.red,
      'progress': 0.8,
      'levels': [
        {'title': 'Level 1', 'subtitle': '30 questions'},
        {'title': 'Level 2', 'subtitle': '35 questions'},
        {'title': 'Level 3', 'subtitle': '40 questions'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Quiz'),
      ),
      body: ListView.builder(
        itemCount: quizLevels.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ExpansionTile(
              title: Text(
                quizLevels[index]['title'],
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text(
                quizLevels[index]['subtitle'],
                style: TextStyle(fontSize: 16.0),
              ),
              leading: Icon(
                Icons.school,
                color: quizLevels[index]['color'],
                size: 48.0,
              ),
              children: List.generate(
                quizLevels[index]['levels'].length,
                    (levelIndex) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizLevelScreen(
                            levelTitle: quizLevels[index]['levels'][levelIndex]['title'],
                            levelSubtitle: quizLevels[index]['levels'][levelIndex]['subtitle'],
                          ),
                        ),
                      );
                    },
                    title: Text(
                      quizLevels[index]['levels'][levelIndex]['title'],
                      style: TextStyle(fontSize: 18.0),
                    ),
                    subtitle: Text(
                      quizLevels[index]['levels'][levelIndex]['subtitle'],
                      style: TextStyle(fontSize: 14.0),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuizLevelScreen extends StatelessWidget {
  final String levelTitle;
  final String levelSubtitle;

  QuizLevelScreen({required this.levelTitle, required this.levelSubtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(levelTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              levelSubtitle,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Code to start the quiz goes here
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}