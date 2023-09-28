import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //tempeture area
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
              height: 96,
              width: 96,
            ),
            Container(
              height: 50,
              width: 1,
              color: const Color.fromARGB(255, 30, 30, 154),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "${weatherDataCurrent.current.temp!.toInt()}°",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 68,
                      color: Colors.black,
                    )),
                TextSpan(
                    text:
                        "${weatherDataCurrent.current.weather![0].description}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ]),
            )
          ],
        ),

        const SizedBox(
          height: 20,
        ),

        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 4,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: CustomColors.cardColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset("assets/icons/windspeed.png"),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 4,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: CustomColors.cardColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset("assets/icons/clouds.png"),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 4,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: CustomColors.cardColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset("assets/icons/humidity.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 4,
                  child: Text(
                    "${weatherDataCurrent.current.windSpeed} km/h",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 4,
                  child: Text(
                    "${weatherDataCurrent.current.clouds}%",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 4,
                  child: Text(
                    "${weatherDataCurrent.current.humidity}%",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
