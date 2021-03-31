class Property {
  int id;
  String city;
  String streetAddress;
  String rentalPrice;
  int rating;
  String ownerName;
  String ownerPhoneNumber;
  PropertyDetails propertyDetails;
  List<Facilities> facilities;

  Property(
      {this.id,
      this.city,
      this.streetAddress,
      this.rentalPrice,
      this.rating,
      this.ownerName,
      this.ownerPhoneNumber,
      this.propertyDetails,
      this.facilities});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    streetAddress = json['street_address'];
    rentalPrice = json['rental_price'];
    rating = json['rating'];
    ownerName = json['owner_name'];
    ownerPhoneNumber = json['owner_phone_number'];
    propertyDetails = json['property_details'] != null
        ? new PropertyDetails.fromJson(json['property_details'])
        : null;
    if (json['facilities'] != null) {
      facilities = new List<Facilities>();
      json['facilities'].forEach((v) {
        facilities.add(new Facilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['street_address'] = this.streetAddress;
    data['rental_price'] = this.rentalPrice;
    data['rating'] = this.rating;
    data['owner_name'] = this.ownerName;
    data['owner_phone_number'] = this.ownerPhoneNumber;
    if (this.propertyDetails != null) {
      data['property_details'] = this.propertyDetails.toJson();
    }
    if (this.facilities != null) {
      data['facilities'] = this.facilities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PropertyDetails {
  String title;
  int bedCount;
  String type;
  int bathroomCount;
  int laundryCount;
  String image;
  String description;

  PropertyDetails(
      {this.title,
      this.bedCount,
      this.type,
      this.bathroomCount,
      this.laundryCount,
      this.image,
      this.description});

  PropertyDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    bedCount = json['bed_count'];
    type = json['type'];
    bathroomCount = json['bathroom_count'];
    laundryCount = json['laundry_count'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['bed_count'] = this.bedCount;
    data['type'] = this.type;
    data['bathroom_count'] = this.bathroomCount;
    data['laundry_count'] = this.laundryCount;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}

class Facilities {
  String name;

  Facilities({this.name});

  Facilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}