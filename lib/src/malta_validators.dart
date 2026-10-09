import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

/// Judges a Maltese plate by its groups. Reports, never bars a keystroke.
///
/// A private plate is three letters and three digits (`WTO 110`); the bus
/// (`BUS 105`), trailer (`TR 1818`) and taxi (`TAXI 119 M`) plates have fixed
/// text and are judged on the digits and the island letter alone. A
/// personalised plate is one to ten letters and digits; its slots cannot hold
/// more than eight.
class MaltaValidator extends GatedPlateValidator {
  const MaltaValidator();

  @override
  String get gateGroup => 'digits';

  static const String reasonPrivate = 'A plate is three letters, three digits.';
  static const String reasonBus = 'A bus plate is BUS and three digits.';
  static const String reasonTrailer = 'A trailer plate is TR and four digits.';
  static const String reasonTaxi =
      'A taxi plate is TAXI, three digits and M or G.';
  static const String reasonPersonalised =
      'A personalised plate is one to ten letters or digits.';

  @override
  PlateValidation judge(PlateEntry entry) {
    final String digits = entry.group('digits');
    final String letters = entry.group('letters');
    final String island = entry.group('island');
    final String text = entry.group('text');
    if (text.isNotEmpty) {
      return RegExp(r'^[A-Z0-9]{1,10}$').hasMatch(text)
          ? const PlateValidation.valid()
          : const PlateValidation.invalid(reasonPersonalised);
    }
    if (island.isNotEmpty) {
      return isDigitsOfLength(digits, 3) &&
              MaltaAlphabets.island.characters.contains(island)
          ? const PlateValidation.valid()
          : const PlateValidation.invalid(reasonTaxi);
    }
    if (letters.isNotEmpty) {
      return isDigitsOfLength(digits, 3) &&
              RegExp(r'^[A-Z]{3}$').hasMatch(letters)
          ? const PlateValidation.valid()
          : const PlateValidation.invalid(reasonPrivate);
    }
    return isDigitsOfLength(digits, 3) || isDigitsOfLength(digits, 4)
        ? const PlateValidation.valid()
        : const PlateValidation.invalid(reasonBus);
  }
}
