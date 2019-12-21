library joey_loading;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:joey_loading/src/mask.dart';

const Color _defaultBackgroundColor = const Color(0xAA000000);

final _defautLoading = Center(
  child: SpinKitCircle(
    color: Colors.white,
  ),
);

class Loading {
  /// Loading show
  ///
  /// static method will help you show loading
  ///
  /// ```dart
  /// Loading.show(context);
  /// ```
  ///
  /// show loading with duration time & loading view widget
  /// ```dart
  /// Loading.show(
  ///   context,
  ///   duration: const Duration(seconds: 2),
  ///   child: SpinKitCircle(
  ///     color: Colors.red,
  ///     size: 100,
  ///   ),
  /// );
  /// ```
  /// loading view will dismiss after duration
  /// if duration is null it would not dismiss untill call Loading.dismiss();
  static void show(
    BuildContext context, {
    Duration duration,
    Widget child,
  }) {
    _Loading.dismiss();
    _Loading.createView(context, child: child);
    if (duration != null) {
      Future.delayed(duration, () {
        _Loading.dismiss();
      });
    }
  }

  /// Loading dismiss
  ///
  /// static method will help you close loading
  ///
  /// ```dart
  /// Loading.dismiss();
  /// ```
  ///
  /// the last loading view will dismiss after call Loading.dismiss()
  static void dismiss() {
    _Loading.dismiss();
  }
}

class _Loading {
  static final _Loading _singleton = _Loading._();

  factory _Loading() => _singleton;

  _Loading._();

  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static dismiss() async {
    if (!_isVisible) return;

    _isVisible = false;
    _overlayEntry?.remove();
  }

  // 创建视图
  static void createView(
    BuildContext context, {
    Widget child,
    Color backgroundColor,
  }) {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = backgroundColor ?? _defaultBackgroundColor;

    // loading 视图
    Widget _child = child ?? _defautLoading;

    _overlayEntry = OverlayEntry(
      builder: (BuildContext _) => MaskWidget(
        child: Container(
          color: Colors.black45,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: _child,
          ),
        ),
      ),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);
  }
}
