import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/functions/navigate.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/style.dart';
import 'package:insights_news/features/controller/news_cubit.dart';
import 'package:insights_news/features/controller/news_state.dart';
import 'package:insights_news/features/views/Source/presentation/view/news_list.dart';

class SourceListView extends StatefulWidget {
  const SourceListView({super.key});

  @override
  State<SourceListView> createState() => _SourceListViewState();
}

class _SourceListViewState extends State<SourceListView> {
  @override
  void initState() {
    super.initState();
 //context.read<NewsCubit>().getNewsBySource();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsBySourceSuccessState) {
          var source = state.sources.sources;
          return ListView.builder(
            itemCount: source?.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
               
                  navigateTo(context, NewsSourceListBuilder(id: source![index].id !,));
                },
                child: Container(
                  height: 75,
            
                 margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(15),),
                      child: Row(
                        children: [
                          Container(
                            height: 75,
                            width: 150,
                              decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),),
                          ),
                         const Gap(10),
                          Expanded(
                            child: Text(source?[index].name ?? '',style: getBodyStyle(),)),
                        ],
                      ) ,
                ),
              );
            },
          );
        } else if (state is NewsBySourceErrorState) {
          return Center(
            child: Text(
              'An error occurred!',
              style: getTitleStyle(),
            ),
          );
        } else {
          return  Center(
              child: CircularProgressIndicator(color: AppColors.green,)
              );
        }
      },
    );
  }
}