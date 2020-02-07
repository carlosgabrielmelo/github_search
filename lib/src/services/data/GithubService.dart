import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_search/src/models/SearchResult.dart';

class GithubService {
  final Dio _dio = Dio();

  GithubService(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        log("requisição foi interceptada antes de ser feita");
        options.baseUrl = "https://api.github.com/";
        return options;
      },
      onResponse: (Response response){
        log("requisição foi interceptadas após resposta");
        return response;
      },
      onError: (DioError error) async {
        log("requisição com erro foi interceptada");
        return error;
      }
    ));
  }

  Future<SearchResult> search(String term) async {
    try{
      Response response = await _dio.get("search/repositories?q="+term);

      return SearchResult.fromJson(response.data);
    }catch (error){
      throw SocketException(error.message);
    }
  }

}