# Brief 533 — Pattern-B struct-callback sibling sweep

Date: 2026-07-05
Branch: `claude/cmatch-ov-533`

## Headline finding

**Pattern B does not sweep the way Pattern A did.** Brief 531's method
(prove one small exemplar byte-exact, then copy the identical shape to
every sibling almost for free) does not transfer to Pattern B. Every
family's exemplar turned out to be a large (100–880 byte), bespoke,
densely-branched function — not a small uniform idiom repeated
verbatim per instance. Zero byte-exact matches landed this brief despite
attempting one exemplar per reachable family and iterating hard on the
most tractable one. The tree is fully clean (nothing committed) and all
three regions still gate `ninja sha1` OK.

This is a real, useful negative result: it tells the campaign that Pattern
B candidates need to go through the normal per-function decompilation
process, not a batch-sweep process, and it identifies exactly which
family is closest to tractable if someone wants to pick this back up.

## Per-family results

### B1 — `data_02191e60` event sink (+0x20/+0x28/+0x38), 11 functions

**Not EUR-native.** All 11 listed addresses (`func_0201f2f8`,
`func_020209d0`, etc.) exist only in `src/usa/main/` and `src/jpn/main/`
— EUR's code in this address range is laid out differently (confirmed:
EUR's own `.text` entries near `0x0201f2f8` have different boundaries),
so these are USA/JPN-native functions with no direct EUR counterpart at
the same address. Only 1 of the 11 (`func_0201fb8c`) is already matched;
the smallest unmatched one (`func_0201fb8c`... already matched; next
smallest `func_0201fcd0`, 160B) plus the "exemplar" the pattern doc lists
first (`func_0201f2f8`, 392B) is a 20+-branch state dispatcher (a `switch`
over an internal mode field with ~7 cases, each hitting the `+0x38`
callback with different argument setups) — not a leaf idiom. Sizes across
all 11 range 140–568 bytes. **Not attempted** — cross-region-native
+ high individual complexity is a worse risk/effort trade than the other
families; would need the standard EUR-equivalent-hunting process (find
the same logical function at its own EUR address) before this family is
even in-scope for the phased EUR-first workflow.

### B2 — Entity `self`/`sl` (+0x54/+0x58), 5 functions

3 of 5 (`func_0200d9fc`, `func_0200dd3c`, `func_0200e9a8`) are USA/JPN-only
like B1. The 2 EUR-native ones diverge sharply in size:
`func_0200da18` (832B, not attempted — too large) and `func_0200dd58`
(108B — attempted, see below).

**`func_0200dd58` — CONTAINED, not byte-exact, parked (permuter-class).**
This was the wave's deepest investigation:

1. First draft (manual shift/mask arithmetic for the `+0x60` 4-bit
   bitfield) compiled to **100 bytes against a 108-byte declared range**
   — confirmed via a direct per-file `ninja build/eur/src/main/<f>.o`
   compile + ELF `.text`-section-size check (much faster than a full ROM
   rebuild for this kind of diagnosis). The resulting full-ROM
   `containment_check.py` run showed a catastrophic 567,526-byte /
   70,578-run avalanche starting from `Entry.c` — i.e. **a size
   mismatch in main ARM9 cascades everywhere, unlike an overlay-scoped
   miss**, because main ARM9 is one contiguous linked image instead of
   independently-based overlay files.
2. Root cause: my C used `(x >> 21) & 0xf` for the bitfield read, which
   mwcc compiles as `lsr+and`. The original uses the classic
   `lsl+lsr`-double-shift bitfield-extraction idiom instead. Switching to
   an actual C bitfield (`unsigned int field : 4` inside a union with the
   raw word) reproduced the exact `lsl/lsr/add/bic/lsl/orr/lsl/lsr`
   instruction *shape* — confirmed via a `capstone` instruction-by-
   instruction diff, not just eyeballing hex.
3. With the shape matched, size returned to the correct 108 bytes and
   `containment_check.py` reported **CONTAINED** (20 bytes / 11 runs, all
   inside range) — the avalanche was entirely a symptom of the size bug,
   not a separate issue.
4. The remaining 20-byte diff is a pure register-allocation swap
   (`r0`/`r1` in my build vs `r1`/`r2` in the original, for the
   "current-field scratch" vs "reassembled packed word" roles) — every
   other instruction matches exactly. **4 different C reshapes** (plain
   bitfield, an explicit staging-struct copy, a combined
   increment-and-store expression, and raw shift/mask arithmetic with the
   store deliberately reordered to match the original's register-reuse
   pattern instead of a fresh reload) all produced the **identical**
   register assignment — strong evidence this is genuinely
   **permuter-class**, not something reachable by any natural C reordering
   I tried. Parked in CONTAINED state (safe, no cascade) rather than
   forced further.

This is the closest Pattern B got to landing all brief — one register
swap away, fully diagnosed, ready for a permuter/decomp.me pass in a
future brief.

### B3 — ov011 `r6` struct (+0x1c/+0x20), 1 function

`func_ov011_021d1514`, 880 bytes (0x370) — a dense multi-branch
handler with 4-bit/2-bit packed-field extraction, MMIO-adjacent writes,
and ~8 distinct callee calls across ~10 labels. **Not attempted** — this
is a single instance (no siblings to amortize the derivation cost across,
unlike B2/B4/B5), and its size/complexity is well beyond what a ~12-minute
budget can safely reverse-engineer from scratch on the first pass.

### B4 — ov010/ov015 `r7` struct (+0x14), 2 functions

`func_ov010_021b2924` / `func_ov015_021b2924`, both 484 bytes (0x1e4),
**byte-for-byte identical `.s` source** (confirmed diff — only the
overlay-specific callee symbol name differs), so proving one proves both.
Fully traced (nested mode/state-transition ladder over 4 struct fields,
with a null-checked callback dispatch matching the pattern doc's `+0x14`
description) and written up as C. **AVALANCHE on first attempt**: the
compiled `.text` was 32 bytes short of the declared 484-byte range
(discovered via manual overlay containment — 2,373 outside-range runs,
21,619 diff bytes, non-zero size delta). Given the scale of the
derivation (a ~35-line nested-conditional reconstruction) and that a
32-byte shortfall implies a materially incomplete or incorrect
reconstruction (not a small register-alloc gap), this was parked rather
than re-derived from scratch within the time budget. **This is the
best remaining candidate for a focused re-attempt** — the logic is fully
written up above (state machine with two "mode" branches, each
transitioning a 2-bit `fc` field through a 4-value cycle and firing a
callback conditionally) and just needs a careful second pass against the
raw `.s` to find the missing ~8 instructions' worth of logic.

### B5 — ov005 `sl` struct (+0x64/+0x68/+0x6c), 2 functions

`func_ov005_021ab6ac` (428B) and `func_ov005_021ab858` (680B) — both
large, with dense MMIO bit-packing, nested loops, and multiple helper
calls (`func_0207ec28`, `func_020b3870`, `func_0207f934`, etc.). **Not
attempted** — same reasoning as B3: no small entry point to de-risk the
first attempt, and both instances are larger than anything this session
successfully matched.

## Method notes for future attempts

- **A per-file `ninja build/<ver>/src/<path>/<file>.o` compile +
  ELF-section-size check is a fast, cheap way to catch a size mismatch
  before running the full `ninja rom` → containment pipeline.** This
  session's B2 attempt would have wasted a full rebuild cycle on a
  doomed candidate without it. Recommend making this the first check
  after every fresh Pattern-B (or any large/complex) candidate draft,
  ahead of the full manual-containment step.
- **A main-ARM9 size mismatch is far more dangerous than an overlay one.**
  Overlay files are independently linked/based, so a size-mismatched
  overlay candidate's damage is contained to that one overlay's `.bin`.
  Main ARM9 is one contiguous linked image — the exact same class of bug
  (a function compiling a few bytes short) produced a 567KB/70K-run
  avalanche here vs. brief 531's worst overlay avalanche (~356KB, but that
  was a genuinely different W7-veneer-related mechanism, not a plain size
  bug). Treat any Pattern B/B6 (main-ARM9) candidate's first build as
  higher-stakes than an overlay one — check size before checking
  containment.
- **`containment_check.py` (main-ARM9-only) worked exactly as documented**
  for the B2 candidate — no need for the manual overlay-diff dance
  brief 529/531 required for `ovNNN` targets. Use `--addr X --module main`
  for a bare address.
- Reconfirms brief 529's capstone-diff lesson: instruction-shape matches
  vs. register-only mismatches are only distinguishable by actually
  disassembling both sides, not by diff byte-counts alone.

## Final gates

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

All three regions re-verified at the end of this brief with the tree back
to its pre-brief state (no Pattern-B changes landed).

## Recommended routing for a follow-up brief

1. **B4 (`021b2924`, ov010/ov015)** — highest expected value. Fully
   traced logic is in this doc; needs a careful line-by-line re-check
   against the raw `.s` to find the missing ~32 bytes of reconstructed
   logic, then the sibling copy is free (proven byte-identical `.s` pair).
2. **B2's `func_0200dd58`** — needs a permuter/decomp.me pass, not manual
   reshaping; the C is otherwise complete and instruction-shape-correct.
3. **B1, B3, B5** — route through the normal single-function
   decompilation process (dossier-style ground-truth writeup, iterate to
   100% match), not a sweep-based brief. B1 additionally needs an
   EUR-equivalent lookup step before it's even in scope for the
   phased EUR-first workflow.
