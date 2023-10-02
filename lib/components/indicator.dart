import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

indicator({double radius = 15}) {
  return Center(
      child: CupertinoActivityIndicator(color: Colors.black, radius: radius));
}
