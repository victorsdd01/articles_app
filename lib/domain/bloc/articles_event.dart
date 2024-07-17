part of 'articles_bloc.dart';

sealed class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}


class IsLoadingEvent extends ArticlesEvent{
  final bool isLoading;
  const IsLoadingEvent({required this.isLoading});
}

class AddArticlesEvent extends ArticlesEvent{
  final List<Article> articles;
  const AddArticlesEvent({required this.articles});
}

class AddNewArticleEvent extends ArticlesEvent{
  final Article article;
  const AddNewArticleEvent({required this.article});
}

class UpdateArticleEvent extends ArticlesEvent{
  final Article article;
  const UpdateArticleEvent({required this.article});
}

class DeleteArticleEvent extends ArticlesEvent{
  final Article article;
  const DeleteArticleEvent({required this.article});
}
