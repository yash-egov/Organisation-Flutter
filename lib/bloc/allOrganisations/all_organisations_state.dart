part of 'all_organisations_bloc.dart';

@immutable
class AllOrganisationsState {
  List<Organisation> allOrganisations;
  bool name, tenant;
  AllOrganisationsState(this.allOrganisations, this.name, this.tenant);
}

final class AllOrganisationsInitial extends AllOrganisationsState {
  AllOrganisationsInitial() : super([], false, false);
}

class AllOrganisationsUpdated extends AllOrganisationsState {
  AllOrganisationsUpdated(List<Organisation> allorg)
      : super(allorg, false, false);
}
