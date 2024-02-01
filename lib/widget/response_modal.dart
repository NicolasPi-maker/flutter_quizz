import 'package:flutter/material.dart';
import 'package:quizz/widget/score_modal.dart';

class ResponseModal extends StatelessWidget {
  const ResponseModal
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
  final int score;

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
    return SimpleDialog(
      title: Text(choosedResponse != question.response ? 'Mauvaise réponse...' : 'Bravo ! Voila un pépito'),
      elevation: 12,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                image: AssetImage(choosedResponse != question.response
                    ? '${uploadsBaseUrl}non.gif'
                    : '${uploadsBaseUrl}oui.gif')),
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
              if (currentQuestionIndex + 1 == questionLength) {
                Navigator.of(context).pop();
                switch(score) {
                  case <= 3:
                    showCustomDialog(
                        dialog: ScoreModal(context: context).customScoreDialog(score, 'Nul Nul Nul', '${uploadsBaseUrl}oui.gif', 'C\'est toi le problème il faut se remettre en question'),
                        context: context
                    );
                  break;
                  case > 3 && < 7:
                    showCustomDialog(
                        dialog: ScoreModal(context: context).customScoreDialog(score, 'C\'est correct on va dire', '${uploadsBaseUrl}oui.gif', 'Rejour pour faire mieux'),
                        context: context
                    );
                  break;
                  case == 10:
                    showCustomDialog(
                      dialog: ScoreModal(context: context).customScoreDialog(score, 'Félicitation c\'est un perfect', '${uploadsBaseUrl}oui.gif', 'Maintenant va trouver un travail'),
                      context: context
                    );
                  default:
                    showCustomDialog(
                        dialog: ScoreModal(context: context).customScoreDialog(score, 'Bien joué c\'est pas mal !', '${uploadsBaseUrl}oui.gif', 'Bravo tu t\'en est bien sortie'),
                        context: context
                    );
                }
              } else {
                if (choosedResponse == question.response) {
                  incScore();
                }
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
