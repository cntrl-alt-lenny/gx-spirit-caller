[//]: # (markdownlint-disable MD013 MD041)

# Brief 334 — ov017 clean-C wave 2 (tier transition)

**Brief:** 334 (decomper, Windows lane). Continue draining ov017 (productive,
ov011-like, mostly reshape-able per the wave-1 spot-check). Continue the
cell-config family + scene-controller predicates/wrappers; reshape
register-CHOICE near-misses, defer scheduling/allocator. Target ~10.

## Headline — 3 matched; ov017 hit the tier transition

**3 shipped (all `.c`), EUR objdiff fuzzy 100%, EUR `ninja sha1` OK.** The
easy/clean tier is **drained** (waves 1+2 = 13 matched); wave 2 ran into the
same tier transition the scaffolder flagged on ov015 wave 2 — the remaining
`<0x100` gap is **allocator / scheduling / fold near-misses** (6 documented at
40–95%, every reshape lever tried and resisted). Below ~3/wave on Windows;
recommend pivoting the next clean-C wave to a fresh overlay and routing the
near-misses to the Mac permuter.

## The 3 picks

| func | size | shape |
|---|---|---|
| `021b3fa4` | 0xb8 | cell-config box-render sink (`func_0201e964`, the sink for the wave-1 021b4090) |
| `021b63ec` | 0x80 | rect-scan loop over the menu rows (calls the wave-1 021b2ce4) |
| `021b4db0` | 0x48 | single MMIO bitfield RMW + VRAM clear |

**Recipe transfers that landed:**
- The **`func_0201e964` 10-arg cell-config** recipe (ov011 021cc8bc lineage)
  matched `021b3fa4` first try — both ov017 cell-config sinks (`ef90` + `e964`)
  are now drained.
- **Constant-order reshape** (`021b63ec`, 90→100%): the rect-init constants
  (8, 0xd8, 0x10) emit in source-assignment order; declaring `int y;` and
  assigning it `0x10` *after* `rect.x`/`rect.w` (not at init) fixed the `mov`
  order.
- **Volatile double-read** (`021b4db0`): two `volatile` reads of 0x04001000
  reproduce the orig's read-twice bitfield RMW.

## Tier transition — 6 near-misses, all reshape-resistant

Every remaining accessible function is a 1–2-instruction allocator/scheduling/
fold miss. Reshape levers (the brief's library) were tried per-pick and did not
move them — they are the classes ov011/ov017 already catalogued as Mac-only:

| func | % | class | levers tried |
|---|---|---|---|
| `021b768c` | 95 | mwcc folds `pos+x` (pos==0); orig keeps the add | reorder pos-init (81→95), explicit temp |
| `021b33dc` | 93 | switch-discriminant r0-vs-r1 | inline / temp-bind / decl-reorder |
| `021b61dc` | 91 | load-dest r0/r1 cascade (2-field address) | operand swap |
| `021b2c8c` | 72 | post-call 3-register rotation (wave-1 deferral) | inline / cached-ptr / pre-inc |
| `021b6610` | 60 | per-case base-reg reuse + const-hoist (jump table) | — |
| `021b6774` | 40 | switch-with-held-consts inside a loop | — |

These are genuine permuter inputs (pre-characterised in `ov017_core.h`
§TIER-TRANSITION), not Windows-reshapeable. Grinding them would violate the
brief's "defer allocator ones."

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff fuzzy, per-pick | **3/3 = 100%** |
| EUR `ninja sha1` | **OK** (byte-identical ROM) |
| ov017 `delinks.txt` | 3 `complete .text` blocks appended (EUR only) |
| 3-region `ninja sha1` | **deferred to brain** |

EUR-only config; no tool change, no USA/JPN change, no renames.

## Recommendation for the brain

1. **ov017 clean-C is effectively drained** (13 across waves 1+2). The
   accessible residue is allocator/scheduling near-misses + a handful of larger
   loops/constructors (`021b7010`/`021b3e6c`/`021b4570`/`021b5130` …).
2. **Don't run an ov017 wave 3 on Windows** — it would be ~3/wave of grind.
   Pivot the next clean-C wave to a fresh overlay; route the 6 §TIER-TRANSITION
   near-misses + `021b2c8c` to the Mac permuter when that lane is live.
3. **Run 3-region SHA1 on merge.**

## Cross-references

- `docs/research/brief-332-ov017-clean-c-wave1.md` — wave 1 (10 matched).
- `src/overlay015/ov015_core.h` / the ov015 wave-2 tier-transition flag — the
  same transition shape.
- `src/overlay017/ov017_core.h` §TIER-TRANSITION — the per-pick near-miss census.
