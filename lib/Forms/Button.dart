// import 'package:digit_flutter_components/enum/app_enums.dart';
// import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';

// class Button extends StatefulWidget {
//   Function func;
//   Object obj;
//   Button(this.func, this.obj, {super.key});

//   @override
//   State<Button> createState() => _ButtonState(func, obj);
// }

// class _ButtonState extends State<Button> {
//   Function func;
//   Object obj;
//   _ButtonState(this.func, this.obj);
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<OrganisationBloc, OrganisationState>(
//       builder: (context, state) {
//         return DigitButton(
//           onPressed: () {
//             if (func(obj)) {
//               // org.contactDetails?.add(contact);
//               context
//                   .read<OrganisationBloc>()
//                   .add(addOrganisationContactDetailEvent(obj));
//             } else {}
//           },
//           label: 'Add Contact',
//           type: ButtonType.secondary,
//         );
//       },
//     );
//   }
// }
