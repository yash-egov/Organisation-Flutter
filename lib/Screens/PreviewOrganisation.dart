import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';

import 'package:auto_route/auto_route.dart';
import 'package:organisations/bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';

@RoutePage()
class PreviewOrganisation extends StatefulWidget {
  const PreviewOrganisation({super.key});

  @override
  State<PreviewOrganisation> createState() => _PreviewOrganisationState();
}

class _PreviewOrganisationState extends State<PreviewOrganisation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MyFontStyle.appbarHeight,
        backgroundColor: DigitTheme.instance.colorScheme.secondary,
        title: Text(
          "Preview Page",
          style: DigitTheme.instance.mobileTypography.headingL,
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BlocBuilder<OrganisationBloc, OrganisationState>(
          builder: (context, state) {
            return DigitButton(
              // width: 90,
              // suffixIcon: Icons.next_plan,
              label: 'SUbmit',
              onPressed: () {
                context.read<OrganisationBloc>().add(SubmitOrganisationEvent());
                AutoRouter.of(context).push(Home());
              },
              type: ButtonType.primary,
            );
          },
        ),
      ),
    );
  }
}
