import '../../domain/entities/up_coming_movie_entity.dart';
import 'package:flutter/material.dart';
import '../widgets/posters_list.dart';

class Background extends StatelessWidget {
  final List<UpComingMovieEntity> list;

  const Background({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PosterList(
          list: list,
          startIndex: 0,
        ),
        PosterList(
          list: list,
          startIndex: 1,
        ),
        PosterList(
          list: list,
          startIndex: 2,
        ),
      ],
    );
  }
}
