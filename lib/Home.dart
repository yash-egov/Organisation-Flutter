import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:organisations/Constants/text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:organisations/RegisterationFormScreen.dart';
import 'package:organisations/router/app_router.gr.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double buttonMarginLR = MediaQuery.sizeOf(context).width / 8;
    double buttonMarginBottom = MediaQuery.sizeOf(context).height / 10;

    return Scaffold(
      appBar: AppBar(
        leading: null,
        toolbarHeight: MyFontStyle.appbarHeight,
        backgroundColor: DigitTheme.instance.colorScheme.secondary,
        title: Center(
          child: Text(
            "Organisation",
            style: TextStyle(fontSize: MyFontStyle.fontsize),
            // style: DigitTheme.instance.mobileTypography.headingL,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.fromLTRB(
                  buttonMarginLR, 0, buttonMarginLR, buttonMarginBottom),
              child: DigitButton(
                label: 'View All Organisations',
                onPressed: () {
                  AutoRouter.of(context).push(AllOrganisations());
                },
                type: ButtonType.primary,
              ),
            ),
            Container(
              height: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.fromLTRB(
                  buttonMarginLR, 0, buttonMarginLR, buttonMarginBottom),
              child: DigitButton(
                label: 'Register Organisation',
                onPressed: () {
                  AutoRouter.of(context).push(OrganisationForm());
                },
                type: ButtonType.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
