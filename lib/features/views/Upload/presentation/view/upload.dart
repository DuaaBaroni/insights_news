// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/constsnts/assets.dart';
import 'package:insights_news/core/functions/custom_dilog.dart';

import 'package:insights_news/core/functions/navigate.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/style.dart';
import 'package:insights_news/core/widgets/custom_tn.dart';

import 'package:insights_news/core/widgets/nav_bar.dart';

String? path;
String name = '';

class UploadView extends StatefulWidget {
  UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  AppLocalStorage.cacheData('name', name);
                  AppLocalStorage.cacheData('image', path);
                  AppLocalStorage.cacheData('isUpload', true);
                  navigateWithReplacment(context, NavBarWidget());
                } else if (path != null && name.isEmpty) {
                  showErrorDialog(context, 'Please Enter Your Name');
                } else if (path == null && name.isNotEmpty) {
                  showErrorDialog(context, 'Please Upload Your Image');
                } else {
                  showErrorDialog(
                      context, 'Please Enter Your Name and Upload Your Image');
                }
              },
              child: Text('Done', style: getBodyStyle(color: AppColors.green))),
        ],
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.green,
                radius: 70,
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : AssetImage(AssetsImg.user),
              ),
              Gap(15),
              CustomButton(
                text: 'Upload From Camera',
                onPressed: () {
                  uploadImage(isCamera: true);
                },
                width: 250,
                style: '',
              ),
              Gap(15),
              CustomButton(
                text: 'Upload From Gallery',
                onPressed: () {
                  uploadImage(isCamera: false);
                },
                width: 250,
                style: '',
              ),
              Gap(15),
              Divider(
                color: AppColors.green,
              ),
              Gap(15),
              TextFormField(
                style: getBodyStyle(),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.green)),
                    prefixIcon: Icon(Icons.person, color: AppColors.green),
                    hintText: "Enter Your UserName",
                    hintStyle: getBodyStyle()
                    
                    ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  uploadImage({required bool isCamera}) async {
    final pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
