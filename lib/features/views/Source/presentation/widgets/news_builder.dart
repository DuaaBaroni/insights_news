

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/functions/navigate.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/style.dart';
import 'package:insights_news/features/controller/news_cubit.dart';
import 'package:insights_news/features/controller/news_state.dart';
import 'package:insights_news/features/views/Source/presentation/widgets/articles_details.dart';



class ArticlesListBuilder extends StatelessWidget {
  const ArticlesListBuilder({super.key, });
  @override
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is ArticlesBySourcesSucessState) {
            var model = state.model.articles;
            return ListView.builder(
              itemCount: model?.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    navigateTo(
                        context,
                        ArticlesDetails(
                          newsArticle: model![index],
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 100,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            model?[index].urlToImage ?? '',
                            fit: BoxFit.cover,
                            height: 100,
                            width: 150,
                            errorBuilder: (context, error, stackTrace) =>
                                SizedBox(
                              height: 100,
                              width: 150,
                              child: Icon(
                                Icons.error,
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                        ),
                        const Gap(15),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                model?[index].title ?? '',
                                style: getSmallStyle(color: AppColors.white),
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.menu,
                                    color: AppColors.white,
                                  ),
                                  const Gap(5),
                                  Text(
                                    'READ',
                                    style: TextStyle(
                                        fontSize: 10, color: AppColors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is ArticlesBySourcesErrorState) {
            return Center(
              child: Text(
                'An error occurred!',
                style: getTitleStyle(),
              ),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.green,
            ));
          }
        },
      );
  }
}
