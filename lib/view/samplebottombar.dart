import 'dart:developer';

 import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);
  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      Page1(controller: _controller),
      const Page2(),
      const Page3(),
      const Page4(),
      const Page5(),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: AnimatedNotchBottomBar(
          notchBottomBarController: _controller,
          color: Colors.transparent,
          showLabel: true,
          textOverflow: TextOverflow.visible,
          maxLine: 1,
          kBottomRadius: 0, // Removed the circular notch
          notchColor: Colors.black87,
          removeMargins: true,
          bottomBarWidth: 500,
          showShadow: false,
          durationInMilliSeconds: 0, // Removed animations
          itemLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          elevation: 0,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(
                Icons.home_filled,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.home_filled,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Page 1',
            ),
            BottomBarItem(
              inActiveItem: Icon(Icons.star, color: Colors.blueGrey),
              activeItem: Icon(
                Icons.star,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Page 2',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.settings,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.settings,
                color: Colors.pink,
              ),
              itemLabel: 'Page 3',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.person,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.person,
                color: Colors.yellow,
              ),
              itemLabel: 'Page 4',
            ),
          ],
          onTap: (index) {
            log('current selected index $index');
            _pageController.jumpToPage(index);
          },
          kIconSize: 24.0,
        ),
      )
          : null,
    );
  }
}
class Page1 extends StatelessWidget {
  const Page1({Key? key, required NotchBottomBarController controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow, child: const Center(child: Text('Page 1')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.lightGreenAccent, child: const Center(child: Text('Page 5')));
  }
}
