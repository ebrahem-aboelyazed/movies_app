import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/modules/watch_list/watch_list.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WatchListCubit>(
      create: (context) {
        return WatchListCubit(
          watchListStorage: getIt.get<WatchListStorage>(),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            context.l10n.watchlist,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: Builder(
          builder: (ctx) {
            final cubit = ctx.read<WatchListCubit>();
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              child: ValueListenableBuilder<Box<String>>(
                valueListenable: cubit.getWatchListStream(),
                builder: (context, value, child) {
                  final movies = cubit.getWatchList();
                  if (movies.isEmpty) {
                    return const Center(child: EmptyView());
                  }
                  return WatchListGridView(movies: movies);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
