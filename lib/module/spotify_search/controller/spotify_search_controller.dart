import 'package:flutter/material.dart';
import 'package:spotify_ui_clone/state_util.dart';
import '../view/spotify_search_view.dart';

class SpotifySearchController extends State<SpotifySearchView>
    implements MvcController {
  static late SpotifySearchController instance;
  late SpotifySearchView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  TextEditingController searchController = TextEditingController();
}
