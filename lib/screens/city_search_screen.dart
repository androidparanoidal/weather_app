import 'package:flutter/material.dart';
import '../constants.dart';

class CitySearchScreen extends StatefulWidget {
  @override
  State<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 26.0),
              Text(
                'Поиск по городу',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Color(0xFF2B2D33),
                  fontFamily: 'Ubuntu Light',
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                'Получить прогноз для любого города',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xFF8799A5),
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 48.0),
              TextField(
                cursorColor: Colors.blueGrey[800],
                style: TextStyle(fontFamily: 'Roboto', fontSize: 17.0),
                decoration: InputDecoration(
                  hintText: 'Введите название города',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE4E6EC))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kBlueColor, width: 2)),
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
              const SizedBox(height: 48.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlueColor,
                    shape: const StadiumBorder(),
                    minimumSize: const Size.fromHeight(48.0),
                  ),
                  child: Text(
                    'Получить прогноз',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Roboto',
                    ),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
