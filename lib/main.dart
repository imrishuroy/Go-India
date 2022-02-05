import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/respositories/deal/deal_repository.dart';
import '/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<DealRepository>(
            create: (_) => DealRepository(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
