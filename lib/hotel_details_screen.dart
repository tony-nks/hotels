import 'package:flutter/material.dart';
import 'package:hotels/connect.dart';
import 'package:hotels/models/hotel_details.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HotelDetailsScreen extends StatefulWidget {
  static const routeName = '/home_page/hotel_details';
  final String addressroute;
  const HotelDetailsScreen({Key? key, required this.addressroute})
      : super(key: key);

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  bool isLoading = false;
  bool error = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print(_response);
  }

  HotelDetails? _response;
  void getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response =
      await getHotelDetails(address: widget.addressroute).getDetails();

        _response = response;

    } catch (e) {
      setState(() {
        error = true;
      });
      print(error);
    }

    setState(() {
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isLoading ? AppBar(backgroundColor: Colors.transparent, shadowColor: Colors.transparent,) : error ? AppBar(title: Text('Ой'), centerTitle: true,)
          : AppBar(
              title: Text(_response!.name),
              centerTitle: true,
            ),
      body:  isLoading ? Center(child: CircularProgressIndicator()) : error ? Center(child: Text('Контент временно недоступен'),) :
       Column(
        children: [
          _response?.name == null ? Center(child: Text('Даннных нет'),) : Column(
            children: [
              Container(
                  child: CarouselSlider.builder(
                    itemCount: _response?.photos.length,
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true),
                    itemBuilder: (context, index, realInx) {
                      return Container(
                        child: Center(
                          child: Image.asset(
                              'assets/images/${_response?.photos[index]}'),
                        ),
                      );
                    },
                  )),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // первые детали под картинкой
                      Column(children: [
                        Row(
                          children: [
                            Text('Страна: '),
                            Text(_response!.address.country,
                                style:
                                TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Город: '),
                            Text(_response!.address.city,
                                style:
                                TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Улица: '),
                            Text(_response!.address.street,
                                style:
                                TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Рейтинг: '),
                            Text(_response!.rating.toString(),
                                style:
                                TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ]),
                      SizedBox(height: 25),
                      Text('Сервисы', style: TextStyle(fontSize: 25)),
                      SizedBox(height: 15),
                      //Платные - Бесплатные
                      Row(
                        children: [
                          //Платные
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Платные',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Container(
                                  height: 150,
                                  width: 180,
                                  child: ListView.builder(
                                      itemCount:
                                      _response!.services.free.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Text(
                                            _response!.services.free[index]);
                                      })),
                            ],
                          ),

                          //Бесплатные
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Бесплатно',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Container(
                                  height: 150,
                                  width: 180,
                                  child: ListView.builder(
                                      itemCount:
                                      _response!.services.paid.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Text(
                                            _response!.services.paid[index]);
                                      })),
                            ],
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}

//
// GridView.count(
// scrollDirection: Axis.vertical,
// crossAxisCount: 2,
// children: [
// Container(
// child: Card(
// color: Colors.amber,
// ),
// ),
// Container(
// child: Card(
// color: Colors.amber,
// ),
// ),
// Container(
// child: Card(
// color: Colors.amber,
// ),
// ),
// Container(
// child: Card(
// color: Colors.amber,
// ),
// ),
// Container(
// child: Card(
// color: Colors.amber,
// ),
// ),
// Container(
// child: Card(
// color: Colors.amber,
// ),
// ),
// Container(
// child: Card(
// color: Colors.amber,
// ),
// ),
// Container(
// child: Card(
// color: Colors.amber,
// ),
// ),
// ],
// ),



