import 'dart:convert';

import 'package:flutter_http_1/post/model/dto/post_dto.dart';
import 'package:http/http.dart' as http;


class PostRepository {

  static PostRepository? _instance;
  PostRepository._();
  static PostRepository get instance => _instance ??= PostRepository._();

  Future<List<PostDTOTable>?> getDTOList() async {
    String url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PostDTOTable.fromJsonList(jsonDecode(response.body)['boxOfficeResult']['dailyBoxOfficeList']);
    } else {
      return null;
    }
  }

}
