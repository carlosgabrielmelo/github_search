import 'dart:async';
import 'package:github_search/src/models/SearchItem.dart';
import 'package:rxdart/rxdart.dart';
import 'package:github_search/src/resources/repositories/GithubRepository.dart';

class SearchBloc {
  GithubRepository _githubRepository = GithubRepository();

  final _searchController = BehaviorSubject<String>();
  Stream<String> get searchFlux => _searchController.stream;
  Sink<String> get searchEvent => _searchController.sink;

  Stream<List<SearchItem>> apiResultFlux;

  SearchBloc(){
    apiResultFlux = searchFlux
      .distinct()
      .where((response) => response.length>2)
      .debounceTime(Duration(milliseconds: 500))
      .asyncMap(_githubRepository.getRepositoriesByTerm)
      .switchMap((response) => Stream.value(response.items));
  }

  void dispose(){
    _searchController?.close();
  }
}