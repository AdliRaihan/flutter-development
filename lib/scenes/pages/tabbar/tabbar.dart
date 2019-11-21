import 'package:adli_train/scenes/Extensions/colorExtension.dart';
import 'package:adli_train/scenes/pages/market/market.dart';
import 'package:adli_train/scenes/pages/member/dashboard.dart';
import 'package:flutter/material.dart';

class tabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: _tabbar(),
      ),
    );
  }
}

class _tabbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _tabbar_();
  }
}

class _tabbar_ extends State<_tabbar> {
  @override
  Widget build(BuildContext context) {
    var navigation = Container(
      decoration: BoxDecoration(
        color: Colors.white, 
        border: Border(
          top: BorderSide(
            color: Colors.black12,
            width: 0.5
          )
        )
      ),
      child: new TabBar(
        indicatorColor: colorExtension().purpleCommonRightColor,
        labelPadding: EdgeInsets.all(10),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black12,
        tabs: <Widget>[
          _buildTab("Dashboard", image: "assets/images/ic_blue_news.png"),
          _buildTab("Market", image: "assets/images/ic_blue_market.png"),
          _buildTab("Explore"),
          _buildTab("Profile")
        ],
      ),
    );
    return Scaffold(
      body: TabBarView(
        children: <Widget>[dashboard(), market(), Container(), Container()],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        maintainBottomViewPadding: false,
        minimum: EdgeInsets.zero,
        child: navigation,
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildTab(String text, {String image = "", Icon icon}) {
    return Tab(
        child: Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            width: 30,
            child: (image.isNotEmpty)
                ? Image.asset(image)
                : Icon((icon == null) ? Icons.home : icon),
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.black38, fontSize: 12, fontFamily: 'Gill Sans'),
          )
        ],
      ),
    ));
  }
}
