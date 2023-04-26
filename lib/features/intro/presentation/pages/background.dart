import '../../domain/entities/backdrop_entity.dart';
import 'package:flutter/material.dart';
import '../widgets/posters_list.dart';

class Background extends StatefulWidget {
  List<BackDropEntity> list;

   Background({super.key, required this.list});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
    

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PosterList(
          list: widget.list,
          startIndex: 0,
        ),
        PosterList(
          list:  widget.list,
          startIndex: 1,
        ),
        PosterList(
          list:  widget.list,
          startIndex: 2,
        ),
      ],
    );
  }
}
