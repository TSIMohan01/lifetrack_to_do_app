import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lifetrack_to_do_app/component/roundbutton.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final CarouselController _controller = CarouselController();
  int currentTab = 0;

  List tabItems = [
    {
      "tab": 0,
      "image": "assets/onboarding1.png",
      "text": "Save time and be productive\nby creating daily tasks.",
      "color": Color(0xFFff4f5a),
    },
    {
      "tab": 1,
      "image": "assets/onboardin2.png",
      "text": "Get that satisfying feeling\nwhen marking them done.",
      "color": Color(0xFFff4f5a),
    },
    {
      "tab": 2,
      "image": "assets/onboarding3.png",
      "text": "Reach your goals faster\nwith Lifetrack.",
      "color": Color(0xFFf44e59),
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            pauseAutoPlayInFiniteScroll: true,
            reverse: false,
            autoPlay: false,
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            // autoPlay: false,
          ),
          items: tabItems
              .map(
                (item) => Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // color: Colors.white,
                        padding: EdgeInsets.all(15),
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            LinearPercentIndicator(
                              width: (width / 3) - 10,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              lineHeight: 6,
                              progressColor: Color(0xFFff4f5a),
                              barRadius: Radius.elliptical(10, 10),
                              percent: currentTab >= 0 ? 1 : 0,

                              // condition ? true block : false block
                              // contion ?? bllock
                              animation: currentTab <= 0,
                              animationDuration: 1400,
                            ),
                            LinearPercentIndicator(
                              width: (width / 3) - 10,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              lineHeight: 6,
                              progressColor: Color(0xFFff4f5a),
                              barRadius: Radius.elliptical(10, 10),
                              percent: currentTab >= 1 ? 1 : 0,
                              animation: currentTab <= 1,
                              animationDuration: 1400,
                            ),
                            LinearPercentIndicator(
                              width: (width / 3) - 10,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              lineHeight: 6,
                              progressColor: Color(0xFFff4f5a),
                              barRadius: Radius.elliptical(10, 10),
                              percent: currentTab >= 2 ? 1 : 0,
                              animation: currentTab <= 2,
                              animationDuration: 1400,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Color(0xFFff4f5a),
                        child: Column(
                          children: [
                            Container(
                              child: Image(
                                image: AssetImage(item['image']),
                                width: width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                              ),
                              width: width,
                              decoration: BoxDecoration(
                                color: item["color"],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 60),
                                    child: Text(
                                      item['text'],
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                  RoundButton(
                                    bgColor: Colors.white,
                                    textColor: Color(0xFFff4f5a),
                                    text: "Continue",
                                    action: () {
                                      setState(() {
                                        currentTab = currentTab == 2
                                            ? currentTab
                                            : currentTab + 1;
                                      });
                                      print(currentTab);
                                      _controller.animateToPage(currentTab);

                                      // Navigator.of(context).push(_createRouteSignUp());

                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => const SignUpPage(),
                                      //   ),
                                      // );
                                    },
                                    fsize: 14,
                                    radius: 50,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  RoundButton(
                                    bgColor: item["color"],
                                    textColor: Colors.white,
                                    text: "Skip",
                                    action: () {
                                      setState(() {
                                        currentTab = 0;
                                      });
                                      _controller.animateToPage(0);

                                      // Navigator.of(context).push(_createRouteSignUp());

                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => const SignUpPage(),
                                      //   ),
                                      // );
                                    },
                                    fsize: 10,
                                    radius: 50,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
