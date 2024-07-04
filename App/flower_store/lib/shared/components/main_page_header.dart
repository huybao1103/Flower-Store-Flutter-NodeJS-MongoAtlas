import 'package:flower_store/assets/custom_icon.dart';
import 'package:flower_store/constants/colors.dart';
import 'package:flutter/material.dart';

Row mainPageHeader(GlobalKey<ScaffoldState> scaffoldKey) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: IconButton(
              onPressed: () { scaffoldKey.currentState?.openDrawer(); }, 
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
              CustomIcon.custom_notification,
              color: iconColor,
              size: 24,
            )
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              CustomIcon.custom_user,
              color: iconColor,
              size: 24,
            )
          ),
        ],
      ),
    ],
  );
}