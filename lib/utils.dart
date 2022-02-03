import 'package:flutter/material.dart';

class Gap {
  static const gapW8 = SizedBox(width: 8);
  static const gapW16 = SizedBox(width: 16);
  static const gapW24 = SizedBox(width: 24);
  static const gapW32 = SizedBox(width: 32);
  static const gapW40 = SizedBox(width: 40);
  static const gapW48 = SizedBox(width: 48);
  static const gapW56 = SizedBox(width: 56);
  static const gapW64 = SizedBox(width: 64);

  static const gapH8 = SizedBox(height: 8);
  static const gapH16 = SizedBox(height: 16);
  static const gapH24 = SizedBox(height: 24);
  static const gapH32 = SizedBox(height: 32);
  static const gapH40 = SizedBox(height: 40);
  static const gapH48 = SizedBox(height: 48);
  static const gapH56 = SizedBox(height: 56);
  static const gapH64 = SizedBox(height: 64);
}

extension StringUtils on String {
  String get capitalized =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
