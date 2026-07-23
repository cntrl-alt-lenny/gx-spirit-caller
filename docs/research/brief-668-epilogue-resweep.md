# Brief 668 — re-attempt past parks with the epilogue routing rule (queue item cm-epilogue-resweep)

**Result: 15/24 shipped (62.5%), 9 parked.** All 15 ported to USA + JPN,
individually verified 100%. 3-region `gate3.py --scope all --no-tests` PASS.

## Scope

The queue item asked to re-attempt candidates previously parked only
because the routing tier was wrong. The first attempts drew from the
brief-568 near-miss catalog (`cmatch-parked-and-floor.md`) and this
session's own briefs 663-666 near-misses — all 7 of those attempts
parked at register-count/footprint walls, a *different* failure class
from the epilogue-*shape* wall this queue item targets (see Problem
Solving below).

The real unlock was `docs/research/campaign-analytics/epilogue-wall-corpus.md`
— a mechanical census (queue item q-epilogue-corpus) of 205 `main`
functions whose body matches the exact brief-661 signature (`stmfd
sp!,{lr}` + `sub sp,#4` prologue, with Style A or Style B epilogue)
and are still assembly-only. Every row carries a header comment
crediting brief 294/302's "GLOBAL_ASM endgame" — a **prior verdict of
"reg-alloc-walled, no C match"** reached before this project understood
the epilogue-tier-routing rule. That verdict is exactly the kind of
stale classification cm-epilogue-resweep exists to re-test, matching
brief 665's P-6 finding: an old "permanent" wall call made before a
lever existed is not proof the lever still fails.

## Ships (15)

Style B rows → `.legacy_sp3.c`; Style A rows → `.legacy.c`, per the
project's epilogue-shape discriminator (read the target's own epilogue
first, route before drafting).

| Function | Pattern | Notes |
|---|---|---|
| `func_02054c0c` | call+bool-to-sentinel | `result==0 ? -1 : *out` |
| `func_02064d88` | struct deref + `%` combined div/mod | callee returns quotient:remainder in r0:r1 — modeled as `long long`, not a 2-int struct (this mwcc ABI returns small aggregates via a **hidden pointer**, not r0:r1; only true scalar 64-bit returns use the register pair) |
| `func_02054c78` | memset-then-clamp | `func_020945f4` is a hand-rolled byte-fill memset, identified from its alignment-aware disassembly shape |
| `func_0208e85c` | MMIO clear-FIFO + busy-wait | reused existing `libs/nitro/func_0208e43c.legacy.c` (`GXi_NopClearFifo128_`) signature |
| `func_0209e0f0` | call passthrough + unchecked global write | no null-check on the dereferenced global, unlike its sibling `func_0209d724` |
| `func_020a6720` / `func_020a6754` | output-param via hidden local | u16/byte twins: zero-init local, call-by-reference, return the local |
| `func_0203ef68` | sequential calls + predicated early-return | literal transcription |
| `func_0204bd8c` | flag-bracket around a call | re-fetches the context accessor 3 times, never caches it (brief 661's lever) |
| `func_0207be90` | `\|\|` guard, not `&&` | see Problem Solving — branch polarity from short jump distance |
| `func_0209d664` | fire-and-forget triple call | callback registration + global clear |
| `func_020a66e8` | output-param, inverted, word-sized | same shape as 6720/6754 but pre-inits `-1` and returns `~out` |
| `func_0204033c` | double-indirect global read + guarded call | `data + 0x1000 + 0x384` bracket check |
| `func_020a5d74` / `func_020a61f0` | struct-write triad / masked-dispatch | straightforward once routed |

Each ship verified 100% via `objdiff-cli diff --format json` before
staging; each ported to USA + JPN and re-verified 100% at the ported
address.

## Parked (9)

All 9 are logic-correct (traced from the raw disassembly with no
ambiguity) but hit register-allocation-**choice** walls: the compiler
picks a structurally-equivalent but different scratch register or
count, and no source reshape tried (explicit locals, statement
reordering, ternary-vs-branch, declaration order, signed/unsigned
casts) moved the needle. This matches the project's documented 0W/many-F
scratch-register anti-pattern.

- `func_02052ecc`, `func_02077ab4` — pointer-holding register differs
  (r1/r0 picked instead of r3), 2-3 reshape attempts each, unchanged.
- `func_02097004`, `func_0209703c` — vtable-dispatch twins; hoisting the
  double-referenced field into a named local removed an extra `mov`
  (0% → 42.9%) but the remaining 4-register permutation (r2/r3/lr/r12
  vs target's r3/r2/lr/r12) didn't respond to declaration-order or
  explicit-sum variants.
- `func_0208a728`, `func_020a1bbc`, `func_02056068` — 81-87% match,
  single scratch-register swap on an isolated global-read.
- `func_020620d8` — 56.25%, both the early-return *and* the final
  bool-to-int conversion fail to predicate in my version even though
  target predicates both; ternary reformulation had no effect.
- `func_02066ea0` — 18.75%, a 5-byte struct-write function; target
  batches loads 2-at-a-time interleaved with 2-at-a-time stores,
  reshaping to match that batching still picked different registers.

None of these were shipped; all reverted cleanly (`git status` clean
for each after revert, confirmed via `check_delink_dupes.py`).

## Levers confirmed / added

- **Route-before-draft generalizes to a systematic corpus, not just
  one-off near-misses.** `epilogue-wall-corpus.md`'s 205-row census
  (mechanically identified by prologue/epilogue shape, independent of
  any C attempt) is a far better source than re-mining old near-miss
  prose — 15/24 (62.5%) here vs. 0/7 on the brief-568-catalog-sourced
  first attempts.
- **mwcc's small-struct return ABI uses a hidden pointer, not r0:r1.**
  Confirmed via `func_02064d88`: modeling a callee's true r0:r1 combined
  div/mod return as a 2-int struct produces `add r0,sp,#0` + reload
  (25%, hidden-pointer codegen); modeling it as `long long` and taking
  `>> 32` produces the exact r0↔r1 register-pair codegen (100%). Only
  genuine 64-bit *scalar* returns use the register pair on this ABI.
- **`\|\|`-early-return vs `&&`-guard are not interchangeable even when
  logically equivalent.** `func_0207be90`: target's short forward-jump
  distance on the first branch (`beq` landing 2 instructions ahead) is
  the tell that the source used `if (a==0 || b==0) return X; return Y;`
  — the De Morgan-equivalent `if (a!=0 && b!=0) return Y; return X;`
  compiles to the opposite branch polarity and a longer jump. Read the
  jump *distance*, not just the condition code, to disambiguate.
- **GLOBAL_ASM "no C match" verdicts from brief 294/302 predate the
  epilogue-tier-routing rule and are not reliable.** 15 of this batch's
  205-row source pool were exactly that verdict, reversed.
- **`port_to_region.py`'s confidence floor does not catch every porting
  bug — individually re-verify every port, don't trust a clean gate3
  alone.** Two distinct bugs surfaced only by objdiff-diffing each
  ported file against its own region's ground truth:
  1. Two LOW-confidence "anti-match" resolutions (`func_020a66e8` /
     `func_020a6720`'s callees) picked the wrong same-size sibling
     out of two candidates 0x44/0x48 bytes apart. The tool's own
     printed "consensus shift" (-0xF4, independently confirmed by 3
     *other* HIGH-confidence ports in the same address neighborhood)
     was right where the LOW-confidence guess was wrong — when a port
     is flagged LOW with an explicit "anti-match", compute the
     consensus-shift address yourself and check `symbols.txt` for a
     same-size function there before accepting the tool's guess.
  2. `func_0204bd8c`'s struct had a field at EUR offset `0x1a8` that
     sits at `0x1a0` in *both* USA and JPN — an 8-byte real layout
     difference between regions (not a symbol-address shift at all).
     `port_to_region.py` only rewrites function-symbol references; it
     cannot know about a hardcoded struct-offset literal in hand-written
     C, so this kind of bug is invisible to the tool by design and only
     shows up as a same-instruction-count, wrong-immediate diff.
  Both classes would have compiled cleanly and only surfaced as a
  silent wrong-immediate/wrong-call-target bug in the shipped ROM —
  gate3's full-ROM sha1 check *would* have caught it, but a per-function
  diff pinpoints which of 15 ports is broken in seconds instead of
  bisecting a whole-ROM mismatch.
- **The project's single global `build.ninja` is last-configure-wins,
  not per-region.** Running `configure.py <region>` for a second region
  silently invalidates every ninja target from the region configured
  before it — including a `gate3.py` run already in flight in the
  background, which itself calls `configure.py` per region internally.
  Interleaving ad hoc `ninja build/<region>/...` verification calls
  with a running background gate risks a race on that shared file;
  the safe pattern is to let one `configure.py`/`ninja` sequence own
  the build.ninja at a time, and re-run the full gate fresh (not trust
  a gate launched before later manual reconfigures) if that discipline
  slips.

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR,
USA, JPN), forced-clean rebuild. `check_delink_dupes.py` clean
throughout (81 delinks.txt, no duplicate `.text` addresses).
