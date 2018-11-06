/**
 * 首页公共的底部导航栏模块
 */

import 'package:flutter/material.dart';
import 'package:magic_frets/assets.dart';

class Footer extends StatelessWidget {
  Footer({ this.index, this.onTapped });

  final int index;
  final onTapped;
  static const Color bgColor = Color.fromRGBO(15, 115, 238, 1.0);
  static const double iconFavorWidth = 68.0;
  static const double botNavbarHeight = 48.0;

  Widget _buildBotNavbar() {
    Widget row = new Stack(
      overflow: Overflow.visible,
      alignment: const FractionalOffset(.5, 1.0),
      children: <Widget>[
        new Container(
          height: botNavbarHeight,
          decoration: const BoxDecoration(
            color: bgColor
          ),
          child: new Row(
            children: <Widget>[
              new FooterNavbarItem(
                padding: const EdgeInsets.only(right: iconFavorWidth / 2.0),
                icon: Icons.star,
                text: '我的订阅',
                isActive: index == 0,
                onTap: () {
                  onTapped(0);
                },
              ),
              new FooterNavbarItem(
                padding: const EdgeInsets.only(left: iconFavorWidth / 2.0),
                icon: Icons.person,
                text: '个人中心',
                isActive: index == 2,
                onTap: () {
                  onTapped(2);
                },
              )
            ],
          ),
        ),
        new InkWell(
          onTap: () {
            onTapped(1);
          },
          child: new Image.asset(
            index == 1 ? ImageAssets.icon_favor_active : ImageAssets.icon_favor,
            width: iconFavorWidth,
          )
        )
      ]
    );

    // Widget containerWithSafeArea = new Container(
    //   child: new SafeArea(
    //     child: row,
    //   )
    // );

    return row;
  }

  @override
  Widget build(BuildContext context) {
    Widget container = new Theme(
      data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor: bgColor,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: bgColor,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: const TextStyle(color: Colors.white))), // sets the inactive color of the `BottomNavigationBar`
      child: _buildBotNavbar()
    );

    return container;
  }
}

class FooterNavbarItem extends StatelessWidget {
  FooterNavbarItem({
    this.padding,
    this.icon,
    this.text,
    this.isActive,
    this.onTap,
  });
  final EdgeInsets padding;
  final IconData icon;
  final String text;
  final bool isActive;
  final onTap;

  static const Color color = Color.fromRGBO(221, 221, 221, 1.0);
  static const Color activeColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    Widget item = Expanded(
      child: new InkWell(
        onTap: () {
          onTap();
        },
        child: new Container(
          padding: padding,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                icon,
                color: isActive ? Colors.orange : color,
              ),
              new Text(
                text,
                style: new TextStyle(
                  color: isActive ? activeColor : color,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                )
              ),
            ],
          ),
        )
      )
    );

    return item;
  }
}