import 'package:flutter/widgets.dart';

/// The colours of the Maltese plates. `euroBlue` is the modal pixel of the
/// band on the vector artwork (`Maltese_license_plate`); the taxi ink is the
/// artwork's dark navy. The bus, trailer, motorcycle and vintage values are
/// the brief's colour-balanced photograph samples and carry their lighting;
/// the vintage plate's green ink is from its photo, the article saying
/// current vintage plates are silver on black.
abstract final class MaltaColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color euroBlue = Color(0xFF003399);

  static const Color taxiField = Color(0xFFFBFBFB);
  static const Color taxiInk = Color(0xFF040914);

  static const Color busField = Color(0xFFECEDED);
  static const Color busInk = Color(0xFF10080A);

  static const Color trailerField = Color(0xFFDDE0E7);
  static const Color trailerInk = Color(0xFF1E2125);

  static const Color motorcycleField = Color(0xFFEFEFEF);
  static const Color motorcycleInk = Color(0xFF2A2F2F);

  static const Color vintageInk = Color(0xFF124A30);

  static const Color personalisedInk = Color(0xFF26303D);

  static const Color inactive = Color(0xFFB0B0B0);
}
