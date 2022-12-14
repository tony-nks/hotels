import 'package:flutter/material.dart';
import 'package:hotels/connect.dart';
import 'package:hotels/models/hotel_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotels/views/not_found_page.dart';

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
      final response = await Connect(address: widget.addressroute).getDetails();
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
    return isLoading
        ? LoadingContent()
        : error
            ? NotFoundContent()
            : Scaffold(
                appBar: AppBar(
                        title: Text(_response!.name),
                        centerTitle: true,
                      ),
                body: Column(
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
                            // ???????????? ???????????? ?????? ??????????????????
                            Column(children: [
                              Row(
                                children: [
                                  Text('????????????: '),
                                  Text(_response!.address.country,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text('??????????: '),
                                  Text(_response!.address.city,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text('??????????: '),
                                  Text(_response!.address.street,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text('??????????????: '),
                                  Text(_response!.rating.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ]),
                            SizedBox(height: 25),
                            Text('??????????????', style: TextStyle(fontSize: 25)),
                            SizedBox(height: 15),
                            //?????????????? - ????????????????????
                            Row(
                              children: [
                                //??????????????
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('??????????????',
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
                                              return Text(_response!
                                                  .services.free[index]);
                                            })),
                                  ],
                                ),
                                //????????????????????
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('??????????????????',
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
                                              return Text(_response!
                                                  .services.paid[index]);
                                            })),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              );
  }
}
