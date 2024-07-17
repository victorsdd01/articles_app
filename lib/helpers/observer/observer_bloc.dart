import 'dart:developer';

import 'package:article_mobile_app/domain/bloc/articles_bloc.dart';
import 'package:bloc/bloc.dart';

class Observable extends BlocObserver{

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (bloc is ArticlesBloc){
      final currentState = change.currentState as ArticlesState;
      final nextState = change.nextState as ArticlesState;
      if (currentState.articles != nextState.articles) {
        log('current: ${currentState.articles}');
        log('next: ${nextState.articles}');
      }
    }
  }
}