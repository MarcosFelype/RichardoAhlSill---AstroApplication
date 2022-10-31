import 'package:astroapp/data/db_helper.dart';
import 'package:astroapp/domain/menu_astro.dart';
import 'package:sqflite/sqflite.dart';

class AssuntosDao {

  Future<List<Menu_astro>> listarPacotes() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sqlassunto = "SELECT * FROM assuntos;";
    final result = await db.rawQuery(sqlassunto);

    List<Menu_astro> lista = <Menu_astro>[];
    for(var json in result){

      Menu_astro assuntos = Menu_astro.fromJson(json);
      lista.add(assuntos);

    }

    return lista;
  }

}