import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/bloc/articles_bloc.dart';
import 'helpers/observer/observer_bloc.dart';
import 'routes/router.dart';
import 'services/service locator/service_locator.dart';
import 'ui/pages.dart';
import 'ui/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observable();
  initServiceLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ArticlesBloc>(),)
      ], 
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      theme: AppTheme.lightTheme,
    );
  }
}