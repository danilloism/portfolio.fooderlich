import 'package:flutter/material.dart';

class Gap {
  static const w8 = SizedBox(width: 8);
  static const w16 = SizedBox(width: 16);
  static const w24 = SizedBox(width: 24);
  static const w32 = SizedBox(width: 32);
  static const w40 = SizedBox(width: 40);
  static const w48 = SizedBox(width: 48);
  static const w56 = SizedBox(width: 56);
  static const w64 = SizedBox(width: 64);

  static const h8 = SizedBox(height: 8);
  static const h16 = SizedBox(height: 16);
  static const h24 = SizedBox(height: 24);
  static const h32 = SizedBox(height: 32);
  static const h40 = SizedBox(height: 40);
  static const h48 = SizedBox(height: 48);
  static const h56 = SizedBox(height: 56);
  static const h64 = SizedBox(height: 64);
}

class PaddingEdgeInsets {
  static const all8 = EdgeInsets.all(8);
  static const all16 = EdgeInsets.all(16);
  static const all24 = EdgeInsets.all(24);
  static const all32 = EdgeInsets.all(32);
  static const all40 = EdgeInsets.all(40);
  static const all48 = EdgeInsets.all(48);
  static const all56 = EdgeInsets.all(56);
  static const all64 = EdgeInsets.all(64);
}

extension StringUtils on String {
  String get capitalized =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}
