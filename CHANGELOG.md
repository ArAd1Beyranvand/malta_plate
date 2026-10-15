## Unreleased

- Each field (letters, digits, island, personalised text) is one `PlateSlot` with a `length` instead of one slot per character. A value is one string per slot: `['WTO', '110']`, `['119', 'M']`. A personalised plate is `['EDWARD1']` and may be shorter than eight characters.
