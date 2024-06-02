import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/app/base_app/base_app.dart';
import 'package:e_commerce/app/core/provider/provider.dart';
import 'package:e_commerce/app/core/services/service_locator.dart';
import 'package:e_commerce/app/core/values/app_colors.dart';
import 'app/utils/constants.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  EnvConfig devConfig = EnvConfig(
    appName: "Flutter Prod",
    baseUrl: "https://api.openweathermap.org/",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  WidgetsFlutterBinding.ensureInitialized();
  // After adding any variable in .env then enable this line
  //await dotenv.load(fileName: "conf/.env");

  await GetStorage.init(databaseName);
  await Hive.initFlutter();

  await Hive.openBox<String>('json_data');

  await ScreenUtil.ensureScreenSize();
  await ServiceLocator.setUpServiceLocator();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.appBarColor,
      systemNavigationBarColor: AppColors.appBarColor2));
  runApp(MultiProvider(
      providers: ProviderPath.providersList, child: const BaseApp()));
}
