import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cgv_clone/widgets/image_slider_widget.dart';
import 'package:cgv_clone/widgets/movie_chart_widget.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = [
      "홈",
      "이벤트",
      "무비톡",
      "패스트오더",
      "기프트샵",
      "@GVC",
    ];
    List<String> bannerUrlItems = [
      "assets/banner_01.jpg",
      "assets/banner_02.jpg",
      "assets/banner_03.jpg",
      "assets/banner_04.jpg",
    ];
    return DefaultTabController(
      length: menuItems.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "GCV",
            style: TextStyle(
              fontSize: 26.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {},
                color: Colors.red,
                icon: Icon(Icons.airplane_ticket_outlined)),
            IconButton(
                onPressed: () {},
                color: Colors.red,
                icon: Icon(Icons.movie_outlined)),
            IconButton(
                onPressed: () {}, color: Colors.red, icon: Icon(Icons.menu)),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Container(
              color: Colors.red,
              child: TabBar(
                tabs: List.generate(
                    menuItems.length,
                    (index) => Tab(
                          text: menuItems[index],
                        )),
                unselectedLabelColor: Colors.white,
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                ImageSliderWidget(bannerUrlItems: bannerUrlItems),
                MovieChartWidget(),
                Divider(
                  thickness: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildLabelIcon(Icons.phone_android, "MyCGV"),
                      buildLabelIcon(Icons.photo, "포토플레이"),
                      buildLabelIcon(Icons.account_balance_wallet, "할인정보"),
                      buildLabelIcon(Icons.music_note, "CGV스토어"),
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: Text("홈화면"),
            ),
            Center(
              child: Text("홈화면"),
            ),
            Center(
              child: Text("홈화면"),
            ),
            Center(
              child: Text("홈화면"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabelIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black12,
          ),
          child: Icon(icon),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12.0),
        )
      ],
    );
  }
}
