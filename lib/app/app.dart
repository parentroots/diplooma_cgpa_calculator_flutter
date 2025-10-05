import 'package:cgpa_calculator_diploma/screens/result_calculation_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResultCalculationScreen(),

      theme: ThemeData(
        inputDecorationTheme: InputDecorationThemeData(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),

          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
           shape: BeveledRectangleBorder(
             borderRadius: BorderRadius.circular(2)
           ),

            elevation: 5,
            textStyle: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic
            )
          ),
        )



      ),
    );
  }
}
