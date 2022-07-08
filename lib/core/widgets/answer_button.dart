import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String ulkeAdi;
  Function dogruKontrol;
  Function soruSayacKontrol;
  AnswerButton(
      {required this.ulkeAdi,
      required this.dogruKontrol,
      required this.soruSayacKontrol,
      Key? key})
      : super(key: key);

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
        dogruKontrol;
        soruSayacKontrol;
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
