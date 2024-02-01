import 'package:flutter/material.dart';
import 'package:quizz/helper/navigator_helper.dart';
import 'package:quizz/main.dart';

class ScoreModal extends StatelessWidget {
  const ScoreModal({super.key, required this.context});

  final String uploadsBaseUrl = 'assets/quizz_uploads/';
  final BuildContext context;

  SimpleDialog customScoreDialog(
      int score, String title, String image, String description) {
    return SimpleDialog(
      title: Text('${'$title, votre score est de $score'} points'),
      elevation: 12,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(image)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(description),
            ),
          ],
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  NavigatorHelper().toSpecificPage(
                      context: context,
                      page: const MyHomePage(title: 'Quizz time!'));
                },
                child: const Text('Rejouer')),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
