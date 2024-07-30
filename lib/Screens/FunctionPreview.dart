import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/bloc/organisation_bloc.dart';

class FunctionPreview extends StatefulWidget {
  int index;
  FunctionPreview(this.index, {super.key});

  @override
  State<FunctionPreview> createState() => _FunctionPreviewState(index);
}

class _FunctionPreviewState extends State<FunctionPreview> {
  int index;
  _FunctionPreviewState(this.index);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganisationBloc, OrganisationState>(
      builder: (context, state) {
        return Column(
          children: [
            Text("Function : ${index + 1}"),
            Row(
              children: [
                Text("Type : "),
                Text('${state.org.functions?[index]?.type}')
              ],
            ),
            Row(
              children: [
                Text("Category : "),
                Text('${state.org.functions?[index].category}')
              ],
            ),
            Row(
              children: [
                Text("className : "),
                Text('${state.org.functions?[index].className}')
              ],
            )
          ],
        );
      },
    );
    ;
  }
}
