import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:organisations/RegisterationFormScreen.dart';
import 'package:organisations/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: Home.page, initial: true),
        AutoRoute(page: OrganisationForm.page),
        AutoRoute(page: AddressForm.page),
        AutoRoute(page: ContactForm.page),
        AutoRoute(page: IdentifierForm.page),
        AutoRoute(page: DocumentsForm.page),
        AutoRoute(page: FunctionsForm.page),
        AutoRoute(page: AllOrganisations.page),
        AutoRoute(page: PreviewOrganisation.page),
        AutoRoute(page: SingleOrganisation.page),
      ];
}
