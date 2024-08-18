import 'package:html/parser.dart';

class LocationHelper {
  final dynamic data;

  LocationHelper({required this.data});

  Future<List<Map<String, dynamic>>> getCityData() async {
    List<Map<String, dynamic>> searchResult = [];

    final document = parse(data);

    final options = document.querySelectorAll('option');

    for (final option in options) {
      final value = option.attributes['value']!;
      final cityName = option.text;

      final result = {
        'value': value.trim(),
        'cityName': cityName.trim(),
      };

      searchResult.add(result);
    }

    return searchResult;
  }
}
