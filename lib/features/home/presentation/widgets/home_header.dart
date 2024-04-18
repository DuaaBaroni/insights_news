// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insights_news/core/functions/navigate.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/style.dart';
import 'package:insights_news/features/profile/presentation/view/profile_view.dart';


class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? path;
  String name = '';

  @override
  void initState() {
    super.initState();
    name = AppLocalStorage.getCacheData('name');
    path = AppLocalStorage.getCacheData('image');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $name',
              style: getTitleStyle(color: AppColors.green),
            ),
            Text(
              'Have A Nice Day !',
              style: getBodyStyle( color: AppColors.grey
              ),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            navigateTo  (context,  ProfileView());
          },
          child: CircleAvatar(
            radius: 22,
            backgroundImage: path != null
                ? FileImage(File(path!)) as ImageProvider
                : const AssetImage('assets/user.png'),
          ),
        ),
      ],
    );
  }
}

