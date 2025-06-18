import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/severices/http_service.dart';

class MovieRepo {
  static Future getMovie() async {
    try {
      String url =
          'https://api.themoviedb.org/3/collection/86311?language=en-US';
      http.Response? response = await HttpService.getApi(url: url, header: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZjYwYzc4MWZjMzkwZjhhMDE2NTJhZWYzNjY2OTlhOSIsIm5iZiI6MTc1MDE1MzExNC40NTI5OTk4LCJzdWIiOiI2ODUxMzc5YTY3Y2MzYWM0MDc5MmRkODYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.vu8gHpj0JdQlgwi8E9qix8L0DZsGIGpCo5VYzLRpfbs',
        'accept': 'application/json',
      });
      if (response != null && response.statusCode == 200) {
        debugPrint(
            "RESPONSE BODY================================>${url} ==> ${response.body}");
        return movieDataModelFromJson(response.body);
      } else {
        debugPrint("Error: ${response?.reasonPhrase}");
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
// Future<MovieDataModel?> getMovie() async {
//   var url = Uri.parse(
//       'https://api.themoviedb.org/3/collection/86311?language=en-US');
//
//   var headers = {
//     'Authorization':
//         'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZjYwYzc4MWZjMzkwZjhhMDE2NTJhZWYzNjY2OTlhOSIsIm5iZiI6MTc1MDE1MzExNC40NTI5OTk4LCJzdWIiOiI2ODUxMzc5YTY3Y2MzYWM0MDc5MmRkODYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.vu8gHpj0JdQlgwi8E9qix8L0DZsGIGpCo5VYzLRpfbs',
//     'accept': 'application/json',
//   };
//
//   final response = await http.get(url, headers: headers);
//
//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     return MovieDataModel.fromJson(data);
//   } else {
//     print('Error: ${response.reasonPhrase}');
//     return null;
//   }
// }
}

// API Call Function
Future<MovieDataModel?> fetchCollection() async {
  var url =
      Uri.parse('https://api.themoviedb.org/3/collection/86311?language=en-US');

  var headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZjYwYzc4MWZjMzkwZjhhMDE2NTJhZWYzNjY2OTlhOSIsIm5iZiI6MTc1MDE1MzExNC40NTI5OTk4LCJzdWIiOiI2ODUxMzc5YTY3Y2MzYWM0MDc5MmRkODYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.vu8gHpj0JdQlgwi8E9qix8L0DZsGIGpCo5VYzLRpfbs',
    'accept': 'application/json',
  };

  final response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return MovieDataModel.fromJson(data);
  } else {
    print('Error: ${response.reasonPhrase}');
    return null;
  }
}
