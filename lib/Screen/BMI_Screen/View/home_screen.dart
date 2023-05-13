import 'dart:async';
import 'package:animator_2/Screen/BMI_Screen/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottem_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  HomeProvider? ProviderTrue;
  HomeProvider? ProviderFalse;
  Animation? animation;
  Animation? animation2;
  AnimationController? animationController;
  AnimationController? animationController2;
  AnimationController? animationController3;

  @override
  void initState() {
    super.initState();
    animationController =
    AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..forward();
    animationController2 =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animationController3 =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation =
        Tween<double>(begin: -1.0, end: 0.0).animate(animationController!);
    animation2 =
        Tween<double>(begin: 1.0, end: 0.0).animate(animationController!);
  }

  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    ProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: AnimatedBuilder(
          animation: animationController!,
          builder: (context, child) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text(
                  "BMI CALCULATOR",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                backgroundColor: Colors.pinkAccent,
              ),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(
                                  animation!.value *
                                      MediaQuery.of(context).size.width,
                                  0.0,
                                  0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30, top: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    ProviderTrue!.ChangeBoolValue();
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height / 5,
                                    width: MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(12)),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 12),
                                          child: Icon(
                                            Icons.male,
                                            color: (ProviderTrue!.vis)
                                                ? Colors.pinkAccent
                                                : Colors.white,
                                            size: 90,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Text(
                                          "MALE",
                                          style: TextStyle(
                                              fontSize: 21, color: Colors.white70),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  animation2!.value *
                                      MediaQuery.of(context).size.width,
                                  0.0,
                                  0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 35, top: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    ProviderTrue!.ChangeBoolValue2();
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height / 5,
                                    width: MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(12)),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.female,
                                          color: (ProviderTrue!.vis2)
                                              ? Colors.pinkAccent
                                              : Colors.white,
                                          size: 90,
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Text(
                                          "FEMALE",
                                          style: TextStyle(
                                              fontSize: 21, color: Colors.white70),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        Transform(
                          transform: Matrix4.translationValues(
                              animation2!.value * MediaQuery.of(context).size.width,
                              0.0,
                              0.0),
                          child: Container(
                            height: 200,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                children: [
                                  const Text(
                                    "HEIGHT",
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.white70),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "${ProviderTrue!.height} ",
                                            style: const TextStyle(
                                                fontSize: 46,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        const TextSpan(
                                          text: "cm",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 30),
                                        ),
                                      ])),
                                  Slider(
                                    value: ProviderTrue!.height.toDouble(),
                                    onChanged: (double value) {
                                      ProviderFalse!.ChangeHeight(value.round());
                                    },
                                    min: 50,
                                    max: 300,
                                    divisions: 300,
                                    label: "${ProviderTrue!.height}",
                                    activeColor: Colors.pinkAccent,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        Row(
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(
                                  animation!.value *
                                      MediaQuery.of(context).size.width,
                                  0.0,
                                  0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30, top: 20),
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 4.5,
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12)),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 21),
                                          child: Text(
                                            "WEIGHT",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.white70),
                                          )),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "${ProviderTrue!.weight}",
                                        style: const TextStyle(
                                            fontSize: 51,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 18),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (ProviderTrue!.weight != 0) {
                                                  ProviderFalse!.MinWeight();
                                                } else {
                                                  animationController3!.forward();
                                                  Timer(const Duration(seconds: 1),
                                                          () {
                                                        if (animationController3!
                                                            .isAnimating) {
                                                          animationController3!.reset();
                                                        }
                                                      });
                                                }
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white54),
                                                alignment: Alignment.topCenter,
                                                child: const Text(
                                                  "-",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 41),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                ProviderFalse!.AddWeight();
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white54),
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  "+",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 35),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  animation2!.value *
                                      MediaQuery.of(context).size.width,
                                  0.0,
                                  0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 35, top: 20),
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 4.5,
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12)),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 3),
                                          child: Text(
                                            "AGE",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.white70),
                                          )),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "${ProviderTrue!.age}",
                                        style: const TextStyle(
                                            fontSize: 51,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 18),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (ProviderTrue!.age != 0) {
                                                  ProviderFalse!.MinAge();
                                                } else {
                                                  animationController3!.forward();
                                                  Timer(const Duration(seconds: 1),
                                                          () {
                                                        if (animationController3!
                                                            .isAnimating) {
                                                          animationController3!.reset();
                                                        }
                                                      });
                                                }
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white54),
                                                alignment: Alignment.topCenter,
                                                child: const Text(
                                                  "-",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 41),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                ProviderTrue!.AddAge();
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white54),
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  "+",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 35),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        Transform(
                          transform: Matrix4.translationValues(
                              animation2!.value * MediaQuery.of(context).size.width,
                              0.0,
                              0.0),
                          child: GestureDetector(
                            onTap: () {
                              if (ProviderTrue!.weight != 0 &&
                                  ProviderTrue!.age != 0 &&
                                  (ProviderTrue!.vis || ProviderTrue!.vis2)) {
                                ProviderFalse!.Result();
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      bottomsheet(context, ProviderTrue!.result),
                                );
                              } else {
                                animationController2!.forward();
                                Timer(const Duration(seconds: 1), () {
                                  if (animationController2!.isAnimating) {
                                    animationController2!.reset();
                                  }
                                });
                              }
                            },
                            child: Container(
                              height: 72,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(30)),
                              alignment: Alignment.center,
                              child: const Text(
                                "CALCULATE",
                                style: TextStyle(fontSize: 24, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: AnimatedBuilder(
                          animation: animationController2!.view,
                          child: Container(
                            height: 45,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(6)),
                            alignment: Alignment.center,
                            child: const Text(
                              "Please Select All Inputs",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          builder: (context, child) => AnimatedOpacity(
                            duration: const Duration(milliseconds: 10),
                            opacity: animationController2!.value,
                            child: child,
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: AnimatedBuilder(
                          animation: animationController3!,
                          child: Container(
                            height: 45,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(6)),
                            alignment: Alignment.center,
                            child: const Text(
                              "Wrong Argument",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          builder: (context, child) => AnimatedOpacity(
                            duration: const Duration(milliseconds: 10),
                            opacity: animationController3!.value,
                            child: child,
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
        ));
  }
}