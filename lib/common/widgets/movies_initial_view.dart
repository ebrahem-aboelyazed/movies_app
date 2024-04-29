import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/gen/assets.gen.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/utils/utils.dart';

class MoviesInitialView extends StatelessWidget {
  const MoviesInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Assets.svg.icMoviesBg.svg(
              height: context.heightPercentage(0.5),
            ),
            const SizedBox(height: 10),
            Text(
              context.l10n.start_searching_for_movies,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
