FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Malta to view examples:

https://platexample.ir/#/discover/malta:python

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

### Install (Python)

Copy `python/plates/countries/malta/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.malta.data import SPECS, THEMES

spec = SPECS["mt.private"]
theme = THEMES["MaltaThemes.private"]
print(spec.id)
```

## Specs

The specs are the same in every language (they come from shared data).

- `mt.private`
- `mt.bus`
- `mt.taxi`
- `mt.personalised`
- `mt.trailer`
- `mt.motorcycle`

## Themes

- `MaltaThemes.private`
- `MaltaThemes.taxi`
- `MaltaThemes.bus`
- `MaltaThemes.personalised`
- `MaltaThemes.trailer`
- `MaltaThemes.motorcycle`
- `MaltaThemes.vintage`

## Change it

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `MaltaValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/malta_plate/blob/main/LICENSE).
