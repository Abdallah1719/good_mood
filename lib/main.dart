import 'package:flutter/material.dart';
import 'package:good_mood/app.dart';
import 'package:good_mood/core/local_data_source/cache_helper.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const App());
}
