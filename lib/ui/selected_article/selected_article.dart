import 'package:flutter/material.dart';
import '../../models/models.dart';

class SelectedArticle extends StatelessWidget {
  const SelectedArticle({super.key});

  @override
  Widget build(BuildContext context) {

    final Article article = ModalRoute.of(context)!.settings.arguments as Article;
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    const double space = 10;
    

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(article.title, maxLines: 1, style: theme.textTheme.titleLarge,),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            width: size.width,
            height: size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: Hero(
              tag: article.id!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  article.urlToImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.no_photography, size: 60.0),
                        const SizedBox(height: 8.0),
                        Text(
                          'Image not available',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.title, style: theme.textTheme.titleMedium),
                const SizedBox(height: space),
                Text(article.description, style: theme.textTheme.labelMedium?.copyWith(color: Colors.grey.shade600)),
                const SizedBox(height: space),
                Text('Author: ${article.author}', style: theme.textTheme.labelSmall),
                const SizedBox(height: space),
                Text('Published at: ${article.publishedAt}', style: theme.textTheme.labelSmall),
              ],
            ),
          ),
        ],
      )
    );
  }
}