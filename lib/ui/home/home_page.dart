import 'package:article_mobile_app/domain/bloc/articles_bloc.dart';
import 'package:article_mobile_app/helpers/alerts/alerts.dart';
import 'package:article_mobile_app/models/models.dart';
import 'package:article_mobile_app/ui/pages.dart';
import 'package:article_mobile_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    context.read<ArticlesBloc>().fetchAllArticles().then((_){
      Alerts.dialog(
        context, 
        'Remember you can edit, delete and add articles.',
        const SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.swipe_right, size: 25,),
                  SizedBox(width: 10.0,),
                  Text('Swipe left to right to edit'),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.swipe_left, size: 25,),
                  SizedBox(width: 10.0,),
                  Text('Swipe right to left to delete'),
                ],
              ),
            ],
          ),
        ),
        false
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: BlocBuilder<ArticlesBloc, ArticlesState>(
          builder: (context, state){

            if (state.isLoading) return const Center(child: CircularProgressIndicator.adaptive(),);

            if(state.articles.isEmpty) return const Center(child: Text('There are not articles yet.'));

            return RefreshIndicator.adaptive(

              onRefresh: () => context.read<ArticlesBloc>().fetchAllArticles(),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Articles'),
                        Text('Total:${state.articles.length}')
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                    itemCount: state.articles.length,
                    itemBuilder: (context, index) {
                      final Article article = state.articles[index];
                        return  Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/selectedArticle', arguments: article),
                            child: Dismissible(
                              key: Key(article.id!),
                              confirmDismiss: (direction) async  {

                                if (direction == DismissDirection.endToStart) {
                                  final value = await Alerts.dialog(context, 'Are you sure do you want to delete this article?', const SizedBox());
                                  if(value){
                                    context.read<ArticlesBloc>().deleteArticle(article.id!);
                                    return Future.value(value);
                                  }
                                  return Future.value(value);
                                }

                                if (direction == DismissDirection.startToEnd) {
                                  Alerts.updateArticle(context, article);
                                  return Future.value(false);
                                }
                                return Future.value(false);
                              },
                              background: DissmissChild(color: Colors.blue.shade300, icon: Icons.edit, alignment:  Alignment.centerLeft,),
                              secondaryBackground: DissmissChild(color: Colors.red.shade500, icon: Icons.delete, alignment:  Alignment.centerRight,),
                              child: ListItem(article: article,)
                            )
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Alerts.addNewArticle(context)
      ),
    );
  }
}


class DissmissChild extends StatelessWidget {
  const DissmissChild({
    super.key, 
    required this.color,
    required this.icon, 
    required this.alignment
  });

  final Color color;
  final IconData icon;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Align(
        alignment: alignment,
        child: Icon(icon, color: Colors.white,)
      ),
    );
  }
}