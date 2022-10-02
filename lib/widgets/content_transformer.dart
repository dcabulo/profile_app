import 'package:flutter/material.dart';
import 'package:another_transformer_page_view/another_transformer_page_view.dart';

class ContentTransformer extends PageTransformer {
  final double _scale;
  final double _fade;
  ContentTransformer({double afade = 0.03, double aScale = 0.08})
      : _fade = afade,
        _scale = aScale;

  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position!;
    double scaleFac = (1 - position.abs()) * (1 - _scale);
    double fadeFac = (1 - position.abs()) * (1 - _fade);
    double opacity = _fade + fadeFac;
    double scale = _scale + scaleFac;

    return Opacity(
      opacity: opacity,
      child: Transform.scale(
        scale: scale,
        child: child,
      ),
    );
  }
}
