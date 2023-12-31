import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            margin: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(10.0)),
            child: const Center(
              child: Text(
                "Weather App",
                style: TextStyle(
                    fontSize: 37,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topCenter,
          child: Center(
            child: Text(
              city,
              style: const TextStyle(fontSize: 35, height: 2),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Center(
            child: Text(
              date,
              style:
                  TextStyle(fontSize: 15, color: Colors.grey[800], height: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
