import 'package:flutter/material.dart';
import 'package:quizz/widget/score_modal.dart';

class ResponseModal extends StatelessWidget {
  ResponseModal
    ({
      super.key,
      required this.incScore,
      required this.questionLength,
      required this.currentQuestionIndex,
      required this.incIndex,
      required this.context,
      required this.score
    });

  final String uploadsBaseUrl = 'assets/quizz_uploads/';

  final Function incScore;
  final Function incIndex;
  final int questionLength;
  final int currentQuestionIndex;
  final BuildContext context;
  late final int score;

  Future<void> showCustomDialog({required Widget dialog, required BuildContext context}) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext buildContext) {
          return dialog;
        }
    );
  }

  SimpleDialog customSimpleDialog(choosedResponse, question) {
    if (choosedResponse == question.response) {
      incScore();
    }
    return SimpleDialog(
      title: Text(choosedResponse != question.response ? 'Mauvaise réponse...' : 'Bravo ! Voila un pépito', textAlign: TextAlign.center),
      elevation: 12,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              fit: BoxFit.cover,
                image: AssetImage(choosedResponse != question.response
                    ? '${uploadsBaseUrl}error.gif'
                    : '${uploadsBaseUrl}success.gif'),
              height: 200,
              width: 400,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(question.explanation, style: const TextStyle(fontSize: 15)),
            ),
          ],
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              if (currentQuestionIndex + 1 == questionLength) {
                int finalScore = score;
                if (choosedResponse == question.response) {
                  finalScore++;
                }
                Navigator.of(context).pop();
                switch(finalScore) {
                  case <= 3:
                    showCustomDialog(
                        dialog: ScoreModal(context: context).customScoreDialog(finalScore, 'Nul Nul Nul', '${uploadsBaseUrl}bad.gif', 'C\'est toi le problème il faut se remettre en question'),
                        context: context
                    );
                  break;
                  case > 3 && < 7:
                    showCustomDialog(
                        dialog: ScoreModal(context: context).customScoreDialog(finalScore, 'C\'est correct on va dire', '${uploadsBaseUrl}medium.gif', 'Essaye encore pour faire mieux'),
                        context: context
                    );
                  break;
                  case == 10:
                    showCustomDialog(
                      dialog: ScoreModal(context: context).customScoreDialog(finalScore, 'Félicitation c\'est un perfect', '${uploadsBaseUrl}wow.webp', 'Maintenant va trouver un travail'),
                      context: context
                    );
                  default:
                    showCustomDialog(
                        dialog: ScoreModal(context: context).customScoreDialog(finalScore, 'Bien joué c\'est pas mal !', '${uploadsBaseUrl}good.gif', 'Bravo tu t\'en est bien sortie'),
                        context: context
                    );
                }
              } else {
                incIndex();
                Navigator.of(context).pop();
              }
            },
            child: Text(currentQuestionIndex + 1 == questionLength ? 'Voir mon score' : 'Question suivante par pitié')),
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
