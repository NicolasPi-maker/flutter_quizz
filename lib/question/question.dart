import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.questions});

  final List questions;
  final int currentQuestionIndex = 0;
  final String uploadsBaseUrl = 'assets/quizz_uploads/';

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  final int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Score $score',
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              'Question n° ${widget.currentQuestionIndex + 1} / ${widget.questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const Divider(height: 2),
          Expanded(
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
                          '${widget.uploadsBaseUrl}${widget.questions[widget.currentQuestionIndex].imagePath}'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.questions[widget.currentQuestionIndex].question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 2),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // TODO refacto pour avoir un composant bouton
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
                    )
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Vrai !',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
                    )
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Faux !',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
