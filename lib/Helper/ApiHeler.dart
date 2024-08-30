import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class ApiHelper{
  Future<List<Map<String, dynamic>>> fetchApi() async {
    String api = "https://sheetdb.io/api/v1/095yqtqt7hhg3";
    Uri url = Uri.parse(api);
    Response response = await http.get(url);

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return data;
    } else{
      return [];
    }
  }
}