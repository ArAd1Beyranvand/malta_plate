FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Malta to view examples:

https://platexample.ir/#/discover/malta:flutter

# malta_plate

Malta's licence plates for plate_core: seven plates (private, bus, taxi, personalised, trailer, motorcycle, vintage), black on white with the EU band, themes, and more.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/malta_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/malta:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/malta_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/malta:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/malta_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/malta:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/malta_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/malta:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  malta_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:malta_plate/malta_plate.dart';

PlateCanvas(
  spec: MaltaPlates.private,
  theme: MaltaThemes.private,
  validator: const MaltaValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `MaltaPlates.private` — id `mt.private`
- `MaltaPlates.bus` — id `mt.bus`
- `MaltaPlates.taxi` — id `mt.taxi`
- `MaltaPlates.personalised` — id `mt.personalised`
- `MaltaPlates.trailer` — id `mt.trailer`
- `MaltaPlates.motorcycle`

## Themes

- `MaltaThemes.private`
- `MaltaThemes.taxi`
- `MaltaThemes.bus`
- `MaltaThemes.personalised`
- `MaltaThemes.trailer`
- `MaltaThemes.motorcycle`
- `MaltaThemes.vintage`

## Change it

`PlateCanvas` takes `spec:` (an entry of `MaltaPlates`) and `theme:` (an entry of `MaltaThemes`). Set `validator:` to `MaltaValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `MaltaCountry` — the country panel.
- `MaltaValidator` — the plate validator.

## Plates

`private` is `WTO 110`, three letters and three digits; `bus` is `BUS 105`;
`taxi` is `TAXI 119 M`; `personalised` is `EDWARD 1`, free text in one
slot of eight cells (the rule allows ten, which the canvas cannot hold at
this size); `trailer` is `TR 1818` and `motorcycle` `BCL 482` on the two-row plate (and, in green, the vintage plate).

Not implemented: the 1952–79 and 1979–95 series (history, not the current
system), the president's vehicle (a coat of arms in place of a plate), the
mobile post office, and the vintage plate's current silver-on-black form
(no reference). The sticker between the private plate's groups, the bus
sticker and the lower-left stickers of the two-row plates are not drawn.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/malta_plate/blob/main/LICENSE).
