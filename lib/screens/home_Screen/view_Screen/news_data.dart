import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:news/screens/bloc/cubit.dart';
import 'package:news/screens/bloc/stats.dart';
import 'package:news/screens/home_Screen/view_Screen/detilse_news.dart';

class NewsData extends StatelessWidget {
   Function onClick;
   NewsData({super.key,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit,HomeState>(
      listener: (context, state) {
        if (state is GetNewsDataLoadingState) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      builder: (context, state) {
        var bloc = BlocProvider.of<HomeCubit>(context);

        if (state is GetNewsDataErrorState) {
          return Center(child: Text("Something went wrong"));
        }

        return ListView.separated(

          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemBuilder: (context, index) {
            return InkWell(
              onLongPress: () {
                showModalBottomSheet(context: context,
                    backgroundColor: Colors.transparent,

                  builder: (context){
                  return Container(
                    height: 450,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.grey),
                    ),
                    padding:  EdgeInsets.all(12.0),
                    margin: EdgeInsets.symmetric(horizontal: 13.0,vertical: 35),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: [

                        ClipRRect(

                          borderRadius: BorderRadiusGeometry.circular(18),
                          child: CachedNetworkImage(
                            imageUrl: bloc.articles[index].urlToImage ?? "",
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                          ),
                        ),
                        Text(
                          bloc.articles[index].title ?? "",
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          bloc.articles[index].description ?? "",
                          maxLines: 4,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 14,
                          ),

                        ),
                        if (bloc.articles[index].url != null && bloc.articles[index].url!.isNotEmpty)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsNews(
                                      url: bloc.articles[index].url!,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 2,
                              ),
                              child: Text(
                                'View Full Article',
                                style:Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary),
                              ),
                            ),
                          )
                        else
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "Full article source not available.",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),

                      ],
                    ),
                  );
                },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                padding:  EdgeInsets.all(12.0),
                margin:  EdgeInsets.all(8.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [

                    ClipRRect(

                      borderRadius: BorderRadiusGeometry.circular(18),
                      child: CachedNetworkImage(
                        imageUrl: bloc.articles[index].urlToImage ?? "",
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                      ),
                    ),
                    Text(
                      bloc.articles[index].title ?? "",
                      maxLines: 1,

                    ),
                    Text(
                      bloc.articles[index].description ?? "",
                      maxLines: 2,

                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            bloc.articles[index].author ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                          ),
                        ),
                        Expanded(
                          child: Text(
                            bloc.articles[index].publishedAt?.substring(0, 10) ??
                                "",
                            maxLines: 1,
                            textAlign: TextAlign.end,

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: bloc.articles.length,
        );
      },
    );
  }

}
