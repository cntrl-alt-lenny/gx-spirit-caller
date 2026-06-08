[//]: # (markdownlint-disable MD013 MD041)

# Brief 387 — ov002 `.s` drain, lower-half wave 2 (+ fixed a broken merge on main)

**Brief:** 387 (decomper). Wave 2 of the ov002 lower-half `.s` drain (wave 1 =
brief 385, PR #909). Next batch of reg-alloc / plateau-class targets in the lower
half (`addr < 0x02234000`); scaffolder has the upper half. `asm_escape
--whole-function`; gate 3-region `ninja sha1`. Target ~8-10. Windows lane.

## Result

- **10 ov002 lower-half functions shipped as byte-exact `.s`** — 3-region
  `ninja sha1` (EUR / USA / JPN) all `OK`.
- **⚠️ FIXED A BROKEN MERGE ON `main`** (see below) — main's
  `config/eur/arm9/overlays/ov002/delinks.txt` had **unresolved git conflict
  markers** committed into it, so `dsd delink` aborted and **main did not build**.
  This PR resolves it.

## ⚠️ The broken merge (main was not building)

`origin/main`'s `ov002/delinks.txt` contained unresolved conflict markers at
lines 5230 / 5271 / 5304:

```
<<<<<<< HEAD          (decomper #909's 10 lower-half carves)
=======
>>>>>>> origin/main   (scaffolder #908's 8 upper-half carves)
```

PRs #908 (scaffolder, brief 386 — upper half) and #909 (decomper, brief 385 —
lower half) both appended carve blocks to the end of the same `delinks.txt`; the
merge that combined them was committed **with the conflict markers left in**.
`dsd delink` then failed (`expected file path to end with ':'`), breaking the
build for everyone on `main`. (CI didn't re-catch it — the tip commit is a
`[skip ci]` README-badge bump.)

**Resolution:** false conflict — the two sides are disjoint appends (my lower-half
10, scaffolder's upper-half 8). Removed the 3 markers, kept both carve sets.
Baseline then builds green. **Recommend brain audit the merge process** —
appends to a shared `delinks.txt` from two lanes will keep colliding; either
serialize merges or have each lane carve into a per-lane include.

## The 10 ships (wave 2)

| function | size | function | size |
|---|---|---|---|
| `func_ov002_0220ddf4` | 0x34 | `func_ov002_022319f4` | 0x48 |
| `func_ov002_0220db18` | 0x48 | `func_ov002_021afffc` | 0x50 |
| `func_ov002_0220ddac` | 0x48 | `func_ov002_021b004c` | 0x50 |
| `func_ov002_022152fc` | 0x48 | `func_ov002_021b3d2c` | 0x50 |
| `func_ov002_02220f00` | 0x48 | | |
| `func_ov002_02229a40` | 0x48 | | |

Wiring = the ov002 convention: `.s` under `src/overlay002/`, carve in
`config/eur/.../ov002/delinks.txt`, `end = addr + symbols.txt size`. EUR-only
baseline; USA/JPN keep them in the gap → byte-identical for free.

## Method + screen

Enumerated uncarved lower-half (`addr < 0x02234000`) ov002 gap funcs ≤0x80
(311 candidates), `asm_escape`-batched the smallest 18 → **17 verified** (the 1
fail, `0222ceac`, is the known `to_mwasm` opcode gap — skipped). Screened the 17:
dropped `021bc6e8` (`kind:data` extern = invisible link-fail); left `021d8184` /
`021e2cd4` (argpack-sink callers) + `021aff4c` (bytepack) for clean-C; shipped 10
`kind:bss`-clean.

## Coordination + runway (not thinning)

Address split holds (decomper `< 0x02234000`, scaffolder `≥`). After waves 1+2
(20 lower-half ships), the lower half still has **~290 uncarved ≤0x80 funcs**
(and far more above 0x80) — **not thinning**, many waves of runway.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
