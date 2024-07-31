class ContactDetail {
  String? contactName;
  String? contactMobileNumber;
  String? contactEmail;

  ContactDetail({
    this.contactName,
    this.contactMobileNumber,
    this.contactEmail,
  });

  // Convert JSON to ContactDetail instance
  factory ContactDetail.fromJson(Map<String, dynamic> json) {
    return ContactDetail(
      contactName: json['contactName'],
      contactMobileNumber: json['contactMobileNumber'],
      contactEmail: json['contactEmail'],
    );
  }

  // Convert ContactDetail instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'contactName': contactName,
      'contactMobileNumber': contactMobileNumber,
      'contactEmail': contactEmail,
    };
  }
}
