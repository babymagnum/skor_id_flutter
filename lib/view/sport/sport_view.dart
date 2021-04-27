import 'package:flutter/material.dart';
import 'package:skor_id_flutter/view/base_view.dart';

class SportView extends StatefulWidget {
  @override
  _SportViewState createState() => _SportViewState();
}

class _SportViewState extends State<SportView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Center(child: Text('Sport View')),
    );
  }
}
