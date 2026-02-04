import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/Provider/theme_provider.dart';
import 'package:news/core/app_image.dart';
import 'package:news/core/app_string.dart';
import 'package:news/screens/widget/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text("titleHome".tr(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon:Icon(Icons.search,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 30,
              )
          ),
        ],
      ),
      drawer: DrawerItems(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("supTitle".tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
