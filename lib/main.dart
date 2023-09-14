import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibify/app_state.dart';
import 'package:vibify/modals/colors.dart';
import 'package:vibify/ui/starting_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(create: (context)=>ApplicationState(),builder: (context,child)=>const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    myColors mcol= myColors();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: mcol.darkblue,
        useMaterial3: true,
      ),
      home: const GetStartedPage(),
    );
  }
}
