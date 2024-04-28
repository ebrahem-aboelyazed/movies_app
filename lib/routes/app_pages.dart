import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/modules/movies/movies.dart';

part 'app_routes.dart';

@Singleton()
class AppPages {
  AppPages();

  final initial = Routes.initial;

  late final router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const MoviesView(),
      ),
      GoRoute(
        path: Routes.movieDetails,
        builder: (context, state) {
          return MovieDetailsPage(id: state.pathParameters['id']!);
        },
      ),
    ],
  );
}
