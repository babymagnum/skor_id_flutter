import 'package:flutter/material.dart';
import 'package:skor_id_flutter/view/base_view.dart';

class EsportView extends StatefulWidget {
  @override
  _EsportViewState createState() => _EsportViewState();
}

class _EsportViewState extends State<EsportView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Center(child: Text('eSports view')),
    );
  }
}
