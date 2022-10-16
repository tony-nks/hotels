import 'package:json_annotation/json_annotation.dart';

part 'hotel_details.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelDetails {
  final String uuid;
  final String name;
  final String poster;
  final HotelAddressDetails address;
  final double rating;
  final HotelServicesDetails services;
  final List photos;

  HotelDetails(
      {required this.uuid,
      required this.name,
      required this.poster,
      required this.address,
      required this.rating,
      required this.services,
      required this.photos});
  factory HotelDetails.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDetailsToJson(this);
}


@JsonSerializable(explicitToJson: true)
class HotelAddressDetails {
  final String country;
  final String street;
  final String city;
  final int zip_code;
  final Map coords;

  HotelAddressDetails(
      {required this.country,
        required this.street,
        required this.city,
        required this.zip_code,
        required this.coords,
});
  factory HotelAddressDetails.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressDetailsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelServicesDetails {
  final List free;
  final List paid;

  HotelServicesDetails(
      {required this.free,
        required this.paid,
      });
  factory HotelServicesDetails.fromJson(Map<String, dynamic> json) =>
      _$HotelServicesDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelServicesDetailsToJson(this);
}
