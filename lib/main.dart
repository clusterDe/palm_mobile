import 'package:flutter/material.dart';
import 'package:palm_mobile/providers/home/home_provider.dart';
import 'package:palm_mobile/providers/search/search_provider.dart';
import 'package:palm_mobile/themes/theme.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
      ],
      child: MaterialApp.router(
        title: 'Palm Mobile',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        routerDelegate: route.routerDelegate,
        routeInformationParser: route.routeInformationParser,
        routeInformationProvider: route.routeInformationProvider,
      ),
    );
  }
}
