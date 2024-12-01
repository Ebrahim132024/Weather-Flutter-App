import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter city name'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context
                    .read<WeatherBloc>()
                    .add(FetchWeatherEvent(_controller.text));
              },
              child: Text('Get Weather'),
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  return Column(
                    children: [
                      Text('City: ${state.weather.cityName}'),
                      Text('Temperature: ${state.weather.temperature}°C'),
                      Text('Description: ${state.weather.description}'),
                      Image.network(
                          'http://openweathermap.org/img/wn/${state.weather.icon}@2x.png'),
                    ],
                  );
                } else if (state is WeatherError) {
                  return Text(
                    state.message,
                    style: TextStyle(color: Colors.red),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

