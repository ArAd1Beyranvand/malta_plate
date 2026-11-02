/// Malta's licence plates for the `plate_core` library.
///
/// Seven plates (private, bus, taxi, personalised, trailer, motorcycle,
/// vintage), black on white with the EU band, their themes, alphabets and an
/// advisory validator.
library;

// TODO(py): [D5] one module `plates.countries.malta`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/malta`; tree-shakable.
// TODO(kt): [D5] package `countries.malta` in the countries module.
export 'package:plate_alphabet/plate_alphabet.dart' show MaltaAlphabets;
export 'src/malta_colors.dart';
export 'src/malta_country.dart';
export 'src/malta_plates.dart';
export 'src/malta_themes.dart';
export 'src/malta_validators.dart';
