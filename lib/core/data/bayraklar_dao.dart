import 'package:flutter_flag_question_app/core/data/veritabani_yardimcisi.dart';
import 'package:flutter_flag_question_app/core/model/flags.dart';

class BayraklarDao {
  Future<List<Flags>> rastgeleBesGetir() async {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Flags(
          satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }

  Future<List<Flags>> rastgeleUcYanlisGetir(int bayrakId) async {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM bayraklar WHERE bayrak_id != $bayrakId ORDER BY RANDOM() LIMIT 3");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Flags(
          satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }
}
