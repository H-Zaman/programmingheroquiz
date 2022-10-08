import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color color;
  final double? value;
  const Loader({Key? key, this.color = Colors.white, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        value: value,
      ),
    );
  }
}
