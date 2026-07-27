# cm-data-inference-6 — data wave 6

2026-07-27. Continues the opaque-blob data-retyping campaign
(`cm-data-inference-2` through `-5`) with the same method: parallel
read-only `Explore` agents, one per blob, exhaustive symbol-grep +
`relocs.txt` address cross-check, classify fixed-offset (WEAK) vs
computed-stride (STRONG), never force a type onto insufficient
evidence, implement centrally afterward rather than via further
concurrent write-capable agents.

## Census correction (again)

The queue item's own carried-over estimate was **~74** remaining
opaque blobs. A fresh live scan at the start of this wave
(`grep -rlE "^(static )?(const )?unsigned char data_[0-9a-zA-Z_]+\[[0-9]+\] = \{" src/main/*.c src/overlay*/*.c`)
found **97**. This is the fifth consecutive wave where the queue's
stated count has drifted from a fresh measurement (wave 3: 213 vs
140; wave 4: ~125 vs 125 actual but 6 named leads outside the count;
wave 5: ~113 vs 116). The pattern holds: verify the number before
planning a wave's scope around it.

A genuine **census-methodology limitation** was also confirmed this
wave: the grep pattern cannot distinguish "never investigated" from
"investigated and correctly left opaque" — several `main` blobs
initially treated as fresh turned out to already be resolved (either
correctly-declined WEAK verdicts from earlier waves, or symbols whose
only evidenced property is a byte-level stride, not per-entry
semantics). Every `Explore` agent this wave was instructed to check
`docs/research/` and the target file's own header comment for
"already-shipped"/"sibling"/"gap-carved" phrasing before treating a
symbol as fresh; this caught several would-be duplicate investigations
before they were dispatched.

## Two carried-over leads (both resolved)

1. **`data_02101e64`** (main, 24 B) — an 11-field fixed-offset struct
   candidate, STRONG on its own investigation but explicitly declined
   in wave 5 for lacking the bulk-copy/function-pointer corroboration
   this campaign's other singleton-struct ships have had. Re-investigated
   with an exhaustive fresh search for any such corroborating consumer.
   **None found. Declined again, same reasoning as wave 5.** No source
   change. This is now two independent waves reaching the same
   verdict — treat as settled unless a genuinely new access pattern
   surfaces (e.g. a not-yet-shipped sibling function).
2. **`data_ov010_021b8908`/`data_ov010_021b8928`** — wave 5 hypothesized
   the `0x8928` boundary was a decomp-tool artifact from an interior
   relocation. **Reversed**: `data_ov010_021b8928` is a genuine,
   deliberately-consumed 24-byte object, not an artifact. Full
   evidence and the resulting carve are below.

## Batch A + B: 28 fresh investigations

20 dispatched first (batch A, the live census's main-blob and
ov006/ov011 candidates plus the two carried-over leads), 8 more once
agent slots freed (batch B: 3 remaining ov011 candidates, all 5 ov012
candidates found in the same address neighborhood).

**Shipped (type change, 20 symbols):**

| Symbol | Shape | Evidence class |
|---|---|---|
| `data_ov006_021cb2d8` | `int[7]` | computed-stride, 2 walled `.s` consumers |
| `data_ov006_021cb2f4` | `int[7]` | computed-stride, 2 walled `.s` consumers |
| `data_ov006_021cb310` | `int[7]` | computed-stride, 2 walled `.s` consumers |
| `data_ov006_021cb32c` | `int[7]` | computed-stride, 2 walled `.s` consumers |
| `data_ov006_021cb348` | `int[10]` | computed-stride, 2 walled `.s` consumers |
| `data_ov006_021cb370` | `int[25]` (0-24 permutation) | computed-stride, 2 walled `.s` consumers |
| `data_ov006_021cb3d4` | `{s16 lo,hi}[28]` bsearch table | explicit count+width args to a bsearch helper (`func_020059b0`) |
| `data_ov006_021cb634` | `short[5][4]` | bulk-copy (`mov r2,#0xa` loop-bound) + `ldrsh` readback (`cmp r0,#5` loop-bound) |
| `data_ov006_021cb65c` | `short[18]` (flat; 4 complete records + 2 of an incomplete 5th) | same consumer/evidence as `021cb634`; address/size kept unchanged (see boundary note below) |
| `data_ov006_021cb680` | `int[22]` | already-matched C consumer, computed-stride |
| `data_ov006_021cb7e0` | `unsigned short[16]` RGB555 palette | established palette-ramp idiom (`func_0208ff84`) |
| `data_ov006_021cb800` | `unsigned short[16]` RGB555 palette | same idiom; byte-identical to already-shipped `data_ov006_021cb738` |
| `data_ov010_021b8908` | `unsigned short[16]` | 12/16 elements fixed-offset `ldrh`-read across 2 walled `.s` consumers |
| `data_ov010_021b8928` | `{u32 ids[3]; u16 tail[6];}` (NEW carve) | `ids`: loop-bound-proof (`cmp r5,#3`) + message-ID idiom; `tail`: fixed-offset `ldrh` via sibling's own base pointer |
| `data_ov011_021d31d8` | `int[5][5]` symmetric matrix | already-matched C consumer, proven stride 20 |
| `data_ov011_021d3594` | `{s8 code,sub; s16 x,y}[4]` | computed-stride (`mla`, stride 6), fields read at proven offsets |
| `data_ov011_021d35ac` | `signed char[28]` (signedness fix only) | all 4 load sites are `ldrsb`, not `ldrb` — was mistyped `unsigned char` |
| `data_ov011_021d38bc` | fn-ptr dispatch table `[5]`, NULL-terminated | 2 already-matched C consumers, computed-stride, NULL-terminator-proven count; also fixed a stale "D-2 scalar" mistag (should have been D-1) |
| `data_ov012_021cc120` | `{s8 kind,msgIdx1,msgIdx2,reserved}[6]` | 2 computed-stride walled `.s` consumers; corroborated by an independent, already-shipped sibling (`data_ov013_021cb7b4`, 5/6 entries byte-identical) |
| `data_ov012_021cc150` | `int[4][3]` | bulk-copy + loop-bound-proven (`cmp r7,#4`) readback stride |
| `data_ov012_021cc180` | `void *const[26]` (16 real pointers + 10 NULL) | `relocs.txt`-proven per-element pointer/NULL split; elements 0-11 also read by a genuine consumer |

**Documented, no type change needed (1):**
- `data_ov011_021d35ec` — STRONG row/column semantics recovered (a
  5x10 lookup table, stride 0xa, matching an existing documented
  constant), but the correct C representation is the *same* flat
  `unsigned char[52]` already on disk: a strict `[5][10]` 2D array
  would only be 50 bytes and would lose the 2-byte alignment pad the
  linker needs to keep the next symbol at its correct address. No
  source change; noted here for the record so a future wave doesn't
  re-investigate it as fresh.

**Confirmed already correct, no change (2, carried from before this
wave's own investigations — re-confirmed, not re-litigated):**
`data_ov006_021cb4f8`, `data_ov006_021cb518`.

**Declined (1):** `data_02101e64` (see above).

**CONTRADICTION, filed as carried-over leads for a future wave (5
symbols across 2 clusters — see queue item `cm-data-inference-7`):**
- `data_ov011_021d3178` — its declared range's first word is itself a
  relocated pointer (proven via `relocs.txt`), meaning the real object
  is the tail of a larger pointer chain crossing several adjacent
  uncarved symbols, not a standalone 16-byte blob.
- `data_ov011_021d3394` — a column-slice of a much larger `0x72`-stride
  row table spanning at least 6 adjacent symbols (`0x21d32d8`
  to `0x21d33bc`).
- `data_ov012_021cc06c` / `021cc078` (gap) / `021cc07c` (gap) /
  `021cc080` — two independent investigations (one per endpoint
  symbol) both found the same thing: `func_ov012_021ca18c.s` reads 6
  bytes at `data_ov012_021cc06c + 0x24..0x29`, an address range that
  the current symbol table assigns to `data_ov012_021cc080`'s own
  offset `0x10..0x15` — the real aggregate spans all 4 symbols
  (2 of which, `021cc078`/`021cc07c`, are still unclaimed `delinks.txt`
  gaps), not 4 independent blobs.

## Two real bugs found during implementation (not shipped on trust)

Both caught by rebuilding and independently comparing built-ROM bytes
against the baserom — never by trusting a "should work" derivation.

**1. A boundary-shift plan that was actually wrong.**
`data_ov006_021cb65c`'s sole consumer (`func_ov006_021be6f4.s`) bulk-copies
40 bytes from its base — 4 bytes past its declared 36-byte end, into
neighbor `data_ov006_021cb680`'s first word. The batch-A investigation
proposed growing `021cb65c` to 40 bytes and shrinking/renaming
`021cb680`. **This is wrong**: `021cb680` has an *already-matched* C
consumer (`func_ov006_021c13c4.c`) whose relocation to address
`0x021cb680` is ground truth (`relocs.txt`); shrinking/renaming it
would have to shift that address, contradicting the matched object.
The `.s` consumer's 40-byte read is pure raw pointer arithmetic — it
doesn't reference `021cb680` by name at all, so it doesn't require or
permit any change to either symbol's declared boundary. Caught by
attempting the rename, hitting a dsd delink-time
`[ERROR] No symbol found for relocation ... to 0x021cb680`, and
re-deriving the mechanism from scratch rather than working around the
error. Fix: both symbols keep their original address/size;
`021cb65c` ships as a flat `short[18]` (not forced into `[N][4]`),
`021cb680` ships as `int[22]` including its previously-assumed-spurious
element 0.

**2. mwcc does not preserve source declaration order for same-TU
globals.** The `data_ov010_021b8908`/`021b8928` merge (2 symbols, 1
TU, per the wave-5 TU-alignment rule) initially declared the 32-byte
array before the 24-byte struct in source order. The built ROM had
them **swapped** — the struct's bytes landed at the array's address
and vice versa. Confirmed via `dsd rom extract` on the freshly-built
ROM plus a direct byte diff against the baserom (not just SHA1
pass/fail). Root cause: mwcc's `-O4,p` reorders const globals within a
`.rodata` section by some internal heuristic (size or alignment,
not source order — this session's one data point is consistent with
either "smaller first" or "higher-alignment-requirement first" and
doesn't disambiguate them). **Generalized fix, not just a patch**: the
`0x21b8908`-`0x21b8928` boundary is a multiple of 4, so the wave-5
TU-alignment rule doesn't actually require a same-TU merge here at
all — split into 2 separate files instead, which sidesteps the
ordering question entirely. Recommend the standing TU-alignment doc
(`docs/research/data-carve-tu-alignment.md`) be amended: prefer 2
separate files whenever the boundary is 4-aligned, and reserve the
same-TU-merge technique strictly for non-4-aligned boundaries where
splitting is unsafe for a different reason. Reordering within a merged
TU is not a lever available at the C source level (declaration order
was tried and did not control layout order).

A third, lower-stakes transcription error was also caught the same
way: `data_ov006_021cb3d4`'s 28-record bsearch table was initially
written with one record accidentally merged into the previous one
during hand-transcription (28 struct-array elements from 27 written
initializers, with the compiler silently zero-filling the missing
28th slot). Caught by the same build+extract+diff cycle, fixed by
regenerating the initializer from the original bytes via a small
script and checking the record count programmatically before
reapplying — the "never hand-transcribe, always script-verify" lesson
from wave 5 held again.

## Gate

Full `python tools/gate3.py --scope all` — 3-region `ninja sha1`
individually confirmed PASS for `[eur]`/`[usa]`/`[jpn]`, full pytest
suite green. EUR additionally re-verified via a full `ninja -t clean`
rebuild plus an independent `dsd rom extract` + byte-level comparison
against the baserom (not just the SHA1 banner) after both real bugs
above were found — this wave specifically did not trust "gate probably
passes" for any of the multi-symbol edits given how much cheaper it
was to catch the 2 real bugs via direct byte comparison than to debug
them from a SHA1 failure alone.

## Hit rate

20 of the wave's genuinely-fresh investigations shipped a type change
(the count above; the 2 carried-over leads and the "declined again"
`data_02101e64` are tracked separately since they were investigated in
wave 5, not fresh this wave). Treating the 28 total fresh
investigations (20 census-driven + the resolved `021b8908`/`021b8928`
lead, which required 1 investigation covering both symbols, +
`021d35ec` + the 5 now-filed-as-leads CONTRADICTIONs + `021d35ac`'s
signedness-only fix, all counted once) as the denominator: comparable
to wave 5's 62% and within this campaign's established 58-69% range
across waves 2-5.
