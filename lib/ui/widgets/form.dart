import 'package:article_mobile_app/enums/enums.dart';
import 'package:article_mobile_app/models/error/error_response.dart';
import 'package:article_mobile_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/blogs.dart';
import '../../helpers/alerts/alerts.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.mode, this.article,});

  final DialogMode mode;
  final Article? article;


  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController autorController;
  late TextEditingController urlController;
  late TextEditingController urlToImageController;
  late TextEditingController publishedAtController;
  double space = 10.0;

  


  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.article?.title ?? '');
    descriptionController = TextEditingController(text: widget.article?.description ?? '');
    autorController = TextEditingController(text: widget.article?.author ?? '');
    urlController = TextEditingController(text: widget.article?.url ?? '');
    urlToImageController = TextEditingController(text: widget.article?.urlToImage ?? '');
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    autorController.dispose();
    urlController.dispose();
    urlToImageController.dispose();
  }

  String? _validator(String value){
    if (value.isEmpty) return 'This field is required';

    return null; 
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              child: TextFormField(
                validator: (value) => _validator(value!),
                controller: titleController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Write the title'
                ),
              )
            ),
            SizedBox(height: space,),
            SizedBox(
              child: TextFormField(
                controller: descriptionController,
                validator: (value) => _validator(value!),
                decoration: const InputDecoration(
                  hintText: 'Write the description'
                ),
              )
            ),
            SizedBox(height: space,),
            SizedBox(
              child: TextFormField(
                controller: autorController,
                validator: (value) => _validator(value!),
                decoration: const InputDecoration(
                  hintText: 'Write the autor'
                ),
              )
            ),
            SizedBox(height: space),
            SizedBox(
              child: TextFormField(
                controller: urlController,
                validator: (value) => _validator(value!),
                decoration: const InputDecoration(
                  hintText: 'Write the url'
                ),
              )
            ),
            SizedBox(height: space),
            SizedBox(
              child: TextFormField(
                controller: urlToImageController,
                validator: (value) => _validator(value!),
                decoration: const InputDecoration(
                  hintText: 'Write the image url'
                ),
              )
            ),
            SizedBox(height: space),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('cancel')
                ),
                FilledButton(
                  onPressed:() {
                    switch (widget.mode) {
                      case DialogMode.ADD:
                        _addNewArticle(context);
                        break;
                      case DialogMode.UPDATE:
                        _updateArticle(context);
                        break;
                      case DialogMode.INFORMATIVE:
                        break;
                    }
                  }, 
                  child: Text(widget.mode == DialogMode.ADD ? 'Add' : 'Update')
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

  void _addNewArticle(BuildContext context) {
    
      if(formKey.currentState!.validate()){
        context.read<ArticlesBloc>().addNewArticle(
          Article(
            author: autorController.text, 
            title: titleController.text, 
            description: descriptionController.text, 
            url: urlController.text, 
            urlToImage: urlToImageController.text, 
            publishedAt: DateTime.timestamp()
          )
        ).then((value){
          _clearControllers();
          Navigator.pop(context);
          Alerts.showSnackBar(context, value is List<RequestError> ? SnackBarMode.ERROR : SnackBarMode.SUCCESS, 'New article has been added successfully!');
        });
      }
  }
  void _updateArticle(BuildContext context) {
    
      if(formKey.currentState!.validate()){
        context.read<ArticlesBloc>().updateArticle(
          Article(
            id: widget.article!.id,
            author: autorController.text, 
            title: titleController.text, 
            description: descriptionController.text, 
            url: urlController.text, 
            urlToImage: urlToImageController.text, 
            publishedAt: widget.article!.publishedAt
          )
        )
        .then((value){
          _clearControllers();
          Navigator.pop(context);
          Alerts.showSnackBar(context, value is List<RequestError> ? SnackBarMode.ERROR : SnackBarMode.SUCCESS, 'Article has been updated successfully');
        });
      }
  }

  void _clearControllers (){
    autorController.text = '';
    titleController.text = '';
    descriptionController.text = '';
    urlController.text = '';
    urlToImageController.text = '';
  }
}