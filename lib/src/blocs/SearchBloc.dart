import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:github_search/src/models/SearchResult.dart';
import 'package:github_search/src/services/data/GithubService.dart';

class SearchBloc {
  GithubService _service = new GithubService();

  final _searchController = new BehaviorSubject<String>();
  Stream<String> get searchFlux => _searchController.stream;
  Sink<String> get searchEvent => _searchController.sink;

  Stream<SearchResult> apiResultFlux;

  SearchBloc(){
    apiResultFlux = searchFlux
        .distinct()
        .where((valor) => valor.length>2)
        .debounceTime(Duration(milliseconds: 500))
        .asyncMap(_service.search)
        .switchMap((valor) => Stream.value(valor));
  }

  void dispose(){
    _searchController?.close();
  }
}