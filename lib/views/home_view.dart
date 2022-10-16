import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hotels/url_addresses.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/widgets/hotels_card.dart';
import 'package:hotels/widgets/hotels_grid_card.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  static const routeName = '/home_page';
  HomeView({Key? key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  bool listView = true;
  List<HotelPreview>? hotels;
  @override
  void initState() {
    super.initState();
    getData();
    print(hotels);
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(UrlAddresses.BASE_URL + UrlAddresses.ALL_HOTELS));
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
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.list_rounded),
              onPressed: () {
                setState(() {
                  listView = true;
                });
              },
            ),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.grid_on),
              onPressed: () {
                setState(() {
                  listView = false;
                });
              },
            ),
          ),
        ],
      ),
      body: isLoading ? Center(child: CircularProgressIndicator()) :
          listView ?
          ListView(
            children: [
              ...?hotels?.map((hotel) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/home_page/hotel_details', arguments: hotel.uuid);
                  },
                  child: HotelsCard(title: hotel.name, image: hotel.poster),
                );
              }).toList(),
            ],
          ) :
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:  2,
              childAspectRatio:  MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2),
            ),
            children: [
              ...?hotels?.map((hotel) {
                return InkWell(
                  onTap: () {
                    //  Navigator.pop(context);
                    Navigator.of(context).pushNamed('/home_page/hotel_details', arguments: hotel.uuid);
                  },
                  child: HotelsCardGrid(title: hotel.name, image: hotel.poster),
                );
              }).toList(),
            ],
          ),
    );
  }
}
