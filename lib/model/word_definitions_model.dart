import 'package:json_annotation/json_annotation.dart';

part 'word_definitions_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WordDefinitionsModel {
  String? word;
  List<Phonetics>? phonetics;
  List<Meanings>? meanings;
  License? license;
  List<String>? sourceUrls;

  WordDefinitionsModel({
    this.word,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });

  factory WordDefinitionsModel.fromJson(Map<String, dynamic> json) =>
      _$WordDefinitionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WordDefinitionsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Phonetics {
  String? audio;
  String? sourceUrl;
  License? license;
  String? text;

  Phonetics({this.audio, this.sourceUrl, this.license, this.text});

  factory Phonetics.fromJson(Map<String, dynamic> json) =>
      _$PhoneticsFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneticsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class License {
  String? name;
  String? url;

  License({this.name, this.url});

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Meanings {
  String? partOfSpeech;
  List<Definitions>? definitions;
  List<String>? synonyms;
  List<String>? antonyms;

  Meanings({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  factory Meanings.fromJson(Map<String, dynamic> json) =>
      _$MeaningsFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Definitions {
  String? definition;
  List<dynamic>? synonyms;
  List<dynamic>? antonyms;
  String? example;

  Definitions({
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });

  factory Definitions.fromJson(Map<String, dynamic> json) =>
      _$DefinitionsFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionsToJson(this);
}
