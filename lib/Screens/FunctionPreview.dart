import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Models/Functions.dart';
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
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 10,
        // color: const Color.fromARGB(255, 230, 224, 224),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Function : ${index + 1}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [Text("Type : "), Text('${function?.type}')],
              ),
              Row(
                children: [Text("Category : "), Text('${function?.category}')],
              ),
              Row(
                children: [
                  Text("className : "),
                  Text('${function?.className}')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
