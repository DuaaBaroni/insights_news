// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/style.dart';
import 'package:insights_news/features/upload/presentation/view/upload_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var image = AppLocalStorage.getCacheData("image");
    var name = AppLocalStorage.getCacheData("name");

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                    radius: 80,
                    backgroundImage: image.isNotEmpty
                        ? FileImage(File(image)) as ImageProvider
                        : const AssetImage('assets/user.png')),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                        radius: 20,
                        child:  Icon(Icons.camera_alt_rounded,color: AppColors.green,)),
                  ),
                )
              ],
            ),
            const Gap(30),
            Divider(
              color: AppColors.green,
            ),
            const Gap(30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: getTitleStyle(color: AppColors.green),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.green,
                    child:
                        CircleAvatar(radius: 17, child:  Icon(Icons.edit, color: AppColors.green,)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
