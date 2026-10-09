import 'package:plate_core/plate_core.dart';

import 'malta_colors.dart';

/// Malta as a `PlateCountry`: the EU band. The stars are the shared asset
/// `plate_core` ships; the `M` beneath them is a [PlateLabel] on the spec, so
/// [captionLines] is empty.
abstract final class MaltaCountry {
  static const PlateCountry malta = PlateCountry(
    code: 'mt',
    captionLines: <String>[],
    panelColor: MaltaColors.euroBlue,
    panelTextColor: MaltaColors.white,
    flagAspectRatio: 46 / 70.4,
    flag: SvgPlateAsset(
      'assets/flags/Flag_of_Europe.svg',
      package: 'plate_core',
    ),
  );
}
