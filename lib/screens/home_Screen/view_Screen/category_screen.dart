import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/Provider/theme_provider.dart';
import 'package:news/core/app_string.dart';
import 'package:news/models/category_models.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  Function onClick;
  CategoryScreen({super.key, required this.onClick});
  var category = CategoryModels.getCategory();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    bool isArabic = context.locale.languageCode == 'ar';
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("supTitle".tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Expanded(child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 15),
              itemBuilder: (context, index){
                return Stack(
                  alignment:index.isOdd?Alignment.bottomLeft :Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(provider.themeMode==ThemeMode.light
                          ?"assets/images/${category[index].image}_dark.png"
                          :"assets/images/${category[index].image}.png"
                        ,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),

                    ),
                    Container(
                      padding: EdgeInsets.only(bottom:120, left: 30,right: 30),
                      width: double.infinity,
                      child: Text(category[index].label,
                          textAlign:index.isOdd|| isArabic? TextAlign.start: TextAlign.end,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          )
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        onClick(category[index]);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding: EdgeInsets.only(left: index.isOdd || isArabic? 0:10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          color: provider.themeMode==ThemeMode.light
                              ? Color(0x80ffffff)
                              : Color(0x80000000),

                        ),
                        width: 200,

                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Visibility(
                                visible: index.isOdd  ,
                                child:  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(50),

                                    ),
                                    padding: EdgeInsets.all(15),
                                    child: Icon(Icons.arrow_back_ios,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    )
                                )),
                            Expanded(child:Text(AppString.view,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                )
                            )),
                            Visibility(
                                visible: index.isEven ,
                                child:  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(50),

                                    ),
                                    padding: EdgeInsets.all(15),
                                    child: Icon(Icons.arrow_forward_ios,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    )
                                ))

                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10,)
              , itemCount: category.length))
        ],
      ),
    );
  }
}
