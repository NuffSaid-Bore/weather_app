import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/routes/routes.dart';
import 'package:weather_app/widgets/weather_display_window.dart';
import '../models/weather_data.dart';

class WeatherWindow extends StatelessWidget {
  const WeatherWindow({
    Key? key,
    required this.city,
  }) : super(key: key);

  final String city;

  @override
  Widget build(BuildContext context) {
    context.read<WeatherData>().fetchWeatherData(city);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 20),
          child: IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(RouteManager.mainPage),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: Colors.deepOrange,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Back to search',
          style: TextStyle(color: Colors.deepOrange),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.black),
        child: RefreshIndicator(
          backgroundColor: Colors.black,
          onRefresh: () async {},
          child: Consumer<WeatherData>(
            builder: (context, value, child) {
              return value.map.isEmpty && !value.error
                  ? const Center(
                      child: CircularProgressIndicator(
                        semanticsLabel: "Loading data from api",
                        
                      ),
                    )
                  : value.error
                      ? Text(
                          'Error occured: ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.map.length,
                          itemBuilder: (context, index) {
                            return DisplayWeatherWidget(
                              city: city,
                              weather: value.map['weather'][index],
                              main: value.map['main'],
                              sys: value.map['sys'],
                              wind: value.map['wind'],
                            );
                          });
            },
          ),
        ),
      ),
    );
  }
}
