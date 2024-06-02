import 'package:hive/hive.dart';
import 'package:weather_assesment/app/data/remote/weather_remote/model/weather_response_model.dart';

class WeatherResponseModelAdapter extends TypeAdapter<WeatherResponseModel> {
  @override
  int get typeId => 0; // Unique identifier for WeatherResponseModel

  @override
  WeatherResponseModel read(BinaryReader reader) {
    // Deserialize WeatherResponseModel from bytes
    var json = reader.readMap() as Map<String, dynamic>;
    ;
    return WeatherResponseModel.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, WeatherResponseModel obj) {
    // Serialize WeatherResponseModel to bytes
    writer.writeMap(obj.toJson());
  }
}

class CurrentAdapter extends TypeAdapter<Current> {
  @override
  int get typeId => 1; // Unique identifier for Current

  @override
  Current read(BinaryReader reader) {
    // Deserialize Current from bytes
    var json = reader.readMap() as Map<String, dynamic>;
    ;
    return Current.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, Current obj) {
    // Serialize Current to bytes
    writer.writeMap(obj.toJson());
  }
}

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  int get typeId => 2; // Unique identifier for Weather

  @override
  Weather read(BinaryReader reader) {
    // Deserialize Weather from bytes
    var json = reader.readMap() as Map<String, dynamic>;
    return Weather.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    // Serialize Weather to bytes
    writer.writeMap(obj.toJson());
  }
}

class DailyAdapter extends TypeAdapter<Daily> {
  @override
  int get typeId => 3; // Unique identifier for Daily

  @override
  Daily read(BinaryReader reader) {
    // Deserialize Daily from bytes
    var json = reader.readMap() as Map<String, dynamic>;
    return Daily.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, Daily obj) {
    // Serialize Daily to bytes
    writer.writeMap(obj.toJson());
  }
}

class TempAdapter extends TypeAdapter<Temp> {
  @override
  int get typeId => 4; // Unique identifier for Temp

  @override
  Temp read(BinaryReader reader) {
    // Deserialize Temp from bytes
    var json = reader.readMap() as Map<String, dynamic>;
    return Temp.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, Temp obj) {
    // Serialize Temp to bytes
    writer.writeMap(obj.toJson());
  }
}
