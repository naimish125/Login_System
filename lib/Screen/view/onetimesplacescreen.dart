import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/onesplace.dart';
import '../../utils/provider.dart';
import '../provider/Splace_provider.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  IntroProvider? introProviderTrue;
  IntroProvider? introProviderFalse;
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    introProviderTrue = Provider.of<IntroProvider>(context, listen: true);
    introProviderFalse = Provider.of<IntroProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (value) {
            introProviderTrue!.lastPage(value);
          },
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("${introProviderFalse!.imageList[0]}"),
                ],
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("${introProviderFalse!.imageList[1]}"),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: introProviderFalse!.isLastPage
            ? InkWell(
          onTap: () {
            Sp sp = Sp();
            sp.saveSp(true);
            Navigator.pushReplacementNamed(context, 'up');
          },
          child: Container(
            color: Colors.white,
            height: 72,
            alignment: Alignment.center,
            child: Text(
              "Get Started",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
            : Container(
          color: Colors.white,
          height: 80,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  pageController.jumpToPage(2);
                },
                child: Text(
                  "SKIP",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'up');
                },
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}