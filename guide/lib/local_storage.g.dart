// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseArticleData _$BaseArticleDataFromJson(Map<String, dynamic> json) =>
    BaseArticleData(
      json['id'] as int,
      json['title'] as String,
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      (json['body'] as List<dynamic>).map((e) => e as String).toList(),
      (json['formatting'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BaseArticleDataToJson(BaseArticleData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'body': instance.body,
      'tags': instance.tags,
      'formatting': instance.formatting,
    };
