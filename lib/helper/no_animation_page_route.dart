import 'package:flutter/material.dart';

class NoAnimationPageRoute<T>extends MaterialPageRoute<T>{
  NoAnimationPageRoute({required WidgetBuilder builder,
  RouteSettings? settings,
    bool maintainState=true,
    bool fullscreenDialog=false,
  }):super(
    builder: builder,
    maintainState: maintainState,
    settings: settings,
    fullscreenDialog: fullscreenDialog
  );

  @override
  Duration get transitionDuration=>const Duration(microseconds: 0);

  @override
  Widget BuildTransitions(BuildContext context , Animation<double> animation,Animation<double> seccondaryAnimation,Widget child ){
    return child;
  }
}