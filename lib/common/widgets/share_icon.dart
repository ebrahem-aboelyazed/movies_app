import 'package:flutter/material.dart';
import 'package:movies_app/modules/movies/movies.dart';

class ShareIcon extends StatelessWidget {
  const ShareIcon({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        //await Share.share('${movie.title}\n');
      },
      iconSize: 30,
      icon: const Icon(Icons.share),
    );
  }
}
