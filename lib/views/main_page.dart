import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_data.dart';
import '../widgets/weather_info_display.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String city = '';

  TextEditingController cityController = TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String time = now.hour.toString() + ":" + now.minute.toString();
    String date = now.day.toString() +
        "/" +
        now.month.toString() +
        "/" +
        now.year.toString();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.deepOrange,
        ),
        child: (city == '')
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 12,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        'Date: $date',
                                        style: const TextStyle(
                                          fontFamily: 'Pacifico',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 12,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        'Time: $time',
                                        style: const TextStyle(
                                          fontFamily: 'Pacifico',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Card(
                                  color: Colors.orangeAccent,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Curious how you can check how is the weather in another city or even your own',
                                      style: TextStyle(
                                        fontFamily: 'Pacifico',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Colors.white30,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 120.0, left: 50.0, right: 50.0),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                onChanged: ((value) {
                                  city = value;
                                }),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.search_outlined,
                                    color: Colors.white,
                                  ),
                                  labelText: 'Enter city name',
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  suffixIcon: Icon(Icons.cancel),
                                  suffixIconColor: Colors.white,
                                ),
                                controller: cityController,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: _searchCity,
                              child: const Text(
                                'S E A R C H',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : ChangeNotifierProvider(
                create: (context) => WeatherData(),
                builder: (context, child) {
                  return WeatherWindow(city: city);
                },
              ),
      ),
    );
  }

  void _searchCity() {
    setState(() {
      city = cityController.text;
    });
  }
}
