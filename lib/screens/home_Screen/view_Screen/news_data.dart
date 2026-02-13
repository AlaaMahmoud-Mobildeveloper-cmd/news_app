import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news/core/app_image.dart';
import 'package:news/screens/bloc/cubit.dart';
import 'package:news/screens/bloc/stats.dart';

class NewsData extends StatelessWidget {

   const NewsData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){
          if (state is GetNewsDataLoadingState){
            context.loaderOverlay.show();
          }else{
            context.loaderOverlay.hide();
          }

        },
        builder: (context,state){
          var bloc = BlocProvider.of<HomeCubit>(context);
          if(state is GetNewsDataLoadingState){
            return Center(child: CircularProgressIndicator());
          }
          if(state is GetNewsDataErrorState){
            return Center(child: Text("something went wrong"));
          }
          return  ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 22,vertical: 15),
              itemCount: bloc.articles.length,
              separatorBuilder: (context,index)=>SizedBox(height: 10,),
              itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                      width:1
                    )
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: bloc.articles[index].urlToImage ?? "",
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onPrimary,
                              strokeWidth: 2,
                            ),
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                            AppImages.errorImg,
                            fit: BoxFit.cover,
                            height: 220,
                            width: double.infinity,
                          ),
                          fit: BoxFit.cover,
                          height: 220,
                          width: double.infinity,
                        )
                      ),
                      Text(bloc.articles[index].title ?? "",style: Theme.of(context).textTheme.titleSmall),
                      Row(
                        children: [
                          Text("By:${bloc.articles[index].author ?? ""}",
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 10
                              )
                          ),

                        ],
                      )
                    ],
                  ),
                );
              }
          );
        }
    );
  }
}
