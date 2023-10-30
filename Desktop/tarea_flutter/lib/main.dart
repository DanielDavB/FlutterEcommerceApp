import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_flutter/screens/main_screen.dart';
import 'package:tarea_flutter/screens/singleProduct.dart';
import 'package:tarea_flutter/screens/products.dart';
import 'package:tarea_flutter/services/allService.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductsService())],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Routing system app",
      initialRoute: "product",
      routes: {
        "main": (_) => const MainScreen(),
        "shop": (_) => const ShopScreen(),
        "product": (_) => const ProductSingle() //
      },
    );
  }
}
