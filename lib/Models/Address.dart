import 'package:organisations/Models/Organisation.dart';

class Address {
  String? tenantId;
  String? doorNo;
  double? latitude;
  double? longitude;
  String? addressNumber;
  String? addressLine1;
  String? addressLine2;
  String? landmark;
  String? city;
  String? pincode;
  String? detail;
  String? buildingName;
  String? street;
  Boundary? boundary;
  String? boundaryType;

  Address({
    this.tenantId,
    this.doorNo,
    this.latitude,
    this.longitude,
    this.addressNumber,
    this.addressLine1,
    this.addressLine2,
    this.landmark,
    this.city,
    this.pincode,
    this.detail,
    this.buildingName,
    this.street,
    this.boundary,
    this.boundaryType,
  });

  // Convert JSON to Address instance
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      tenantId: json['tenantId'],
      doorNo: json['doorNo'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      addressNumber: json['addressNumber'],
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      landmark: json['landmark'],
      city: json['city'],
      pincode: json['pincode'],
      detail: json['detail'],
      buildingName: json['buildingName'],
      street: json['street'],
      boundary: json['boundary'] != null
          ? Boundary.fromJson(json['boundary'] as Map<String, dynamic>)
          : null,
      boundaryType: json['boundaryType'],
    );
  }

  // Convert Address instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'tenantId': tenantId,
      'doorNo': doorNo,
      'latitude': latitude,
      'longitude': longitude,
      'addressNumber': addressNumber,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'landmark': landmark,
      'city': city,
      'pincode': pincode,
      'detail': detail,
      'buildingName': buildingName,
      'street': street,
      'boundary': boundary?.toJson(),
      'boundaryType': boundaryType,
    };
  }
}
