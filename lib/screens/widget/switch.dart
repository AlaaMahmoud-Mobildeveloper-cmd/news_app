import 'package:flutter/material.dart';
import 'package:news/Provider/theme_provider.dart';
import 'package:news/core/app_image.dart';
import 'package:provider/provider.dart';

class SwitchItem extends StatelessWidget {
  const SwitchItem({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return  Switch(
      value: themeProvider.themeMode == ThemeMode.dark,
      onChanged: (value){
        if(themeProvider.themeMode == ThemeMode.light){
          themeProvider.changeTheme(ThemeMode.dark);
        }else{
          themeProvider.changeTheme(ThemeMode.light);
        }
      },
      activeThumbImage: AssetImage(AppImages.lightIcon),
      activeTrackColor: Theme.of(context).colorScheme.primary,
      inactiveThumbColor: Theme.of(context).colorScheme.primary,
      activeThumbColor: Theme.of(context).colorScheme.primary,
      inactiveThumbImage:  AssetImage(AppImages.darkIcon),
      inactiveTrackColor: Theme.of(context).colorScheme.surface ,
    );
  }
}
