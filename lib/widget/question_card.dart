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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(image: AssetImage('$uploadsBaseUrl${question.imagePath}'), height: 300, fit: BoxFit.cover,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  question.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
