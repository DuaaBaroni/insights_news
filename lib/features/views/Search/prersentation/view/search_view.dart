// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/style.dart';
import 'package:insights_news/features/controller/news_cubit.dart';
import 'package:insights_news/features/views/Search/prersentation/widgets/list_search.dart';


class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search for News'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: getBodyStyle(),
                      controller: searchController,
                      decoration: const InputDecoration(
                       
                        hintText: 'Search for news', hintStyle: TextStyle(color: Colors.white) ,
                      ),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: AppColors.white,
                        child: SvgPicture.asset('assets/search.svg'),
                        onPressed: () {
                          context
                              .read<NewsCubit>()
                              .getNewsBySearch(searchController.text);
                        }),
                  )
                ],
              ),
              const Gap(20),
              const Expanded(child: NewsListSearchView())
            ],
          ),
        ),
      ),
    );
  }
}