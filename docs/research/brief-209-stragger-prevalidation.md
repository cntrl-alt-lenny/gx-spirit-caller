# Brief 209 pre-validation — what brief 206 left behind

**Investigation:** brain-PR while briefs 208 + 209 are in flight
(2026-05-25).
**Question:** brief 206's PR body referenced "23 stragglers" — what
are they actually, and where should brief 209 Phase 2 focus?

## Headline

The 23 stragglers split cleanly into **4 tiers by fuzzy_match
divergence**, and the bottom tier has a single shared root cause.

| Tier | Count | Fuzzy range | Hypothesis |
|---|---:|---|---|
| **Trivially close** | 3 | 95-100% | Tiny residual — recipe tweak likely closes |
| **Moderately close** | 3 | 80-95% | Hand-encoded `.s` BL ships; small post-link bytes match SHA1 but unrelocated bytes still diverge |
| **Wider divergence** | 4 | 50-80% | Same root cause as 80-95% but more BLs / longer functions |
| **All-ov011 .s family** | 13 | < 50% (7 at literal 0.00%) | Brief 197's hand-encoded BL drain — `R_ARM_CALL`-class reloc that brief 206's harness doesn't fully handle |

## Per-unit detail

### 95-100% (3 units) — trivially close

These are basically matched; objdiff just sees a tiny residual.
Likely a single-instruction reloc difference or a stray
`debug_line` entry.

| Unit | Source | Size | Fuzzy | Note |
|---|---|---:|---:|---|
| `ov002/func_ov002_021c4c9c` | `.s` | 12972 | 99.97% | Largest of the 23 by far; HIGHEST fuzzy. One instruction off in ~3,243 instructions. |
| `ov002/func_ov002_02247b6c` | `.s` | 1892 | 99.79% | ~1 instruction off. |
| `main/Entry` | `.c` | 316 | 98.73% | **Only `.c` straggler.** Interesting — suggests a C-source-level issue not the `.s` reloc family. |

### 80-95% (3 units) — close

C-32-family hand-encoded BL ships. Small but non-trivial residual.

| Unit | Source | Size | Fuzzy |
|---|---|---:|---:|
| `ov011/func_ov011_021ca03c` | `.s` | 88 | 90.91% |
| `ov011/func_ov011_021d2c64` | `.s` | 40 | 90.00% |
| `main/func_020b3814` | `.s` | 60 | 86.67% |

### 50-80% (4 units) — moderate divergence

Same family as above but more BLs per function / longer reach.

| Unit | Source | Size | Fuzzy |
|---|---|---:|---:|
| `main/func_020b3808` | `.s` | 12 | 66.67% |
| `ov011/func_ov011_021ca0ac` | `.s` | 24 | 66.67% |
| `ov012/func_ov012_021c9d8c` | `.s` | 20 | 60.00% |
| `ov013/func_ov013_021c9d60` | `.s` | 20 | 60.00% |

### <50% (13 units) — all ov011 (brief 197's drain)

These are ALL from brief 197's massive ov011 C-32 drain (13/13).
Brief 195 + 197 shipped them via hand-encoded `.word <BL>` literals
instead of `bl <symbol>` mnemonics, because dsd emits the originals
with `kind:arm_call module:none` relocations that mwldarm can't
resolve.

| Unit | Size | Fuzzy |
|---|---:|---:|
| `ov011/func_ov011_021d07b0` | 212 | 30.19% |
| `ov011/func_ov011_021d0884` | 152 | 26.32% |
| `ov011/func_ov011_021ca9e8` | 276 | 13.04% |
| `ov011/func_ov011_021cb574` | 1520 | 12.63% |
| `ov011/func_ov011_021cf3dc` | 612 | 5.88% |
| `ov011/func_ov011_021cada4` | 1140 | 3.86% |
| `ov011/func_ov011_021c9e98` | 420 | **0.00%** |
| `ov011/func_ov011_021cd754` | 492 | **0.00%** |
| `ov011/func_ov011_021cd940` | 572 | **0.00%** |
| `ov011/func_ov011_021cf0c8` | 304 | **0.00%** |
| `ov011/func_ov011_021cf358` | 76 | **0.00%** |
| `ov011/func_ov011_021cf640` | 1040 | **0.00%** |
| `ov011/func_ov011_021d02a4` | 1292 | **0.00%** |

## Root-cause diagnosis for the bottom tier (verified empirically)

Empirically checked `func_ov011_021c9e98` — orig delink + built:

- **Built `.text` has ZERO relocs.** mwasm resolved the `.word
  <BL>` literals to final encoded bytes at assembly time.
- **Orig delink `.text` has 10 `R_ARM_PC24` relocs** pointing at
  externs (`GetSystemWork`, `func_020139b4`, etc. — all named
  symbols, NOT `func_<8-hex>`-style address-encoded).

The reloc TYPE (`R_ARM_PC24`) IS supported by brief 206's
resolver. The actual issue is more subtle:

- When brief 206 resolves the orig's `R_ARM_PC24` reloc against
  `GetSystemWork`, it looks up the symbol via the 24-bit FNV-1a
  name hash (since `GetSystemWork` doesn't have an address
  embedded in its name). Resolves to some fictional address X.
- The built `.o` has no reloc to apply — the bytes are already
  the FINAL encoded BL displacement that mwasm computed using
  the REAL link-time address of `GetSystemWork` (whatever it
  is in the actual overlay layout).

**X ≠ the real link-time displacement**, so post-resolve bytes
diverge. Fuzzy → 0%.

The two `.o` files derive their BL displacement from different
base addresses:
- Orig (post-resolve): hash(symbol) → fictional address
- Built (pre-existing): mwasm-encoded → real link-time address

Brief 206's resolver can't reconcile this because the built
side has no reloc to manipulate.

## What brief 209+ should do about it

Two options, in order of pragmatism:

### Option A — accept the under-count for `.word <BL>` ships

These 13 picks are correctly byte-identical at the LINKED ROM
level (SHA1 confirms across 3 regions and 27/27 modules). They're
the C-32 wall family — the recipe is "hand-encode BL because dsd
can't emit a relocation for cross-overlay calls." That's the
expected outcome.

The simple verdict: matched_functions will under-count this
specific cohort permanently, but `complete_units` correctly
tracks them. Both metrics together give the accurate picture.

Document this in the research note + tag the units in `tools/
predict_walls.py` with a "metric_under_count: true" hint so the
canonical metric table can call out the gap explicitly.

### Option B — extend the resolver to handle "no-reloc BLs"

Teach `tools/objdiff_resolve_relocs.py` to detect ARM `BL`
instructions (`0xeb...` opcode high byte) in `.text` where there's
NO accompanying R_ARM_PC24 reloc, then re-encode them to use the
target the orig would resolve to. Requires:
- Parsing the built `.o`'s `.text` for BL-shaped instructions
- Decoding the displacement to identify the call target
- Cross-referencing with the orig `.o`'s reloc table to find
  which symbol that BL "should" target
- Re-encoding using the fictional address

Feasible but fragile (~100-150 LOC). High-information-density
fix that closes the metric gap permanently. Brief 210+ candidate
if Option A turns out to mislead readers.

## What brief 209 Phase 2 should do

The empirical investigation above (`objdump -r` on
`func_ov011_021c9e98`) is the entire Phase 2 deliverable for the
bottom tier. **Brief 209 Phase 2 can skip the bottom tier
investigation and focus on the 7 close picks (95-100% + 80-95% +
50-80%).**

For those 7:

1. **`main/Entry`** (98.73%, only `.c`) — single manual inspection.
   Likely a single-instruction divergence the decomper can fix
   inline. Highest priority — closes the only `.c` straggler.
2. **`ov002/func_ov002_021c4c9c`** + **`ov002/func_ov002_02247b6c`**
   (99.97% / 99.79%) — large `.s` files with TINY residual. Probably
   need either a re-shipment with brief 208's fix (if literal-tail
   trim is the issue) OR a similar one-instruction fix.
3. The 4 at 50-80% and 3 at 80-95% — likely same root cause as
   the bottom tier (hand-encoded BLs with name-mapped externs)
   but shorter. Option A applies; tag and move on.

## What brief 209 Phase 2 should do

**Don't disasm each of the 23 individually** — that's already done
by this note's tiering. Instead:

1. **Verify the root-cause hypothesis** for the 13 bottom-tier
   units. Read `objdump -r build/eur/delinks/src/overlay011/
   func_ov011_021c9e98.o` — confirm `R_ARM_CALL` is present in
   orig but absent in built.
2. **If hypothesis confirms**, document and hand off to brief 210
   scaffolder for `tools/objdiff_resolve_relocs.py` extension.
3. **For the 95-100% tier (3 units)**, individually inspect — these
   might be single-instruction fixes that decomper can ship inline
   without scaffolder help.
4. **For the 80-95% + 50-80% tiers (7 units)**, likely same
   root cause as the bottom tier but smaller — confirm and same
   handoff.

`main/Entry` is the odd one out (`.c` source, 98.73%). Single
manual inspection — likely a single instruction off.

## Expected outcome

**If brief 209 closes the 7 close picks (95-100% + 80-95% + 50-80%):**
matched_functions 1684 → ~1691 (+7).

**If brief 210+ also implements Option B for the bottom tier:**
matched_functions → ~1707 (+23 cumulative). Closes the metric gap
between `matched_functions` and `complete_units` permanently for
`.s`-class ships.

**If we adopt Option A:** matched_functions stops near 1691, and
state.md is updated to call out that `complete_units` remains the
true headline because the C-32 wall family's hand-encoded BL
recipe is structurally under-counted by the unrelocated-byte
comparison.

Option A is the cheaper, more honest stance. Option B closes the
metric gap but adds complexity to maintain. Both are defensible.
The user's call.
