import 'package:malta_plate/malta_plate.dart';
import 'package:plate_core/testing.dart';

void main() {
  plateGoldens('mt', MaltaCountry.malta, <String, PlateGoldenCase>{
    'private': (MaltaPlates.private, MaltaThemes.private, 'WTO 110'),
    'bus': (MaltaPlates.bus, MaltaThemes.bus, '105'),
    'taxi': (MaltaPlates.taxi, MaltaThemes.taxi, '119 M'),
    'personalised': (
      MaltaPlates.personalised,
      MaltaThemes.personalised,
      'EDWARD1',
    ),
    'trailer': (MaltaPlates.trailer, MaltaThemes.trailer, '1818'),
    'motorcycle': (MaltaPlates.motorcycle, MaltaThemes.motorcycle, 'BCL 482'),
    'vintage': (MaltaPlates.motorcycle, MaltaThemes.vintage, 'HBS 896'),
  });
}
