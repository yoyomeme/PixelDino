import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/auth/firebase_auth/auth_util.dart';

double incrementJumpGravity() {
  // create a gradient decrease for my jump that return a dynamic double value from 0.5 to 0.1
  double gravity = 0.5;
  double decrement = 0.1;
  return math.max(gravity - decrement, 0.1);
}
