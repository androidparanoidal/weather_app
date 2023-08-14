import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../api/weather_api.dart';
import '../forecast_util.dart';
import '../model/weather_model.dart';
import '../screens/city_search_screen.dart';
import '../screens/login_screen.dart';

// the top widget
class CityView extends StatefulWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  CityView({required this.snapshot});
  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  @override
  Widget build(BuildContext context) {
    late Future<WeatherModel> forecastObject;
    late String _cityName;

    var city = widget.snapshot.data?.city?.name;
    var country = widget.snapshot.data?.city?.country;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              SizedBox(
                height: 24.0,
                width: 24.0,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      forecastObject = WeatherAPI().getWeather();
                    });
                  },
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(Icons.location_on_outlined, color: Colors.white),
                ),
              ),
              Text(
                '$city, $country',
                style: TextStyle(
                    color: Colors.white, fontSize: 15.0, fontFamily: 'Roboto'),
              ),
            ],
          ),

          // SizedBox(
          //   height: 24.0,
          //   width: 24.0,
          //   child: IconButton(
          //       onPressed: () async {
          //         var tappedName = await Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => CitySearchScreen()));
          //         if (tappedName != null) {
          //           setState(() {
          //             _cityName = tappedName;
          //             forecastObject = WeatherAPI()
          //                 .getWeather(cityName: _cityName, isCity: true);
          //           });
          //         }
          //       },
          //       padding: EdgeInsets.all(0.0),
          //       icon: Icon(Icons.search, color: Colors.white)),
          // ),
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ));
              },
              padding: EdgeInsets.all(0.0),
              icon: Icon(Icons.logout_outlined, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
