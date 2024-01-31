import 'package:flutter/material.dart';
import 'package:quizz/question/question.dart';
import 'package:quizz/data/questionData.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  final String uploadsBaseUrl = 'assets/quizz_uploads/';

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      margin: const EdgeInsets.all(30.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image(image: AssetImage('${uploadsBaseUrl}nutella.jpeg')),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  // TODO à remplacer par le helper
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Question(questions: QuestionData().questionList)));
                },
                child: const Text(
                  'Start the quizz!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
