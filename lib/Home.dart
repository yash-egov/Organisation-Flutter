import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:organisations/RegisterationFormScreen.dart';
import 'package:organisations/bloc/allOrganisations/all_organisations_bloc.dart';
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
    double width = MediaQuery.sizeOf(context).width;
    double crossAxisSpacing = 16.0;
    double mainAxisSpacing = 16.0;
    int crossAxisCount =
        (width ~/ 300); // Number of columns based on screen width

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
      body: Padding(
        padding: const EdgeInsets.all(100.0), // Adjusted padding
        child: GridView.builder(
          itemCount: 2, // Number of grid items
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            childAspectRatio: 1, // Ensures the items are square
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10, // Adds shadow to the card
              // color: Color.fromARGB(255, 240, 174, 74),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: InkWell(
                onTap: () {
                  if (index == 0) {
                    context
                        .read<AllOrganisationsBloc>()
                        .add(getAllOrganisationsEvent());
                    AutoRouter.of(context).push(AllOrganisations());
                  } else if (index == 1) {
                    AutoRouter.of(context).push(OrganisationForm());
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: index == 0
                          ? Icon(
                              Icons.view_headline_outlined,
                              size: 50,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.create,
                              size: 50,
                              color: Colors.green,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                          16.0), // Padding around the button
                      child: DigitButton(
                        label: index == 0
                            ? 'View All Organisations'
                            : 'Register Organisation',
                        onPressed: () {
                          if (index == 0) {
                            context
                                .read<AllOrganisationsBloc>()
                                .add(getAllOrganisationsEvent());
                            AutoRouter.of(context).push(AllOrganisations());
                          } else if (index == 1) {
                            AutoRouter.of(context).push(OrganisationForm());
                          }
                        },
                        type: ButtonType
                            .tertiary, // Adjusted button type for consistency
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
