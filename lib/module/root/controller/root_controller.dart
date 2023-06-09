import 'package:flutter/material.dart';
import 'package:spotify_ui_clone/state_util.dart';
import '../view/root_view.dart';

class RootController extends State<RootView> implements MvcController {
  static late RootController instance;
  late RootView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int currentIndex = 0;
  void setCurrentIndex(value) {
    setState(() {});
    currentIndex = value;
  }
}
