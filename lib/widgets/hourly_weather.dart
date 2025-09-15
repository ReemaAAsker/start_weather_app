import 'package:flutter/material.dart';

class HourlyWeather extends StatefulWidget {
  const HourlyWeather({super.key});

  @override
  State<HourlyWeather> createState() => _HourlyWeatherState();
}

class _HourlyWeatherState extends State<HourlyWeather> {
  int selectedButton = 0;
  Color bg = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: selectedButton == index
                  ? bg
                  : Colors.transparent,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              setState(() {
                bg = const Color(0xff0FA2FD);
                selectedButton = index;
              });
            },
            child: AnimatedScale(
              duration: const Duration(milliseconds: 150),
              scale: selectedButton == index ? 1.1 : 1,
              child: const HourlyForecastItem(),
            ),
          ),
        ),
      ),
    );
  }
}

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('25°', style: TextStyle(color: Colors.white, fontSize: 12)),
          Expanded(
            child: Image.asset(
              'assets/images/cloud.png',
              height: 30,
              width: 30,
            ),
          ),

          // Icon(Icons.radar, color: Colors.white, size: 25),
          Text('3:00', style: TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }
}
