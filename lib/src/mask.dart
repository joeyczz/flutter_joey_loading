import 'package:flutter/material.dart';

class MaskWidget extends StatelessWidget {
  MaskWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Material(
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}
