import 'dart:convert';

import 'package:dog/model/response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

String url = 'dog.ceo';

class ApiService {
  Future<String> getDogPicture() async {
    Response response;

    try {
      response = await http.get(Uri.https(url, '/api/breeds/image/random', {}));
      DogImageResponse dogResponse =
          DogImageResponse.fromJson(json.decode(response.body));

      if (dogResponse.status != 'success') return 'error';
      return dogResponse.message;
    } catch (ex) {
      print(ex);
    }
  }
}
