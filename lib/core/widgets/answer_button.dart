import 'package:flutter/material.dart';
import 'package:flutter_flag_question_app/core/views/result_page.dart';

class AnswerButton extends StatelessWidget {
  final String ulkeAdi;
  const AnswerButton({required this.ulkeAdi, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.cyan.shade700,
        onPrimary: Colors.white,
        elevation: 5,
        minimumSize: const Size(275, 50),
        maximumSize: const Size(275, 50),
      ),
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(dogruSayisi: 2),
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ulkeAdi,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const Icon(Icons.fast_forward),
        ],
      ),
    );
  }
}
