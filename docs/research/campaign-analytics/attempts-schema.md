# attempts.tsv schema

attempts.tsv is an append-only event log. New rows are written by
tools/park_one.py and tools/record_shipped.py; repeated (module, addr) pairs
are legal because a later ship can follow an earlier park.

The columns, in order, are:

| Column | Meaning |
| --- | --- |
| addr | Function address. |
| module | Canonical module key used by selectors. |
| text_size | .text byte span, or unknown when unavailable. |
| tier | Source tier supplied by the recorder. |
| shape | Mechanical/source shape supplied by the recorder. |
| result | Event result such as parked or shipped. |
| match_pct | Agent-reported match percentage. |
| park_class | Raw park classification supplied by the lane. |
| park_family | Derived controlled-vocabulary family. |
| brief | Brief or sweep that produced the event. |
| attempts | Non-negative integer draft/compile iterations; blank means not recorded. |

The attempts field deliberately defaults to blank, not zero. Existing rows from
before this field was added may omit the trailing field entirely; readers
interpret that missing value as blank. No historical attempt count is inferred.
tools/validate_attempts.py accepts blank or a non-negative integer and rejects
other values.
