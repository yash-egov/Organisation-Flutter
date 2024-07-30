import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';

class FunctionPreview extends StatefulWidget {
  int index;
  List<Functions>? functions;
  FunctionPreview(this.index, this.functions, {super.key});

  @override
  State<FunctionPreview> createState() => _FunctionPreviewState(index);
}

class _FunctionPreviewState extends State<FunctionPreview> {
  int index;

  _FunctionPreviewState(this.index);
  @override
  Widget build(BuildContext context) {
    final function = widget.functions?[widget.index];
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Function : ${index + 1}"),
            Row(
              children: [Text("Type : "), Text('${function?.type}')],
            ),
            Row(
              children: [Text("Category : "), Text('${function?.category}')],
            ),
            Row(
              children: [Text("className : "), Text('${function?.className}')],
            )
          ],
        ),
      ),
    );
  }
}
