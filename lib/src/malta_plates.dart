import 'package:flutter/widgets.dart' show Color, EdgeInsets;
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'malta_country.dart';

/// Where the ink sits, in plate units. The one-line plates are the 520×110
/// the article gives; each photo was flattened to it at 4 px per unit and its
/// ink runs read off (`pk` measure).
///
/// The article gives no size for the two-row plates (trailer, motorcycle,
/// vintage). Their photographs fit a rectangle of aspect 1.39–1.45 (the fit
/// is flagged unconfident), so they are drawn on 210×150, aspect 1.4; their
/// coordinates are the flat's divided by 2.476 (x) and multiplied by 1.364
/// (y). That size is an estimate, not a measurement.
///
/// Ink is 71 tall on the 110 plate; a box that tall would need ~130, so every
/// one-line box is the full canvas height and the ink lands near 60, about 85%
/// of reference. The two-row boxes are 76 tall for ink of ~56 on 150.
///
/// One-line centres (x), from the flats' ink runs:
/// - private `WTO 110`: letters 110, 166, 226 (pitch ~58); digits 350, 406,
///   461 (pitch ~56). The sticker between the groups is not drawn.
/// - bus `BUS 105`: `BUS` 159; digits 329, 400, 471 (pitch ~71).
/// - taxi `TAXI 119 M`: `TAXI` 163.5 (ink 72.8–254.2); digits 303, 353, 403;
///   `M` 472.5.
/// - personalised `EDWARD 1`: first ink centre 93, pitch 53.5, eight cells.
/// Two-row centres (real units): motorcycle `BCL` 74, 119, 163 and `482` 75,
/// 119, 163; trailer `TR` 111 and `1818` 52, 92, 132, 173.
abstract final class _Layout {
  static const double lineWidth = 520, lineHeight = 110;
  static const double boxWidthLetters = 56, boxWidthDigits = 54;

  static const double rowsWidth = 210, rowsHeight = 150;
  static const double rowBox = 76, rowTop1 = 3.5, rowTop2 = 72.5;
}

/// The EU band: a blue strip to [end], the stars asset in the box
/// ([left], [starsTop], [width]) and the `M` beneath. [rowsEnd] cuts the blue
/// short of the plate bottom (taxi, trailer, motorcycle: the blue is a box at
/// the top of the strip and the white below carries a sticker).
class _Band {
  const _Band({
    required this.end,
    required this.left,
    required this.width,
    required this.starsTop,
    required this.mTop,
    required this.mHeight,
    required this.mGlyph,
    this.rowsEnd,
  });

  final double end, left, width, starsTop, mTop, mHeight, mGlyph;
  final double? rowsEnd;

  double get starsHeight => width * 70.4 / 46;
}

/// Private plate: blue x 10.5–57, y 9–101 under the frame; ring centre y 37,
/// `M` ink y 68–84.5.
const _Band _privateBand = _Band(
  end: 57,
  left: 10.5,
  width: 46.5,
  starsTop: 8.6,
  mTop: 65.3,
  mHeight: 22,
  mGlyph: 30,
);

/// Bus and personalised: the band runs to about x 48, read off the sheet at
/// about ±3.
const _Band _narrowBand = _Band(
  end: 48,
  left: 4.5,
  width: 43.5,
  starsTop: 8,
  mTop: 66,
  mHeight: 22,
  mGlyph: 30,
);

/// Taxi: blue x 8.5–52, y 0–61. The stars asset keeps its aspect, so it is
/// scaled to the 61 the blue box allows (private plate's layout times 0.866)
/// and centred across the band.
const _Band _taxiBand = _Band(
  end: 52,
  left: 10.3,
  width: 39.9,
  starsTop: 0,
  mTop: 50,
  mHeight: 10,
  mGlyph: 14,
  rowsEnd: 61,
);

/// Two-row plates: blue x 0–37, y 0–66 on 210×150.
const _Band _rowsBand = _Band(
  end: 37,
  left: 0,
  width: 37,
  starsTop: 0,
  mTop: 44,
  mHeight: 16,
  mGlyph: 28,
  rowsEnd: 66,
);

/// A keyed group of slots at the given centres, each [width] wide.
class _Run {
  const _Run(
    this.key,
    this.alphabet,
    this.centres,
    this.width, {
    required this.top,
    required this.height,
  });

  final String key;
  final PlateAlphabet alphabet;
  final List<double> centres;
  final double width, top, height;
}

/// Text printed on every plate of the design (`BUS`, `TAXI`, `TR`).
class _Fixed {
  const _Fixed(this.text, this.cx, this.width, this.top, this.height);

  final String text;
  final double cx, width, top, height;
}

/// The Maltese plates, each a [_Band] plus keyed runs of slots and fixed text.
///
/// [private] is `WTO 110`, three letters and three digits; [bus] is `BUS 105`;
/// [taxi] is `TAXI 119 M`; [personalised] is `EDWARD 1`, free text in eight
/// cells (the rule allows ten, which the canvas cannot hold at this size);
/// [trailer] is `TR 1818` and [motorcycle] `BCL 482` on the two-row plate,
/// [vintage] the same face as the motorcycle plate in green.
///
/// Not implemented: the 1952–79 and 1979–95 series (history, not the current
/// system), the president's vehicle (a coat of arms in place of a plate), the
/// mobile post office, and the vintage plate's current silver-on-black form
/// (no reference). The sticker between the private plate's groups, the bus
/// sticker and the lower-left stickers of the two-row plates are not drawn.
abstract final class MaltaPlates {
  static final PlateSpec private = _spec(
    id: 'mt.private',
    band: _privateBand,
    runs: <_Run>[
      _Run(
        'letters',
        MaltaAlphabets.letters,
        <double>[110, 168, 226],
        _Layout.boxWidthLetters,
        top: 0,
        height: _Layout.lineHeight,
      ),
      _Run(
        'digits',
        MaltaAlphabets.digits,
        <double>[350, 405.5, 461],
        _Layout.boxWidthDigits,
        top: 0,
        height: _Layout.lineHeight,
      ),
    ],
  );

  static final PlateSpec bus = _spec(
    id: 'mt.bus',
    band: _narrowBand,
    fixed: <_Fixed>[_Fixed('BUS', 159, 170, 0, _Layout.lineHeight)],
    runs: <_Run>[
      _Run(
        'digits',
        MaltaAlphabets.digits,
        <double>[329, 400, 471],
        70,
        top: 0,
        height: _Layout.lineHeight,
      ),
    ],
  );

  static final PlateSpec taxi = _spec(
    id: 'mt.taxi',
    band: _taxiBand,
    fixed: <_Fixed>[_Fixed('TAXI', 163.5, 181, 0, _Layout.lineHeight)],
    runs: <_Run>[
      _Run(
        'digits',
        MaltaAlphabets.digits,
        <double>[303, 353, 403],
        50,
        top: 0,
        height: _Layout.lineHeight,
      ),
      _Run(
        'island',
        MaltaAlphabets.island,
        <double>[472.5],
        50,
        top: 0,
        height: _Layout.lineHeight,
      ),
    ],
  );

  static final PlateSpec personalised = _spec(
    id: 'mt.personalised',
    band: _narrowBand,
    runs: <_Run>[
      _Run(
        'text',
        MaltaAlphabets.personalised,
        <double>[for (int i = 0; i < 8; i++) 93 + 53.5 * i],
        53.5,
        top: 0,
        height: _Layout.lineHeight,
      ),
    ],
  );

  static final PlateSpec trailer = _spec(
    id: 'mt.trailer',
    band: _rowsBand,
    width: _Layout.rowsWidth,
    height: _Layout.rowsHeight,
    fixed: <_Fixed>[_Fixed('TR', 111, 84, _Layout.rowTop1, _Layout.rowBox)],
    runs: <_Run>[
      _Run(
        'digits',
        MaltaAlphabets.digits,
        <double>[52, 92, 132, 172],
        40,
        top: _Layout.rowTop2,
        height: _Layout.rowBox,
      ),
    ],
  );

  static final PlateSpec motorcycle = _rowsSpec('mt.motorcycle');

  static final PlateSpec vintage = _rowsSpec('mt.vintage');

  static List<PlateSpec> get all => <PlateSpec>[
    private,
    bus,
    taxi,
    personalised,
    trailer,
    motorcycle,
    vintage,
  ];

  static PlateSpec _rowsSpec(String id) => _spec(
    id: id,
    band: _rowsBand,
    width: _Layout.rowsWidth,
    height: _Layout.rowsHeight,
    runs: <_Run>[
      _Run(
        'letters',
        MaltaAlphabets.letters,
        <double>[74, 118.5, 163],
        44,
        top: _Layout.rowTop1,
        height: _Layout.rowBox,
      ),
      _Run(
        'digits',
        MaltaAlphabets.digits,
        <double>[75, 119, 163],
        44,
        top: _Layout.rowTop2,
        height: _Layout.rowBox,
      ),
    ],
  );

  static PlateSpec _spec({
    required String id,
    required _Band band,
    required List<_Run> runs,
    List<_Fixed> fixed = const <_Fixed>[],
    double width = _Layout.lineWidth,
    double height = _Layout.lineHeight,
  }) {
    final PlateSection strip = band.rowsEnd == null
        ? const PlateSection.fill(PlateFill.panel)
        : PlateSection.rows(<PlatePart>[
            PlatePart(
              const PlateSection.fill(PlateFill.panel),
              end: band.rowsEnd,
            ),
            const PlatePart(PlateSection.plain),
          ]);
    int next = 0;
    final List<PlateTextGroup> groups = <PlateTextGroup>[];
    for (final _Run run in runs) {
      groups.add(
        PlateTextGroup(<int>[
          for (int i = 0; i < run.centres.length; i++) next + i,
        ], key: run.key),
      );
      next += run.centres.length;
    }
    return PlateSpec(
      id: id,
      country: MaltaCountry.malta,
      canvasWidth: width,
      canvasHeight: height,
      panel: PlatePanel(
        box: PlateBox(band.left, band.starsTop, band.width, band.starsHeight),
        padding: EdgeInsets.zero,
      ),
      background: PlateSection.columns(<PlatePart>[
        PlatePart(strip, end: band.end),
        const PlatePart(PlateSection.plain),
      ]),
      slots: <PlateSlot>[
        for (final _Run run in runs)
          for (final double cx in run.centres)
            PlateSlot(
              alphabet: run.alphabet,
              box: PlateBox(cx - run.width / 2, run.top, run.width, run.height),
            ),
      ],
      labels: <PlateLabel>[
        PlateLabel(
          text: 'M',
          box: PlateBox(band.left, band.mTop, band.width, band.mHeight),
          glyphHeight: band.mGlyph,
          color: const Color(0xFFFFFFFF),
        ),
        for (final _Fixed f in fixed)
          PlateLabel(
            text: f.text,
            box: PlateBox(f.cx - f.width / 2, f.top, f.width, f.height),
            glyphHeight: f.height,
          ),
      ],
      textGroups: groups,
    );
  }
}
