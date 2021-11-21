import 'package:flutter/material.dart';
import 'package:grisoftware/feature/home/view/pages/home_page.dart';
import 'package:grisoftware/feature/home/viewmodel/home_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:grisoftware/core/init/injection_container.dart' as dependencyInjection;

void main() async {
  await dependencyInjection.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomePageProvider(dependencyInjection.serviceLocator()),
        ),
      ],
      child: const Grisoftware(),
    ),
  );
}

class Grisoftware extends StatelessWidget {
  const Grisoftware({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grisoftware',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
