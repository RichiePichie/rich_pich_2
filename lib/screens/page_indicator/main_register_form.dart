import 'package:flutter/material.dart';
import 'package:rich_pich_2/screens/page_indicator/register1.dart';
import 'package:rich_pich_2/screens/page_indicator/register2.dart';
import 'package:rich_pich_2/screens/page_indicator/register3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatefulWidget {
  const PageIndicator({Key? key}) : super(key: key);

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  late List<Widget> _pages;
  final _controller = PageController();
  final GlobalKey<RegisterState> _registerKey = GlobalKey<RegisterState>();

  @override
  void initState() {
    super.initState();
    _pages = [
      Register(key: _registerKey),
      Regiser2(),
      Regiser3(),
    ];
  }

  void _goToNextPage() {
    if (_controller.page! < _pages.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.bounceIn,
      );
    } else {
      _registerUser();
    }
  }

  void _registerUser() {
    final registerState = _registerKey.currentState;
    if (registerState != null) {
      registerState.register();
    }
  }

  void _goback() {
    _controller.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.bounceOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: _pages,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: _pages.length,
                onDotClicked: (index) {},
                effect: ScaleEffect(),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _goback,
                  child: Text('Back'),
                ),
                SizedBox(
                  width: 300,
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: _goToNextPage,
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}