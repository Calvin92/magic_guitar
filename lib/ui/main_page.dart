import 'package:flutter/material.dart';
import 'package:magic_frets/ui/main_page/header.dart';
import 'package:magic_frets/ui/main_page/main_cards.dart';
import 'package:magic_frets/ui/common/footer.dart';

class MainPage extends StatefulWidget {
  const MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  void onBotNavTapped (int index) {
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildBody(BuildContext context) {
    double bannerHeight = 200.0;
    // print(MediaQuery.of(context).size.);
    if (MediaQuery.of(context).size.height <= 568.0) { // 5s或以下的小屏幕
      bannerHeight = 160.0;
    }

    return new Stack(
      children: <Widget>[
        new HeaderBanners(
          height: bannerHeight,
        ),
        new MainCards(top: bannerHeight - 24.0),
      ],
    );
  }

  Widget _buildBody2() {
    return new Container(
      child: const Center(
        child: const Text('吉他实验室'),
      ),
    );
  }

  
  Widget _buildBody3() {
    return new Container(
      child: const Center(
        child: const Text('个人中心'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_currentIndex == 0) {
      body = _buildBody(context);
    } else if (_currentIndex == 1) {
      body = _buildBody2();
    } else {
      body = _buildBody3();
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1.0),
      body: body,
      bottomNavigationBar: new Footer(
        index: _currentIndex,
        onTapped: onBotNavTapped,
      ),
    );
  }
}
