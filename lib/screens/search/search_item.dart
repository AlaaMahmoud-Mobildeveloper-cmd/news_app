import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/di.dart';
import 'package:news/screens/home_Screen/view_Screen/detilse_news.dart';
import 'package:news/screens/search/bloc/cubit.dart';
import 'package:news/screens/search/bloc/state.dart';
import 'dart:async';

class SearchItem extends StatefulWidget {
  static const String routeName = '/search';
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  Timer? _debounce;


  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
        create: (context) => getIt<SearchCubit>(),
        child: BlocConsumer<SearchCubit,SearchState>(
          builder: (context, state){
            var cubit = BlocProvider.of<SearchCubit>(context);
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search for news...",
                        hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16,
                        ),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon:Icon(Icons.clear),
                          onPressed: () {
                            Navigator.pop(context);
                            cubit.clearSearch();
                            _debounce?.cancel();
                          },
                        ),
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 2,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ) ,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 2,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 2,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();
                        _debounce = Timer(const Duration(milliseconds: 500), () {
                          cubit.getSearch(value);
                        });
                      },
                    ),
                  ),
                  centerTitle: true,
                ),
                body:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 22),
                  child: Column(
                      children: [
                        if (state is LoadingSearchState)
                          const Center(child: CircularProgressIndicator()),

                        if (state is SuccessSearchState)
                          Expanded(
                            child: ListView.builder(
                              itemCount: cubit.searchList.length,
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
                                                  imageUrl: cubit.searchList[index].urlToImage ?? "",
                                                  height: 220,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Center(child: CircularProgressIndicator()),
                                                  errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                                                ),
                                              ),
                                              Text(
                                                cubit.searchList[index].title ?? "",
                                                maxLines: 1,
                                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                  color: Theme.of(context).colorScheme.primary,)
                                              ),
                                              Text(
                                                cubit.searchList[index].description ?? "",
                                                maxLines: 4,
                                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                  fontSize: 14,
                                                  color: Theme.of(context).colorScheme.primary,
                                                ),

                                              ),
                                              if (cubit.searchList[index].url != null && cubit.searchList[index].url!.isNotEmpty)
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);

                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => DetailsNews(
                                                            url: cubit.searchList[index].url!,
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
                                            imageUrl: cubit.searchList[index].urlToImage ?? "",
                                            height: 220,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                                          ),
                                        ),
                                        Text(
                                          cubit.searchList[index].title ?? "",
                                          maxLines: 1,

                                        ),
                                        Text(
                                          cubit.searchList[index].description ?? "",
                                          maxLines: 2,

                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                cubit.searchList[index].author ?? "",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,

                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                cubit.searchList[index].publishedAt?.substring(0, 10) ??
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
                            ),
                          ),

                        if (state is ErrorSearchState)
                          const Center(child: Text("Something went wrong!")),
                      ]
                  ),
                )
            );
            },
          listener: (context, state){
          }
      )
    );
  }
}
