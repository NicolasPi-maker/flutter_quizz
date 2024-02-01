import 'package:flutter/material.dart';
import 'package:quizz/data/question_data.dart';
import 'package:quizz/helper/navigator_helper.dart';
import 'package:quizz/page/quizz.dart';
import 'package:quizz/widget/rounded_square_button.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  final String uploadsBaseUrl = 'assets/quizz_uploads/';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(image: AssetImage('${uploadsBaseUrl}quizz.jpg')),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RoundedSquareButton(
              buttonText: 'Start the quizz !',
              onPressedCallback: () {
                NavigatorHelper().toSpecificPage(
                  context: context,
                  page: Question(questions: QuestionData().questionList),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
