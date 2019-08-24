import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../../scoped_models/scoped_counters.dart';

class Widget3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant(
    
        builder: (context, child, ScopedCounter model) =>
            Text('Widget3 counter is ${model.counter3.count}'));
  }
}