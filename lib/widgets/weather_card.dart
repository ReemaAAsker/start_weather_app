import 'package:flutter/material.dart';
import 'package:starter_temp_weather_app/widgets/weather_stat.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatefulWidget {
  final Map<String, dynamic> weather_data;
  const WeatherCard({super.key, required this.weather_data});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: const Color(0xB0FFFFFF), width: 0.4),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff15BDF6), Color(0xFF065FAC)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF065FAC).withOpacity(0.5),
            spreadRadius: -12.0,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(30, 30),
                  shape: const CircleBorder(),
                  side: const BorderSide(color: Color(0xCCFFFFFF)),
                ),
                child: const Icon(Icons.more_horiz_sharp, color: Colors.white),
              ),
              Row(
                children: [
                  Icon(Icons.location_pin, color: Colors.white, size: 20),
                  SizedBox(width: 4),
                  Text(
                    '${widget.weather_data['name']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.more_vert_outlined, color: Colors.white),
            ],
          ),
          Expanded(child: Image(image: AssetImage('assets/images/cloud.png'))),
          Text(
            '${((widget.weather_data['main']['temp']) as double).toStringAsFixed(1)}°',
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '${widget.weather_data['sys']['country']} ,${widget.weather_data['sys']['name']}',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '${DateFormat('EEEE , d MMMM').format(DateTime.now())}',
            style: TextStyle(color: Colors.white54, fontSize: 10),
          ),
          const Divider(color: Colors.white12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherStat(
                icon: Icons.wind_power_outlined,
                value: '${widget.weather_data['wind']['speed']} km/h',
                label: 'Wind',
              ),
              WeatherStat(
                icon: Icons.water_drop_outlined,
                value: '${widget.weather_data['main']['humidity']}%',
                label: 'Humidity',
              ),
              WeatherStat(
                icon: Icons.waves,
                value: '${widget.weather_data['clouds']['all']}%',
                label: 'Chance\nof rain',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*


*/
