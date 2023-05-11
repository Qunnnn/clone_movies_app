import '../../../../constants/assest_path.dart';
import '../../domain/entities/backdrop_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
class PosterList extends StatefulWidget {
  final List<BackDropEntity> list;
  final int startIndex;
  const PosterList({super.key, required this.list, required this.startIndex});

  @override
  State<PosterList> createState() => _PosterListState();
}

class _PosterListState extends State<PosterList> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (!_scrollController.position.atEdge) {
        _autoScroll();
      }
      // adding to list
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _autoScroll();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _autoScroll() {
    final endScrollPosition = _scrollController.position.maxScrollExtent;
    _scrollController.animateTo(endScrollPosition,
        duration: const Duration(seconds: 10), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        width: 50.w,
        child: Transform.rotate(
            angle: -3 * pi / 180,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: widget.list.length - 2,
                itemBuilder: ((context, index) => Container(
                      margin: const EdgeInsets.only(right: 5, left: 5, top: 10),
                      height: 35.h,
                      width: 18.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(imageUrl:  "$baseUrlImage${widget.list[widget.startIndex + index].backdropPath}" , fit: BoxFit.fill,)
                      ),
                    )))));
  }
}
