# cm-data-inference-14 — data wave 14

2026-07-27. Finishes the `src/overlay004/data/` pool wave 13 started: the
17 largest candidates were investigated there; this wave covers the
remaining smaller ones (32 bytes and below).

## A correction from wave 13, made before this wave started

Wave 13's own report claimed `data_ov004_02206760` (an AES Td2 table) was
investigated, documented, and shipped — but checking out this wave's
branch fresh from merged `main` showed the file still held its original
`unsigned char[1024]` content. The commit that shipped as PR #1383 never
actually contained the edit for that one file, out of the 6 it claimed.
An omitted edit is byte-identical to a correct no-op, so `ninja sha1` and
`gate3.py` both passed without ever exercising the claim — nothing about
the gate could have caught this.

Fixed as the first commit on this wave's branch: re-extracted the 1024
bytes via script, verified round-trip byte-exactness before writing,
rebuilt, and confirmed `ninja sha1` PASS with the retype actually in
place this time. `docs/research/data/cm-data-inference-13-2026-07-27.md`
and `docs/queue/claude-scaffolder.md` both carry dated correction notes
(the original text is kept, not rewritten, matching this campaign's
practice for the wave-12 census correction). See the session's
`feedback_claimed-change-was-never-written` note for the general lesson:
before writing a commit message or doc claiming "shipped N files," check
`git diff --stat` against the claim, not just memory of intending to edit
each one.

## Where this wave's count came from

Re-ran the same recursive census wave 13 used
(`grep -rlE "^(static )?(const )?unsigned char data_[0-9a-zA-Z_]+\[[0-9]+\] = \{" --include="*.c" src/main src/overlay*`)
fresh against merged `main`: **60** total project-wide matches (down from
66 at wave 13's start — the 6 files it actually retyped, once the AES fix
above is included, all correctly dropped out). Of those, **35 are in
`src/overlay004/data/`**, of which **11 were already settled by wave 13**
(9 confirmed CORRECTLY OPAQUE ARM32-code-as-data instances, 1 WEAK decline,
1 kept-as-is with a comment fix) — leaving **24 genuinely fresh
candidates, all 8–32 bytes**, not the 25 the wave-13 doc estimated (the
AES fix retiring `02206760` from the flat-glob count accounts for the
difference). All 24 were dispatched this wave.

## Result: 24 of 24 STRONG — a very different profile than wave 13

Where wave 13's 17-item batch (2280–40 bytes) skewed heavily toward real
compiled ARM32/Thumb code misclassified as data (9 of 17), this wave's
24-item batch (32 bytes and under) is **100% genuine structured data** —
every single symbol shipped. This is not a coincidence of the numbers;
it reflects a real structural difference in *where* the two batches sit.
Wave 13's large candidates clustered in the `0x021e2xxx`–`0x021ffxxx`
`.rodata`/`.text`-adjacent band, exactly the address range a separate,
pre-existing research thread (`ov004-rodata-misclassification-survey.md`
and siblings) had already flagged as containing linker-veneer-suppression
code claimed as opaque `.rodata` for build reasons unrelated to data
shape. This wave's smaller candidates sit entirely in ov004's genuine
`.data` section (`0x02209aa0`–`0x0220b500`) plus one `.rodata` outlier —
real initialized game data, not code masquerading as data. A lower or
higher hit rate than a prior wave is a property of which population got
sampled, not of investigation quality; this wave's 100% and wave 13's 35%
are both correct reports of two different pools.

### String families shipped (18 of 24)

- **"Common dialog" trio** (`0220a12c`/`0220a14c`/`0220a16c`, 32 B each):
  a concrete instance (`dialog_unite01`) plus two sprintf templates
  (`dialog_base%02d`, `dialog_unite%02d`), all three used back-to-back in
  one function (`func_ov004_021d8798`) via `OS_SPrintf`. Distinct from
  wave 13's `/Duel2D/MOBJ/edit_*` family despite address proximity to
  `0220a20c` — verified from actual bytes each time, not inferred from
  proximity (the proximity lead was explicitly wrong for all three).
- **MOBJ asset-path family, further members** (`02209aec`/`02209b08`
  "WF/WL_Icons"; `02209c2c`/`02209c70`/`02209c8c`/`02209ca8`/`02209cc8`/
  `02209ce8`/`02209d10`/`02209d30`/`02209d68`, various `/Duel2D/MOBJ/*`
  paths): continues wave 13's `/Duel2D/MOBJ/*.LZ5bg` family. Several are
  **genuine duplicate strings** at independent addresses/consumers —
  `02209c70`/`02209d30` both "chr_NTj.LZ5bg" (two unrelated call sites);
  `02209ce8`/`02209d68` both duplicate wave 13's shipped `0220a270`;
  `02209cc8`/`02209d10` both duplicate wave 13's shipped `0220a250`. Each
  duplicate claim was independently re-verified against the raw ROM bytes
  before being trusted (one, `02209c70`, was specifically double-checked
  given how coincidental it looked — confirmed genuine, not an error).
  Five of these (`02209c70`/`_c8c`/`_ca8`/`_cc8`/`_ce8`) are sibling
  category-label strings sharing one function's literal pool
  (`func_ov004_021cced8`), independently corroborated by a separate prior
  research doc (`docs/research/retriage/Ov004Ov006DeepR8.md`).
- **WiFi asset-path family** (`02209b9c`/`02209bb8` "anime_musen1/2";
  `02209e10`/`02209e88` "bg_ue_musen"/"bg_sita1a"): a parallel
  `/WiFi/*.LZ5bg` family, same structure as the MOBJ family but for
  WiFi-mode assets, each with a real consumer taking its address.
- **`02209f88`** ("game_level", 12 B): a named config/struct-field key,
  not an asset path — one of 5 sibling keys spaced 0x28 bytes apart in a
  repeated `func_02033d3c(&field, key, value)` call pattern; the other 4
  keys remain opaque, a lead for a future wave.
- **AOSS Wi-Fi pair** (`0220a2f8` "MELCO", `0220a300` "ESSID-AOSS"): the
  default vendor name/SSID pair for Buffalo/Melco's AOSS one-touch Wi-Fi
  setup. Both have **already-matched, byte-verified consumers** —
  `strlen`/`memcmp`-equivalent C functions called directly on them in
  `Net_SerializeParams` — the strongest evidence tier this campaign uses,
  stronger than most of wave 13's own shipped strings. Also corrects a
  stale cluster-level "writable `void *` singleton" guess from
  `Ov004Ov006DataTables.md`'s "Category 6" survey, which had also
  mis-guessed wave 13's `0220a2a0` the same way.

### Non-string retypes (6 of 24)

- **`02209ac0`** (20 B): a NULL-terminated function-pointer dispatch table
  (4 real, still-unmatched functions + NULL). Already has a real,
  in-tree C consumer (`func_ov004_021cb518.c`) proving the exact shape —
  indexes by a runtime counter, calls if non-NULL, treats NULL as
  sequence-end.
- **`0220a0ac`** (16 B): the same dispatch idiom, 3 functions + NULL,
  consumed via the documented cross-overlay `data_021040ac+0xb6c`
  pattern (`docs/research/data/FunctionPointerTables.md` §10) — already
  shipped identically for ov006 in `cm-data-inference-8`
  (`data_ov006_021cbb50.c`). Used the identical `extern char` + cast
  recipe as that precedent.
- **`02200de8`** (12 B, the batch's one `.rodata` outlier): a
  `{unsigned int a, b, c;}` struct, proven by an already-matched, real
  consumer (`func_020822c8`) whose own parameter type is exactly that
  shape (`triple_020822c8_t` in `src/main/func_020822c8.c`) — direct
  consumer-type proof, not inference. Kept `const` (ground truth
  `.rodata`, unlike every other file this wave which is `.data`).

All byte content generated via a Python script reading
`extract/eur/arm9_overlays/ov004.bin` directly (file offset = VA −
`0x021c9d60`), then independently re-verified in one consolidated pass
against every agent's proposed content before any file was written — a
belt-and-suspenders check on top of the never-hand-transcribe rule, given
this wave's scale (24 files at once) and the wave-13 lesson about
claims not matching the actual diff.

## Gate

`ninja sha1` (EUR) PASS on the first attempt with all 24 files (plus the
AES-table correction) in place. Full 3-region `python tools/gate3.py
--scope all`: first attempt caught a real, expected failure —
`docs/research/README.md` was stale (this wave's new research doc hadn't
been indexed yet), exactly the "regenerate before gate, not concurrently"
lesson from wave 11. Fixed with `python tools/generate_research_index.py`
and re-ran: PASS (`[eur]`/`[usa]`/`[jpn]` SHA1 individually confirmed;
pytest 3111 passed, 15 skipped, 63 subtests). USA/JPN are unaffected by
construction (unprefixed `src/overlay004/data/*.c` compiles EUR-only).

`Named-struct`: 44,680 → 44,728 (+48, exactly the 3 struct/typedef-array
files this wave: `02209ac0` 20 B + `0220a0ac` 16 B + `02200de8` 12 B —
`progress.py` buckets any file-scope array whose element type isn't a
bare primitive keyword here, which is why the two `void*`-typedef
pointer tables count alongside the one real struct). `Typed-array`
(the superset metric, any file-scope array regardless of element type):
79,676 → 79,664, a small net decrease that doesn't cleanly follow from
this wave's own changes alone — likely an interaction with the wave-13
AES-table correction landing on the same branch, not fully traced down
in the time available. Noted rather than glossed over: the gate (SHA1 +
pytest) is the authoritative correctness signal here and is fully green;
this is a secondary reporting metric with known heuristic edge cases
(see `q-metric-extern-guard`/`q-metric-singleton-struct-gap`, two prior
bugs in this same metric).

## Hit rate

24/24 investigated, 24/24 shipped (100%) — see the population-difference
explanation above for why this isn't comparable to wave 13's 35%.

## What's left

This wave closes out every candidate the corrected recursive census found
in `src/overlay004/data/` as of this wave's start. A fresh census re-run
after this wave's merge should be the first step of any continuation, per
this campaign's standing count-derivation rule — do not assume the pool
is empty without re-deriving it. Open leads surfaced but not investigated
this wave: the other 4 sibling category-label strings referenced by
`data_ov004_02209f88`'s consumer (`data_ov004_0220a010`/`_01c`/`_028`/
`_034`, spaced 0x28 bytes apart in the same struct-field-list pattern).
