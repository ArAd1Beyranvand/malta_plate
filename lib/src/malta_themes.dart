import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'malta_colors.dart';

/// One ink on one field. Only the private and taxi plates carry the black
/// frame (about 4.4 of the 110 height, read off the flats); the others are
/// photographs of plates whose rim is not part of the face.
abstract final class MaltaThemes {
  static final PlateTheme private = _theme(
    MaltaColors.white,
    MaltaColors.black,
    0.04,
  );

  static final PlateTheme taxi = _theme(
    MaltaColors.taxiField,
    MaltaColors.taxiInk,
    0.04,
  );

  static final PlateTheme bus = _theme(
    MaltaColors.busField,
    MaltaColors.busInk,
    0,
  );

  static final PlateTheme personalised = _theme(
    MaltaColors.white,
    MaltaColors.personalisedInk,
    0,
  );

  static final PlateTheme trailer = _theme(
    MaltaColors.trailerField,
    MaltaColors.trailerInk,
    0,
  );

  static final PlateTheme motorcycle = _theme(
    MaltaColors.motorcycleField,
    MaltaColors.motorcycleInk,
    0,
  );

  static final PlateTheme vintage = _theme(
    MaltaColors.white,
    MaltaColors.vintageInk,
    0,
  );
}

PlateTheme _theme(Color field, Color ink, double border) =>
    PlateTheme.monochrome(
      field: field,
      ink: ink,
      inactive: MaltaColors.inactive,
      borderWidthRatio: border,
      plateRadiusRatio: 0.07,
    );
