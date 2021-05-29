import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MovieAppModule().dependencies();
  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(MovieApp()));
}

class MovieApp extends GetView<MovieAppModule> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: ,
    )
  }
}
