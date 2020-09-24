import 'package:flutter/material.dart';

class Investors {
  final int likes;
  final int dislikes;
  final String description;
  final String investorName;
  final String imageUrl;


  const Investors({
    @required this.likes,
    @required this.dislikes,
    @required this.description,
    @required this.investorName,
    @required this.imageUrl,
  });
}
