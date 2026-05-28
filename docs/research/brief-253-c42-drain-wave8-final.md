[//]: # (markdownlint-disable MD013 MD041)

# Brief 253 — C-42 drain wave 8 (the last sibling-family pass)

**Brief:** 253 (decomper). (A) Ship the 4 C-43 / Family-5 picks via
gotcha 13. (B) Drain the winnable size-3 / size-2 families with clear
catalog recipes; STOP + report resisters as P-N candidates. This is the
LAST C-42 wave — report the final cohort state for the pivot.

## Headline

**20 .c shipped across 9 families** (4 C-43 + 16 size-2), every pick
3-region SHA1 PASS + objdiff 100 %. **8 multi-member families did NOT
ship** and are reported below as P-N candidates with evidence (4
reg-alloc-plateau, 1 optimizer range-fusion plateau, 3 complex /
unclassified). No near-matches were shipped.

**Final C-42 cohort: 316 unmatched / 306 distinct signatures — 94 %
singletons.** The remaining 8 multi-member families are all
non-coercible by the current catalog. **C-42's homogeneous vein is
mined out; the pivot off C-42 is confirmed** (scaffolder's brief-252
track scout takes over).

## (A) C-43 / Family 5 — 4 picks, gotcha 13

One recipe (int-typed stack value args → `ldr`, narrow on the `strh`
store, explicit `u16` pad gaps at 4/10) drained all four. Helpers are
per-overlay; no cross-overlay symbol trap (they are `func_ovNN_*`, not
shared data).

| Pick | objdiff |
|---|---|
| `func_ov016_021b3560` | 100 % (52/52 bytes) |
| `func_ov016_021b5154` | 100 % (52/52 bytes) |
| `func_ov017_021b405c` | 100 % (52/52 bytes) |
| `func_ov019_021b3f00` | 100 % (52/52 bytes) |

## (B) Size-2 families drained — 16 picks, 8 families

All 16 at objdiff 100 %. Recipe + any catalog fix applied:

| Family | Picks | Module | Recipe / fix |
|---|---:|---|---|
| `cc6d27cc` | 2 | ov002 | `h2(self, LIT, h1(self))` (pool = literal 0x157a/0x198e) |
| `3e76dd44` | 2 | ov002 | 5-arg call, `c` on the stack |
| `619c229d` | 2 | ov010/ov015 | `*out=h(x,data->fN)` ×2 — **per-overlay data** (ov010 `data_ov010_021b8a60`, ov015 `data_ov015_021b5ba0`) |
| `575ddc6a` | 2 | ov010/ov015 | signed-`short` reads + **`int` writes** (ldrsh vs str — mixed-width struct) |
| `14b92c28` | 2 | main | `int base=*a` hoist (keep in callee-save across both calls) + explicit `if(r)return r; return 0` tail |
| `155423ea` | 2 | ov011 | bit-12 test `(x<<19)>>31` on `unsigned int` (explicit shift, not `& MASK`) |
| `0b94bd45` | 2 | ov002 | bit-extract `((unsigned)x<<16)>>K` + **gotcha 7** (2 pass-through args push the temp r1→r3) |
| `be365725` | 2 | ov002 | `if (x & 0xfffe0000)` — mwcc materializes the mask as `mov #0x20000; rsb #0` (matches orig) |

Per-pick objdiff 100 % confirmed for all 16 (`20/20 at 100%` across the
whole wave; 3-region SHA1 below is the gate).

## Families that did NOT ship (8) — P-N candidates with evidence

Reported neutrally per the brief; not graded, not ground on.

### Reg-alloc plateau (4) — siblings diverge, one source can't match both

In each family the two "siblings" have **different register allocations
of the same shape**, so no single C source reproduces both — and each is
a leaf with no free signature lever (gotchas 7/9/11 don't apply). Strong
P-14 / reg-alloc-plateau candidates.

| Family | Module | Divergence (member A vs B) |
|---|---|---|
| `0ca11024` | main | `mla r1,r6,r2,r1; mov r0,r5` vs `mla r0,r6,r2,r1; mov r1,r5` |
| `96d2a201` | main | `mov r1,#0; add r2,sp; …` vs `mov r2,#0; add r1,sp; …` (r1/r2 swap) |
| `e7e4cff1` | main | `add r1,r4,#0x23c; mov r0,r5; add r1,r1,#0xc00` vs `add r2,…; mov r1,r5; add r0,r2,…` |
| `ef19bc9a` | ov002 | `mov r5,r0; ldr r0,.L; mov r4,r1` vs `mov r4,r1; ldr r1,.L; mov r5,r0` (pool-load reg + save order) |

### Optimizer range-fusion plateau (1) — `2b07f982` (ov002)

Orig keeps 3 explicit compares; mwcc **fuses** the equality-chain over
the consecutive set `{0x4b,0x4c,0x4d}` into a range check. Verified
against `func_ov002_022abfc0` (`if (n==0x4b||n==0x4c||n==0x4d) return 0`,
`n=-self->f4`):

```text
orig:  rsb r2,r2,#0 ; cmp r2,#0x4b ; cmpne r2,#0x4c ; cmpne r2,#0x4d ; bne …
mine:  mvn r2,#0x4a ; sub r2,r2,r3 ; cmp r2,#2       ; movls r0,#0   ; popls …   (30.8% fuzzy)
```

mwcc -O4 always fuses `x==a||x==b||x==c` over a contiguous range; no
in-range source idiom observed that suppresses it. New sub-pattern
candidate (range-fusion); recommend the scaffolder run the variant
matrix (switch form, non-contiguous reorder, opaque negate) to
classify coercible-vs-P-N.

### Complex / unclassified (3) — no clear catalog recipe

Not attempted (brief: attempt only clear-recipe families). Each is a
novel shape that wants a scaffolder classification pass, not a decomper
pilot:

- `0d484478` (ov002) — byte-pack `(a&0xff)|((b&0xff)<<8)` + two
  `u16` shift-casts with a specific interleaved schedule.
- `29f7d996` (ov002) — `mla`/`mul` 2-D table index with two pool
  constants as `mla` operands + `ldrh [base, idx]`.
- `378a6647` (ov000) — predicated ternary-with-load
  (`ldrne r4,[…]; moveq r4,#K`) + two per-overlay pool data ptrs.

## Final cohort state (for the pivot)

`tools/c42_family_hunter.py --version eur` after this wave:

```text
C-42 cohort: 831 predicted, 515 matched, 316 unmatched
clustered 316 picks into 306 distinct signatures
  size  families  picks
     3         1      3     (Family 7 = P-1, brief-250 census; excluded)
     2         8     16     (the 8 reported above — all non-coercible)
     1       297    297
```

**94 % of the remaining cohort is singletons; the only multi-member
families left are the 8 non-coercible ones above.** Sibling-family
draining is exhausted. Cumulative C-42 drain waves 1-8: **203 picks**
(154 + 29 + 20). Recommend the brain green-light the scaffolder's
post-C-42 track (brief 252).

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 20/20 at 100 % |
| `tools/check_match_invariants.py` | 0 errors (4392 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2264 passed |

## Cross-references

- `docs/research/codegen-walls.md` § C-43 + recipe-gotchas.md gotcha 13
  (the Family-5 recipe).
- `docs/research/brief-251-*.md` — the family-hunter + per-overlay
  data-symbol caveat (hit again here on `619c229d`).
- `docs/research/recipe-gotchas.md` gotcha 7 (bitfield temp-reg on
  `0b94bd45`).
