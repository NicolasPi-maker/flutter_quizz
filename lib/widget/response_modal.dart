import 'package:flutter/material.dart';

class ResponseModal extends StatelessWidget {
  const ResponseModal({super.key, required this.incScore, required this.questionLength, required this.currentQuestionIndex, required this.incIndex, required this.context});
  final String uploadsBaseUrl = 'assets/quizz_uploads/';

  final Function incScore;
  final Function incIndex;
  final int questionLength;
  final int currentQuestionIndex;
  final BuildContext context;


  SimpleDialog customSimpleDialog(choosedResponse, question) {
    if(choosedResponse == question.response) {
      incScore();
    }
    return SimpleDialog(
      title: Text(choosedResponse != question.response ? 'Mauvaise réponse...' : 'Bravo ! Voila un pépito'),
      elevation: 12,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(choosedResponse != question.response ? '${uploadsBaseUrl}non.gif' : '${uploadsBaseUrl}oui.gif')),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(question.explanation),
            ),
          ],
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
              onPressed: () {
                if(currentQuestionIndex + 1 == questionLength) {
                  return;
                } else {
                    incIndex();
                    Navigator.of(context).pop();
                  }
                },
              child: Text(currentQuestionIndex + 1 == questionLength ? 'Voir mon score' :'Question suivante par pitié')
          ),
        )
      ],
    );
  }

  SimpleDialogOption simpleDialogOption({required String text}) {
    return SimpleDialogOption(
      onPressed: () {
        // Do something here
      },
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
