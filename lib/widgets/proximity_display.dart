import 'package:flutter/material.dart';

class ProximityDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FractionallySizedBox(
        widthFactor: 1.0,
        heightFactor: 0.8,
        child: Placeholder(),
      ),
    );
  }
}