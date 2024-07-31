class Jurisdiction {
  String code;
  String jurisdictionId;
  Map<String, dynamic> additionalDetails;

  Jurisdiction(
    this.code,
    this.jurisdictionId,
    this.additionalDetails,
  );

  // Convert JSON to Jurisdiction instance
  factory Jurisdiction.fromJson(Map<String, dynamic> json) {
    return Jurisdiction(
      json['code'],
      json['jurisdictionId'],
      json['additionalDetails'] ?? {},
    );
  }

  // Convert Jurisdiction instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'jurisdictionId': jurisdictionId,
      'additionalDetails': additionalDetails ?? {},
    };
  }
}
