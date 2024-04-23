import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/views/Home/prersentation/view/home_view.dart';
import 'package:insights_news/features/views/Profile/prersentation/view/profile.dart';
import 'package:insights_news/features/views/Search/prersentation/view/search_view.dart';
import 'package:insights_news/features/views/Source/presentation/view/source_view.dart';


class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key, this.page});
  final int? page;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int selectedIndex = 0;
  List<Widget> views = [
    const HomeView(),
     SearchView(),
    const SourceView(),
    const ProfileView(),
  ];

  @override
  void initState() {
    selectedIndex = widget.page ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/home.svg'),
              activeIcon: SvgPicture.asset('assets/home.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.green, BlendMode.srcIn)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/search.svg'),
              activeIcon: SvgPicture.asset('assets/search.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.green, BlendMode.srcIn)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/folder.svg'),
              activeIcon: SvgPicture.asset('assets/folder.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.green, BlendMode.srcIn)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Profile.svg'),
              activeIcon: SvgPicture.asset('assets/Profile.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.green, BlendMode.srcIn)),
              label: 'Home',
            ),
          ]),
    );
  }
}
