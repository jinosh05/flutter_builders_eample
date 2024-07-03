import "dart:convert";
import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_builders_eample/models/dictionary_model.dart";
import "package:http/http.dart";

class ApiServices {
  Future<DictionaryModel?> fetchApi(final String value) async {
    final Response response = await get(
      Uri.parse("https://api.urbandictionary.com/v0/define?term=$value"),
    );

    try {
      debugPrint(response.body);
      return DictionaryModel.fromJson(jsonDecode(response.body));
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
