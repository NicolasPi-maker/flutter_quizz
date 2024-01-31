import 'package:flutter/material.dart';
import 'package:quizz/model/question.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.question});

  final Question question;
  final String uploadsBaseUrl = 'assets/quizz_uploads/';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CircleAvatar(
              radius: 135,
              backgroundColor: Colors.blueGrey,
              child: CircleAvatar(
                radius: 130,
                backgroundImage: AssetImage(
                    '$uploadsBaseUrl${question.imagePath}'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              question.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
