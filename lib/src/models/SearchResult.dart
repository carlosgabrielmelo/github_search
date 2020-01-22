import 'package:json_annotation/json_annotation.dart';
import 'package:github_search/src/models/SearchItem.dart';

part 'SearchResult.g.dart';

@JsonSerializable()

class SearchResult {
  final List<SearchItem> items;

  SearchResult(this.items);

  factory SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);

}