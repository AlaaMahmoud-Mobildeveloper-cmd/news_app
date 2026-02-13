import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news/screens/bloc/cubit.dart';
import 'package:news/screens/bloc/stats.dart';
import 'package:news/screens/home_Screen/view_Screen/news_data.dart';


class SourcesView extends StatelessWidget {
  String categoryId;
 SourcesView({super.key, required this.categoryId});


  @override
  Widget build(BuildContext context) {

    return BlocProvider<HomeCubit>(
        create: (context) => HomeCubit()..getSources(categoryId),
        child: BlocConsumer<HomeCubit,HomeState>(
            listener: (context,state){
              if (state is GetSourcesLoadingState){
                context.loaderOverlay.show();
              }else{
                context.loaderOverlay.hide();
              }
            },
            builder: (context,state){
              var bloc = BlocProvider.of<HomeCubit>(context);
              return Column(
                children: [
                  DefaultTabController(
                      length: bloc.sources.length,
                      initialIndex:  bloc.selectedIndex,
                      child:TabBar(
                          onTap: (index){
                            bloc.onChangeSource(index);

                          },
                          dividerColor: Colors.transparent,
                          tabAlignment: TabAlignment.start,
                          indicatorColor: Theme.of(context).colorScheme.onPrimary,
                          isScrollable: true,
                          tabs: bloc.sources.map((e) => Tab(
                            child: Text(e.name ?? "",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          )).toList()
                      )
                  ),
                 Expanded(
                   child: NewsData(
                   ),
                 ),
                ],
              );
            }

        )
    );
  }
}
