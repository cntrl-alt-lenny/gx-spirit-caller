[//]: # (markdownlint-disable MD013 MD041)

# Brief 401 — fresh-overlay scout: no fresh easy clean-C tier exists; the residue is reg-alloc-finicky

**Brief:** 401 (decomper). Pivot off the (tapped) ov004 Thumb cohort; scout 2-3
fresh overlays and drain the richest easy clean-C tier. Two suggested shots: ov006
(biggest residue, scaffolder co-drain — look for *missed sink-caller families*) and
ov017 (the "largest never-tracked overlay"). Target ~10-18; **a fresh wave-1
calibrates yield — report the actual yield + recommend continue-or-re-pick; don't
force a low-yield wave.**

## Headline — the "fresh easy tier" premise was wrong; ship is a calibration, not a drain

**0 matched funcs. The scout's premise does not hold: there is no fresh, easy
clean-C tier among the candidate overlays, and ov017's residue is uniformly a
reg-alloc near-miss class — permuter-shaped, not clean-C-shaped.** This is a
deliberate "don't force a low-yield wave" outcome (per the brief): I attempted 4
ov017 funcs across 4 different shapes; every one is a 1-2 instruction register-
allocation divergence that the clean-C levers don't fix. Reporting the finding +
recommendation is the deliverable.

## Two census corrections (the scout inputs were wrong)

1. **The census over-counted uncarved.** The brain's `_dsd_gap`-based census (and my
   first pass) counted carved funcs as uncarved because the scaffolder carves ov006
   as `ov006_XXXX.c` (no `func_` prefix). Counting by carved **start address**
   instead: ov006 = 182 uncarved (not 242), ov017 = 33 (not 37). Corrected
   `arm <=0x100` tiers: ov006 88, ov011 45, ov008 36, ov000 34, ov016 18, ov017 14.
2. **ov017 was NOT "never tracked".** It has a **brief 332 wave 1** (10 picks) and a
   documented `src/overlay017/ov017_core.h` (sinks + recipes). Its *easy* tier
   (scene wrappers, touch hit-tests, the cell-config window-builder family) is
   already drained; the 33 uncarved are the residue.

## ov006 — biggest residue, but the missed-family bet does not pan out

ov006 (the scaffolder's direct-mwcc co-drain, mined at brief 314) has the most
volume (88 `<=0x100` uncarved). The brief-364 play was *missed sink-caller
families*. With correct carve-detection, **ov006 has no uncarved family of small
(<=0x80) sink-callers** — the scaffolder drained them per-func. The richest sink
(`0x020944c0`, 22 callers) has its small callers all carved. The residue is the
*medium* tier (0x80-0x100+), which the scaffolder left because it is harder.

## ov017 — the residue is a reg-alloc near-miss class (4/4 attempted)

I picked ov017 (documented recipes + known sinks) and attempted its easy-tier
residue. Every func is a **1-2 instruction register-allocation / constant-
materialization divergence** — matchable in principle, but not by the clean-C
levers:

| func | size | shape | near-miss |
|---|---|---|---|
| `021b2c8c` | 0x58 | script-step fn-ptr dispatcher | the `&&` shared-epilogue recipe **worked** (21→20 ins), but the advance block materialises the zero once (mwcc) vs twice (orig: `mov r1,#0` store + `mov r0,#0` return); base in r2 vs r0. 1 instr. |
| `021b2280` | 0x6c | SWAR popcount (no calls/branches) | mwcc loads the **low** masks (`0x55…`, derive high via `lsl`); orig loads the **high** masks (`0xaa…`, derive low via `lsr`). Unsteerable across all 5 mask forms tried (23 orig / 24-27 mine). |
| `021b66a8` | 0xcc | struct-init (two copy loops) | the loop counter is `sub;cmp` vs `subs`, and mwcc spills 2 extra callee-saved regs (`r6,r7`) — structural reg-pressure divergence. |
| `021b33dc` | 0xe8 | state-machine switch + MMIO + `func_02037208` | byte-exact **except** the switch value lands in r0 (mwcc) vs r1 (orig, reserving r0 for the MMIO `ldr =0x040…` loads). 1 reg. |

This is exactly the **changed-bool / reg-alloc wall class** my own ov004 work
(briefs 393-399) routed to the permuter/`.s` — not a clean-C tier. ov017's *clean*
funcs were taken in brief 332.

## The real finding — the decomper's easy clean-C is largely mined project-wide

Across this session (393-401): ov004's easy/control-flow tier is drained (the Thumb
residue is builders+walls), and the other candidate overlays were *also* drained in
prior waves (ov006/scaffolder, ov000/008/010/011/016/017/decomper). **There is no
untouched easy overlay left.** What remains everywhere is:

- **reg-alloc-finicky residue** (the dominant vein — every overlay has it),
- **detailed builders** (high-cost clean-C, possible but slow),
- **jump-table / switch-tree / RE-tier walls**.

The "pick a fresh overlay's easy tier" strategy has run out of fresh overlays.

## Recommendation for the brain (re-pick — don't grind)

The residue is **permuter-shaped**, not clean-C-shaped. Three options, in my
recommended order:

1. **Feed the permuter at scale.** The reg-alloc near-misses (these 4 ov017 funcs +
   the catalogued ov004 ones + the per-overlay residue everywhere) are precisely
   what the permuter anneals. This is the highest-leverage use of the remaining
   vein — and it converts "1-instr near-miss" into shipped matches without the
   hand-grind the clean-C levers can't do here. (Caveat: brief 383 found the
   permuter *niche* on the catalogued list; but that list was mislabeled — a
   freshly-harvested reg-alloc near-miss like `021b33dc` (1 reg) is a better
   permuter target than the picked-over catalog.)
2. **`.s` byte-completion.** If the goal is the 100% byte-completion endgame, the
   decomper joins the scaffolder's `.s` lane for the walls + reg-alloc residue
   (whole-function `.s`), accepting that clean-C is mostly mined.
3. **Patient clean-C on the detailed builders** (ov006's medium tier, ov017's
   text-cell family) at a *realistic* ~5-8/wave with heavy per-func iteration — the
   lowest funcs/hour of the three.

I would **not** queue another "fresh overlay easy-tier" drain — there isn't one.

## Tooling notes (banked)

- Census **must** detect carved funcs by `.text start:` address, not the
  `func_ov\d+_` name regex (the scaffolder uses `ovNNN_XXXX.c`).
- The overlay-generic `/tmp/dcheck.py` does **not** drop trailing literal-pool
  `.word`s (the Thumb `cmp_thumb.py` did) — pool-having ARM funcs show spurious
  trailing-`.word` diffs; confirm with `ninja sha1` (brief 399 lesson).
- ov017 is in an overlay-swap group (overlaps ov006/007/010/…); m2c_feed needs the
  `func_ov017_` name (not a bare address) to disambiguate.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` (no net code change — all attempts reverted) | **OK** |
| Working tree | clean (docs only) |

## Cross-references

- `docs/research/brief-399-ov004-thumb-drain-wave3.md` — the w3 recommendation that
  motivated this pivot.
- `docs/research/brief-364-overlay-resweep.md` — the missed-family playbook (which
  ov006's drained small tier no longer affords).
- `src/overlay017/ov017_core.h` — the brief-332 vocabulary (ov017 was already
  tracked).
