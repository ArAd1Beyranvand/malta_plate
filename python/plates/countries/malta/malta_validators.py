"""Port of malta_plate/lib/src/malta_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

import re
from dataclasses import dataclass

from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation, is_digits_of_length

REASON_PRIVATE = 'A plate is three letters, three digits.'
REASON_BUS = 'A bus plate is BUS and three digits.'
REASON_TRAILER = 'A trailer plate is TR and four digits.'
REASON_TAXI = 'A taxi plate is TAXI, three digits and M or G.'
REASON_PERSONALISED = 'A personalised plate is one to ten letters or digits.'

_PERSONALISED = re.compile(r'[A-Z0-9]{1,10}')
_LETTERS = re.compile(r'[A-Z]{3}')


@dataclass(frozen=True)
class MaltaValidator(GatedPlateValidator):
    gate_group = 'digits'

    def judge(self, entry: PlateEntry) -> PlateValidation:
        digits, letters = entry.group('digits'), entry.group('letters')
        island, text = entry.group('island'), entry.group('text')
        if text:
            return PlateValidation.valid() if _PERSONALISED.fullmatch(text) else PlateValidation.invalid(REASON_PERSONALISED)
        if island:
            ok = is_digits_of_length(digits, 3) and island in ('M', 'G')
            return PlateValidation.valid() if ok else PlateValidation.invalid(REASON_TAXI)
        if letters:
            ok = is_digits_of_length(digits, 3) and _LETTERS.fullmatch(letters)
            return PlateValidation.valid() if ok else PlateValidation.invalid(REASON_PRIVATE)
        ok = is_digits_of_length(digits, 3) or is_digits_of_length(digits, 4)
        return PlateValidation.valid() if ok else PlateValidation.invalid(REASON_BUS)
