// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future calculateJumpIncrement(
    double playerYAlignment, bool jumpIsAscending) async {
  // Create onTap action to decrement playerYAlignment from 0.5 to 0.1, with a fast-to-slow pace.
  double jumpIncrement = 0.4;
  double jumpPeakHeight = 0.5;
  while (jumpIncrement > 0.1) {
    await Future.delayed(Duration(milliseconds: 50));
    jumpIncrement -= 0.1;
    if (playerYAlignment <= jumpPeakHeight) {
      jumpIsAscending = false;
      return jumpIsAscending;
    }
  }
}
