import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Provider/theme_provider.dart';
import 'package:news/core/internet_checker.dart';
import 'package:news/core/observer.dart';
import 'package:news/core/theme_app.dart';
import 'package:news/di.dart';
import 'package:news/screens/home_Screen/home_screen.dart';
import 'package:news/screens/home_Screen/view_Screen/detilse_news.dart';
import 'package:news/screens/search/search_item.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  getIt<InternetConnectivity>().initialize();
  Bloc.observer = MyBlocObserver();
  runApp( EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ar', 'EG'),
    ],
    path: "assets/translation",
    fallbackLocale: Locale('en', 'US'),
    child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: MyApp()),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme:AppThemeData.themeLight ,
      darkTheme: AppThemeData.themeDark,
      themeMode: provider.themeMode,
      initialRoute: HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName: (context) =>  HomeScreen(),
        SearchItem.routeName: (context) =>  SearchItem(),
      },
    );
  }
}
