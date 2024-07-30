part of 'all_organisations_bloc.dart';

@immutable
class AllOrganisationsEvent {}

class getAllOrganisationsEvent extends AllOrganisationsEvent {}

class getQueryOrganisationsEvent extends AllOrganisationsEvent {
  String query;

  getQueryOrganisationsEvent(this.query);
}

class toggleNameEvent extends AllOrganisationsEvent {}

class toggleTenantEvent extends AllOrganisationsEvent {}
