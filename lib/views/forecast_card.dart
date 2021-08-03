import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_weather_app/custom_widgets/custom_text.dart';
import 'package:simple_weather_app/services/get_weather_state.dart';
import 'package:simple_weather_app/custom_widgets/captilize.dart';

Widget foreCastCard(BuildContext context, int item) {
  final RxWeatherView weather = Get.put(RxWeatherView());
  //Weather weather = Weather();
  return Obx(
    () => Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: SizedBox(
        width: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                  Colors.indigo.shade300,
                  Colors.transparent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text:
                        '${(weather.currentWeather.value.list?[item].dtTxt)?.hour}:00',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 50,
                    child: Image.network(
                        'http://openweathermap.org/img/wn/${weather.currentWeather.value.list?[item].weather?[0].icon}.png'),
                  ),
                  CustomText(
                    text:
                        '${weather.currentWeather.value.list?[item].main?.temp?.round()}°',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  CustomText(
                    text:
                        '${(weather.currentWeather.value.list?[item].weather?[0].description)?.capitalizeFirstofEach}',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
