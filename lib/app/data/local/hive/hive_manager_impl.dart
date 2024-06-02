import 'package:hive/hive.dart';
import 'package:weather_assesment/app/data/local/hive/hive_manager.dart';

class HiveManagerImpl implements HiveManager {
  final Box _box;

  HiveManagerImpl(this._box);

  @override
  String getString(String key, {String defaultValue = ""}) =>
      _box.get(key, defaultValue: defaultValue) as String;

  @override
  void setString(String key, String value) => _box.put(key, value);

  @override
  int getInt(String key, {int defaultValue = 0}) =>
      _box.get(key, defaultValue: defaultValue) as int;

  @override
  void setInt(String key, int value) => _box.put(key, value);

  @override
  double getDouble(String key, {double defaultValue = 0.0}) =>
      _box.get(key, defaultValue: defaultValue) as double;

  @override
  void setDouble(String key, double value) => _box.put(key, value);

  @override
  bool getBool(String key, {bool defaultValue = false}) =>
      _box.get(key, defaultValue: defaultValue) as bool;

  @override
  void setBool(String key, bool value) => _box.put(key, value);

  @override
  List<String> getStringList(String key,
          {List<String> defaultValue = const []}) =>
      _box.get(key, defaultValue: defaultValue) as List<String>;

  @override
  void setStringList(String key, List<String> value) => _box.put(key, value);

  @override
  void remove(String key) => _box.delete(key);

  @override
  void clear() => _box.clear();
}
