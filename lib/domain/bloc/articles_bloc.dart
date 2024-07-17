import 'dart:async';
import 'package:article_mobile_app/models/models.dart';
import 'package:article_mobile_app/services/articles/articles_information.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {

  final ArticlesInformation _articlesInformation;
  ArticlesBloc(ArticlesInformation articlesInformation) : 
  _articlesInformation = articlesInformation,

  super(const ArticlesState()) {
    on<IsLoadingEvent>((event,emit)=> emit(state.copyWith(isLoading: event.isLoading)));
    on<AddArticlesEvent>((event, emit)=> emit(state.copyWith(articles: event.articles)));
    on<AddNewArticleEvent>(_addNewArticleEvent);
    on<UpdateArticleEvent>(_updateArticleEvent);
    on<DeleteArticleEvent>(_deleteArticle);

  }

  FutureOr<void> _addNewArticleEvent(AddNewArticleEvent event,Emitter<ArticlesState> emit) {
    final List<Article> updatedList = List.from(state.articles);
    updatedList.add(event.article);
    emit(state.copyWith(articles: updatedList));
  }
  FutureOr<void> _updateArticleEvent(UpdateArticleEvent event,Emitter<ArticlesState> emit){
    final List<Article> updatedList = List.from(state.articles);
    final index = updatedList.indexWhere((article) => article.id == event.article.id);
    updatedList[index] = event.article;
    emit(state.copyWith(articles: updatedList));
  }

  FutureOr<void> _deleteArticle(DeleteArticleEvent event, Emitter<ArticlesState> emit){
    final List<Article> updatedList = List.from(state.articles);
    updatedList.removeWhere((article) => article.id == event.article.id);
    emit(state.copyWith(articles: updatedList));
  }


  Future<dynamic> fetchAllArticles () async {
    add(const IsLoadingEvent(isLoading: true));

    final response = await _articlesInformation.geAllArticles();
    if (response is List<Article> && response.isNotEmpty) add(AddArticlesEvent(articles: response));
    add(const IsLoadingEvent(isLoading: false));
  }

  Future<dynamic> addNewArticle(Article article) async {
    add(const IsLoadingEvent(isLoading: true));
    final response = await _articlesInformation.addNewArticle(article);
    if (response is Article) {
      add(AddNewArticleEvent(article: response));
    }
    add(const IsLoadingEvent(isLoading: false));
    return response;
  }

  Future<dynamic> updateArticle (Article article) async {
    add(const IsLoadingEvent(isLoading: true));
    final response = await _articlesInformation.updateArticle(article);
    if (response is Article) {
      add(UpdateArticleEvent(article: response));
    }
    add(const IsLoadingEvent(isLoading: false));
    return response;
  }

  Future<void> deleteArticle (String id) async {
    add(const IsLoadingEvent(isLoading: true));
    final response = await _articlesInformation.deleteArticle(id);
    if (response is Article) {
      add(DeleteArticleEvent(article: response));
    }
    add(const IsLoadingEvent(isLoading: false));
    return response;
  }
}
