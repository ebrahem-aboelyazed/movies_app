import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesCubit>(
          create: (BuildContext context) {
            return MoviesCubit(
              moviesService: getIt.get<MoviesService>(),
            );
          },
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          routerConfig: getIt.get<AppPages>().router,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}