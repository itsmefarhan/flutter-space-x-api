import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacex/model/launch.dart';

class Service {
  static String url = 'https://api.spacexdata.com/v3/launches';

  static Future<List<Launch>> getLaunches() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final launches = json.decode(response.body);
      return launches.map<Launch>((item) => Launch.fromJson(item)).toList();
    } else {
      throw Exception('Failed');
    }
  }
}
