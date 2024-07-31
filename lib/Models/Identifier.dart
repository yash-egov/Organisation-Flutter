class Identifier {
  String? type;
  String? value;
  bool? isActive;
  Map<String, dynamic>? additionalDetails;

  Identifier({
    this.type,
    this.value,
    this.isActive,
    this.additionalDetails,
  });

  // Convert JSON to Identifier instance
  factory Identifier.fromJson(Map<String, dynamic> json) {
    return Identifier(
      type: json['type'],
      value: json['value'],
      isActive: json['isActive'],
      additionalDetails: json['additionalDetails'] ?? {},
    );
  }

  // Convert Identifier instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
      'isActive': isActive,
      'additionalDetails': additionalDetails ?? {},
    };
  }
}
