[//]: # (markdownlint-disable MD013 MD041)

# Brief 349 — main easy-tier straggler sweep wave 1 (+ probe)

**Brief:** 349 (scaffolder, co-drain). Survey main's simplest `<0x80` cohort and
drain it with the mature recipe library. The wave **doubles as a probe**: if the
easy-tier yield is ~5 or fewer, that confirms the direct-mwcc easy lane is
exhausted game-wide. Per-pick gate = EUR objdiff 100%; the brain runs the
3-region SHA1 on merge. Don't touch ov002 (decomper owns it); don't re-attack the
brief-340 catalogue. Branch `scaffolder/main-stragglers-wave1`.

## Headline — yield 11, NOT exhausted; the lane was mis-measured two ways

**11 shipped, all EUR objdiff 100%, all drop out of a clean re-delink, and EUR
`ninja sha1` PASSES** with the wave applied (main `complete` 1650 → 1661). That is
the *upper* half of the 5–12 target — the opposite of the "exhausted" probe
result. But the real finding is **why** main looked exhausted: the "near-miss"
pile was inflated by **two measurement bugs**, not by true walls.

### Finding 1 — the harness comparator was hiding real matches (FIXED)

The reconstructed `verify.py` broke at the first internal `.L_` sublabel when
reading the original. **dsd's gap objects split each function at its internal
labels** (default blocks, switch tails, const pools), so the comparator captured
only the *first* sub-block of the original (e.g. 6 of 10 words) and reported a
false count-mismatch DIFF against my whole-function `.o`. Two of the first ten
funcs sampled (`0201f0f4`, `0203402c`) were **byte-identical all along** —
confirmed by a direct full-word objdump compare. Fixed `words_from_obj` to span
`.L_*` continuations. **Implication:** any past wave whose harness had this bug
under-counted (nothing wrong *shipped* — the bug only produces false negatives —
but real matches were left on the table as "near-misses").

### Finding 2 — half the misses are LEGACY-compiler (Style-A) functions

After the comparator fix, the remaining "walls" were dominated by
**predication-vs-branch** and a few **reg-alloc** divergences under the default
mwcc 2.0/sp1p5. Re-running every near-miss through **legacy mwcc 1.2/sp2p3**
(`.legacy.c`) flipped **5 of them to byte-identical**. The tell for the cleanest
case (`02073eb0`) is the **Style-A epilogue** (`pop {r4,lr}; bx lr` vs 2.0's
`pop {r4,pc}`), but legacy *also* matched the orig's predicated guard-bodies
(`movne/strne` where 2.0 emits an early `bxeq`) and a register-choice miss
(`020873a8`, 8v8 under 2.0). **main (arm9) carries a large cohort of
legacy-codegen functions; testing only the default compiler mislabels them as
walls.** Trying *both* compilers tripled the measured yield (≈18% buggy →
≈23% default-only → **50% dual-compile**).

## The 11 picks

| func | size | compiler | shape / recipe |
|---|---|---|---|
| `0204525c` | 0x24 | 2.0 `.c` | guarded dual-store (`!=9` → latch a0,a1) |
| `02068424` | 0x28 | 2.0 `.c` | singly-linked list push (head/tail/count) |
| `0201f0f4` | 0x28 | 2.0 `.c` | table lookup — **signed-low + UNSIGNED-high bound** (`a0>=0 && (unsigned)a0<N`) |
| `0203402c` | 0x28 | 2.0 `.c` | inclusive range — **tested value is the 2nd param** (orig keeps it in r1) |
| `0201a110` | 0x24 | 2.0 `.c` | test bit `(ret-68)` of a mask word — **`(1<<n) & field`** (mask first → field in r0) |
| `02073eb0` | 0x28 | **1.2 `.legacy.c`** | probe-then-default — **Style-A epilogue** (`pop {r4,lr}; bx lr`) |
| `020873a8` | 0x24 | **1.2 `.legacy.c`** | test-and-set bitmask global — legacy allocator (2.0 = 8v8 reg miss) |
| `0204529c` | 0x28 | **1.2 `.legacy.c`** | zero-store sibling of `0204525c` — legacy predicates the body |
| `02049634` | 0x28 | **1.2 `.legacy.c`** | guarded dual-store via ptr-global (re-read) — legacy predicates |
| `02046c60` | 0x28 | **1.2 `.legacy.c`** | clone of `02049634` (offsets 0x90/0x94) |
| `02070fe8` | 0x28 | **1.2 `.legacy.c`** | chase `g->f4->fa4`, poke byte + clear word — legacy predicates two stores |

All 11: EUR objdiff 100% (direct-mwcc) · 11/11 dropped out of the main gap
objects · EUR `ninja sha1` OK (full ROM byte-identical).

## Recipes banked (new this wave)

- **Signed-low + unsigned-high bound**: a mixed `cmp #0;blt` / `…CC` range is
  `if (x >= 0 && (unsigned)x < N)`, **not** the all-signed `x>=0 && x<N` (which
  emits `…LT`). (`0201f0f4`.)
- **Tested-value-in-r1 ⇒ second parameter**: when the orig compares the arg in
  r1 (`cmp r1,r0`) and keeps a const-pool base in r0, the function has an unused
  leading arg — declare `f(int a0, int a1)` and test `a1`. (`0203402c`.)
- **`&` operand order picks the return register**: `(1 << n) & field` lands
  `field` in r0; `field & (1 << n)` swaps the alloc (8v8 miss). (`0201a110`.)
- **Legacy-compiler routing is a first-class lever, not an afterthought.** For
  any near-miss whose only/dominant divergence is (a) the Style-A epilogue
  `pop {regs,lr}; bx lr`, (b) the orig predicating a guard-body where 2.0
  branches (`bxeq`), or (c) a plain caller-saved register-choice — **recompile
  as `.legacy.c` (mwcc 1.2/sp2p3) before declaring a wall.** Keep the
  `if (!g) return 0;` (early-out) C form so the `moveq r0,#0` schedules right
  after the compare (the inverted `if(g){…return 1;} return 0;` mis-places it).

## Genuine walls (resist BOTH compilers — route to permuter/m2c)

`02001e5c` (short-circuit bool, 7v10→10v10), `020379c4` (pooled-tailcall reg
choice, 8v8), `020534b4` (mask-idiom `mvnne/andne`), `020a3afc` (base-reg
alloc, 7v7), `02032724`/`02054314` (addressing-fold / blx-reload — legacy makes
them *worse*, 11v9), `02054c0c` (push-reg-vs-`sub sp` frame), `0207d274`
(caller-saved G in r4 vs reload), `0200f01c` (temp-vs-in-place RMW, 10v10),
`0207eae4` (predication, 9v9 under legacy — close), `0207e6bc` (predicated
index). `0207eae4` / `0200f01c` / `02001e5c` go to **equal instruction count**
under legacy — they are the nearest legacy near-misses and may fall to one more
reshape; the rest are scheduling/alloc class. Skipped per brief: loops
(`02092904`, `02077094`), dispatcher (`0206280c`), stack-heavy composites
(`0203f718`, `02040c98`, `02054840`).

## Probe verdict (the deliverable)

**The direct-mwcc easy lane is NOT exhausted on main — it was mis-measured.**
Of ~22 distinct `<0x40` simple funcs sampled, **11 matched** once both the
comparator was fixed and *both* compilers were tried (50%); the other 11 are
genuine scheduling/alloc walls. The dominant reason main looked dead is that
prior measurement used the default compiler only, and a subtle harness bug
masked clean matches. This **does not contradict brief 340** — that re-sweep
tested the decomper's *declaration-order* source lever on the *catalogued*
backlog and correctly found it Mac/permuter-bound. This wave found a *different*
lever (**compiler routing**) on *fresh* main stragglers; the catalogue was not
re-attacked.

## Recommendation for the brain

1. **main's easy tier is a live vein — keep a scaffolder wave on it.** Drain
   `<0x80` simple shapes, but **dual-compile every candidate** (2.0 `.c` AND
   1.2 `.legacy.c`) before declaring a wall. The yield is singleton-heavy (few
   clone families) but real at ~50% of clean shapes.
2. **The legacy lever is worth a one-shot re-sweep of the catalogued reg-alloc /
   predication misses** that were judged on the default compiler only — brief
   340's "yields 0" was about a different lever and never tried `.legacy.c`.
   (Recommendation only; not done here per the brief's no-re-attack rule.)
3. **Standardise the comparator fix** in any reconstructed harness — span `.L_*`
   sublabels when reading dsd gap objects, or whole-function matches read as
   false near-misses.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-unit) | **11/11 byte-identical** |
| clean re-delink drop-out (gap-object scan) | **11/11** out of `_dsd_gap@main_*.o` |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| build routing | 5 → `mwcc` (2.0), 6 → `mwcc_legacy` (1.2/sp2p3) |
| `ruff` / `tests/` / `check_match_invariants` | clean / pass / 0 errors |

`src/main/` gains 5 `.c` + 6 `.legacy.c`; EUR `arm9/delinks.txt` +11 `complete`.
No tool / USA / JPN change.

## Cross-references

- `docs/research/brief-340-resweep-pilot.md` — the declaration-order re-sweep
  (different lever, catalogued backlog) this wave does **not** contradict.
- `docs/research/style-a-epilogue.md` — the `.legacy.c` (mwcc 1.2/sp2p3) routing
  for Style-A epilogues, here extended to predication/alloc misses on main.
