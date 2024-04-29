import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/modules/favorites/favorites.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<FavoritesCubit>(
        create: (context) {
          return FavoritesCubit(
            favoritesStorage: getIt.get<FavoritesStorage>(),
          );
        },
        child: Builder(
          builder: (ctx) {
            final cubit = ctx.read<FavoritesCubit>();
            return Column(
              children: [
                AppBar(
                  centerTitle: true,
                  title: Text(
                    context.l10n.favorites,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ValueListenableBuilder<Box<String>>(
                    valueListenable: cubit.getFavoritesStream(),
                    builder: (context, value, child) {
                      final movies = cubit.getFavorites();
                      if (movies.isEmpty) {
                        return const Center(child: EmptyView());
                      }
                      return FavoritesGridView(movies: movies);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
