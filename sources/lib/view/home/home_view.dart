import 'package:flutter/material.dart';
import 'package:pln_flutter/view/base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Container(
        child: Center(
          child: Text('HOME VIEW'),
        ),
      ),
    );
  }
}
