import 'package:github_search/src/models/SearchResult.dart';
import 'package:github_search/src/resources/data/GithubDataProvider.dart';

class GithubRepository {
  final GithubDataProvider _githubDataProvider = GithubDataProvider();

  Future<SearchResult> getRepositoriesByTerm(String term) async {
    SearchResult dataSet = await _githubDataProvider.readRepositoriesByTerm(term);

    return dataSet;
  }

}