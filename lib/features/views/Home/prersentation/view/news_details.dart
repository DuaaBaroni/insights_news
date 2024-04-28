// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/style.dart';
import 'package:insights_news/core/widgets/custom_tn.dart';
import 'package:insights_news/features/model/news_model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsView extends StatefulWidget {


   const NewsDetailsView({super.key, required this.model});
  final Article model;

  @override
  State<NewsDetailsView> createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  bool isShowMore = true;

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(widget.model.url ?? ''))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.white,
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomButton(
          text: 'Go to Website',
          onPressed: () {
            _launchUrl();
          },
          style: '',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.model.urlToImage ?? '',
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    child: const Icon(Icons.error),
                  );
                },
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.model.title ?? '',
                    style: getTitleStyle(color: AppColors.white),
                  ),
                ),
              ],
            ),
            const Gap(15),
            Row(
              children: [
                Text(
                  widget.model.author ?? '',
                  style: getBodyStyle(color: AppColors.green),
                ),
              ],
            ),
            const Gap(15),
            Row(
              children: [
                Text(
                  widget.model.publishedAt?.split('T')[0] ?? '',
                  style: getSmallStyle(),
                ),
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    maxLines: isShowMore ? 2 : null,
                    widget.model.description ?? '',
                    style: getBodyStyle(color: AppColors.white),
                  ),
                ),
              ],
            ),
             TextButton(
                onPressed: () {
                  setState(() {
                    isShowMore = !isShowMore;
                  });
                },
                child: Text(
                  isShowMore ? "Show more" : "Show less",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.green,
                  ),
                )
                ),
          ],
        ),
      ),
    );
  }
}

