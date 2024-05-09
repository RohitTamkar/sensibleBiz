// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:loading_animation_widget/loading_animation_widget.dart';

const Color _kAppColor = Color.fromARGB(255, 242, 242, 223);
const double _kSize = 100;
// void main() {
//   runApp(const MyApp());
// }

class LoadingCustomWidget extends StatefulWidget {
  const LoadingCustomWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _LoadingCustomWidgetState createState() => _LoadingCustomWidgetState();
}

class _LoadingCustomWidgetState extends State<LoadingCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: _kAppColor,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Colors.brown,
          contentTextStyle: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  void _onTapNext() {
    if (_currentPage + 1 < listOfAnimations.length) {
      _pageController.jumpToPage(_currentPage + 1);
      setState(() {
        _currentPage++;
      });
    } else {
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 800),
        curve: Curves.ease,
      );
      setState(() {
        _currentPage = 0;
      });
    }
  }

  void _onTapPrevious() {
    if (_currentPage == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'There is nothing left 🌚',
          ),
        ),
      );
    } else {
      _pageController.jumpToPage(_currentPage - 1);
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: listOfAnimations
          .map(
            (appBody) => Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SafeArea(
                    bottom: false,
                    child: Text(
                      appBody.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: appBody.widget,
                    ),
                  ),
                ],
              ),
              // bottomNavigationBar: SafeArea(
              //   top: false,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         IconButton(
              //           icon: const Icon(
              //             Icons.chevron_left_rounded,
              //           ),
              //           onPressed: _onTapPrevious,
              //         ),
              //         IconButton(
              //           icon: const Icon(
              //             Icons.chevron_right_rounded,
              //           ),
              //           onPressed: _onTapNext,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ),
// 1 of 1
          )
          .toList(),
    );
  }
}

class AppBody {
  final String title;
  final Widget widget;
  AppBody(
    this.title,
    this.widget,
  );
}

final listOfAnimations = <AppBody>[
  AppBody(
    // 'discreteCircle',
    'Please Wait',
    // FFAppState().startLoop as String,
    LoadingAnimationWidget.discreteCircle(
      color: Colors.white,
      size: _kSize,
      secondRingColor: Colors.red,
      thirdRingColor: Colors.yellow,
      // fourthRingColor: Colors.green,
      // fifthRingColor: Colors.blue
    ),
  )
];
