import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  // color는 옵셔널 named parameter.
  final Color color;

  const Category({
    required this.id,
    required this.title,
    this.color:
        Colors.orange, // default 값은 orange. const가 아니라 final이라 default 값 설정가능.
  });
}
