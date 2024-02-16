// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_article_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileArticle _$FileArticleFromJson(Map<String, dynamic> json) => FileArticle(
      json['id'] as int,
      json['title'] as String,
      json['filename'] as String,
    );

Map<String, dynamic> _$FileArticleToJson(FileArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'filename': instance.filename,
    };
