import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news/Provider/theme_provider.dart';
import 'package:news/core/app_image.dart';
import 'package:news/core/app_string.dart';
import 'package:news/models/category_models.dart';
import 'package:news/screens/home_Screen/view_Screen/category_screen.dart';
import 'package:news/screens/home_Screen/view_Screen/sources_view.dart';
import 'package:news/screens/widget/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return LoaderOverlay(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          title: Text(selectedCategory == null
              ?"titleHome".tr()
              :selectedCategory!.label,
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
        drawer: DrawerItems(
          onClick:drawerOnclick ,
        ),
        body: selectedCategory == null
            ? CategoryScreen(onClick:onClick ,)
            :SourcesView(categoryId: selectedCategory!.id,
      
        ),
      ),
    );

  }

  CategoryModels? selectedCategory;
  void drawerOnclick(){
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });
  }
  void onClick(CategoryModels category){
    selectedCategory = category;
    setState(() {

    });
  }
}
