
import 'dart:developer';

import 'package:article_mobile_app/models/error/error_response.dart';
import 'package:dio/dio.dart';
import '../../models/models.dart';

class ArticlesInformation{

    final Dio dio;
    ArticlesInformation({required this.dio});

    Future<dynamic> geAllArticles() async {
      try {
        final response = await dio.get('/articles');
        final articles =  ArticleResponse.fromMap(response.data);
        return articles.articles;
        
      } on DioException catch (error) {
        final ErrorResponse errors = ErrorResponse.fromJson(error.response?.data);
        return errors.errors;
      }
    }

    Future<dynamic> addNewArticle(Article article) async {
      try {
        final Response response = await dio.post('/articles', data: article.newArticle());
        final newArticle = Article.fromJson(response.data);
        return newArticle;
      } on DioException catch (e) {
        final ErrorResponse errors = ErrorResponse.fromJson(e.response?.data);
        return errors.errors;
      }
    }

    Future<dynamic> updateArticle(Article article) async {
      try {
        final Response response = await dio.put('/articles/${article.id}', data: article.newArticle());
        final Article updatedArticle = Article.fromJson(response.data);
        log('uodated: $updatedArticle');
        return updatedArticle;
      } on DioException catch (error) {
        final ErrorResponse errors = ErrorResponse.fromJson(error.response?.data);
        return errors.errors;
      }
    }


    Future<dynamic> deleteArticle(String id) async {
      try {
        final Response response = await dio.delete('/articles/$id');
        final Article article = Article.fromJson(response.data);
        return article;
      } on DioException catch (error) {
        final ErrorResponse errors = ErrorResponse.fromJson(error.response?.data);
        return errors.errors;
      }
    }


}