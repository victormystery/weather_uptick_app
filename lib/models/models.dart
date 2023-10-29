class Temperatures {
  Location location;
  Current current;

  Temperatures({
    required this.location,
    required this.current,
  });

  factory Temperatures.fromJson(Map<String, dynamic> data) {
    return Temperatures(
      location: Location.fromJson(data['location']),
      current: Current.fromJson(data['current']),
    );
  }
}

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId;
  int localtimeEpoch;
  String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> data) {
    return Location(
      name: data['name'],
      region: data['region'],
      country: data['country'],
      lat: data['lat'],
      lon: data['lon'],
      tzId: data['tz_id'],
      localtimeEpoch: data['localtime_epoch'],
      localtime: data['localtime'],
    );
  }
}

class Current {
  int tempC;
  int tempF;
  int isDay;
  Condition condition;
  double windMph;
  int windDegree;
  String windDir;
  double pressureIn;
  int precipIn;
  int humidity;
  int cloud;

  Current({
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windDegree,
    required this.windDir,
    required this.pressureIn,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
  });

  factory Current.fromJson(Map<String, dynamic> data) {
    return Current(
      tempC: data['temp_c'],
      tempF: data['temp_f'],
      isDay: data['is_day'],
      condition: Condition.fromJson(data['condition']),
      windMph: data['wind_mph'],
      windDegree: data['wind_degree'],
      windDir: data['wind_dir'],
      pressureIn: data['pressure_in'],
      precipIn: data['precip_in'],
      humidity: data['humidity'],
      cloud: data['cloud'],
    );
  }
}

class Condition {
  String text;
  String icon;
  int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> data) {
    return Condition(
      text: data['text'],
      icon: data['icon'],
      code: data['code'],
    );
  }
}