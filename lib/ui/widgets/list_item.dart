// ignore_for_file: file_names

import 'package:article_mobile_app/models/models.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, this.height = 100, required this.article});

  final double height;
  final Article article;

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);

    return Container(
      height: height,
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffdedede),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: double.maxFinite,
            width: MediaQuery.of(context).size.width * 0.18,
            decoration: BoxDecoration(
              color: const Color(0xffdedede),
              borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.rectangle
            ),
            child: Hero(
              tag: article.id!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(article.urlToImage, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.no_photography),);
                  },
                )
              ),
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.title, maxLines: 1, style: theme.textTheme.titleSmall,overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 5.0,),
                Text(article.author, maxLines: 1,style: theme.textTheme.labelMedium?.copyWith(color: Colors.grey.shade500)),
                const SizedBox(height: 5.0,),
                Text(article.description, maxLines: 1,style: theme.textTheme.bodySmall, overflow: TextOverflow.ellipsis,),
              ],
            )
          )
        ],
      ),
    );
  }
}