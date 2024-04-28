// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:insights_news/features/views/Source/presentation/widgets/articles_details.dart';
import 'package:insights_news/features/views/Source/presentation/widgets/news_builder.dart';
import 'package:insights_news/features/views/Source/presentation/widgets/source_list.dart';


class SourceView extends StatefulWidget {
  const SourceView({super.key});

  @override
  State<SourceView> createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            title: const Text('Sources', textAlign: TextAlign.center,),
          )),
      body: const Padding(
        padding:  EdgeInsets.all(20),
        child: Column(
          children: [
         // Expanded(child: 
          SourceListView(),
        // ArticlesListBuilder()
          
          //),
        ],),
      )
       
      
    );
  }
}