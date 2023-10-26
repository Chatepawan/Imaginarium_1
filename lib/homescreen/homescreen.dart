import 'dart:async';

import 'package:animator/animator.dart';
import 'package:imaginarium/homescreen/popular_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jumping_dot/jumping_dot.dart';

import '../custom_3d_objects_screen.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _leftAnimation;
  late Animation<Offset> _rightAnimation;
  late Animation<Offset> _bottomAnimation;
  bool _isLoading = false;

  height() {
    return MediaQuery.of(context).size.height;
  }

  width() {
    return MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      // Adjust the duration as needed
      vsync: this,
    );

    _leftAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _bottomAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _rightAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the widget is initialized
    _controller.forward();
    // _refreshData();
  }


  Duration _getRowAnimationDelay(int rowIndex) {
    const rowDelay = Duration(milliseconds: 200); // Adjust the delay as needed
    return Duration(milliseconds: rowIndex * rowDelay.inMilliseconds);
  }
  Future<void> _refreshData() async {
    setState(() {
      _isLoading = true;
    });

    setState(() {
      // Reset the animation controller
      _controller.reset();

      // Start the animation when the widget is refreshed
      _controller.forward();
    });


    // Simulate a data refresh with a delay
    await Future.delayed(Duration(seconds: 1));

    // Stop the refresh indicator
    // _controller.reset();

    // Set isLoading to false to display the refreshed data
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _refreshData,
            child: _isLoading
                ? Center(child: JumpingDots(
              color: Colors.deepPurple,
            ))
                : Container(
                    color: Color(0xffF5F3FF),
                    child: Padding(
                      padding: EdgeInsets.only(right: width() / 20.61, left: width() / 20.61, top: height() / 39.56 ),
                      child: SafeArea(
                          child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SlideFadeTransition(
                                          curve: Curves.elasticOut,
                                          delayStart: Duration(milliseconds: 200),
                                          animationDuration: Duration(milliseconds: 1500),
                                          offset: 2.5,
                                          direction: Direction.horizontal,
                                          child: Text(
                                            "Learning just a",
                                            style: TextStyle(
                                                fontFamily: 'Le Havre Rounded',
                                                fontSize: 30,
                                                color: Color(0xff270E7C)),
                                          ),
                                        ),
                                        SlideFadeTransition(
                                          curve: Curves.elasticOut,
                                          delayStart: Duration(milliseconds: 200),
                                          animationDuration: Duration(milliseconds: 1500),
                                          offset: 2.5,
                                          direction: Direction.horizontal,
                                          child: Text(
                                            "click away!",
                                            style: TextStyle(
                                                fontFamily: 'Le Havre Rounded',
                                                fontSize: 30,
                                                color: Color(0xff270E7C)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SlideFadeTransition(
                                      curve: Curves.elasticOut,
                                      delayStart: Duration(milliseconds: 200),
                                      animationDuration: Duration(milliseconds: 1500),
                                      offset: 2.5,
                                      direction: Direction.vertical,
                                      child: Image.asset(
                                        "assets/images/home/Ellipse 1.png",
                                        height: 60,
                                        width: 60,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height / 24,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Container(
                                    height: height() / 14.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(
                                              -1, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Solar system for kids",
                                        contentPadding: EdgeInsets.only(
                                            top: height() / 61.51,
                                            bottom: height() / 61.51,
                                            left: 26.72),
                                        hintStyle: TextStyle(
                                            fontFamily: 'Le Havre Rounded',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24,
                                            color:
                                                Color.fromRGBO(39, 14, 124, 0.40)),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(18),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            // Specify your desired border color here
                                            width: 2.0,
                                          ),
                                        ),
                                        focusColor: Colors.white,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(18),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            // Specify your desired border color here
                                            width: 2.0,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(18),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            // Specify your desired border color here
                                            width: 2.0,
                                          ),
                                        ),
                                        filled: true,
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              right: width() / 73.58),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(19),
                                              color: Color(0xff744EE5),
                                            ),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Animator<double>(
                                                duration:
                                                    Duration(milliseconds: 1000),
                                                cycles: 0,
                                                curve: Curves.easeInOut,
                                                tween: Tween<double>(
                                                    begin: 15, end: 25.0),
                                                builder: (context,animatorState,child)=> Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                  size: animatorState.value,

                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 32.93,
                                ),
                                // const Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       "Popular",
                                //       style: TextStyle(
                                //           fontFamily: 'Le Havre Rounded',
                                //           fontSize: 24,
                                //           color: Color(0xff270E7C)),
                                //     ),
                                //     Row(
                                //       children: [
                                //         Text(
                                //           "See all",
                                //           style: TextStyle(
                                //               fontFamily: 'Le Havre Rounded',
                                //               fontSize: 18,
                                //               color: Color(0xff270E7C)),
                                //         ),
                                //         SizedBox(
                                //           width: 5,
                                //         ),
                                //         Icon(
                                //           Icons.arrow_forward_ios,
                                //           color: Color(0xff270E7C),
                                //           size: 15,
                                //         )
                                //       ],
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 10,),
                                CarouselSlider.builder(
                                    itemCount: 3,
                                    // itemCount: 2,
                                    options: CarouselOptions(
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          // packageIndex = index;
                                        });
                                        // homeWidgetController
                                        //     .changeCurrentSlider(index);
                                      },
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      // height: 170,
                                      // initialPage: 0,
                                      // enableInfiniteScroll: true,
                                      height: 150,
                                      enlargeFactor: 1,
                                      padEnds: false,
                                      autoPlay: true,
                                      viewportFraction: 1,
                                      enlargeCenterPage: true,
                                      autoPlayInterval: const Duration(seconds: 4),
                                    ),
                                    itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) {
                                      return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Custom3dObjectsScreen()));
                                          }, child: PopularCard());
                                    }),

                                // PopularCard(),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Categories",
                                      style: TextStyle(
                                          fontFamily: 'Le Havre Rounded',
                                          fontSize: 24,
                                          color: Color(0xff270E7C)),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "See all",
                                          style: TextStyle(
                                              fontFamily: 'Le Havre Rounded',
                                              fontSize: 18,
                                              color: Color(0xff270E7C)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xff270E7C),
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                MasonryGridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 6,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 20,
                                  itemBuilder: (BuildContext context, int index) {
                                    // final rowDelay = _getRowAnimationDelay(index ~/ 2);
                                    return SlideFadeTransition(
                                      curve: Curves.elasticInOut,
                                      delayStart: Duration(milliseconds: 200),
                                      animationDuration: Duration(milliseconds: 1500),
                                      offset: 2.5,
                                      direction: Direction.vertical,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Color(0xffD9D9D9)),
                                        height: MediaQuery.of(context).size.height /
                                            4.8,
                                        // width: MediaQuery.of(context).size.width / 2.294,
                                      ),
                                    );
                                    //   AnimatedBuilder(
                                    //   animation: _controller,
                                    //   builder:
                                    //       (BuildContext context, Widget? child) {
                                    //     return SlideTransition(
                                    //       position: index  == 0
                                    //           ? _leftAnimation
                                    //           : index == 1 ? _rightAnimation : _bottomAnimation,
                                    //       child: child,
                                    //     );
                                    //   },
                                    //   child: Container(
                                    //     decoration: BoxDecoration(
                                    //         borderRadius: BorderRadius.circular(20),
                                    //         color: Color(0xffD9D9D9)),
                                    //     height: MediaQuery.of(context).size.height /
                                    //         4.8,
                                    //     // width: MediaQuery.of(context).size.width / 2.294,
                                    //   ),
                                    // );
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: displayWidth * .05,right: displayWidth * .05,top: 875),
          //   height: displayWidth * .155,
          //   decoration: BoxDecoration(
          //     color: Color(0xffF5F3FF),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black.withOpacity(.1),
          //         blurRadius: 30,
          //         offset: Offset(0, 10),
          //       ),
          //     ],
          //     borderRadius: BorderRadius.circular(18),
          //   ),
          //   child: ListView.builder(
          //     itemCount: 4,
          //     scrollDirection: Axis.horizontal,
          //     padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          //     itemBuilder: (context, index) => InkWell(
          //       onTap: () {
          //         setState(() {
          //           currentIndex = index;
          //           HapticFeedback.lightImpact();
          //         });
          //       },
          //       splashColor: Colors.transparent,
          //       highlightColor: Colors.transparent,
          //       child: Stack(
          //         children: [
          //           AnimatedContainer(
          //             duration: Duration(seconds: 1),
          //             curve: Curves.fastLinearToSlowEaseIn,
          //             width: index == currentIndex
          //                 ? displayWidth * .32
          //                 : displayWidth * .18,
          //             alignment: Alignment.center,
          //             child: AnimatedContainer(
          //               duration: Duration(seconds: 1),
          //               curve: Curves.fastLinearToSlowEaseIn,
          //               height: index == currentIndex ? displayWidth * .12 : 0,
          //               width: index == currentIndex ? displayWidth * .32 : 0,
          //               decoration: BoxDecoration(
          //                 color: index == currentIndex
          //                     ? Colors.blueAccent.withOpacity(.2)
          //                     : Colors.transparent,
          //                 borderRadius: BorderRadius.circular(18),
          //               ),
          //             ),
          //           ),
          //           AnimatedContainer(
          //             duration: Duration(seconds: 1),
          //             curve: Curves.fastLinearToSlowEaseIn,
          //             width: index == currentIndex
          //                 ? displayWidth * .31
          //                 : displayWidth * .18,
          //             alignment: Alignment.center,
          //             child: Stack(
          //               children: [
          //                 Row(
          //                   children: [
          //                     AnimatedContainer(
          //                       duration: Duration(seconds: 1),
          //                       curve: Curves.fastLinearToSlowEaseIn,
          //                       width:
          //                       index == currentIndex ? displayWidth * .13 : 0,
          //                     ),
          //                     AnimatedOpacity(
          //                       opacity: index == currentIndex ? 1 : 0,
          //                       duration: Duration(seconds: 1),
          //                       curve: Curves.fastLinearToSlowEaseIn,
          //                       child: Text(
          //                         index == currentIndex
          //                             ? '${listOfStrings[index]}'
          //                             : '',
          //                         style: TextStyle(
          //                           color: Color(0xff6748C1),
          //                           fontWeight: FontWeight.w600,
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: [
          //                     AnimatedContainer(
          //                       duration: Duration(seconds: 1),
          //                       curve: Curves.fastLinearToSlowEaseIn,
          //                       width:
          //                       index == currentIndex ? displayWidth * .03 : 20,
          //                     ),
          //                     Icon(
          //                       listOfIcons[index],
          //                       size: displayWidth * .076,
          //                       color: index == currentIndex
          //                           ? Color(0xff6748C1)
          //                           : Colors.black26,
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.only(left: displayWidth * .05,right: displayWidth * .05,bottom: displayWidth * .05),
      //   height: displayWidth * .155,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(.1),
      //         blurRadius: 30,
      //         offset: Offset(0, 10),
      //       ),
      //     ],
      //     borderRadius: BorderRadius.circular(50),
      //   ),
      //   child: ListView.builder(
      //     itemCount: 4,
      //     scrollDirection: Axis.horizontal,
      //     padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
      //     itemBuilder: (context, index) => InkWell(
      //       onTap: () {
      //         setState(() {
      //           currentIndex = index;
      //           HapticFeedback.lightImpact();
      //         });
      //       },
      //       splashColor: Colors.transparent,
      //       highlightColor: Colors.transparent,
      //       child: Stack(
      //         children: [
      //           AnimatedContainer(
      //             duration: Duration(seconds: 1),
      //             curve: Curves.fastLinearToSlowEaseIn,
      //             width: index == currentIndex
      //                 ? displayWidth * .32
      //                 : displayWidth * .18,
      //             alignment: Alignment.center,
      //             child: AnimatedContainer(
      //               duration: Duration(seconds: 1),
      //               curve: Curves.fastLinearToSlowEaseIn,
      //               height: index == currentIndex ? displayWidth * .12 : 0,
      //               width: index == currentIndex ? displayWidth * .32 : 0,
      //               decoration: BoxDecoration(
      //                 color: index == currentIndex
      //                     ? Colors.blueAccent.withOpacity(.2)
      //                     : Colors.transparent,
      //                 borderRadius: BorderRadius.circular(50),
      //               ),
      //             ),
      //           ),
      //           AnimatedContainer(
      //             duration: Duration(seconds: 1),
      //             curve: Curves.fastLinearToSlowEaseIn,
      //             width: index == currentIndex
      //                 ? displayWidth * .31
      //                 : displayWidth * .18,
      //             alignment: Alignment.center,
      //             child: Stack(
      //               children: [
      //                 Row(
      //                   children: [
      //                     AnimatedContainer(
      //                       duration: Duration(seconds: 1),
      //                       curve: Curves.fastLinearToSlowEaseIn,
      //                       width:
      //                       index == currentIndex ? displayWidth * .13 : 0,
      //                     ),
      //                     AnimatedOpacity(
      //                       opacity: index == currentIndex ? 1 : 0,
      //                       duration: Duration(seconds: 1),
      //                       curve: Curves.fastLinearToSlowEaseIn,
      //                       child: Text(
      //                         index == currentIndex
      //                             ? '${listOfStrings[index]}'
      //                             : '',
      //                         style: TextStyle(
      //                           color: Color(0xff6748C1),
      //                           fontWeight: FontWeight.w600,
      //                           fontSize: 15,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Row(
      //                   children: [
      //                     AnimatedContainer(
      //                       duration: Duration(seconds: 1),
      //                       curve: Curves.fastLinearToSlowEaseIn,
      //                       width:
      //                       index == currentIndex ? displayWidth * .03 : 20,
      //                     ),
      //                     Icon(
      //                       listOfIcons[index],
      //                       size: displayWidth * .076,
      //                       color: index == currentIndex
      //                           ? Color(0xff6748C1)
      //                           : Colors.black26,
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      backgroundColor: Color(0xffF5F3FF),
    );
  }
  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Favorite',
    'Settings',
    'Account',
  ];
}
enum Direction { vertical, horizontal }

class SlideFadeTransition extends StatefulWidget {
  final Widget child;

  final double offset;

  final Curve curve;

  final Direction direction;

  final Duration delayStart;

  final Duration animationDuration;

  SlideFadeTransition({
    required this.child,
    this.offset = 1.0,
    this.curve = Curves.easeIn,
    this.direction = Direction.vertical,
    this.delayStart = const Duration(seconds: 0),
    this.animationDuration = const Duration(milliseconds: 800),
  });

  @override
  _SlideFadeTransitionState createState() => _SlideFadeTransitionState();
}

class _SlideFadeTransitionState extends State<SlideFadeTransition>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animationSlide;

  late AnimationController _animationController;

  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    if (widget.direction == Direction.vertical) {
      _animationSlide =
          Tween<Offset>(begin: Offset(0, widget.offset), end: Offset(0, 0))
              .animate(CurvedAnimation(
            curve: widget.curve,
            parent: _animationController,
          ));
    } else {
      _animationSlide =
          Tween<Offset>(begin: Offset(widget.offset, 0), end: Offset(0, 0))
              .animate(CurvedAnimation(
            curve: widget.curve,
            parent: _animationController,
          ));
    }

    _animationFade =
        Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
          curve: widget.curve,
          parent: _animationController,
        ));

    Timer(widget.delayStart, () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animationFade,
        child: SlideTransition(
            position: _animationSlide,
            child: widget.child,
        ),
        );
    }



}
