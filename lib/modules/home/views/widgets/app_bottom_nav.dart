import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/modules/home/home.dart';
import 'package:movies_app/utils/utils.dart';

class AppBottomNav extends StatefulWidget {
  const AppBottomNav({super.key});

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  late final HomeCubit cubit;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    cubit = context.read<HomeCubit>();
    currentIndex = 0;
    cubit.pageController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        final index = cubit.currentPage ?? 0;
        if (index != currentIndex) {
          setState(() => currentIndex = index);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() => currentIndex = index);
        cubit.changePage(page: index);
      },
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.lightPrimaryColor,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedFontSize: 14,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.house, size: 18),
          label: context.l10n.home_txt,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite, size: 18),
          label: context.l10n.favorites,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.access_time_filled, size: 18),
          label: context.l10n.watchlist,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings, size: 18),
          label: context.l10n.settings,
        ),
      ],
    );
  }
}
