import 'package:json_annotation/json_annotation.dart';

part 'SearchItem.g.dart';

@JsonSerializable()

class SearchItem{
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "html_url")
  final String url;
  @JsonKey(name: "owner", fromJson: _avatarUrlFromOwner)
  final String avatarUrl;

  static String _avatarUrlFromOwner(Map<String, dynamic> owner){
    return owner["avatar_url"] as String;
  }

  SearchItem({this.fullName, this.url, this.avatarUrl});

  factory SearchItem.fromJson(Map<String, dynamic> json) => _$SearchItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchItemToJson(this);

}