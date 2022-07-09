import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_flag_question_app/core/data/bayraklar_dao.dart';
import 'package:flutter_flag_question_app/core/model/flags.dart';
import 'package:flutter_flag_question_app/core/views/result_page.dart';
import 'package:flutter_flag_question_app/core/widgets/answer_button.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Flags> sorular = <Flags>[];
  List<Flags> yanlisSecenekler = <Flags>[];
  late Flags dogruSoru;
  var tumSecenekler = HashSet<Flags>();

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;

  String bayrakResimAdi = "placeholder.png";
  String buttonAyazi = "";
  String buttonByazi = "";
  String buttonCyazi = "";
  String buttonDyazi = "";

  Future<void> sorulariAl() async {
    sorular = await BayraklarDao().rastgeleBesGetir();

    soruYukle();
  }

  Future<void> soruYukle() async {
    dogruSoru = sorular[soruSayac];
    bayrakResimAdi = dogruSoru.flagImage;
    yanlisSecenekler =
        await BayraklarDao().rastgeleUcYanlisGetir(dogruSoru.flagId);

    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    buttonAyazi = tumSecenekler.elementAt(0).flagName;
    buttonByazi = tumSecenekler.elementAt(1).flagName;
    buttonCyazi = tumSecenekler.elementAt(2).flagName;
    buttonDyazi = tumSecenekler.elementAt(3).flagName;

    setState(() {});
  }

  void soruSayacKontrol() {
    soruSayac++;

    if (soruSayac != 5) {
      soruYukle();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(dogruSayisi: dogruSayac),
          ));
    }
  }

  void dogruKontol(String buttonYazi) {
    if (dogruSoru.flagName == buttonYazi) {
      dogruSayac++;
    } else {
      yanlisSayac++;
    }
  }

  @override
  void initState() {
    sorulariAl();
    super.initState();
  }

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
              children: [
                Text(
                  "$dogruSayac : Dogru",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "$yanlisSayac Yanlis",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            Text("${soruSayac + 1}.Soru", style: const TextStyle(fontSize: 30)),
            Image.asset("assets/images/$bayrakResimAdi"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan.shade700,
                onPrimary: Colors.white,
                elevation: 5,
                minimumSize: const Size(275, 50),
                maximumSize: const Size(275, 50),
              ),
              onPressed: () {
                soruSayacKontrol();
                dogruKontol(buttonAyazi);
              },
              child: Text(
                buttonAyazi,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan.shade700,
                onPrimary: Colors.white,
                elevation: 5,
                minimumSize: const Size(275, 50),
                maximumSize: const Size(275, 50),
              ),
              onPressed: () {
                soruSayacKontrol();
                dogruKontol(buttonByazi);
              },
              child: Text(
                buttonByazi,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan.shade700,
                onPrimary: Colors.white,
                elevation: 5,
                minimumSize: const Size(275, 50),
                maximumSize: const Size(275, 50),
              ),
              onPressed: () {
                soruSayacKontrol();
                dogruKontol(buttonCyazi);
              },
              child: Text(
                buttonCyazi,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan.shade700,
                onPrimary: Colors.white,
                elevation: 5,
                minimumSize: const Size(275, 50),
                maximumSize: const Size(275, 50),
              ),
              onPressed: () {
                soruSayacKontrol();
                dogruKontol(buttonDyazi);
              },
              child: Text(
                buttonDyazi,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
