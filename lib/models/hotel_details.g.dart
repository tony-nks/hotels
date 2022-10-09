// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelDetails _$HotelDetailsFromJson(Map<String, dynamic> json) => HotelDetails(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
      address:
          HotelAddressDetails.fromJson(json['address'] as Map<String, dynamic>),
      rating: (json['rating'] as num).toDouble(),
      services: HotelServicesDetails.fromJson(
          json['services'] as Map<String, dynamic>),
      photos: json['photos'] as List<dynamic>,
    );

Map<String, dynamic> _$HotelDetailsToJson(HotelDetails instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address.toJson(),
      'rating': instance.rating,
      'services': instance.services.toJson(),
      'photos': instance.photos,
    };

HotelAddressDetails _$HotelAddressDetailsFromJson(Map<String, dynamic> json) =>
    HotelAddressDetails(
      country: json['country'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      zip_code: json['zip_code'] as int,
      coords: json['coords'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$HotelAddressDetailsToJson(
        HotelAddressDetails instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zip_code,
      'coords': instance.coords,
    };

HotelServicesDetails _$HotelServicesDetailsFromJson(
        Map<String, dynamic> json) =>
    HotelServicesDetails(
      free: json['free'] as List<dynamic>,
      paid: json['paid'] as List<dynamic>,
    );

Map<String, dynamic> _$HotelServicesDetailsToJson(
        HotelServicesDetails instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
