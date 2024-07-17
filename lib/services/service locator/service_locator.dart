import 'package:article_mobile_app/domain/blogs.dart';
import 'package:article_mobile_app/helpers/helpers.dart';
import 'package:article_mobile_app/services/articles/articles_information.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt =  GetIt.instance;

void initServiceLocator() {

  final Dio instance = DioInstance().instance;
  final ArticlesInformation articlesInformation = ArticlesInformation(dio: instance);

  getIt.registerSingleton(ArticlesBloc(articlesInformation));
  
}