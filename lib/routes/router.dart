import 'package:article_mobile_app/ui/pages.dart';

class AppRoutes {

  static const String initialRoute = '/';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/'                : (_) => const HomePage(),
    '/selectedArticle' : (_) => const SelectedArticle()
  };


}