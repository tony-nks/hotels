import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:hotels/const.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/widgets/hotels_card.dart';
import 'package:http/http.dart' as http;


class HomeView extends StatefulWidget {
  static const routeName = '/home_page';
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  List<HotelPreview>? hotels;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print(hotels);
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(Urls().BASE_URL + Urls().ALL_HOTELS));
    var data = json.decode(response.body);
    hotels = data.map<HotelPreview>((hotels) => HotelPreview.fromJson(hotels)).toList();
    setState(() {
      isLoading = false;
    });
    print(hotels);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список всех отелей'),
        centerTitle: true,
      ),
      body: isLoading ? Center(child: CircularProgressIndicator()) :
          ListView(
            children: [
              ...?hotels?.map((hotel) {
                return InkWell(
                  onTap: () {
                  //  Navigator.pop(context);
                    Navigator.of(context).pushNamed('/home_page/hotel_details', arguments: hotel.uuid);
                  },
                  child: HotelsCard(title: hotel.name, image: hotel.poster),
                );
              }).toList(),
            ],
          ),
    );
  }
}
