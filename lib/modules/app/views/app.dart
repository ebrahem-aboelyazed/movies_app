import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/modules/movies/movies.dart';
import 'package:movies_app/routes/routes.dart';
import 'package:movies_app/utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsStorage = getIt.get<SettingsStorage>();
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
        child: ValueListenableBuilder<Box<dynamic>>(
          valueListenable:
              Hive.box<dynamic>(AppConstants.preferences).listenable(),
          builder: (context, value, child) {
            final isDarkMode = settingsStorage.isDarkMode();
            return MaterialApp.router(
              routerConfig: getIt.get<AppPages>().router,
              debugShowCheckedModeBanner: false,
              locale: Locale(settingsStorage.localeName),
              theme: isDarkMode ? darkTheme : lightTheme,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}
