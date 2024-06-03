// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_definitions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordDefinitionsModel _$WordDefinitionsModelFromJson(
        Map<String, dynamic> json) =>
    WordDefinitionsModel(
      word: json['word'] as String?,
      phonetics: (json['phonetics'] as List<dynamic>?)
          ?.map((e) => Phonetics.fromJson(e as Map<String, dynamic>))
          .toList(),
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => Meanings.fromJson(e as Map<String, dynamic>))
          .toList(),
      license: json['license'] == null
          ? null
          : License.fromJson(json['license'] as Map<String, dynamic>),
      sourceUrls: (json['sourceUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$WordDefinitionsModelToJson(
        WordDefinitionsModel instance) =>
    <String, dynamic>{
      'word': instance.word,
      'phonetics': instance.phonetics?.map((e) => e.toJson()).toList(),
      'meanings': instance.meanings?.map((e) => e.toJson()).toList(),
      'license': instance.license?.toJson(),
      'sourceUrls': instance.sourceUrls,
    };

Phonetics _$PhoneticsFromJson(Map<String, dynamic> json) => Phonetics(
      audio: json['audio'] as String?,
      sourceUrl: json['sourceUrl'] as String?,
      license: json['license'] == null
          ? null
          : License.fromJson(json['license'] as Map<String, dynamic>),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$PhoneticsToJson(Phonetics instance) => <String, dynamic>{
      'audio': instance.audio,
      'sourceUrl': instance.sourceUrl,
      'license': instance.license?.toJson(),
      'text': instance.text,
    };

License _$LicenseFromJson(Map<String, dynamic> json) => License(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LicenseToJson(License instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Meanings _$MeaningsFromJson(Map<String, dynamic> json) => Meanings(
      partOfSpeech: json['partOfSpeech'] as String?,
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definitions.fromJson(e as Map<String, dynamic>))
          .toList(),
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      antonyms: (json['antonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MeaningsToJson(Meanings instance) => <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions?.map((e) => e.toJson()).toList(),
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
    };

Definitions _$DefinitionsFromJson(Map<String, dynamic> json) => Definitions(
      definition: json['definition'] as String?,
      synonyms: json['synonyms'] as List<dynamic>?,
      antonyms: json['antonyms'] as List<dynamic>?,
      example: json['example'] as String?,
    );

Map<String, dynamic> _$DefinitionsToJson(Definitions instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
      'example': instance.example,
    };
