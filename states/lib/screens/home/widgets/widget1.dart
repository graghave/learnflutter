import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../../scoped_models/scoped_counters.dart';

class Widget1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant(
    
        builder: (context, child,ScopedCounter model) =>
            Text('Widget1 counter is ${model.counter1.count}'));
  }
}