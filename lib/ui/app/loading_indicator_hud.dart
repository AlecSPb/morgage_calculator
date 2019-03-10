import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingIndicatorHUD extends StatelessWidget{
  final bool isLoading;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset offset;
  final bool dismissible;
  final Widget child;

  LoadingIndicatorHUD({
    Key key,
    @required this.isLoading,
    @required this.child,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
  }):assert(child != null),
    assert(isLoading != null),
    super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if(isLoading){
      Widget layOutProgressIndicator;
      if(offset == null)
        layOutProgressIndicator = Center(child: progressIndicator);
      else{
        layOutProgressIndicator = Positioned(
            child: progressIndicator,
            left: offset.dx,
            top: offset.dy,
        );
      }
      final modal = [
        new Opacity(
          child: new ModalBarrier(dismissible: dismissible, color: color,),
          opacity: opacity,
        ),
        layOutProgressIndicator
      ];
      widgetList += modal;
    }
    return new Stack(
      children: widgetList,
    );
  }

}