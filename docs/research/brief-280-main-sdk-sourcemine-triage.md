[//]: # (markdownlint-disable MD013 MD041)

# Brief 280 — main `<0x100` SDK source-mining triage

**Status:** sized + de-risked. decomp.me / research only — no SHA1, no
`.c`. Fetched content treated as data; no install piped. **Verdict: the
main-SDK source-mining track is a *modest* opportunity, NOT the fast bulk
track the hypothesis hoped — main's unmatched small cohort is ~76 % game
code, and source-mining a recognized SDK func still needs the same mwcc
coercion as hand-RE unless an exact same-version SDK source is vendored
(none is).**

## (A) How much of main's 2025 `<0x100` is library code?

### Signal 1 — all 2025 are unnamed `func_<addr>`

Zero are pre-identified by name (no `OS_*`/`GX_*`/etc. survive in the
unmatched set — the SDK that *was* identified is already matched:
`libs/nitro` 100 + 40 named thunks). So identification must be by
**byte/structure**, not name.

### Signal 2 — call-graph classification (the defensible estimate)

Classifying all 2025 by what they call:

| class | count | % | reading |
|---|---:|---:|---|
| **calls ≥1 game `func_`** | **1540** | **76 %** | **game code** (depends on the game's call graph) |
| leaf (no call) | 438 | 22 % | library *candidate* (or game leaf-compute) |
| calls only named/SDK | 15 | <1 % | SDK-adjacent |
| other | 32 | 2 % | — |

**At most ~453 (22 %) are library candidates** (the non-game-callers).
A 5-function disasm spot-check agreed: 4/5 were plainly game (game-struct
manipulation, game-func calls), 1/5 SDK-ish (a VRAM-address calc).

### Signal 3 — the recognizable SDK families (the confident floor)

Within the 453 candidates, the **confidently-NitroSDK** subset is small +
clustered around hardware MMIO:

- **~28 CP / hardware-math funcs** touching the DS divider/sqrt MMIO
  (`0x4000280-0x40002b8`) — siblings of the brief-086-matched
  `func_0208bde0`. e.g. `func_0208bf14` (DIV result read), `func_0208be70`
  (SQRT result read + round).
- **~45 MMIO leaves** (GX register / OS-IRQ helpers) — e.g. `func_0208df60`
  (VRAM-bank address calc), `func_020905a8` (OS_DisableIrq-style IME
  critical section).
- An unknown fraction of the ~380 remaining pure-compute leaves are CRT /
  MSL (mem/string/math); the rest are small game computation. Without a
  vendored reference to fingerprint against, this split can't be pinned.

**dsd `sig` is a dead end for bulk auto-ID:** it ships **only 2**
signatures (`FS_LoadOverlay`, `FS_UnloadOverlay`); `sig list` confirms.
Real auto-ID would need signatures *built* (`sig new-elf`) from a
reference NitroSDK decomp's `.o` — i.e. the vendoring step below.

### Defensible estimate

**Upper bound: ~453** (`<0x100` non-game-callers). **Confident floor:
~70-100** (the CP/math + MMIO register families). The true SDK-matchable
figure is in between and **not precisely determinable without a vendored
same-version SDK reference** — but it is a **small minority of the 2025**,
not "much of main." The SDK is largely already done.

## (B) Pilot — source-mining loop, end-to-end (the de-risk)

Loop: recognize the func → obtain canonical SDK source → compile under our
cflags → byte-compare vs the delinked orig.

**`func_0208bf14`** (NitroSDK DIV-result read): canonical source
`while (*(vu16*)0x4000280 & 0x8000); return *(vs64*)0x40002a0;` compiles
**7 of 8 instructions byte-identical** (both pool words + relocs match).
The one diff: orig `ands r0, r0, #0x8000` vs mine `tst r0, #0x8000` — orig
keeps the (discarded) masked value; reconstructed source emits TST and
mwcc elides the dead value. Two source variants (assign-in-condition,
`!= 0`) did **not** flip it to ANDS.

**The in-project sibling doesn't even transfer:** the matched
`func_0208bde0` (brief 086, the DIV *quotient*) uses **`tst`** in its wait
loop — so `func_0208bf14`'s **`ands`** is a genuinely different variant,
not copyable from the matched neighbor. `func_0208be70` (sqrt) repeats the
same ANDS/TST near-miss; `func_020905a8` (OS critical section) carries a
gotcha-17 dead-load/re-read.

**Pilot finding:** recognition + canonical source gets you ~90 % of the
way fast, but **the last-mile mwcc coercion (ANDS/TST, gotcha-17 volatile,
reg-alloc) is the same work as hand-RE** — unless you have the *exact
same-version* SDK source, which compiles to the orig directly. We have no
such reference vendored (`tools/_vendor` is empty bar the permuter), and
the byte-fingerprint matcher (`tools/external_obj.py`, brief 068) has no
pool to match against.

## Source-mining recipe (for if/when the track is opened)

1. **Vendor a same-version reference** (prerequisite, currently missing):
   a NitroSDK/MSL decomp on `mwcc 2.0/sp1p5` — the **TWEWY CC0** pool
   (brief 272 scout: our exact compiler) or pokediamond/pokeheartgold.
   Deliberate `git clone`, never piped.
2. **Build a signature DB** (`dsd sig new-elf` from the reference's built
   `.o`) and `dsd sig apply --all --dry` to count + name matches; OR
   byte-fingerprint via `tools/external_obj.py` (reloc-masked) for the
   unnamed `func_<addr>` ones.
3. For a hit: take the reference's **exact source** for that function,
   compile under our cflags, **objdiff** vs the delinked `.o`.
4. **Expect per-func coercion** on near-misses (ANDS/TST, gotcha 17, the
   recipe-gotchas catalog) where the reference's SDK version differs from
   ours — i.e. budget hand-RE-grade effort per near-miss, not a free win.

## Verdict + recommendation

**Do NOT stand up a separate main-SDK pipeline as the "fast bulk track."**
The hypothesis (main is library-heavy) is **overstated for the unmatched
cohort**: 76 % is game code, the SDK is largely matched, and the ~453
candidates are tiny and partly game. The recognizable SDK families
(~70-100 CP/math + GX/OS) are few and **still need per-func coercion**
without an exact-version reference.

**Recommendation:**

1. **Fold the library-candidate leaves into the brief-277 hand-RE drain.**
   They are `<0x100` + simple — the *same* recipe (m2c draft → coerce →
   SHA1). No separate track needed.
2. **A source-mining track is a contingent, modest add-on**, not a
   parallel bulk track: only worth standing up if a **same-version**
   reference (TWEWY CC0) is vendored first, and even then it batches only
   the recognizable SDK families (~100s), with coercion per near-miss.
3. **Keep the ov002 hand-drain as the primary cold-RE track** (briefs
   277/279/281) — it remains the higher-EV path.

## Falsification

- "76 % game": `tools/size_census`-style call-graph classification of all
  2025 (1540 call a game `func_`). Re-runnable.
- "dsd sig is thin": `./dsd sig list` → 2 entries.
- "source-mining not free": `func_0208bf14` canonical source → 7/8 (ANDS
  vs TST); the matched sibling `func_0208bde0` uses the *other* form.
- The whole verdict flips **iff** a same-version NitroSDK source is
  vendored and the CP/math family then byte-matches *without* coercion —
  the test brief 282 should run before committing to the track.

## Scope

Research-only (no tool, no `.c`): the verdict is "don't build the
pipeline," so a tool isn't warranted; the call-graph classifier is
inlined in this brief and re-derivable from `tools/size_census` +
the gap disasm.

## Cross-references

- `docs/research/brief-278-harvest-census-clusterA-map.md` — the census
  that surfaced main's 2025 `<0x100` (this brief triages it).
- `tools/external_obj.py` / `tools/find_external_source.py` (briefs
  066/068) — the byte-fingerprint matcher (needs a vendored pool).
- `src/main/func_0208bde0.legacy.c` — the brief-086 matched divider
  (the CP-family template; uses TST).
- `docs/research/recipe-gotchas.md` — the coercion catalog source-mining
  near-misses fall back on (gotcha 17, ANDS/TST, etc.).
