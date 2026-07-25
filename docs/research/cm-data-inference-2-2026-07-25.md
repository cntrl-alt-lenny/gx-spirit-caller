# cm-data-inference-2: widening the no-oracle data retype (2026-07-25)

Continuation of `cm-data-inference-probe` (2/6 shipped) and
`cm-data-020b52d8-carve` (the hardest of that probe's 6 landed). This
item widens the same structural-inference method — no `.inc` oracle,
just reading how real consumer code indexes an opaque blob — to (a)
the remaining opaque `const unsigned char data_X[N]` blobs in
`src/main` beyond the original 6, and (b) overlays, which no prior
probe had touched at all.

**Result: 16 blobs investigated (8 main, 8 overlay), 11 shipped
(69% hit rate)** — far above the original probe's 33%. `Named-struct`
bytes: **8,832 → 38,652 (+29,820 B, +337.6%)**. 3-region `gate3.py
--scope all` PASS.

## Method: parallel investigation, then parallel implementation

Two separate waves, matching this campaign's established
worktree-parallel pattern:

1. **Investigation** (16 parallel read-only `Explore` agents, one per
   blob): exhaustive consumer search (symbol-name grep + independent
   `relocs.txt` address-based cross-check, so a raw-pointer consumer
   that never names the symbol textually can't hide), classify each
   access as fixed-offset (weak) or computed-stride (`base +
   idx*STRIDE`, strong), and report a verdict — never write code.
2. **Implementation** (4 parallel worktree-isolated agents, batched by
   risk level): retype only the STRONG-evidence blobs, each
   independently verified (byte-identical `.rodata` per TU, `fastmatch`
   re-verification of any touched consumer, full `ninja sha1`).

Candidates were ranked by size within each corpus (main's remaining 35
opaque blobs beyond the original 6; all 98 overlay opaque blobs, none
previously probed) and the top 8 of each taken — a reasonable sample
given the effort per blob, not an exhaustive sweep of either corpus
(see *What's left* at the end).

## Investigation results — all 16, not just the shipped ones

| Blob | Size | Verdict | Shape |
|---|---:|---|---|
| `data_020c398c` (main) | 512 B | STRONG, shipped | 256×`u16`, ctype+toupper tables |
| `data_020c3754` (main) | 256 B | STRONG, shipped | 128×`u16`, ctype bitmask table |
| `data_020c2f80` (main) | 260 B | STRONG, shipped | 130×`s16`, arctan curve |
| `data_020c3084` (main) | 260 B | STRONG, shipped | 130×`s16`, arctan curve (octant) |
| `data_020c31f8` (main) | 256 B | STRONG, shipped | 128×`s16`; 1 consumer already matched C |
| `data_020b4bd4` (main) | 396 B | STRONG, shipped | 99×{u16,u16} struct, 2 matched consumers |
| `data_020c32f8` (main) | 724 B | **not retypeable** | sole consumer's index is computed but unscaled (stride=1) — already correctly typed |
| `data_020bed6c` (main) | 256 B | **not retypeable** | unrolled full-buffer memcpy feeding strlen/strcat, not record access; content looks like a scalar string constant |
| `data_ov002_022c357c` (ov002) | 19,488 B | STRONG, shipped | 812×6-word struct; 100%/100% reloc+symbol corroboration |
| `data_ov002_022be1ac` (ov002) | 4,632 B | STRONG, shipped | 193×6-word struct; 8 matched consumers, none needed changes |
| `data_ov002_022c9ad0` (ov002) | 2,208 B | STRONG, shipped | 276×{id,handler} struct |
| `data_ov002_022c89a0` (ov002) | 1,616 B | STRONG, shipped | 202×{id,handler} struct |
| `data_ov002_022c9508` (ov002) | 1,480 B | STRONG, shipped | 185×{id,handler} struct; 1 consumer already matched C |
| `data_ov004_021e3500` (ov004) | 2,280 B | **misclassified as data** | real ARM32 linker veneer stubs — code, not a record table |
| `data_ov004_021ff0b4` (ov004) | 2,096 B | **misclassified as data** | same veneer-blob class |
| `data_ov004_02206760` (ov004) | 1,024 B | STRONG, **deferred** | an AES T-table (part of a 10-table encrypt/decrypt set) — but its consumer lives entirely inside an unclaimed opaque-code region, no real TU to verify against |

## What shipped, and why each is safe

**6 main blobs** (`data_020c398c`, `data_020c3754`, `data_020c2f80`,
`data_020c3084`, `data_020c31f8`, `data_020b4bd4`): flat `short`/`u16`
scalar arrays and one 2-field struct. All bytes are exact
reinterpretations of the already-shipped, already-`ninja sha1`-verified
opaque literal — every retype script parsed the EXISTING committed byte
array and round-trip-verified before writing anything, never
re-extracted from the ROM and never hand-transcribed. `data_020c31f8`
and `data_ov002_022c9508` (below) were near-trivial: a matched C
consumer already declared the exact type needed, so the blob's own
declaration just had to catch up.

**`data_020b4bd4` hit the real risk this method carries, and caught
it**: rewriting an already-matched consumer from pointer-cast
arithmetic to struct-member access can compile to different addressing
instructions (the same risk this session's concurrent
`cm-parked-reaudit-2` item independently rediscovered from the other
direction). `func_020117ac.c`'s rewrite matched cleanly (100%).
`func_02011780.c`'s did not (27.3%, mwcc folded the constant `+2`
offset into the pool literal instead of computing it explicitly) — it
was reverted to its original pointer-cast form rather than forced,
with the residual documented inline. The blob itself keeps its new
struct type either way; a consumer isn't required to use
struct-member syntax to compile correctly against it.

**5 overlay002 blobs** (`data_ov002_022c357c`, `data_ov002_022be1ac`,
`data_ov002_022c9ad0`, `data_ov002_022c89a0`, `data_ov002_022c9508`):
turned out to be members of one coherent family — "card-ID →
handler-pointer(s)" dispatch tables, all sharing generic lookup
helpers (`func_ov002_02257464.s`'s binary search, `func_ov002_0228bcd0.s`'s
record consumer). The doc `docs/research/data/Ov002DataComplete.md`
(an independent byte-pattern catalog, not consulted for the
investigation's own primary verdict) names 8 such tables total; 5 of
the 8 were investigated and all 5 shipped. `data_ov002_022c357c`
(19,488 B, the largest blob touched by ANY probe in this campaign) has
the strongest non-matched-consumer evidence found so far: **100% of
2,187 relocations** inside its byte range land at a valid
record-relative offset with zero anomalies, and **100% of 875 distinct
pointer values** resolve exactly to a real function symbol's start
address. `data_ov002_022be1ac` has 8 matched C consumers, but each
receives the record pointer as a plain function argument and declares
its own independent local cast — none references the array's own
declared type — so retyping the blob was verified to be, and was,
transparent to all 8 (individually reconfirmed via `fastmatch.py`,
100% for every one).

## What didn't ship, and why (all 5, none silently dropped)

- **`data_020c32f8`**: the one real "structurally already correct"
  finding — its single consumer's index is a genuine runtime variable
  but used unscaled, meaning the "record" already is the byte. Retyping
  would misrepresent the evidence, not improve it.
- **`data_020bed6c`**: content and access shape both point to a scalar
  string constant (`0x5c` + 255 zero bytes = `"\\"`), not a record
  array — the sole consumer is an unrolled memcpy into a stack buffer
  consumed by generic strlen/strcat/strstr, never field-indexed.
- **`data_ov004_021e3500`, `data_ov004_021ff0b4`**: both are real ARM32
  machine code (clean push/pop prologues, `BL`/`BX LR`, jump tables)
  that dsd's automatic classification couldn't distinguish from data —
  independently confirmed against this project's own prior
  `Ov004Ov006DataTables.md`/`ov004-rodata-pointer-targets.md` research.
  Retyping either as a struct array would be actively wrong; the
  correct fix (reclassify as code) is a separate, already-flagged-risky
  undertaking (a structurally identical sibling broke `ninja sha1` when
  tried before) — out of scope here.
- **`data_ov004_02206760`**: real AES T-table evidence (part of a
  10-table encrypt/decrypt set spanning exactly `10×1024` bytes, a
  textbook software-AES table layout), but its consumer code lives
  entirely inside `data_ov004_021ded69`, an unclaimed opaque-code
  region with no `.c`/`.s` TU of its own — there is nothing in the
  buildable source tree to attach a struct type to, so retyping this
  blob alone would have zero verification value. Flagged as a strong
  lead for a future, differently-scoped item (claim the AES table
  family + the surrounding veneer code as its own project), not forced
  here.

## Metric impact

```
                    before      after      delta
Named-struct (B)     8,832     38,652    +29,820  (+337.6%)
Typed-array (B)     80,748     80,748          0  (by design — see below)
```

`Typed-array` (`tools/progress.py`'s broader metric) intentionally
retains "historical coverage, including opaque `unsigned char
data_*[N]` carve placeholders" per its own comment — every blob here
already counted under it BEFORE this item, opaque or not, so converting
`unsigned char[N]` to `short[N]`/a real struct doesn't move that
number. `Named-struct` is the narrow, meaningful tier (`q-data-metric-fix-v2`'s
own exclusion-by-primitive-type design): only a genuinely non-primitive
element type counts, which is exactly what this item added. Verified
directly (not assumed) via a throwaway detached worktree at this
item's own base commit, comparing real `progress.py` output before vs.
after — 8,832 confirmed as the true pre-item baseline, and the +29,820
delta reconciles exactly against the 6 struct-shaped retypes' own byte
math (99×4 + 812×24 + 193×24 + 276×8 + 202×8 + 185×8 = 29,820).

The 5 flat scalar-array retypes (`short[]`/`unsigned short[]`) are real
readability improvements — evidence-backed types replacing raw bytes —
but register under **neither** current metric: already counted by
`Typed-array`'s broad net, not eligible for `Named-struct`'s
non-primitive-only net. This is `q-data-metric-fix-v2`'s own documented
design choice ("primitive-element arrays cannot count here"), not a
bug found by this item — noted for completeness, not flagged as a
follow-up.

## Verification

4 worktree-isolated implementation agents (batched: 4 zero-consumer-risk
main blobs / 2 main blobs incl. the one struct-rewrite regression-and-revert
/ 3 zero-consumer-risk ov002 blobs / 2 ov002 blobs incl. the
8-matched-consumer check) — **zero merge conflicts** across all 4
`git merge --no-ff` merges despite two batches independently touching
overlapping file sets. One batch's own background verification process
appeared to go silent mid-task; directly inspecting its worktree (not
just trusting its self-report) showed the work was in fact sound and
just short of being committed — finished the third candidate and the
full-ROM verification directly rather than risk a repeated
round-trip. Every shipped candidate's byte content was parsed from the
already-committed literal via script and round-trip-verified before
being written, per this whole campaign's standing "generate
initializers by script, never hand-transcribe" rule. 3-region
`python tools/gate3.py --scope all` (includes the full pytest suite):
**GATE PASS**.

## What's left

- Main: 35 - 6 = **29 opaque blobs** beyond this item's 6 remain
  uninvestigated (this item sampled the top 8 by size; 2 were negative).
- Overlays: 98 - 8 = **90 opaque blobs** beyond this item's 8 remain
  uninvestigated, across every overlay except the ones sampled here —
  and the "8-table family" pattern found in ov002 alone (5 of 8
  investigated, all 5 shipped) strongly suggests other overlays carry
  similar undiscovered families rather than isolated singletons.
- The AES table family (`data_ov004_02206760` + 9 siblings, ~10 KB) is
  a distinct, well-evidenced, differently-scoped future target — needs
  claiming the surrounding veneer-code region first, not a lever
  application.
- `data_ov004_021e3500`/`data_ov004_021ff0b4`'s "misclassified as
  code" finding adds 2 more confirmed instances to the existing
  veneer-blob catalog; not actioned here (reclassification is
  independently known risky) but available for whoever picks that up.
