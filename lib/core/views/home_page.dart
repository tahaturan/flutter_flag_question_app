import 'package:flutter/material.dart';
import 'package:flutter_flag_question_app/core/views/quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnaSayfa'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/homequiz.jpg"),
            const SizedBox(height: 150),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                onPrimary: Colors.white,
                elevation: 5,
                minimumSize: const Size(275, 50),
                maximumSize: const Size(275, 50),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "BASLA",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Icon(Icons.start),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
