import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/Provider/theme_provider.dart';
import 'package:news/core/app_image.dart';
import 'package:news/core/app_string.dart';
import 'package:news/screens/gnarel_Screen/gnarel_screen.dart';
import 'package:news/screens/home_Screen/home_screen.dart';
import 'package:news/screens/widget/dropdown.dart';
import 'package:news/screens/widget/switch.dart';
import 'package:provider/provider.dart';

class DrawerItems extends StatefulWidget {
  const DrawerItems({super.key});

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  String? selectedLanguage;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var currentLocale;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: EdgeInsets.symmetric(vertical: 75,),
              child: Text("title".tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary
                  )
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
                  },
                  child: Row(
                      spacing: 10,
                      children: [
                        ImageIcon(AssetImage(AppImages.homeIcon,),
                            color: Theme.of(context).colorScheme.primary,
                            size: 40),
                        Text("titlePage".tr(),
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context).colorScheme.primary
                            )
                        )
                      ]
                  ),
                )
            ),
            Divider(
              endIndent: 30,
              indent: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
            Container(
              width: double.infinity,
              height:90,
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                child: DropdownList(
                  value: provider.themeMode,
                  itemsMap: {
                    ThemeMode.light: "Light",
                    ThemeMode.dark: "Dark"

                  },
                  onChanged: (value) {
                   provider.changeTheme(value == ThemeMode.light ? ThemeMode.light : ThemeMode.dark);
                  },

                ),
            ),
            Divider(
              endIndent: 30,
              indent: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
            Container(
              width: double.infinity,
                height:90,
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                child: DropdownList(
                   value: context.locale.toString(),
                   itemsMap: {
    "en_US": "English",
    "ar_EG": "العربية",
    },
                   onChanged: (value) {
                     if (value == "en_US") {
                       context.setLocale(const Locale('en', 'US'));
                     } else if (value == "ar_EG") {
                       context.setLocale(const Locale('ar', 'EG'));
                     }
                  }

                )
            ),
          ]
      ),
    );
  }
}
