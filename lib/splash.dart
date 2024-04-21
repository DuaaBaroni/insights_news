import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/functions/navigate.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/style.dart';
import 'package:insights_news/core/widgets/nav_bar.dart';
import 'package:insights_news/features/view/upload/presentation/view/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isUpload = AppLocalStorage.getCacheData('isUpload') ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      navigateWithReplacment(
          context, isUpload ? const NavBarWidget() : UploadView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/splash.png'),
          const Gap(10),
          Text(
            'Insights News',
            style: getTitleStyle(color: AppColors.green, fontSize: 22),
          ),
          const Gap(10),
          Text(
            'Stay Informed, Anytime, Anywhere.',
            style: getSmallStyle(),
          ),
        ],
      )),
    );
  }
}
