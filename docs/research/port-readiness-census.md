# USA/JPN port-readiness census

Status: current-tree, build-free census run on 2026-08-25.

This is a measurement, not a recommendation. It prices the deferred USA/JPN
option without deciding whether the port lane should become active.

## Method

All numeric results below come from this read-only command, run from the
repository root:

```text
python tools/port_census.py
```

The command reads the current EUR `delinks.txt`/`symbols.txt`, finds HIGH
cross-region siblings with byte disambiguation enabled, checks the current
`src/usa/` and `src/jpn/` trees for the target source kind, prints the totals,
and writes `build/port_backlog.json`. The census unit is a function address,
not a raw directory entry: a multi-function translation unit can therefore
contribute more than one entry. `port_to_region.py` is the existing mechanical
path for the `BACKLOG-s` class, with its default HIGH confidence floor.

The run found 5,163 EUR function-keyed `.c` entries and 2,636 unresolved EUR
TUs. Those unresolved entries are chiefly data TUs and are excluded by the
tool's metadata-driven function census; they are not silently counted as port
opportunities.

## EUR `.c` with a target `.s`

Counts and bytes below are the `BACKLOG-s` entries from the command above.
Bytes are the EUR function sizes reported by the sibling match, not an
estimate of eventual region growth.

| module | USA entries | USA bytes | JPN entries | JPN bytes |
| --- | ---: | ---: | ---: | ---: |
| main | 444 | 60,492 | 445 | 60,608 |
| ov000 | 1 | 184 | 1 | 184 |
| ov002 | 156 | 25,944 | 156 | 25,944 |
| ov003 | 1 | 188 | 1 | 188 |
| ov004 | 14 | 2,312 | 14 | 2,312 |
| ov006 | 37 | 8,784 | 38 | 9,212 |
| ov007 | 1 | 132 | 1 | 132 |
| ov008 | 4 | 568 | 4 | 568 |
| ov010 | 5 | 632 | 5 | 632 |
| ov011 | 7 | 1,012 | 7 | 1,012 |
| ov012 | 1 | 156 | 1 | 156 |
| ov014 | 2 | 416 | 2 | 416 |
| ov015 | 1 | 268 | 1 | 268 |
| ov016 | 3 | 864 | 3 | 864 |
| ov017 | 3 | 1,056 | 3 | 1,056 |
| ov018 | 1 | 280 | 1 | 280 |
| ov020 | 2 | 316 | 2 | 316 |
| **Total** | **683** | **103,604** | **685** | **104,148** |

## Byte-identical versus needs work

The split is intentionally blank in this checkout. Every backlog entry was
reported as `byte_sim=unavailable` (`683 / 103,604 B` for USA and
`685 / 104,148 B` for JPN), because the gitignored `extract/` tree is absent;
`find_region_siblings.function_byte_similarity()` therefore has no region
binary from which to compute the masked-byte comparison. Source similarity or
the old `q-port-harvest-*` figures would not be a valid substitute.

| region | byte-identical-portable | needs work | evidence limitation |
| --- | ---: | ---: | --- |
| USA |  |  | `extract/usa/` and `extract/eur/` absent; all 683 sims unavailable |
| JPN |  |  | `extract/jpn/` and `extract/eur/` absent; all 685 sims unavailable |

The blank cells are facts, not estimates. Re-running the same command in a
checkout containing the three extracted region binaries will populate the
tool's `byte-identical` (`sim >= 0.9999`) and `needs-work` (`sim < 0.9999`)
evidence buckets.

## Known blockers

The same census run reports the following per region:

| blocker | USA | JPN | meaning |
| --- | ---: | ---: | --- |
| HIGH sibling, target `.s` exists | 683 | 685 | existing port path; priced above |
| HIGH but no target file | 63 | 63 | the known high-confidence/no-target class |
| no HIGH sibling | 797 | 797 | no safe target mapping from the current matcher |
| no EUR symbol | 2 | 2 | source entry could not be connected to the EUR function table |

The HIGH/no-target class remains exactly 63 per region. Its newly reported
EUR-size cost is 3,244 B per region. The module split is identical in both
regions: main `3 / 380 B`; ov002 `3 / 112 B`; ov003 `1 / 44 B`; ov004
`11 / 604 B`; ov005 `5 / 220 B`; ov006 `11 / 484 B`; ov007 `3 / 176 B`;
ov009 `3 / 132 B`; ov010 `3 / 188 B`; ov011 `1 / 52 B`; ov014 `3 / 132 B`;
ov015 `2 / 104 B`; ov016 `5 / 220 B`; ov017 `4 / 176 B`; ov019 `3 / 132 B`;
ov021 `2 / 88 B`. The no-HIGH and no-EUR-symbol pools are left unpriced as
port bytes: they have no proven target mapping to which a port cost could be
honestly attached.

## Per-region bottom line

This separates what the existing path can address from what needs a new
mapping or other investigation; it does not convert the latter into a
forecast.

| region | bytes reachable by existing port path (`BACKLOG-s`) | priced new-work subset (HIGH/no-target) | unpriced blocker pools |
| --- | ---: | ---: | --- |
| USA | 103,604 B | 3,244 B | 797 no-HIGH + 2 no-EUR-symbol entries; bytes blank |
| JPN | 104,148 B | 3,244 B | 797 no-HIGH + 2 no-EUR-symbol entries; bytes blank |

The byte-identical/needs-work split remains blank for both reachable columns
until `extract/{eur,usa,jpn}/` is present. No port was created or modified by
this census.
