import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:organisations/Models/Organisation.dart';

part 'organisation_event.dart';
part 'organisation_state.dart';

class OrganisationBloc extends Bloc<OrganisationEvent, OrganisationState> {
  OrganisationBloc() : super(OrganisationInitial()) {
    on<addOrganisationAddressEvent>((event, emit) {
      print("Inside Add Address bloc -- ");

      print(event.address.doorNo);

      print(List.from(state.org.orgAddress as Iterable)..add(event.address));
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: List.from(state.org.orgAddress as Iterable)
          ..add(event.address),
        contactDetails: state.org.contactDetails,
        identifiers: state.org.identifiers,
        functions: state.org.functions,
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: state.org.documents,
        additionalDetails: state.org.additionalDetails,
      );
      print("Updated Org --");
      print(updatedOrg.orgAddress?[0].doorNo);

      emit(OrganisationUpdated(updatedOrg));
    });

    on<addOrganisationContactDetailEvent>((event, emit) {
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: state.org.orgAddress,
        contactDetails: List.from(state.org.contactDetails as Iterable)
          ..add(event.contactDetail),
        identifiers: state.org.identifiers,
        functions: state.org.functions,
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: state.org.documents,
        additionalDetails: state.org.additionalDetails,
      );
      emit(OrganisationUpdated(updatedOrg));
    });

    on<addOrganisationIdentifierEvent>((event, emit) {
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: state.org.orgAddress,
        contactDetails: state.org.contactDetails,
        identifiers: List.from(state.org.identifiers as Iterable)
          ..add(event.identifier),
        functions: state.org.functions,
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: state.org.documents,
        additionalDetails: state.org.additionalDetails,
      );
      emit(OrganisationUpdated(updatedOrg));
    });

    on<addOrganisationDocumentEvent>((event, emit) {
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: state.org.orgAddress,
        contactDetails: state.org.contactDetails,
        identifiers: state.org.identifiers,
        functions: state.org.functions,
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: List.from(state.org.documents as Iterable)
          ..add(event.document),
        additionalDetails: state.org.additionalDetails,
      );
      emit(OrganisationUpdated(updatedOrg));
    });

    on<addOrganisationFunctionEvent>((event, emit) {
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: state.org.orgAddress,
        contactDetails: state.org.contactDetails,
        identifiers: state.org.identifiers,
        functions: List.from(state.org.functions as Iterable)
          ..add(event.functions),
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: state.org.documents,
        additionalDetails: state.org.additionalDetails,
      );
      emit(OrganisationUpdated(updatedOrg));
    });

    on<addOrganisationFunctionDocumentEvent>((event, emit) {
      print(event.functionIndex);
      print("Inside addOrganisationFunctionDocumentEvent 1");
      // Retrieve the current list of functions
      final updatedFunctions =
          List<Functions>.from(state.org.functions as Iterable);

      print("Inside addOrganisationFunctionDocumentEvent 2");

      // // Get the function that needs to be updated
      final functionToUpdate = updatedFunctions[event.functionIndex];

      print("Inside addOrganisationFunctionDocumentEvent 3");

      // Create a new FunctionOrg object with updated documents list
      final updatedFunction = Functions(
        type: functionToUpdate.type,
        category: functionToUpdate.category,
        className: functionToUpdate.className,
        validFrom: functionToUpdate.validFrom,
        validTo: functionToUpdate.validTo,
        documents: List<Document>.from(functionToUpdate.documents as Iterable)
          ..add(event.document),
        additionalDetails: functionToUpdate.additionalDetails,
      );
      print("Inside addOrganisationFunctionDocumentEvent 4");

      // Replace the old function with the updated function in the list
      updatedFunctions[event.functionIndex] = updatedFunction;

      print("Inside addOrganisationFunctionDocumentEvent 5");
      // Create a new Organisation object with the updated functions list
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: state.org.orgAddress,
        contactDetails: state.org.contactDetails,
        identifiers: state.org.identifiers,
        functions: updatedFunctions,
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: state.org.documents,
        additionalDetails: state.org.additionalDetails,
      );
      print("Inside addOrganisationFunctionDocumentEvent 6");
      // Emit the new state with the updated organisation
      emit(OrganisationUpdated(updatedOrg));
    });
  }
}
