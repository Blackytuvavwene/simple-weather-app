import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simple_weather_app/custom_widgets/custom_text.dart';
import 'package:simple_weather_app/views/forecast_card.dart';
import 'package:simple_weather_app/custom_widgets/gradient_text_widget.dart';
import 'package:simple_weather_app/services/get_weather_state.dart';
import 'package:simple_weather_app/custom_widgets/captilize.dart';
import 'package:simple_weather_app/views/5_day_forecast_card.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    Key? key,
    //this.weatherData,
  }) : super(key: key);
  //final WeatherApiService? weatherData;

  @override
  Widget build(BuildContext context) {
    final RxWeatherView weather = Get.put(RxWeatherView());
    //Weather weather = Weather();
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.city,
            ),
          ),
        ),
        title: Obx(
          () => Text(
            '${weather.currentWeather.value.city?.name}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        shadowColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.ellipsisV,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 150,
            ),
            SizedBox(
              height: 250,
              child: Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      weatherCondition(weather),
                      SizedBox(
                        height: 10,
                      ),
                      currentDate(),
                    ],
                  ),
                ),
                tempView(weather),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomText(
                text: '24 hour weather forecast',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weather.currentWeather.value.list?.length = 24,
                  itemBuilder: (context, item) => foreCastCard(context, item),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomText(
                text: '5-Day weather report',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weather.currentWeather.value.list?.length,
                  itemBuilder: (context, item) =>
                      fiveDayForeCastCard(context, item),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding currentDate() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: CustomText(
        text: '${(formatDate(
          DateTime.now(),
          [DD, ' ,', dd, ' ', MM],
        ))}',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Padding weatherCondition(RxWeatherView weather) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Obx(
        () => CustomText(
          text:
              '${(weather.currentWeather.value.list?[0].weather?[0].description)?.capitalizeFirstofEach}',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Expanded tempView(RxWeatherView weather) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            right: 35,
            child: GradientText(
              text: '°C',
              fontSize: 35,
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.transparent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Obx(
              () => GradientText(
                text:
                    '${(weather.currentWeather.value.list?[0].main?.temp)?.round()}',
                fontSize: 170,
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.transparent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
