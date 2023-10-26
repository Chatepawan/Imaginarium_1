import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/home/supercar-bugatti-4.jpg",
            fit: BoxFit.cover,
          ),
        ));
  }
}
