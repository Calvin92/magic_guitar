import 'package:flutter/material.dart';
import 'package:magic_frets/assets.dart';

class MainCard extends StatelessWidget {
  MainCard({ this.title, this.border, this.iconPath });

  final String title;
  final Border border;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    Widget expanded = new Expanded(
      child: new Container(
        decoration: BoxDecoration(
          border: border,
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: 50.0,
              padding: const EdgeInsets.only(
                bottom: 6.0,
              ),
              child: new Image.asset(iconPath),
            ),
            new Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            )
          ],
        )
      )
    );

    return expanded;
  }
}

class MainCards extends StatelessWidget {
  MainCards({ this.top });
  final double top;
  final BorderSide borderSide = const BorderSide(width: 1.0, color: Color.fromRGBO(242, 242, 242, 1.0));

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height - top - 68, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      margin: new EdgeInsets.only(
        top: top,
        left: 24.0,
        right: 24.0,
      ),
      padding: const EdgeInsets.all(.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(12.0),
          topRight: const Radius.circular(12.0),
        )
      ),
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new Row(
              children: <Widget>[
                new MainCard(
                  title: '音名反射记忆',
                  border: Border(
                    right: borderSide,
                    bottom: borderSide
                  ),
                  iconPath: ImageAssets.icon_abc,
                ),
                new MainCard(
                  title: '听音辨位',
                  border: Border(
                    bottom: borderSide,
                  ),
                  iconPath: ImageAssets.icon_radar,
                )
              ],
            )
          ),
          new Expanded(
            child: new Row(
              children: <Widget>[
                new MainCard(
                  title: '音程地图',
                  border: Border(
                    right: borderSide,
                    bottom: borderSide,
                  ),
                  iconPath: ImageAssets.icon_map,
                ),
                new MainCard(
                  title: '音阶特训',
                  border: Border(
                    bottom: borderSide,
                  ),
                  iconPath: ImageAssets.icon_ladder,
                )
              ],
            )
          ),
          new Expanded(
            child: new Row(
              children: <Widget>[
                new MainCard(
                  title: '和弦推导',
                  border: Border(
                    right: borderSide,
                    bottom: borderSide,
                  ),
                  iconPath: ImageAssets.icon_caged,
                ),
                new MainCard(
                  title: '伴奏音乐',
                  border: Border(
                    bottom: borderSide,
                  ),
                  iconPath: ImageAssets.icon_music,
                ),
              ],
            )
          ),
          new Expanded(
            child: new Row(
              children: <Widget>[
                new MainCard(
                  title: '节拍训练',
                  border: Border(
                    right: borderSide,
                  ),
                  iconPath: ImageAssets.icon_media,
                ),
                new MainCard(
                  title: '音/视频',
                  border: null,
                  iconPath: ImageAssets.icon_tempo,
                )
              ],
            )
          )
        ],
      )
    );
  }
}
