import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/favorites/favorites.dart';
import 'package:movies_app/modules/home/home.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/modules/settings/settings.dart';
import 'package:movies_app/modules/watch_list/watch_list.dart';
import 'package:movies_app/utils/extensions/snackbars_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MoviesCubit, MoviesState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: context.showErrorSnackBar,
        );
      },
      child: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
        child: Scaffold(
          bottomNavigationBar: const AppBottomNav(),
          body: Builder(
            builder: (ctx) {
              final cubit = ctx.read<HomeCubit>();
              return PopScope(
                canPop: false,
                onPopInvoked: (didPop) {
                  if (didPop) return;
                  if (cubit.currentPage != 0) {
                    cubit.changePage(page: 0);
                  }
                },
                child: PageView(
                  controller: cubit.pageController,
                  children: const [
                    MoviesView(),
                    FavoritesView(),
                    WatchListView(),
                    SettingsView(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
