class WeatherAPIModel {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherAPIModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  WeatherAPIModel.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }
}

class AQIList {
  final int aqi;

  AQIList({
    required this.aqi,
  });

  factory AQIList.fromJson(Map<String, dynamic> json) {
    return AQIList(
      aqi: json["main"]["aqi"],
    );
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class AQI {
  final Coord? coord;
  final List<AQIList>? main;

  AQI({
    this.coord,
    this.main,
  });

  factory AQI.fromJson(Map<String, dynamic> json) {
    return AQI(
      coord: Coord.fromJson(json['coord']),
      main:
          (json['list'] as List).map((item) => AQIList.fromJson(item)).toList(),
    );
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'].toDouble();
    feelsLike = json['feels_like'].toDouble();
    tempMin = json['temp_min'].toDouble();
    tempMax = json['temp_max'].toDouble();
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}

class Wind {
  double? speed;
  int? deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'].toDouble();
    deg = json['deg'];
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}

class WeatherForecastHourly {
  final int? dt;
  final Main? main;

  final double? temp;
  final double? feelsLike;
  final double? pressure;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;

  final double? visibility;
  final String? description;
  final String? icon;

  WeatherForecastHourly(
      {this.dt,
      this.main,
      this.temp,
      this.clouds,
      this.wind,
      this.feelsLike,
      this.pressure,
      this.weather,
      this.visibility,
      this.description,
      this.icon});

  factory WeatherForecastHourly.fromJson(Map<String, dynamic> json) {
    return WeatherForecastHourly(
      dt: json['dt'].toInt(),
      main: Main.fromJson(json['main']),
      weather: (json['weather'] as List)
          .map((item) => Weather.fromJson(item))
          .toList(),
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      temp: json['main']['temp'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      visibility: json['visibility'].toDouble(),
    );
  }
}

class ForecastHourly {
  final List<WeatherForecastHourly> hourly;

  ForecastHourly({
    required this.hourly,
  });

  factory ForecastHourly.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourlyData = json['list'];

    List<WeatherForecastHourly> hourly = <WeatherForecastHourly>[];

    for (var item in hourlyData) {
      var hour = WeatherForecastHourly.fromJson(item);
      hourly.add(hour);
    }

    return ForecastHourly(
      hourly: hourly,
    );
  }
}
