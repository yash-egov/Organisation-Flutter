import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:location_app/bloc/bloc/city_lat_lon_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/bloc/allOrganisations/all_organisations_bloc.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';
// import 'package:location_app/router/app_router.dart';
import 'package:organisations/router/app_router.dart';

void main() async {
  // await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrganisationBloc(),
        ),
        BlocProvider(
          create: (context) => AllOrganisationsBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        // theme: DigitTheme.instance.mobileTheme,
      ),
    );
  }
}
