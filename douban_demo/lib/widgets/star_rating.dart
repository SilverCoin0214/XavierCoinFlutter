/*
 * @Author: sce
 * @Date: 2021-09-10 22:14:29
 * @LastEditTime: 2021-09-10 22:14:30
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/douban_demo/lib/widgets/star_rating.dart
 */

import 'package:flutter/material.dart';

class SceStartRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;
  final Widget unselectedImage;
  final Widget selectedImage;

  SceStartRating({
    required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget? unselectedImage,
    Widget? selectedImage,
  }) : unselectedImage = unselectedImage ?? Icon(Icons.star_border,
          color: unselectedColor, size: size),
      selectedImage = selectedImage ??  Icon(Icons.star, color: selectedColor, size: size);

  @override
  _SceStartRatingState createState() => _SceStartRatingState();
}

class _SceStartRatingState extends State<SceStartRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnselectedStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectedStar(),
        ),
      ],
    );
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(
      widget.count,
      (index) => Icon(Icons.star_border,
          color: widget.unselectedColor, size: widget.size),
    );
  }

  List<Widget> buildSelectedStar() {
    List<Widget> stars = [];
    final star =
        Icon(Icons.star, color: widget.selectedColor, size: widget.size);

    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();

    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }

    double leftWdith = ((widget.rating / oneValue) - entireCount) * widget.size;
    stars.add(ClipRect(
      child: star,
      clipper: SceStarClipper(leftWdith),
    ));

    return stars;
  }
}

class SceStarClipper extends CustomClipper<Rect> {
  late double width;

  SceStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
