import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCarouselSlider extends StatelessWidget {
  MyCarouselSlider(
      {required this.itemBuilder,
      required this.itemCount,
      this.viewportFraction = .45,
      Key? key,
      this.onPageChanged,
      this.aspectRatio = 0.9})
      : super(key: key);
  Widget Function(BuildContext context, int index, int realindex)? itemBuilder;
  dynamic Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  final double aspectRatio;
  final int itemCount;
  final double viewportFraction;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      options: CarouselOptions(
        autoPlay: true,
        onPageChanged: onPageChanged,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        enableInfiniteScroll: itemCount > 2,
        viewportFraction: viewportFraction,
        enlargeCenterPage: itemCount != 1,
        aspectRatio: aspectRatio,
      ),
    );
  }
}
