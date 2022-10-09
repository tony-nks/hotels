import 'package:hotels/models/hotel_details.dart';
import 'package:http/http.dart' as http;
import 'package:hotels/const.dart';
import 'dart:convert';


class getHotelDetails{
  final String address;

  getHotelDetails({required this.address});
  Future<HotelDetails> getDetails() async{



    final response = await http.get(Uri.parse(Urls().BASE_URL + address));


    final json = jsonDecode(response.body);
    return HotelDetails.fromJson(json);
  }
}