
import 'package:article_mobile_app/ui/pages.dart';
import 'package:article_mobile_app/ui/widgets/widgets.dart';
import '../../enums/enums.dart';
import '../../models/models.dart';

class Alerts{

  static void addNewArticle(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          title: Text('Add new article', style: Theme.of(context).textTheme.titleMedium,),
          content: const SizedBox(
            width: double.infinity,
            child: CustomForm(mode: DialogMode.ADD,)
          ),
        );
      },
    );
  }

  static void updateArticle(BuildContext context, Article article) async {
    await showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          title: Text('Update article', style: Theme.of(context).textTheme.titleMedium,),
          content: SizedBox(
            width: double.infinity,
            child: CustomForm(mode: DialogMode.UPDATE, article: article)
          ),
        );
      },
    );
  }

  static Future<bool> dialog(BuildContext context, String title, Widget? content, [bool showCancelButton = true]) async {
    final resp = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
          content: content ?? const SizedBox(),
          actions: [
            showCancelButton 
              ?   
                FilledButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('cancel')
                ) 
              : const SizedBox(),
            
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Ok')
            ),
          ],
        );
      },
    );
    return resp!;
  }

  static showSnackBar(BuildContext context, SnackBarMode mode, String successMessage ){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: mode == SnackBarMode.SUCCESS ? Colors.green : Colors.red,
        content: Text(mode == SnackBarMode.SUCCESS ? successMessage : 'Something went wrong!')
      )
    );
  }

}