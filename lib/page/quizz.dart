import 'package:flutter/material.dart';
import 'package:quizz/widget/question_card.dart';
import 'package:quizz/widget/response_modal.dart';
import 'package:quizz/widget/rounded_square_button.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.questions});

  final List questions;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  final String uploadsBaseUrl = 'assets/quizz_uploads/';
  late int score = 0;
  late int currentQuestionIndex = 0;

  incScore() {
    setState(() {
      score = score + 1;
    });
  }

  incIndex() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  Future<void> showCustomDialog({required Widget dialog, required BuildContext context}) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext buildContext) {
          return dialog;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Score $score',
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              'Question n° ${currentQuestionIndex + 1} / ${widget.questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const Divider(height: 2),
          QuestionCard(question: widget.questions[currentQuestionIndex]),
          const Divider(height: 2),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundedSquareButton(
                  buttonText: 'Vrai',
                  backgroundColor: Colors.lightGreen,
                  onPressedCallback: () {
                    showCustomDialog(
                        dialog: ResponseModal(
                            questionLength: widget.questions.length,
                            incIndex: incIndex,
                            incScore: incScore,
                            currentQuestionIndex: currentQuestionIndex,
                            score: score,
                            context: context).customSimpleDialog(true, widget.questions[currentQuestionIndex]),
                        context: context
                    );
                  },
                ),
                RoundedSquareButton(
                  buttonText: 'Faux',
                  backgroundColor: Colors.redAccent,
                  onPressedCallback: () {
                    showCustomDialog(
                        dialog: ResponseModal(
                            questionLength: widget.questions.length,
                            incIndex: incIndex,
                            incScore: incScore,
                            currentQuestionIndex: currentQuestionIndex,
                            score: score,
                            context: context).customSimpleDialog(false, widget.questions[currentQuestionIndex]),
                        context: context
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
