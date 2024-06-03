import 'dart:convert';
import 'package:coodesh/model/word_definitions_model.dart';
import 'package:coodesh/repository/repository.dart';
import 'package:coodesh/repository/request_response.dart';
import 'package:http/http.dart' as http;

class RoosterListRepository {
  const RoosterListRepository();

  Future<RequestResponse<List<WordDefinitionsModel>?>?> getTranslation({
    required String word,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.dictionaryapi.dev/api/v2/entries/en/$word',
        ),
        headers: Repository.basicHeaders,
      );
      List<WordDefinitionsModel>? roosterListModel;
      final map = json.decode(response.body);
      if (map != null && response.statusCode == 200) {
        final newList = map as List<dynamic>;
        roosterListModel =
            newList.map((e) => WordDefinitionsModel.fromJson(e)).toList();
      }
      return RequestResponse(response, roosterListModel);
    } catch (erro) {
      return null;
    }
  }
}
