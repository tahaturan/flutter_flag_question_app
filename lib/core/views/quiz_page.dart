import 'package:flutter/material.dart';
import 'package:flutter_flag_question_app/core/widgets/answer_button.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "Dogru : 1",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Yanlis : 1",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Text(
              "1.Soru",
              style: TextStyle(fontSize: 30),
            ),
            Image.asset("assets/images/turkiye.png"),
            const AnswerButton(ulkeAdi: "Button A"),
            const AnswerButton(ulkeAdi: "Button B"),
            const AnswerButton(ulkeAdi: "Button C"),
            const AnswerButton(ulkeAdi: "Button D"),
          ],
        ),
      ),
    );
  }
}
