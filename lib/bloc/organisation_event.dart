part of 'organisation_bloc.dart';

@immutable
class OrganisationEvent {}

class addOrganisationAddressEvent extends OrganisationEvent {
  final Address address;
  addOrganisationAddressEvent(this.address);
}

class addOrganisationContactDetailEvent extends OrganisationEvent {
  final ContactDetail contactDetail;
  addOrganisationContactDetailEvent(this.contactDetail);
}

class addOrganisationIdentifierEvent extends OrganisationEvent {
  final Identifier identifier;
  addOrganisationIdentifierEvent(this.identifier);
}

class addOrganisationDocumentEvent extends OrganisationEvent {
  final Document document;
  addOrganisationDocumentEvent(this.document);
}

class addOrganisationFunctionEvent extends OrganisationEvent {
  final Functions functions;
  addOrganisationFunctionEvent(this.functions);
}

class addOrganisationFunctionDocumentEvent extends OrganisationEvent {
  final Document document;
  final int functionIndex;
  addOrganisationFunctionDocumentEvent(this.document, this.functionIndex);
}

class SubmitOrganisationEvent extends OrganisationEvent {}
