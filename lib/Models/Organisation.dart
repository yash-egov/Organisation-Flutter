import 'package:organisations/Models/Address.dart';
import 'package:organisations/Models/ContactDetails.dart';
import 'package:organisations/Models/Document.dart';
import 'package:organisations/Models/Functions.dart';
import 'package:organisations/Models/Identifier.dart';
import 'package:organisations/Models/Juridiction.dart';

class Organisation {
  String? tenantId;
  String? name;
  String? applicationStatus;
  String? externalRefNumber;
  int? dateOfIncorporation;
  List<Address>? orgAddress;
  List<ContactDetail>? contactDetails;
  List<Identifier>? identifiers;
  List<Functions>? functions;
  List<Jurisdiction>? jurisdiction;
  bool? isActive;
  List<Document>? documents;
  Map<String, dynamic>? additionalDetails;

  Organisation({
    this.tenantId,
    this.name,
    this.applicationStatus,
    this.externalRefNumber,
    this.dateOfIncorporation,
    this.orgAddress,
    this.contactDetails,
    this.identifiers,
    this.functions,
    this.jurisdiction,
    this.isActive,
    this.documents,
    this.additionalDetails,
  });

  // Convert JSON to Organisation instance
  factory Organisation.fromJson(Map<String, dynamic> json) {
    return Organisation(
      tenantId: json['tenantId'],
      name: json['name'],
      applicationStatus: json['applicationStatus'],
      externalRefNumber: json['externalRefNumber'],
      dateOfIncorporation: json['dateOfIncorporation'],
      orgAddress: (json['orgAddress'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactDetails: (json['contactDetails'] as List<dynamic>?)
          ?.map((e) => ContactDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      identifiers: (json['identifiers'] as List<dynamic>?)
          ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      functions: (json['functions'] as List<dynamic>?)
          ?.map((e) => Functions.fromJson(e as Map<String, dynamic>))
          .toList(),
      jurisdiction: (json['jurisdiction'] as List<dynamic>?)
          ?.map((e) => Jurisdiction.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['isActive'],
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalDetails: json['additionalDetails'] ?? {},
    );
  }

  // Convert Organisation instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'tenantId': tenantId,
      'name': name,
      'applicationStatus': applicationStatus,
      'externalRefNumber': externalRefNumber,
      'dateOfIncorporation': dateOfIncorporation,
      'orgAddress': orgAddress?.map((e) => e.toJson()).toList(),
      'contactDetails': contactDetails?.map((e) => e.toJson()).toList(),
      'identifiers': identifiers?.map((e) => e.toJson()).toList(),
      'functions': functions?.map((e) => e.toJson()).toList(),
      'jurisdiction': jurisdiction?.map((e) => e.toJson()).toList(),
      'isActive': isActive,
      'documents': documents?.map((e) => e.toJson()).toList(),
      'additionalDetails': additionalDetails ?? {},
    };
  }
}

class Boundary {
  String code;
  String name;
  String label;
  double latitude;
  double longitude;

  Boundary(
    this.code,
    this.name,
    this.label,
    this.latitude,
    this.longitude,
  );

  // Convert JSON to Boundary instance
  factory Boundary.fromJson(Map<String, dynamic> json) {
    return Boundary(
      json['code'],
      json['name'],
      json['label'],
      json['latitude'],
      json['longitude'],
    );
  }

  // Convert Boundary instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'label': label,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
