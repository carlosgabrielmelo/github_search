// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchItem _$SearchItemFromJson(Map<String, dynamic> json) {
  return SearchItem(
    fullName: json['full_name'] as String,
    url: json['html_url'] as String,
    avatarUrl:
        SearchItem._avatarUrlFromOwner(json['owner'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SearchItemToJson(SearchItem instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'html_url': instance.url,
      'owner': instance.avatarUrl,
    };
