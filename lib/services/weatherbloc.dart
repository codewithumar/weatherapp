import 'package:flutter_bloc/flutter_bloc.dart';

class Events {
  double? lat, long;
  Events(this.lat, this.long);
}

class WeatherBloc extends Bloc<Events, WeatherState> {
  WeatherBloc() : super(WeatherState(0.0, 0.0));
  Stream<WeatherState> mapEventToState(Events event) async* {
    yield WeatherState(event.lat!, event.long!);
  }
}

class WeatherState {
  double lat = 0.0, long = 0.0;

  WeatherState(this.lat, this.long);
}
