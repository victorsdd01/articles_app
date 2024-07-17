


import '../pages.dart';

class AppTheme {

  static const Color _textLigthColor = Color(0xff2c2c2c);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 16,
        fontWeight: FontWeight.w300,
        
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: Colors.deepPurple.shade100),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: Colors.deepPurple.shade100),
      ),
      focusedBorder: OutlineInputBorder( 
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.deepPurple.shade600
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red
        ),
        borderRadius: BorderRadius.circular(5.0)
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.deepPurple.shade300),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      )
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w300,
        fontSize: 96,
        letterSpacing: -1.5,
      ),
      displayMedium: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w300,
        fontSize: 60,
        letterSpacing: -0.5,
      ),
      displaySmall: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 48,
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 34,
        letterSpacing: 0.25,
      ),
      headlineSmall: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 24,
        letterSpacing: 0,
      ),
      titleLarge: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        letterSpacing: 0.15,
      ),
      titleMedium: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 0.1,
      ),
      bodyLarge: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: 0.25,
      ),
      labelLarge: TextStyle(
        decorationColor: Colors.transparent,
        wordSpacing: 1.0,
        decorationThickness: 1.0,
        backgroundColor: Colors.transparent,
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 1.25,
      ),
      bodySmall: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        letterSpacing: 0.4,
      ),
      labelSmall: TextStyle(
        color:_textLigthColor,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 10,
        letterSpacing: 1.5,
      ),
    ),
  );

  
    

}