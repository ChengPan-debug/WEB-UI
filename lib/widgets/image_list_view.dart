import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/responsive_layout.dart';

class ImageListView extends StatefulWidget {
  const ImageListView({Key? key, this.startIndex = 1, this.duration = 30})
      : super(key: key);

  final int startIndex;
  final int duration;

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        _autoScroll();
      }
    });
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  _autoScroll() {
    final _currentScrollPosition = _scrollController.offset;
    final _scrollEndPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
        _currentScrollPosition == _scrollEndPosition ? 0 : _scrollEndPosition,
        duration: Duration(seconds: widget.duration),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        height: 130,
        width: double.infinity,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _ImageTitle(
                image: 'assets/nfts/${widget.startIndex + index}.png');
          },
          itemCount:ResponsiveLayout.isSmallScreen(context) ? 10 : 20,
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class _ImageTitle extends StatelessWidget {
  const _ImageTitle({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: image,
      child: Image.asset(
        image,
        width: 130,
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.035, 0); //起点
    path.lineTo(size.width, 0); //第一条线
    path.lineTo(size.width * 0.965, size.height); //第二条线
    path.lineTo(0, size.height); //第三条线
    path.close(); //将路径闭合，形成一个四边形
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
