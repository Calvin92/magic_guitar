import 'package:flutter/material.dart';
import 'package:magic_frets/assets.dart';

class HeaderBanners extends StatelessWidget {
  HeaderBanners({ this.height });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.mainPageBanner_1,
      height: height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}