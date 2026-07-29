# cm-data-inference-13 — data wave 13

2026-07-27. First wave against a genuinely new pool: `src/overlay004/data/`,
an overlay the `cm-data-inference` campaign had never mechanically censused
before wave 12's "exhausted" conclusion was corrected (see
`docs/queue/claude-scaffolder.md`'s dated correction section and the
[[feedback_census-must-be-recursive-not-flat-glob]] memory note).

## Where the pool count came from, and how it was derived

Every wave's census (2 through 12) used a **flat, one-level glob**:
`grep -rlE "..." src/main/*.c src/overlay*/*.c`. This pattern only matches
files directly inside `src/main/` or `src/overlayNNN/` — it silently never
descends into nested subdirectories. Ten such subdirectories exist
(`src/main/data/`, and `src/overlay{002,004,005,006,007,008,009,013,021}/data/`),
and none of them were ever reached by the campaign's own census regex.

Re-running the same pattern **recursively** (`grep -rlE "..." --include="*.c"
src/main src/overlay*`) found **66** current opaque `unsigned char[N]`
matches, not 24 — a net of **42 fresh candidates, all inside
`src/overlay004/data/`**. This count was independently re-derived this wave
(not taken on faith from the queue entry's own "63" estimate, which was
itself already a correction of this session's own first flat-glob count) —
both landed in the same neighborhood but the 42/66/24 figures above are the
ones actually used to scope this wave's work, verified directly against a
fresh `grep` run at wave-13 start.

Per the standing size-first instruction, this wave dispatched investigation
agents against the **17 largest** of the 42 fresh candidates (2280 bytes
down to 40 bytes), leaving 25 smaller candidates (32 bytes and below) for a
future wave. See "What's left" below.

## A correction to this wave's own framing: not all 17 were genuinely unseen

Two of the 17 dispatched symbols — `data_ov004_021ff0b4` and
`data_ov004_02206760` — turned out to already have prior investigation in
`docs/research/cm-data-inference-2-2026-07-25.md` (wave 2, 2026-07-25), which
did a manual/ad hoc sample of overlay blobs outside the numbered census's
own flat-glob scope. Both agents found and cited this prior work rather than
re-discovering it blind, and in both cases used it as a starting point for
deeper, independently re-derived verification (full relocs.txt sweeps and,
for `02206760`, an original disassembly proving the STRONG verdict wave 2
had left as "deferred").

Separately, **9 of the 17** — `021e2efc`, `021e3128`, `021e3500`, `021e3de8`,
`021e3f60`, `021e87ac`, `021f4880`, `021f4a40`, `021ff0b4` — turned out to be
cataloged by name in `docs/research/data/Ov004Ov006DataTables.md`'s
"Category 2 — ARM32 veneer blobs" list, and/or in the separate
`ov004-rodata-misclassification-survey.md` / `ov004-rodata-pointer-targets.md`
research thread (briefs ~141-182, mwldarm interworking-veneer suppression —
a different concern from this campaign's C-type inference). **None of that
prior work had run this campaign's own STRONG/WEAK/CONTRADICTION/CORRECTLY
OPAQUE method against these symbols** — it characterized the bytes as
"ARM32 code" but never independently verified consumers, boundaries, or
(for several) even fully disassembled the content. Every one of the 17
reports below re-derived its evidence from primary sources (symbols.txt,
delinks.txt, relocs.txt, and either raw ROM bytes or a from-scratch
disassembly) rather than trusting the prior docs' characterization.

**Takeaway for future waves**: "never touched by the numbered census" is
not the same claim as "nobody has ever looked at this data." This project
has at least one other active research thread (the ov004 veneer-suppression
work) whose scope overlaps this campaign's territory without using this
campaign's method. Check `docs/research/` broadly, not just prior
`cm-data-inference-N` docs, before calling something fresh.

## The "Category 2 — ARM32 veneer blob" class: CORRECTLY OPAQUE, do not retype

**9 of 17** investigated symbols are real, compiled ARM32/Thumb machine code
(complete functions with prologues/epilogues/branches, plus embedded literal
pools of pointer constants) that dsd's automatic classification left tagged
`kind:data(any)` because the original ROM's static reachability analysis
never traced a call path to them:

| Symbol | Size | Structure found |
|---|---:|---|
| `data_ov004_021e3500` | 2280 B | ARM32 code + pools (confirmed prior wave) |
| `data_ov004_021ff0b4` | 2096 B | 7 push-prologues, 10 pop-epilogues, 16 `BX LR`, 24 `BL`; corroborated by wave 2 |
| `data_ov004_021e87ac` | 704 B | ARM32 code + pools (confirmed prior wave) |
| `data_ov004_021e3128` | 268 B | 1 ARM function (63 words) + 4-word literal pool, contiguous with `021e2efc` |
| `data_ov004_021e2efc` | 556 B | 3 ARM functions + 3 interleaved literal pools, fully mapped (556/556 B accounted) |
| `data_ov004_021e3f60` | 500 B | 3 ARM code units + 3 literal pools, fully mapped |
| `data_ov004_021f4880` | 448 B | ARM32 code + pools (confirmed prior wave) |
| `data_ov004_021e3de8` | 376 B | code + 5 code blocks (60/32/32/80/12/116 B, no uniform stride) + 11-word pool |
| `data_ov004_021f4a40` | 152 B | ARM32 code + pools (confirmed prior wave) |

Every one of these:
- Has zero C-level consumers anywhere in `src/` or `libs/`, any region.
- Has relocations that are internal literal-pool loads (`kind:load`), never
  `arm_call`/`thumb_call` targeting the blob and never an externally-indexed
  pointer-table pattern.
- Fully disassembles to coherent ARM32/Thumb control flow with no leftover,
  unexplained bytes.
- Sits in the same `0x021e2xxx`–`0x021ffxxx` VA band already flagged by the
  separate `ov004-rodata-misclassification-survey.md` research thread.

**Do not reclassify these to `kind:function`.** Brief 154 (PR #581) directly
tested this on the structurally-identical sibling `data_ov004_021e2efc` —
a pure `kind:` metadata flip, zero byte changes — and it **broke EUR
`ninja sha1`**. `data_ov004_021e2efc`'s own investigation this wave found
why the naive flip likely fails: it isn't one function, it's three
interleaved with literal pools, so a single `function(arm,size=0x0,unknown)`
tag misdescribes it regardless. A future, correctly-scoped code-recovery
brief (splitting each blob into its real function/pool sub-pieces) might
succeed, but that is decompilation work, not data-shape work, and stays out
of this campaign's scope.

**A load-bearing correction to the ov004 pointer-targets research**: several
of this wave's agents independently found and proved that large reference
counts cited for these blobs in `docs/research/ov004-rodata-pointer-targets.md`
(e.g. "151 refs", "360 refs", "17 callers") are **mirages** — ov002 and
ov004 are mutually-exclusive overlays sharing the same RAM address window
(never resident simultaneously), and `mwldarm`'s static linker sees both
modules' symbol tables at once. The cited "callers" are ov002's own,
already-matched functions whose addresses numerically fall inside ov004's
nominal range; they call each other, not into ov004. This should be treated
as a standing correction to that doc for any future reader.

## WEAK: `data_ov004_02206738` (AES Rcon table, 40 B)

Content is an exact, verified match for the standard AES round-constant
table (Rcon[1..10] = 1,2,4,8,16,32,64,128,0x1B,0x36), stored big-endian
per-word (not native ARM9 little-endian). The one real consumer is a single
fixed-offset load of the table's *base address* from inside a still-opaque
neighboring blob (`data_ov004_021ded69`) — no computed-stride or
runtime-indexed access is observable, because the enclosing function has no
symbol boundary yet. Falls short of STRONG on the method's own terms (no
loop bound, no bitmask, no indexed access in any readable consumer) despite
strong circumstantial/content evidence. Not retyped; a future wave that
carves the enclosing AES routine out of `data_ov004_021ded69` could revisit
this.

## STRONG — implemented this wave

All byte content generated via a Python script reading
`extract/eur/arm9_overlays/ov004.bin` directly (file offset = VA −
`0x021c9d60`, this overlay's `.text` base), per the permanent
never-hand-transcribe rule. All 6 files below are `.data` section per
`delinks.txt` ground truth (confirmed before writing any pointer field) —
so no `const` was added anywhere, matching each file's pre-existing
non-const declaration and this project's const-placement rule (`const`
would force a `.rodata` relocation and break the section match).

- **`data_ov004_02209f94`** (60 B) → `char[60]` string literal: the ESRB
  online-play notice, `"ESRB Notice: Game Experience May Change During
  Online Play"`. One real consumer (`relocs.txt`: `0x021d4188` loads its
  address).
- **`data_ov004_0220a20c`** (32 B) → `char[32]` = `"/Duel2D/MOBJ/edit_001n.LZ5bg"`.
- **`data_ov004_0220a250`** (32 B) → `char[32]` = `"/Duel2D/MOBJ/edit_%03dn.LZ5bg"`
  — a sprintf-style path *template* (literal `%03d` bytes), not a
  compile-time escape.
- **`data_ov004_0220a270`** (32 B) → `char[32]` = `"/Duel2D/MOBJ/edit_000n.LZ5bg"`.
  Its consumer (`0x021db528`) sits 4 bytes after `0220a250`'s own consumer
  (`0x021db524`) — the same caller loading both strings back to back.
  All three MOBJ strings share one asset family
  (`/Duel2D/MOBJ/edit_*.LZ5bg`); likely more siblings exist among the
  still-undispatched smaller candidates (see "What's left").
- **`data_ov004_02206760`** (1024 B) → `const unsigned int[256]`: the
  standard AES **Td2** inverse-cipher round table (verified byte-for-byte
  against an independently-computed reference table — not just pattern
  matched). Element count/stride proven directly from the raw consumer
  disassembly (the enclosing function is itself undecompiled, embedded in
  `data_ov004_021ded69`): explicit `LSL r3,r1,#2` (×4 stride) immediately
  preceded by `AND r1,r2,#0xff` (index masked to 0-255) before the indexed
  `LDR r5,[r1,r3]`. Sibling of the `02206738` Rcon table and 8 more
  `0x400`-spaced AES tables not yet individually carved.
- **`data_ov004_0220a2a0`** (88 B) → partial struct. `relocs.txt` proves
  exactly 2 of 88 bytes: offset+0x04 and +0x08 are pointers to this
  overlay's own matched thumb functions `func_ov004_021dbf48` (size 0x24)
  and `func_ov004_021dbf30` (size 0x18) — used as raw address-literal
  casts (not named refs), matching this project's established pointer-table
  convention (`data_ov022_021ab9a0`) regardless of section. A third reloc
  proves something else (still unmatched) holds this struct's own address,
  consistent with it being one entry of an uncarved dispatch table. The
  remaining 76 bytes have zero relocations and zero consumers; kept as
  explicit gap fields rather than guessed types, except two visibly non-zero
  `0x00001000` words (surfaced as plain `unsigned int`s so they aren't
  mistaken for part of the all-zero padding — semantics still unproven).

## Kept unchanged, comment-only fix

- **`data_ov004_02209fd0`** (64 B): genuine text — ASCII `"Wi-Fi"` followed
  by a Shift-JIS Japanese sentence and two further Shift-JIS fragments.
  STRONG evidence that it's text, but deliberately **not** converted to a
  `char[] = "..."` string literal: embedding raw Shift-JIS bytes in a
  quoted literal risks silent mis-transcoding by editors/git/the compiler's
  source-charset handling, for zero byte-layout benefit over the existing
  hex form. Old "D-2 scalar / shape=struct" header comment (a stale
  mechanical batch-carve tag) replaced with an accurate description; zero
  byte changes.

## Gate

`ninja sha1` (EUR) passed clean on the **first attempt** — no
rebuild-and-fix cycle, a direct result of script-generating every byte
value instead of hand-transcribing. Full 3-region `python tools/gate3.py
--scope all` PASS, also first attempt (`[eur]`/`[usa]`/`[jpn]` SHA1
individually confirmed; pytest 3108 passed, 15 skipped, 63 subtests
passed). USA/JPN are unaffected by construction — all 6 changed files are
unprefixed `src/overlay004/data/*.c`, which `tools/configure.py` compiles
EUR-only.

`Named-struct`: 44,592 → 44,680 bytes (+88, exactly `data_ov004_0220a2a0`
— the one struct-typed file this wave; the 4 string literals and the flat
`const unsigned int[256]` array are real readable-C but aren't
struct-shaped, so they don't move this specific metric). Current
`Typed-array`: 79,676 data bytes (1.67%) — no wave-12-end reading of this
sub-metric was recorded to diff against; reported as an absolute value
rather than a fabricated delta.

## Hit rate — and why it's not comparable to waves 2-12

17 investigated: 6 implemented (STRONG, 4 as strings + 1 flat array + 1
partial struct), 1 declined (WEAK), 1 kept byte-identical with a
comment-only fix, 9 confirmed CORRECTLY OPAQUE (compiled machine code, not
data at all). A **35% ship rate**, well below waves 8-12's 60-100% range —
exactly the "different, likely lower" profile the queue entry predicted,
for the reason it predicted: this pool was never pre-filtered by a
mechanical carve pass that already excluded the obviously-wrong candidates.
Nearly half the batch (9/17) being real machine code misclassified as data
is itself a notable, project-relevant finding, not a shortfall — see the
"Category 2" section above and its live cross-reference to the separate
veneer-suppression research thread.

## What's left

25 of the 42 fresh `src/overlay004/data/` candidates (32 bytes and smaller)
were not dispatched this wave. The three MOBJ-path-string siblings
(`data_ov004_0220a12c`, `_0220a14c`, `_0220a16c`, all 32 B, immediately
before `_0220a20c` in address order) are a strong lead for the same
"asset-path string family" pattern found this wave. **Re-derive the exact
remaining list fresh** rather than trusting this doc's or the queue's
size table — this campaign's own handed-down counts have been wrong every
wave so far, this one included.
