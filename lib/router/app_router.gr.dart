// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:organisations/Forms/AddressForm.dart' as _i5;
import 'package:organisations/Forms/ContactForm.dart' as _i4;
import 'package:organisations/Forms/DocumentsForm.dart' as _i9;
import 'package:organisations/Forms/FunctionDocumentsForm.dart' as _i7;
import 'package:organisations/Forms/FunctionForm.dart' as _i8;
import 'package:organisations/Forms/IdentifierForm.dart' as _i3;
import 'package:organisations/Forms/OrganisationForm.dart' as _i6;
import 'package:organisations/Home.dart' as _i2;
import 'package:organisations/Models/Organisation.dart' as _i11;
import 'package:organisations/RegisterationFormScreen.dart' as _i1;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    RegistrationFormRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.RegistrationFormScreen(),
      );
    },
    Home.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Home(),
      );
    },
    IdentifierForm.name: (routeData) {
      final args = routeData.argsAs<IdentifierFormArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.IdentifierForm(org: args.org),
      );
    },
    ContactForm.name: (routeData) {
      final args = routeData.argsAs<ContactFormArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ContactForm(args.org),
      );
    },
    AddressForm.name: (routeData) {
      final args = routeData.argsAs<AddressFormArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.AddressForm(org: args.org),
      );
    },
    OrganisationForm.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.OrganisationForm(),
      );
    },
    FunctionDocumentsForm.name: (routeData) {
      final args = routeData.argsAs<FunctionDocumentsFormArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.FunctionDocumentsForm(
          functionIndex: args.functionIndex,
          function: args.function,
        ),
      );
    },
    FunctionsForm.name: (routeData) {
      final args = routeData.argsAs<FunctionsFormArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.FunctionsForm(org: args.org),
      );
    },
    DocumentsForm.name: (routeData) {
      final args = routeData.argsAs<DocumentsFormArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DocumentsForm(org: args.org),
      );
    },
  };
}

/// generated route for
/// [_i1.RegistrationFormScreen]
class RegistrationFormRoute extends _i10.PageRouteInfo<void> {
  const RegistrationFormRoute({List<_i10.PageRouteInfo>? children})
      : super(
          RegistrationFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationFormRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Home]
class Home extends _i10.PageRouteInfo<void> {
  const Home({List<_i10.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.IdentifierForm]
class IdentifierForm extends _i10.PageRouteInfo<IdentifierFormArgs> {
  IdentifierForm({
    required _i11.Organisation org,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          IdentifierForm.name,
          args: IdentifierFormArgs(org: org),
          initialChildren: children,
        );

  static const String name = 'IdentifierForm';

  static const _i10.PageInfo<IdentifierFormArgs> page =
      _i10.PageInfo<IdentifierFormArgs>(name);
}

class IdentifierFormArgs {
  const IdentifierFormArgs({required this.org});

  final _i11.Organisation org;

  @override
  String toString() {
    return 'IdentifierFormArgs{org: $org}';
  }
}

/// generated route for
/// [_i4.ContactForm]
class ContactForm extends _i10.PageRouteInfo<ContactFormArgs> {
  ContactForm({
    required _i11.Organisation org,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ContactForm.name,
          args: ContactFormArgs(org: org),
          initialChildren: children,
        );

  static const String name = 'ContactForm';

  static const _i10.PageInfo<ContactFormArgs> page =
      _i10.PageInfo<ContactFormArgs>(name);
}

class ContactFormArgs {
  const ContactFormArgs({required this.org});

  final _i11.Organisation org;

  @override
  String toString() {
    return 'ContactFormArgs{org: $org}';
  }
}

/// generated route for
/// [_i5.AddressForm]
class AddressForm extends _i10.PageRouteInfo<AddressFormArgs> {
  AddressForm({
    required _i11.Organisation org,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          AddressForm.name,
          args: AddressFormArgs(org: org),
          initialChildren: children,
        );

  static const String name = 'AddressForm';

  static const _i10.PageInfo<AddressFormArgs> page =
      _i10.PageInfo<AddressFormArgs>(name);
}

class AddressFormArgs {
  const AddressFormArgs({required this.org});

  final _i11.Organisation org;

  @override
  String toString() {
    return 'AddressFormArgs{org: $org}';
  }
}

/// generated route for
/// [_i6.OrganisationForm]
class OrganisationForm extends _i10.PageRouteInfo<void> {
  const OrganisationForm({List<_i10.PageRouteInfo>? children})
      : super(
          OrganisationForm.name,
          initialChildren: children,
        );

  static const String name = 'OrganisationForm';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.FunctionDocumentsForm]
class FunctionDocumentsForm
    extends _i10.PageRouteInfo<FunctionDocumentsFormArgs> {
  FunctionDocumentsForm({
    required int functionIndex,
    required _i11.Functions function,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          FunctionDocumentsForm.name,
          args: FunctionDocumentsFormArgs(
            functionIndex: functionIndex,
            function: function,
          ),
          initialChildren: children,
        );

  static const String name = 'FunctionDocumentsForm';

  static const _i10.PageInfo<FunctionDocumentsFormArgs> page =
      _i10.PageInfo<FunctionDocumentsFormArgs>(name);
}

class FunctionDocumentsFormArgs {
  const FunctionDocumentsFormArgs({
    required this.functionIndex,
    required this.function,
  });

  final int functionIndex;

  final _i11.Functions function;

  @override
  String toString() {
    return 'FunctionDocumentsFormArgs{functionIndex: $functionIndex, function: $function}';
  }
}

/// generated route for
/// [_i8.FunctionsForm]
class FunctionsForm extends _i10.PageRouteInfo<FunctionsFormArgs> {
  FunctionsForm({
    required _i11.Organisation org,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          FunctionsForm.name,
          args: FunctionsFormArgs(org: org),
          initialChildren: children,
        );

  static const String name = 'FunctionsForm';

  static const _i10.PageInfo<FunctionsFormArgs> page =
      _i10.PageInfo<FunctionsFormArgs>(name);
}

class FunctionsFormArgs {
  const FunctionsFormArgs({required this.org});

  final _i11.Organisation org;

  @override
  String toString() {
    return 'FunctionsFormArgs{org: $org}';
  }
}

/// generated route for
/// [_i9.DocumentsForm]
class DocumentsForm extends _i10.PageRouteInfo<DocumentsFormArgs> {
  DocumentsForm({
    required _i11.Organisation org,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          DocumentsForm.name,
          args: DocumentsFormArgs(org: org),
          initialChildren: children,
        );

  static const String name = 'DocumentsForm';

  static const _i10.PageInfo<DocumentsFormArgs> page =
      _i10.PageInfo<DocumentsFormArgs>(name);
}

class DocumentsFormArgs {
  const DocumentsFormArgs({required this.org});

  final _i11.Organisation org;

  @override
  String toString() {
    return 'DocumentsFormArgs{org: $org}';
  }
}
