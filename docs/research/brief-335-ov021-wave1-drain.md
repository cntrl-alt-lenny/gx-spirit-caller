[//]: # (markdownlint-disable MD013 MD041)

# Brief 335 — pivot to ov021: clean-C wave 1 (fresh, reshape-able overlay)

**Brief:** 335 (scaffolder, co-drain). ov015's easy tier is drained (brief 333
tier-transition), so pivot to **ov021** — 22 funcs `<0x100`, the richest
untouched vein. Per-pick gate = EUR objdiff 100% (direct-mwcc); the brain runs
the 3-region SHA1 on merge. Own `src/overlay021/`, the ov021 `delinks.txt`, and a
new `ov021_core.h`. Target ~10-12.

## Headline

**12 shipped (all `.c`), all EUR objdiff 100% + `ninja rom` OK.** The pivot is a
clean ramp: ov021's reachable cohort is an **ov006-style state machine** (per-
state enter / reset / step / audio-init methods over a central state word
`data_ov021_021ace80`), and **every recipe in the library transferred** — 12 of
14 attempts matched, the 2 misses being one permuter-class `blx` and one
register-choice coin-flip. The early reshape-spot-check the brief asked for
verdicts ov021 = **"yes"** (like ov017, unlike ov020).

## The 12 picks (by recipe)

| recipe | funcs |
|---|---|
| enter / reset / 3-state machine | `021aa8d4` `021aa898` `021ab05c` `021aa9fc` `021aaa40` |
| display-blank "enter" (ov006 family D) | `021aa7d8` |
| BGn toggle (ov006 family E) | `021abb6c` (main) `021aad5c` (sub) |
| audio init (ov005 recipe) | `021aa9bc` `021aa514` |
| constructor / capture-arm | `021aaadc` `021aadbc` |

## Recipes re-proven (the whole library transferred)

- **Family-D display-blank gotcha CONFIRMED for ov021** (`021aa7d8`): the SUB
  DISPCNT must be an **inline cast** `*(volatile unsigned long *)0x04001000`, NOT
  derived from the main pointer (`disp[0x400]`). mwcc still folds the address to
  `add r1, r2, #0x1000` (r2 already holds the main base) but keeps
  value=r0/address=r1. **Derived = 61%, inline cast = 100%** — same as ov006.
- **BGn toggle** (ov006 family E, `021abb6c`/`021aad5c`): dup-RMW-per-branch,
  compute `mode` then `base` as separate temps, leading flag store.
- **Audio init** (ov005 recipe, `021aa9bc`/`021aa514`): the channel is
  `data_02104f4c.chan` read through the `unsigned :3` bitfield; the deferred
  start is `func_020373cc(0x..., 1, 0, -1)` (the `-1` materialises by reuse).
- **Bind-call-result-to-temp** (`021ab9d0`): fixed the tail extra-`mov`
  (58%→78%) even though the load-register swap kept it a near-miss.
- **Return-value watch** (`021aaadc`): a "void-looking" setup that actually ends
  `mov r0,#1; ...` returns 1 — declare it `int` (95%→100%).
- **Split immediates** (`021aadbc`): `| 0x204 | 0x400` (0x604 isn't encodable, so
  two `orr`s); reuse the `0x400100e` base + `0xe` offset for the second store.

## Deferred (NOT shipped — catalogued for the Mac lane)

| func | % | class |
|---|:---:|---|
| `021aa4a0` | — | **permuter** (indirect `blx` dispatch; ov005 `021acfb0` kin) |
| `021ab9d0` | 78% | register-choice (o[0x48]/o[0x44] load-register swap; reshaped from 58%) |

`021ab9d0` is the only register-choice miss; per the brief I reshaped it (bind
idx, swap operands, bind the tail temp) — the tail fixed but the load-register
swap is a coin-flip. The other 21 funcs all matched or are clearly tractable.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (per-unit + `report.json`) | **12/12 = 100.0** |
| in-tree build + link (`ninja rom`) | compiled + linked, ROM written |
| ov021 `delinks.txt` | +12 `complete .text`; gap set 28 → 16 (−12, clean re-dis) |
| `check_match_invariants.py` | **0 errors** |
| `ruff check tools/ tests/` | clean |
| 3-region `ninja sha1` | deferred to the brain on merge (per brief) |

Pre-flight: branched from fresh `main` (`ff7e8ee` = #847 + #848 + #849);
cleaned stale gap files + re-`dis`.

## Recommendation for the brain

1. **ov021 is a strong, reshape-able vein — keep the scaffolder here for wave 2.**
   ~10 funcs remain: the random-unique loops (`021aba18`/`021abaa0`, magic
   div-by-5), the 0xb8–0xec render helpers, and the 0x100+ tier. Expect a
   healthy wave 2 (the state-machine recipes keep paying off).
2. **The recipe library is now overlay-portable** — every ov006/ov005/ov015
   recipe applied to ov021 unchanged. Bank that for future fresh-overlay pivots.
3. **`021aa4a0` → the permuter backlog** with `021acfb0` / `021b5a14`.
4. **Run the 3-region SHA1 on merge** — per-pick gate here is EUR objdiff only.

## Cross-references

- `docs/research/brief-333-ov015-wave2-drain.md` — the tier-transition that
  triggered this pivot + the bind-struct-base lever.
- `docs/research/brief-304-ov006-wave1-drain.md` / `brief-327-ov005-wave1-drain.md`
  — the family-D / family-E / audio-init / dispatch recipes re-proven here.
- `src/overlay021/ov021_core.h` — §VERIFIED wave-1 block + the recipe notes +
  the deferred catalogue.
