import 'package:flutter/material.dart';
import '../services/size_service.dart';

abstract class AppTextStyles {
  static const String mainFont = 'CeraPro';

  static TextStyle h1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: scaleWidth(14),
    height: 1.2,
    color: Colors.white,
  );

  static TextStyle h2 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: scaleWidth(12),
    color: Colors.white,
  );

  static TextStyle h3 = TextStyle(
    fontWeight: FontWeight.w700,
    height: 1.2,
    fontSize: scaleWidth(10),
    color: Colors.white,
  );

  static TextStyle h4 = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: scaleWidth(8),
      height: 1.2,
      color: Colors.white);

  static TextStyle regularCopy = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: scaleWidth(6),
    height: 1.3,
    color: Colors.white,
  );

  static TextStyle regularCopyBold = regularCopy.copyWith(
    fontWeight: FontWeight.bold,
  );
}
