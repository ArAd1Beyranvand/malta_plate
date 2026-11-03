import 'package:plate_core/plate_core.dart';

/// Malta as a `PlateCountry`: the EU band. The stars are `EuropeanStars.band`;
/// the `M` beneath them is a [PlateLabel] on the spec, so
/// [captionLines] is empty.
abstract final class MaltaCountry {
  static const PlateCountry malta = PlateCountry.euroband(code: 'mt');
}
