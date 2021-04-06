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

  bool isReserved;

  Property({
    this.id,
    this.city,
    this.streetAddress,
    this.rentalPrice,
    this.rating,
    this.ownerName,
    this.ownerPhoneNumber,
    this.propertyDetails,
    this.facilities,
    this.isReserved,
  });

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
}


class PropertyDetails {
  String title;
  int bedCount;
  String type;
  int bathroomCount;
  int laundryCount;
  String image;
  String description;

  PropertyDetails({
    this.title,
    this.bedCount,
    this.type,
    this.bathroomCount,
    this.laundryCount,
    this.image,
    this.description,
  });

  PropertyDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    bedCount = json['bed_count'];
    type = json['type'];
    bathroomCount = json['bathroom_count'];
    laundryCount = json['laundry_count'];
    image = json['image'];
    description = json['description'];
  }
}


class Facilities {
  String name;

  Facilities({this.name});

  Facilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
