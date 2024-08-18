import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:zodiac_signs_finder/models/tropical.dart';

class ZodiacHelper {
  final dynamic data;

  ZodiacHelper(this.data);

  List<Tropical> parseZodiacData() {
    final document = parse(data);

    final tables = document.querySelectorAll('table.newtable');

    print('total tables : ${tables.length}');

    final tropical = _getTropicalData(table: tables.first);

    return tropical;
  }

  List<Tropical> _getTropicalData({required Element table}) {
    List<Tropical> tropicalList = [];

    for (final rows in table.querySelectorAll('tr')) {
      final tableData = rows.querySelectorAll('td');

      String glyphOne = '';
      String planetName = '';
      String glyphTwo = '';
      String signName = '';
      String float = '';
      String retro = '';

      for (int i = 0; i < tableData.length; i++) {
        if (i == 0) {
          final img = tableData[i].querySelector('img')?.attributes['src'];
          final image = 'https://astro.cafeastrology.com/${img?.substring(2)}';
          glyphOne = image;
        } else if (i == 1) {
          planetName = tableData[i].text.trim();
        } else if (i == 2) {
          final img = tableData[i].querySelector('img')?.attributes['src'];
          final image = 'https://astro.cafeastrology.com/${img?.substring(2)}';
          glyphTwo = image;
        } else if (i == 3) {
          signName = tableData[i].text.trim();
        } else if (i == 4) {
          float = tableData[i].text.trim();
        } else if (i == 5) {
          retro = tableData[i].text.trim();
        }
      }

      final model = Tropical(
        glyphOne: glyphOne,
        planetName: planetName,
        glyphTwo: glyphTwo,
        signName: signName,
        float: float,
        retro: retro,
      );

      tropicalList.add(model);
    }
    return tropicalList..removeAt(0); //remove header text
  }
}
