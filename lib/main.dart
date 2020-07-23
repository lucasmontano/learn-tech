import 'package:flutter/material.dart';
import 'package:learntech/home/home_screen.dart';
import 'package:learntech/store/questcategory_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return Provider<QuestCategoryStore>(
      create: (_) {
        final store = QuestCategoryStore();
        store.init();
        return store;
      },
      dispose: (_, store) => store.dispose(), // Clean up after we're done
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => const HomeScreen(),
        },
      ),
    );
  }
}
