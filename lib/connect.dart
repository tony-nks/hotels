import 'package:hotels/models/hotel_details.dart';
import 'package:http/http.dart' as http;
import 'package:hotels/url_addresses.dart';
import 'dart:convert';

class Connect{
  final String address;
  Connect({required this.address});

  Future<HotelDetails> getDetails() async{
    final response = await http.get(Uri.parse(UrlAddresses.BASE_URL + address));
    final json = jsonDecode(response.body);
    return HotelDetails.fromJson(json);
  }
}