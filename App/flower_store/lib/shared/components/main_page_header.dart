import 'package:flower_store/constants/colors.dart';
import 'package:flutter/material.dart';

Row mainPageHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: IconButton(
              onPressed: () {}, 
              icon: const Icon(
                Icons.bar_chart_rounded,
                color: iconColor,
                size: 30,
              )
            ),
          ),
          const Text(
            "4 MAN FLOWER",
            style: TextStyle(color: headerBrandNameColor, fontSize: 18),
          ),
        ],
      ),
      Row(
        children: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.notifications,
              color: iconColor,
              size: 30,
            )
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.person,
              color: iconColor,
              size: 30,
            )
          ),
        ],
      ),
    ],
  );
}