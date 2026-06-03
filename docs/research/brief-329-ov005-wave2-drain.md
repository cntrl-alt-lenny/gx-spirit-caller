[//]: # (markdownlint-disable MD013 MD041)

# Brief 329 — co-drain wave 2: ov005 medium-leaning tier (+ THINNING flag)

**Brief:** 329 (scaffolder, co-drain). Continue draining ov005 (wave 1 = brief
327, PR #843, 13 matched; EUR `ninja sha1` PASS confirmed the ov005/ov008
swap-group isolation is byte-clean). Per-pick gate = **EUR objdiff 100%**
(direct-mwcc); the brain reproduces the 3-region SHA1 on merge. Own
`src/overlay005/`, the ov005 `delinks.txt`, and `ov005_core.h`. Target ~12;
**flag if ov005 thins below ~6/wave.**

## Headline

**7 shipped (all `.c`), all EUR objdiff 100% + `ninja rom` OK.** ov005 matched
**19 → 26.** This is the **thinning floor** the brief asked me to watch for:
the easy `<0x98` tier is now essentially drained (waves 1+2 = 20 funcs), and the
7 here took real per-pick iteration because **ov005 has no clone families — every
function is a unique singleton**, and the remainder is dominated by
register-allocation / code-layout near-misses. **I recommend the brain pivot the
scaffolder to a richer overlay (ov020 / ov015) after this wave** and leave
ov005's tail for the permuter/m2c endgame (see THINNING below).

## The 7 picks (per-unit EUR objdiff 100%)

| func | size | shape | the catch |
|---|---|---|---|
| `021acf34` | 0x44 | teardown call sequence | — (clean) |
| `021ac9dc` | 0x54 | linear search, live-count re-read | — (clean) |
| `021aaea8` | 0x58 | endpoint interpolate | tail DUPLICATED per branch (self-contained branches) |
| `021aafac` | 0x60 | command-buffer bind | reload `o[1]` for the cursor; slot→temp before the `*2` arg |
| `021ac984` | 0x44 | clamp = min(count, span/16) | `<<22>>28` 4-bit field; min as explicit `if`, not ternary |
| `021aca64` | 0x68 | scroll-begin guard | bind call result to a temp so the subtract keeps the reg |
| `021abe04` | 0x58 | window-clear loop + predicated store | reuse the `x` param in place as `lo` |

## The wave-2 lever — register-reuse shaping

ov005's tier is **not algorithmically hard; it is register-choice hard.** Three
picks first came in as 73–92% near-misses whose *only* diff was which physical
register held a value. mwcc picks the "incumbent" register from how the C is
shaped, so each was flipped to 100% by reshaping (not rewriting) the C:

- **min/max → explicit `if`-assign, not a ternary.** `021ac984`: `x<=d?x:d`
  made `x` the incumbent (`movgt r0,q`); `int r=d; if(x<=d) r=x; return r;`
  makes `d` the incumbent (`movle r1,x; mov r0,r1`) = orig. (88% → 100%.)
- **bind a call result to a named temp** before reusing it. `021aca64`:
  `d = x - f(o) - 1` put `d` in r1; `int y=f(o); d=x-y-1` keeps the subtract in
  the call-result register r0 = orig. (84.6% → 100%.)
- **reuse a PARAM in place, not a fresh local.** `021abe04`: `int lo=x-0x10`
  put lo in a fresh reg; `x -= 0x10;` (then use `x` as lo) keeps lo in x's
  register and gives `hi` the fresh one = orig. (73% → 100%.)

These are banked in `ov005_core.h §VERIFIED (wave 2)`.

## Other banked gotchas (re-proven here)

- **branch-tail duplication** (`021aaea8`): when the orig duplicates a
  shared `(sub,scale,add)` tail per branch, write each branch self-contained
  (compute the shared fields inside each); mwcc does not cross-jump them.
- **reload vs reuse** (`021aafac`): the orig re-reads `o[1]` for the `*(o[1]+8)`
  cursor instead of reusing the just-stored value; mirror the reload. Loading
  `o[0x10]` into a temp before the `(count+1)*2` arg sequences the `ldr` before
  the shift.
- **`<<22>>28` u16 bitfield** (`021ac984`/`021aca64`): a 4-bit field at bit 6 of
  the +0x5c halfword reads as `((unsigned)h << 22) >> 28` (cast to unsigned for
  the `lsr`); `/16` matches mwcc's signed-div idiom (`asr#3; add; asr#4`) as
  written, no coaxing.

## Deferred near-misses (NOT shipped)

| func | size | % | class | disposition |
|---|---|:---:|---|---|
| `021acfb0` | 0x68 | 24v26 | **permuter** (indirect `blx` dispatch) | route to backlog with ov008 `021aafa4` (per brief) |
| `021ad284` | 0xd8 | 92.6% | register (switch discriminant r0 vs r1) | direct-mwcc-resistant; temp/hoist did not move it |
| `021af874` | 0x78 | 83% | code layout (handler/default block order) | direct-mwcc-resistant block placement |
| `021af704` | 0x4c | 47% | strength-reduction (pointer-bump IV) | no C form blocks the SR (tried 5) |

`021acfb0` is the only **permuter-class** miss (matching wave 1's call). The
other three are direct-mwcc register/layout divergences — catalogued, not
permuter material, not worth grinding (per the brief's "don't grind direct-mwcc"
guidance for the indirect-dispatch class, extended here to the alloc/layout
class since the symptom is identical: structurally-correct C, mwcc disagrees on
a register/block).

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-unit) | **7/7 byte-identical** |
| EUR objdiff (authoritative `report.json`, `fuzzy_match_percent`) | **7/7 = 100.0** |
| in-tree build + link (`ninja rom`) | compiled (7 `.o`) + linked, ROM written |
| ov005 `delinks.txt` | +7 `complete .text` (19 → 26); clean re-dis drop-out |
| `check_match_invariants.py` | **0 errors** (placeholder-name warns only) |
| `ruff check tools/ tests/` | clean |
| 3-region `ninja sha1` | deferred to the brain on merge (per brief) |

## ⚠️ THINNING flag + recommendation for the brain

1. **ov005 has hit the floor — pivot the scaffolder.** Waves 1+2 drained 20
   funcs; the easy `<0x98` tier is done. The residue is: the `0x98+` tier
   (bigger constructors/loops — e.g. `021ab00c` the "ITTM" command-list
   constructor, `021ab3e8`/`021ab6ac`/`021ab858` 0x1ac–0x2c4 blx bodies), a
   handful of register/layout near-misses (above), and ~210... no — **~13
   funcs `<0x100` remain**, most near-miss-prone. A wave-3 here looks like ~4-6
   with heavy effort. Per the brief's own trigger, **flag raised.**
2. **Recommended next vein:** ov020 (32 funcs `<0x100`) or ov015 (31) — the
   richest untouched overlays the brief named. Both should yield a clean wave-1
   ramp like ov005/ov008 wave 1 did.
3. **Leave ov005's tail for the permuter / m2c pass.** `021acfb0` (permuter,
   with ov008 `021aafa4`); `021ad284` / `021af874` / `021af704` are
   register/layout/SR misses better served by m2c-assisted or
   permuter-assisted matching than more direct-mwcc grinding.
4. **Run the 3-region SHA1 on merge** — per-pick gate here is EUR objdiff only.

## Cross-references

- `docs/research/brief-327-ov005-wave1-drain.md` — wave 1; the families and the
  swap-group isolation proof.
- `docs/research/brief-325-ov008-wave2-medium-tier.md` — the permuter-bound
  medium-tier verdict; `021aafa4` is the sibling of this wave's `021acfb0`.
- `src/overlay005/ov005_core.h` — §VERIFIED extended with the wave-2 picks, the
  register-reuse recipe, and the deferred near-miss catalogue.
