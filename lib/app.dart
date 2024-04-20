import 'exporters.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRouter.routes,
      initialRoute: AppRouter.initalRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 44, 44, 44),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          foregroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          labelSmall: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        scaffoldBackgroundColor: const Color.fromARGB(255, 54, 54, 54),
      ),
    );
  }
}
