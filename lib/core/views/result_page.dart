import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultPage extends StatefulWidget {
  int dogruSayisi;
  ResultPage({required this.dogruSayisi, Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    int basariOrani = (widget.dogruSayisi * 100) ~/ 5;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sonuc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                color: Colors.cyan.shade300,
                elevation: 8,
                surfaceTintColor: Colors.red,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${widget.dogruSayisi} dogru",
                          style: const TextStyle(
                              fontSize: 30, color: Colors.green),
                        ),
                        Text(
                          "${5 - widget.dogruSayisi} yanlis",
                          style:
                              const TextStyle(fontSize: 30, color: Colors.red),
                        ),
                      ],
                    ),
                    Text(
                      "Basari Orani %$basariOrani",
                      style: const TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green.shade700,
                  onPrimary: Colors.white,
                  elevation: 5,
                  minimumSize: const Size(275, 50),
                  maximumSize: const Size(275, 50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Tekrar Dene"),
                    Icon(Icons.reply_all_outlined),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
