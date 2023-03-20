class BillingModel {
  int? id;
  CustomerData? customerData;
  String? customerEmail;
  int? customerPhone;
  DoctorData? doctorData;
  PrescriptionData? prescriptionData;
  String? billingDate;
  String? appointmentDate;
  int? consultationCharges;
  String? createdAt;
  int? prescription;
  int? customer;
  int? createdBy;

  BillingModel(
      {this.id,
      this.customerData,
      this.customerEmail,
      this.customerPhone,
      this.doctorData,
      this.prescriptionData,
      this.billingDate,
      this.appointmentDate,
      this.consultationCharges,
      this.createdAt,
      this.prescription,
      this.customer,
      this.createdBy});

  BillingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerData = json['customer_data'] != null
        ? CustomerData.fromJson(json['customer_data'])
        : null;
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
    doctorData = json['doctor_data'] != null
        ? DoctorData.fromJson(json['doctor_data'])
        : null;
    prescriptionData = json['prescription_data'] != null
        ? PrescriptionData.fromJson(json['prescription_data'])
        : null;
    billingDate = json['billing_date'];
    appointmentDate = json['appointment_date'];
    consultationCharges = json['consultation_charges'];
    createdAt = json['created_at'];
    prescription = json['prescription'];
    customer = json['customer'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (customerData != null) {
      data['customer_data'] = customerData!.toJson();
    }
    data['customer_email'] = customerEmail;
    data['customer_phone'] = customerPhone;
    if (doctorData != null) {
      data['doctor_data'] = doctorData!.toJson();
    }
    if (prescriptionData != null) {
      data['prescription_data'] = prescriptionData!.toJson();
    }
    data['billing_date'] = billingDate;
    data['appointment_date'] = appointmentDate;
    data['consultation_charges'] = consultationCharges;
    data['created_at'] = createdAt;
    data['prescription'] = prescription;
    data['customer'] = customer;
    data['created_by'] = createdBy;
    return data;
  }
}

class CustomerData {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? roleId;
  bool? isSuperuser;
  String? city;
  String? clinicName;
  String? state;
  String? country;
  String? pinCode;
  String? yourSign;
  List<String>? tags;
  String? addressLine2;
  String? addressLine1;
  String? roleName;
  String? fullName;

  CustomerData(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.roleId,
      this.isSuperuser,
      this.city,
      this.clinicName,
      this.state,
      this.country,
      this.pinCode,
      this.yourSign,
      this.tags,
      this.addressLine2,
      this.addressLine1,
      this.roleName,
      this.fullName});

  CustomerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    roleId = json['role_id'];
    isSuperuser = json['is_superuser'];
    city = json['city'];
    clinicName = json['clinic_name'];
    state = json['state'];
    country = json['country'];
    pinCode = json['pin_code'];
    yourSign = json['your_sign'];
    if (json['tags'] != null) {
      tags = <String>[];
      json['tags'].forEach((v) {
        tags!.add(v.toString());
      });
    }
    addressLine2 = json['address_line2'];
    addressLine1 = json['address_line1'];
    roleName = json['role_name'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['role_id'] = roleId;
    data['is_superuser'] = isSuperuser;
    data['city'] = city;
    data['clinic_name'] = clinicName;
    data['state'] = state;
    data['country'] = country;
    data['pin_code'] = pinCode;
    data['your_sign'] = yourSign;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toString()).toList();
    }
    data['address_line2'] = addressLine2;
    data['address_line1'] = addressLine1;
    data['role_name'] = roleName;
    data['full_name'] = fullName;
    return data;
  }
}

class DoctorData {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? roleId;
  bool? isSuperuser;
  String? city;
  String? clinicName;
  String? state;
  String? country;
  String? pinCode;
  String? yourSign;
  List<String>? tags;
  String? addressLine2;
  String? addressLine1;
  String? roleName;
  String? fullName;

  DoctorData(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.roleId,
      this.isSuperuser,
      this.city,
      this.clinicName,
      this.state,
      this.country,
      this.pinCode,
      this.yourSign,
      this.tags,
      this.addressLine2,
      this.addressLine1,
      this.roleName,
      this.fullName});

  DoctorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    roleId = json['role_id'];
    isSuperuser = json['is_superuser'];
    city = json['city'];
    clinicName = json['clinic_name'];
    state = json['state'];
    country = json['country'];
    pinCode = json['pin_code'];
    yourSign = json['your_sign'];
    if (json['tags'] != null) {
      tags = <String>[];
      json['tags'].forEach((v) {
        tags!.add(v.toString());
      });
    }
    addressLine2 = json['address_line2'];
    addressLine1 = json['address_line1'];
    roleName = json['role_name'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['role_id'] = roleId;
    data['is_superuser'] = isSuperuser;
    data['city'] = city;
    data['clinic_name'] = clinicName;
    data['state'] = state;
    data['country'] = country;
    data['pin_code'] = pinCode;
    data['your_sign'] = yourSign;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toString()).toList();
    }
    data['address_line2'] = addressLine2;
    data['address_line1'] = addressLine1;
    data['role_name'] = roleName;
    data['full_name'] = fullName;
    return data;
  }
}

class PrescriptionData {
  int? id;
  int? customer;
  String? customerName;
  String? clinicName;
  int? queue;
  int? mobile;
  List<int>? prescription;
  String? note;
  String? prescriptionName;
  bool? deleted;
  int? createdBy;
  String? createdAt;
  List<PrescriptionList>? prescriptionList;
  String? purposeOfVisit;
  String? symptoms;
  String? doctorName;
  List<String>? doctorTags;

  PrescriptionData(
      {this.id,
      this.customer,
      this.customerName,
      this.clinicName,
      this.queue,
      this.mobile,
      this.prescription,
      this.note,
      this.prescriptionName,
      this.deleted,
      this.createdBy,
      this.createdAt,
      this.prescriptionList,
      this.purposeOfVisit,
      this.symptoms,
      this.doctorName,
      this.doctorTags});

  PrescriptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'];
    customerName = json['customer_name'];
    clinicName = json['clinic_name'];
    queue = json['queue'];
    mobile = json['mobile'];
    prescription = json['prescription'].cast<int>();
    note = json['note'];
    prescriptionName = json['prescription_name'];
    deleted = json['deleted'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    if (json['prescription_list'] != null) {
      prescriptionList = <PrescriptionList>[];
      json['prescription_list'].forEach((v) {
        prescriptionList!.add(PrescriptionList.fromJson(v));
      });
    }
    purposeOfVisit = json['purpose_of_visit'];
    symptoms = json['symptoms'];
    doctorName = json['doctor_name'];
    if (json['doctor_tags'] != null) {
      doctorTags = <String>[];
      json['doctor_tags'].forEach((v) {
        doctorTags!.add(v.toString());
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer'] = customer;
    data['customer_name'] = customerName;
    data['clinic_name'] = clinicName;
    data['queue'] = queue;
    data['mobile'] = mobile;
    data['prescription'] = prescription;
    data['note'] = note;
    data['prescription_name'] = prescriptionName;
    data['deleted'] = deleted;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    if (prescriptionList != null) {
      data['prescription_list'] =
          prescriptionList!.map((v) => v.toJson()).toList();
    }
    data['purpose_of_visit'] = purposeOfVisit;
    data['symptoms'] = symptoms;
    data['doctor_name'] = doctorName;
    if (doctorTags != null) {
      data['doctor_tags'] = doctorTags!.map((v) => v.toString()).toList();
    }
    return data;
  }
}

class PrescriptionList {
  int? id;
  String? name;
  String? drugToTaken;
  String? note;
  bool? deleted;
  int? createdBy;
  String? createdAt;

  PrescriptionList(
      {this.id,
      this.name,
      this.drugToTaken,
      this.note,
      this.deleted,
      this.createdBy,
      this.createdAt});

  PrescriptionList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    drugToTaken = json['drug_to_taken'];
    note = json['note'];
    deleted = json['deleted'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['drug_to_taken'] = drugToTaken;
    data['note'] = note;
    data['deleted'] = deleted;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    return data;
  }
}
