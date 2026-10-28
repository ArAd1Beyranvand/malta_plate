FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Malta to view examples:

https://platexample.ir/#/discover/malta

# malta_plate

Malta's licence plates for the `plate_core` library. Seven plates (private, bus, taxi, personalised, trailer, motorcycle, vintage), black on white with the EU band, their themes, alphabets and an advisory validator.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  malta_plate: ^0.1.0
```

## Use

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

## Contains

- `MaltaCountry` — country panel: `malta`.
- `MaltaPlates` — 6 plate specs: `private`, `bus`, `taxi`, `personalised`, `trailer`, `motorcycle`.
- `MaltaThemes` — 7 themes: `private`, `taxi`, `bus`, `personalised`, `trailer`, `motorcycle`, `vintage`.
- `MaltaValidator` — advisory validator; flags the frame, never blocks a keystroke.

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

