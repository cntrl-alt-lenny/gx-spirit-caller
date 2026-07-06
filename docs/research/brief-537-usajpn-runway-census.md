[//]: # (markdownlint-disable MD013)

# Brief 537 — USA/JPN mechanical `.s`-drain runway census

Branch: `claude/usajpn-census-537`

**READ-ONLY.** No carves, no delink writes, no ships. This brief exists to
answer one strategic question before committing further campaign time:
*is USA/JPN's ~51% uncarved code still a big, mechanically tractable
`.s`-drain lane (the b467-469 drain that reached ~49% may have simply
**paused** for the c-match pivot), or has it become a wall of genuine
`kind:data` C-absorption / permuter / RE cases?*

## Headline verdict

**There is a very large, still-tractable mechanical drain lane.** Across
USA + JPN combined, **4,439 functions are uncarved**; **4,349 of them
(98.0%) pass the `kind:data` link preflight cleanly** (the same
preflight `asm_escape --whole-function` gates on before it will emit a
`.s`). Only **90 (2.0%)** REFUSE, and **100% of every REFUSE seen, in
every module, in both regions, is genuine `C-absorbed`** (data folded
into a bundle TU with no linkable symbol) — not a config artifact, not
an ambiguous case.

If the tractable set actually ships at anything close to its preflight
rate (see Caveats — this wasn't independently re-verified against a
live `--whole-function` assemble this brief, by design), it would carry
USA/JPN from **~49% code to ~99% code** — closing almost the entire
remaining gap. This is a far bigger lane than the c-match tail (b536's
"last easy wave" is 8 functions; this is thousands).

**One module dominates.** `ov002` alone accounts for **1,447 (USA) /
1,583 (JPN)** of the uncarved functions and **~77-78% of all tractable
bytes**. It is almost the entire opportunity by itself.

## Method

Wine-free, objdump-only, in-process (no per-function subprocess spawn):

1. `ninja delink` for each region — a native `dsd` step (no wine, no
   mwcc/mwld), ~10s, produces the `build/<ver>/delinks/_dsd_gap@*.o`
   objects the data-preflight's B-gap check reads.
2. Reused `asm_escape.py`'s pure `classify_data_refs()` (config-file-only,
   no build dependency) for the actual A-aligned / B-gap / C-absorbed /
   OFFSET / MISADDRESSED verdict per kind:data reference — the exact
   same logic `asm_escape.py --classify-data` uses, called as a Python
   import instead of ~4,439 subprocess invocations.
3. Built ONE cached set of gap-defined symbols per region (single
   `glob` + `objdump -t` pass over all `_dsd_gap@*.o`, ~1,150-1,200
   objects) instead of `asm_escape._gap_defines_data()`'s per-call
   rescan — the naive per-function approach measured ~53ms/candidate
   (77s for ov002 alone); caching brought the full 4,439-candidate,
   50-module × region sweep under 5 minutes.
4. "Uncarved" = a `kind:function` symbol in `symbols.txt` whose address
   isn't covered by any `.text start:`/`end:` block in `delinks.txt`.
   No `--min-addr` guard was applied (the brief's warned-about default
   `0x02234000` would have silently excluded everything below it) —
   every module's full symbol range was scanned by loading its own
   `config/<ver>/arm9[/overlays/ovNNN]/symbols.txt` directly rather than
   invoking `batch_carve.py --dry-run` (which still takes `--min-addr`
   per call); see Method notes for the one deliberate divergence this
   caused.

**Validation.** Spot-checked 5 candidates (2 REFUSE, 3 tractable,
spanning ov002's smallest/largest and ov006) directly against the real
`asm_escape.py --classify-data` CLI — all 5 matched this census's
verdict exactly.

**Every REFUSE in every module in both regions was `C-absorbed`.** No
`OFFSET`, `MISADDRESSED`, or unresolved `B-gap-unconfirmed` case
appeared anywhere in ~4,439 candidates — so, empirically this round,
the tool's own "REFUSE = NOT (A-aligned or B-gap)" superset collapsed
to exactly the genuine-wall subset. Worth re-confirming on a live run
rather than assuming this holds forever, but it held 100% of the time
here.

## Per-module census — USA

| Module | Total fn | Carved | Uncarved | Tractable (zero-dep) | REFUSE | Tractable bytes |
|---|---:|---:|---:|---|---:|---:|
| main | 4093 | 4044 | 49 | 23 (20) | 26 | 4,524 |
| ov000 | 143 | 58 | 85 | 85 (76) | 0 | 18,504 |
| ov001 | 6 | 2 | 4 | 4 (3) | 0 | 980 |
| **ov002** | **3772** | **2325** | **1447** | **1443 (1347)** | **4** | **898,448** |
| ov003 | 34 | 13 | 21 | 21 (15) | 0 | 19,072 |
| ov004 | 224 | 222 | 2 | 0 (0) | 2 | 0 |
| ov005 | 85 | 22 | 63 | 63 (51) | 0 | 27,296 |
| ov006 | 395 | 382 | 13 | 0 (0) | 13 | 0 |
| ov007 | 32 | 13 | 19 | 19 (18) | 0 | 2,060 |
| ov008 | 91 | 20 | 71 | 71 (53) | 0 | 31,216 |
| ov009 | 35 | 11 | 24 | 24 (19) | 0 | 12,228 |
| ov010 | 104 | 42 | 62 | 62 (56) | 0 | 22,696 |
| ov011 | 193 | 193 | 0 | 0 (0) | 0 | 0 |
| ov012 | 24 | 8 | 16 | 16 (8) | 0 | 8,140 |
| ov013 | 16 | 7 | 9 | 9 (5) | 0 | 6,216 |
| ov014 | 33 | 5 | 28 | 28 (21) | 0 | 9,268 |
| ov015 | 72 | 33 | 39 | 39 (35) | 0 | 11,364 |
| ov016 | 78 | 22 | 56 | 56 (37) | 0 | 24,408 |
| ov017 | 55 | 16 | 39 | 39 (26) | 0 | 21,480 |
| ov018 | 29 | 20 | 9 | 9 (7) | 0 | 8,756 |
| ov019 | 44 | 12 | 32 | 32 (24) | 0 | 12,092 |
| ov020 | 49 | 17 | 32 | 32 (27) | 0 | 12,840 |
| ov021 | 38 | 20 | 18 | 18 (16) | 0 | 4,068 |
| ov022 | 15 | 2 | 13 | 13 (8) | 0 | 4,648 |
| ov023 | 3 | 2 | 1 | 1 (1) | 0 | 48 |
| **TOTAL** | | | **2152** | **2107 (1873)** | **45** | **1,160,352** |

## Per-module census — JPN

| Module | Total fn | Carved | Uncarved | Tractable (zero-dep) | REFUSE | Tractable bytes |
|---|---:|---:|---:|---|---:|---:|
| main | 4093 | 4045 | 48 | 22 (20) | 26 | 4,408 |
| ov000 | 143 | 58 | 85 | 85 (76) | 0 | 18,504 |
| ov001 | 6 | 2 | 4 | 4 (3) | 0 | 980 |
| **ov002** | **3772** | **2189** | **1583** | **1579 (1481)** | **4** | **924,196** |
| ov003 | 34 | 13 | 21 | 21 (15) | 0 | 19,072 |
| ov004 | 224 | 222 | 2 | 0 (0) | 2 | 0 |
| ov005 | 85 | 22 | 63 | 63 (51) | 0 | 27,296 |
| ov006 | 395 | 382 | 13 | 0 (0) | 13 | 0 |
| ov007 | 32 | 13 | 19 | 19 (18) | 0 | 2,060 |
| ov008 | 91 | 20 | 71 | 71 (53) | 0 | 31,216 |
| ov009 | 35 | 11 | 24 | 24 (19) | 0 | 12,228 |
| ov010 | 104 | 42 | 62 | 62 (56) | 0 | 22,696 |
| ov011 | 193 | 193 | 0 | 0 (0) | 0 | 0 |
| ov012 | 24 | 8 | 16 | 16 (8) | 0 | 8,140 |
| ov013 | 16 | 7 | 9 | 9 (5) | 0 | 6,216 |
| ov014 | 33 | 5 | 28 | 28 (21) | 0 | 9,268 |
| ov015 | 72 | 33 | 39 | 39 (35) | 0 | 11,364 |
| ov016 | 78 | 22 | 56 | 56 (37) | 0 | 24,408 |
| ov017 | 55 | 16 | 39 | 39 (26) | 0 | 21,480 |
| ov018 | 29 | 20 | 9 | 9 (7) | 0 | 8,756 |
| ov019 | 44 | 12 | 32 | 32 (24) | 0 | 12,092 |
| ov020 | 49 | 17 | 32 | 32 (27) | 0 | 12,840 |
| ov021 | 38 | 20 | 18 | 18 (16) | 0 | 4,068 |
| ov022 | 15 | 2 | 13 | 13 (8) | 0 | 4,648 |
| ov023 | 3 | 2 | 1 | 1 (1) | 0 | 48 |
| **TOTAL** | | | **2287** | **2242 (2007)** | **45** | **1,185,984** |

`ov011` is fully drained already (0 uncarved, both regions) — a
completed lane, not a wall.

## Rough size tiers (tractable candidates, both regions ≈ same shape)

| Tier | USA count | JPN count |
|---|---:|---:|
| ≤96B | 214 | 214 |
| 97-256B | 513 | 648 |
| 257-512B | 813 | 813 |
| 513-1024B | 340 | 340 |
| >1024B | 227 | 227 |

Not a tiny-leaf-only pool — over 1,600 tractable candidates per region
are >256 bytes, and 227 exceed 1KB (the largest single candidate seen,
`func_ov002_021c4bbc`, is 12,972 bytes and preflights clean). This
lane's average candidate is a full working function, not a stub — the
byte-yield per carve should be much higher than the c-match campaign's
leaf-function tier.

## Code-% projection

Current function-byte coverage (measured the same way the ~49% figure
in `AGENTS.md` was derived — carved bytes / total `kind:function` bytes
across main + every overlay):

| Region | Total fn bytes | Carved now | Now % | + tractable | Projected % |
|---|---:|---:|---:|---:|---:|
| USA | 2,368,852 | 1,177,928 | 49.7% | +1,160,352 | **98.7%** |
| JPN | 2,368,852 | 1,152,296 | 48.6% | +1,185,984 | **98.7%** |

If the tractable pool ships at anywhere near its preflight-clean rate,
this closes almost the entire remaining USA/JPN gap in one resumed
lane, leaving only the ~90 confirmed `C-absorbed` REFUSEs (and whatever
the actual whole-function assemble step turns up beyond the data
preflight — see Caveats) as the residual wall.

## Caveats — what this census does NOT confirm

1. **The data preflight is necessary, not sufficient, for a successful
   carve.** `asm_escape --whole-function` still has to assemble the
   original disassembly with `mwasmarm` and byte-verify it against the
   delinked `.o` — a wine-dependent step this brief deliberately never
   ran (scope was read-only / wine-free where possible). Historically
   (the b467-469 drain, and every `batch_carve` wave since) the
   preflight-clean → successful-carve conversion rate has been very
   high for whole-function ships (it's a re-assembly of the *original*
   bytes, not a compiler-match problem), but this brief did not
   re-confirm that rate against a live gate.
2. **REFUSE = C-absorbed was 100% this round, but is not the tool's
   only failure mode by design** — `OFFSET` and `MISADDRESSED` exist in
   `asm_escape.py`'s own verdict space and could appear on a future
   sweep (new candidates, different modules) even though none did here.
3. **`--min-addr` was bypassed by construction**, not "set correctly
   per module" — this census reads each module's own `symbols.txt`
   directly rather than calling `batch_carve.py --dry-run` (which still
   defaults to the documented `0x02234000` trap), so there is no
   analogous guard to misconfigure. A future *carving* brief that
   drives `batch_carve.py` directly still needs to pass the right
   `--min-addr` (0, or the module's true base) per invocation.
4. **Byte counts are per-function `.text` size only** — they don't
   account for any `kind:data` bytes the campaign would still need to
   carve alongside (though the whole point of A-aligned/B-gap
   candidates is that their data is *already* carved or falls in an
   already-linkable gap, so this should be small).

## Verdict

**Yes — resume the mechanical USA/JPN drain.** This is not a depleted
lane; it looks paused. The single highest-leverage move is **`ov002`**
(1,447-1,583 uncarved, ~98-99.7% tractable, ~77-78% of all tractable
bytes) — a `batch_carve.py --overlay ov002 --version usa` (and `jpn`)
run with `--min-addr 0` (NOT the default) would be the natural next
brief. `ov004` and `ov006` are the opposite case: 100% of their small
uncarved residue (2 and 13 functions respectively) is a confirmed
`C-absorbed` wall — skip them, they're not resumable without a
different technique (the kind:data absorption pattern, not a carve
issue).

## Final state

No files changed except this doc + the regenerated research index —
per the brief's read-only scope, `git status` shows nothing else.
