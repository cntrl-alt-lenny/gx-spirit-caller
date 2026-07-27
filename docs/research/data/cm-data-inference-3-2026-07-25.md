# cm-data-inference-3: data wave 3 (2026-07-25)

Continuation of `cm-data-inference-2` (11/16 shipped, 69%). This wave
widens the same no-oracle structural-inference method to the remaining
opaque `const unsigned char data_X[N]` blobs across `src/main` and,
for the first time, overlays beyond ov002 (ov005, ov006, ov011,
ov012, ov013).

**Result: 24 blobs investigated (12 main, 12 overlay), 14 shipped
(58%)** across main + 4 overlay modules, plus 2 bonus siblings found
mid-investigation (same struct shape, same consumer, discovered for
free). 4 more blobs reached STRONG evidence but were deliberately NOT
shipped this wave — filed as focused follow-up queue items instead of
forced or silently dropped.

## A correction to the item's own starting count

The item text said "65 opaque blobs remain in `src/main` and 148
across `src/overlay*`" (213 total). A live scan (`grep -rlE
"^(static )?(const )?unsigned char data_[0-9a-zA-Z_]+\[[0-9]+\] = \{"
src/main/*.c src/overlay*/*.c`, cross-checked against known-shipped
symbols to rule out false positives from stale comments) found **140**
currently opaque blobs project-wide (40 main, 100 overlay) before this
wave started. Consistent with this campaign's recurring pattern of
queued counts drifting from reality (q-itcm-feeder-fix, the prototype
bank's 3,892-vs-3,793 count, etc.) — reported as measured, not forced
to match the stated estimate.

## Method: parallel investigation, then direct implementation

24 parallel read-only `Explore` agents, one per blob (matching wave
2's proven pattern): exhaustive consumer search (symbol-name grep
across all regions + `libs/`, independently cross-checked against the
relevant `relocs.txt` by address range so a raw-pointer consumer that
never names the symbol textually can't hide), classify each access as
fixed-offset (weak) or computed-stride (`base + idx*STRIDE`, strong),
sanity-check for misclassified ARM32 code, and report a verdict —
never write code. Candidates were the top 12 main + top 12 overlay
blobs by declared size (main: excluding 2 already-decided negatives
from wave 2's own probe; overlay: spread deliberately across modules
beyond ov002 to test wave 2's own hypothesis that other overlays carry
undiscovered families).

Implementation (this session, not parallelized): for every STRONG
verdict, parse the byte content directly out of the **already-
committed** literal via script (never hand-transcribed, never
re-extracted from the ROM), re-render as the proposed type, and
compile-verify per file before moving to the next. Final confirmation:
one 3-region `gate3.py --scope all` run across all 14 shipped files
together.

## Investigation results — all 24, not just the shipped ones

| Blob | Module | Size | Verdict | Shape |
|---|---|---:|---|---|
| `data_020bead0` | main | 136 B | STRONG, shipped | 34×`int`, display-order remap; sole consumer unmatched `.s` |
| `data_020bea2c` | main | 164 B | STRONG, shipped (partial) | 20×`int` prefix (80 B) + 84 B raw tail (no consumer for the tail) |
| `data_020b4908` | main | 256 B | ALREADY-OPTIMAL | single-byte-stride LUT (index unscaled) — same class as wave 2's `data_020c32f8` |
| `data_020bff80` | main | 5904 B | WEAK-NO-SHIP | 2 fixed-offset reads only; independently reconfirms wave-1 probe's own prior verdict |
| `data_020c1f80` | main | 4096 B | WEAK-NO-SHIP | same consumer/shape as `data_020bff80`, same prior-probe reconfirmation |
| `data_020bf280` | main | 3328 B | WEAK-NO-SHIP | 1 fixed-offset consumer; resolved a previously-flagged "pointer anomaly" as a false positive (smooth numeric ramp crossing a plausible-address byte window) |
| `data_020b4b1c` | main | 184 B | WEAK-NO-SHIP | genuinely variable-length, length-prefixed record chain (28 records, exact 184-byte fit verified by simulation) — no uniform stride exists to type |
| `data_020c36d4` | main | 128 B | ALREADY-OPTIMAL | exact ASCII `toupper()` table, stride-1 |
| `data_020c3654` | main | 128 B | ALREADY-OPTIMAL | exact ASCII `tolower()` table, stride-1 |
| `data_020b4680` | main | 96 B | STRONG, **deferred** (carve) | evidence covers only first 32 of 96 bytes (16×`u16` nibble-spread LUT) |
| `data_020c319c` | main | 92 B | STRONG, **deferred** (carve) | mid-record split, true base is 4 bytes earlier in an unclaimed gap — mirrors `data_020b52d8` precedent exactly |
| `data_021015e4` | main | 272 B | STRONG, **deferred** (complex) | 30-field single struct instance (not an array), 6 function-pointer fields |
| `data_ov002_022c86b8` | ov002 | 744 B | STRONG, shipped | 93×{u32 cardId, void* handler} — 6th/7th/8th member found this wave of wave-2's 8-table family |
| `data_ov002_022c9250` | ov002 | 696 B | STRONG, shipped | 87×{u32 cardId, void* handler} — same family |
| `data_ov002_022c9038` | ov002 | 536 B | STRONG, shipped | 67×{u32 cardId, void* handler} — same family |
| `data_ov002_022c819c` | ov002 | 432 B | STRONG, shipped | 27×16B struct, 2 function-pointer fields — independent of the 8-table family (different helpers entirely) |
| `data_ov013_021cb7b4` | ov013 | 360 B | STRONG, shipped (partial) | 6×4B message-lookup prefix (24 B) + 336 B raw tail (no consumer for the tail; overlay013's first-ever data-inference touch) |
| `data_ov002_022bdfec` | ov002 | 288 B | STRONG, shipped | 6×24 genuine 2D `short` array (row AND column both runtime) — independent of the 8-table family, and corrected a wrong access-shape claim in existing project docs |
| `data_ov006_021cdf88` | ov006 | 224 B | STRONG, shipped | 8×28B struct, 10 fields, cross-region verified (EUR/USA/JPN) — overlay006's first-ever data-inference touch |
| `data_ov006_021cb518` | ov006 | 220 B | WEAK-NO-SHIP | pointer only ever passed through generic type-erased engine plumbing, never dereferenced against this specific blob; found a promising sibling lead (see below) |
| `data_ov005_021b1618` | ov005 | 204 B | STRONG, shipped | 102×[2]byte Shift-JIS kana/text table — overlay005's first-ever data-inference touch; byte order is load-bearing (must stay `unsigned char[102][2]`, NOT `unsigned short[102]`) |
| `data_ov012_021cc1e8` | ov012 | 160 B | STRONG, shipped | 5×8 `void *` array — overlay012's first-ever data-inference touch; all 7 distinct pointer targets still uncarved, shipped via raw literal-address casts (empirically confirmed byte-identical, see below) |
| `data_ov011_021d3060` | ov011 | 152 B | STRONG, **deferred** (ambiguous) | genuine contradiction: the proven index range overlaps 2 rows independently proven to be pointers, not table data — overlay011's first-ever data-inference touch, needs human judgment on the boundary |
| `data_ov006_021cc588` | ov006 | 144 B | STRONG, shipped | 12×12B struct, 4 fields; found 2 more sibling tables sharing the exact same consumer code (bonus ships, see below) |

**2 bonus ships**, found (not separately dispatched — the same
investigating agent for `data_ov006_021cc588` traced its shared
consumer to two more differently-sized tables using the identical
12-byte stride, corroborated by each one's own hard-coded loop bound
matching its own size exactly):

| Blob | Size | Shape |
|---|---:|---|
| `data_ov006_021cc478` | 132 B | 11×12B, same `RecordOv006_021cc588` struct |
| `data_ov006_021cc0f4` | 36 B | 3×12B, same struct |

## Shipped: 14 total

`data_020bead0`, `data_020bea2c`, `data_ov002_022c86b8`,
`data_ov002_022c9250`, `data_ov002_022c9038`, `data_ov002_022c819c`,
`data_ov013_021cb7b4`, `data_ov002_022bdfec`, `data_ov006_021cdf88`,
`data_ov005_021b1618`, `data_ov012_021cc1e8`, `data_ov006_021cc588`,
`data_ov006_021cc478`, `data_ov006_021cc0f4`.

All zero-risk from a consumer-regression standpoint: every single
consumer touching any of these 14 blobs is still an unmatched `.s`
file — unlike wave 2's `data_020b4bd4` case, nothing needed rewriting
from pointer-cast to struct-member access, so there is no analog of
that wave's caught-and-reverted regression to report here. Every byte
value in every shipped file is a script-parsed reinterpretation of the
literal already committed to the tree, round-trip verified before
writing, never hand-transcribed or re-extracted from the ROM.

### The `data_ov012_021cc1e8` raw-literal-cast finding

This blob's 7 distinct pointer targets (`data_ov012_021cc2cc` etc.)
have no dedicated source file yet — they sit in an unclaimed `.data`
gap, and `relocs.txt` shows the ORIGINAL rom used real relocations to
reach them (unlike the ov002 family's `handler` field, whose established
raw-literal-cast convention was justified by the *opposite* observation
— that field's original had *no* relocations at all). Rather than block
this ship on carving 7 unrelated symbols first, emitted the 5×8 array
as raw `(void *)0x...` literal casts and verified directly:
`arm-none-eabi-objdump -s -j .rodata` on the compiled `.o` shows the
`.rodata` bytes are an EXACT match for the original 160-byte literal
(`ccc21c02 b8c21c02 ...` repeated 5×), and `objdump -r` shows **zero**
relocations against `.rodata` (only irrelevant `.debug_info` relocs).
A raw literal and a resolved relocation bottom out at the same 4 bytes
once linked — confirmed empirically for this file, not just asserted.

## Deferred: 4 blobs, all evidence-complete, all filed as follow-up queue items

Not shipped this wave, each for a specific, documented reason — none
silently dropped:

1. **`data_020b4680`** (main) — STRONG evidence for only 32 of 96
   bytes; the remaining 64 bytes have zero consumer evidence. Requires
   an actual symbol carve/split (not a same-symbol struct+raw-tail
   like `data_020bea2c`/`data_ov013_021cb7b4` below, because the
   evidenced portion is a *clean* prefix that would need its own
   symbol, not a struct member sharing the original boundary). Filed
   as `cm-data-020b4680-carve`.
2. **`data_020c319c`** (main) — mid-record split: the true table base
   sits 4 bytes before this symbol, inside an unclaimed `delinks.txt`
   gap with no owning file. Structurally identical to the already-
   shipped `cm-data-020b52d8-carve` precedent. Filed as
   `cm-data-020c3198-carve`.
3. **`data_021015e4`** (main) — STRONG evidence, but for a 30-field
   **single struct instance** (a static/default object used by a
   constructor/destructor pair), not an array of N repeating records
   like every other candidate this wave or in prior waves. 6 of the 30
   fields are function pointers, proven by a real call site's argument
   types. Technically shippable, but meaningfully higher implementation
   risk (getting mwcc's exact struct layout/padding right for a complex
   mixed-type single instance) than this wave's array-shaped ships —
   deferred for careful, unhurried treatment rather than rushed into
   this batch. Folded into `cm-data-inference-4` as a named priority
   candidate (full struct proposal already in the investigating agent's
   report, preserved via git history / this doc).
4. **`data_ov011_021d3060`** (ov011) — STRONG evidence for an 8-byte
   row table, but the consumer's own mathematically-reachable index
   range (0-15) overlaps 2 rows independently proven via `relocs.txt`
   to be real pointers, not table data — a genuine contradiction, not
   a clean case. The investigating agent explicitly recommended against
   a script-driven retype. Folded into `cm-data-inference-4` as a named
   candidate needing human judgment on the record-count boundary
   (there's also an unconfirmed lead that the true array starts 1 byte
   earlier, at a still-uncarved sibling symbol).

## Negative results: 8 blobs, correctly declined

`data_020b4908` (single-byte-stride LUT), `data_020bff80`/
`data_020c1f80` (both re-confirm a wave-1 probe finding independently),
`data_020bf280` (resolved a documented "pointer anomaly" as a false
positive), `data_020b4b1c` (a genuinely variable-length record chain —
no uniform stride exists, confirmed by simulating the traversal
against the real bytes), `data_020c36d4`/`data_020c3654` (exact
toupper/tolower tables, already stride-1-optimal), `data_ov006_021cb518`
(pointer only ever passed through generic engine plumbing, never
dereferenced against this specific blob's own bytes).

## Sibling leads found, not investigated (for `cm-data-inference-4`)

- **`data_ov006_021cb5f4`** — immediately adjacent to
  `data_ov006_021cb518`, in an unclaimed `.rodata` gap, already
  indexed with a genuine runtime `int` stride by a real, already-
  matched C consumer (`func_ov006_021c148c.c`). No dedicated `.c` file
  exists yet.
- **`data_ov006_021cddec`** — referenced only as an `.extern` in
  `func_ov006_021c3384.s` (the same loop that drives the already-
  shipped `data_ov006_021cdf88`), shows its own stride-2 `int16`
  computed-index evidence. No dedicated `.c` file exists yet.

## A real bug caught by the full gate (not by per-file compilation)

Individually compiling each file clean is necessary but NOT sufficient
— it only proves the `.c` is syntactically valid and produces the
right bytes *in isolation*, not that it lands in the right linker
section. The first `gate3.py --scope all` run on the full batch of 14
came back **GATE FAIL, diverging region(s): eur** — 87.6 million
differing bytes (out of ~134 MB), first divergence at byte 50 (inside
the ROM header itself, far from any of the 14 changed symbols' own
addresses). That byte-count and location are the signature of a
*section placement* shift cascading through the entire downstream
layout, not a localized content bug.

Root cause: 4 of the 14 files (`data_ov006_021cdf88`,
`data_ov006_021cc588`, `data_ov006_021cc478`, `data_ov006_021cc0f4`)
originally used a bare `unsigned char data_X[N]` declaration (no
`const` — a different naming/carve convention, "D-2 wave 2"/"Cluster
D-2", from the `const`-everywhere "Cluster C Pattern 1" files the rest
of this wave touched). Their retyped versions were written with
`const` added by copy-paste habit from the majority-`const` sibling
files, moving all 4 from whatever section dsd's original classifier
placed them in to a `const`-qualified one mwcc treats differently —
shifting everything laid out after them and cascading through the
rest of the linked ROM.

**Fix: match the original's `const`-ness exactly, always** — verified
systematically across all 14 files (`git show HEAD:<file> | grep
'^const '` vs the new top-level declaration), not just the 4 known
offenders, in case of a second instance. None found. Re-ran `ninja
sha1` for EUR alone first (fast, single-region) to confirm the fix
before paying for a full 3-region gate again: **OK**. This is now a
standing checklist item for any future retype in this campaign, not
just a one-off fix — `const`-ness (and, checked separately, `static`)
must be diffed against the original declaration for every file in a
batch, not assumed from a sibling file's convention.

## Verification

Every shipped file individually compiled clean
(`ninja build/eur/src/.../data_X.o`) before moving to the next — this
step alone would NOT have caught the `const` bug above (see that
section). Final confirmation, after the fix: 3-region `python
tools/gate3.py --scope all` (EUR/USA/JPN SHA1 + full pytest) —
**GATE PASS** across all 14 files together.

## Metric impact

`Named-struct` bytes (`python tools/progress.py --version eur`,
verified via a real `git stash`/pop before-vs-after comparison, not
assumed): **38,652 -> 41,956 bytes (+3,304, +8.5%)**. Smaller than wave
2's own +337.6% jump because a larger fraction of this wave's ships are
primitive-element flat arrays (`int[]`, `short[6][24]`,
`unsigned char[102][2]`, `void *const[5][8]`) which this project's own
metric design (`q-data-metric-fix-v2`) deliberately excludes from
`Named-struct` — real readability improvements that register under
neither current metric, same caveat wave 2's own writeup already
documented for its flat-array ships.
