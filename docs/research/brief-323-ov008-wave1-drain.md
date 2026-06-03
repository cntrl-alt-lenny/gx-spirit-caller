[//]: # (markdownlint-disable MD013 MD041)

# Brief 323 — pivot to ov008: co-drain wave 1

**Brief:** 323 (scaffolder, co-drain). ov000 clean-C is mined (brief-321
thinning verdict), so the second drain stream pivots to **ov008** — collision-
free vs the decomper (on ov010): own `src/overlay008/`, the ov008
`delinks.txt`, and `ov008_core.h`. Per-pick gate = **EUR objdiff 100%**
(direct-mwcc); the brain runs the 3-region SHA1 on merge. Small-first clean-C;
target ~20–25 (≈ half the shape-reachable), flag when yield drops.

## Headline

**12 shipped (all `.c`), all EUR objdiff 100%**, all drop out of a clean ov008
re-delink, and **EUR `ninja sha1` PASSES** with the wave applied. ov008 matched
(`.c`+`.s`): 12 → **24**.

**Yield signal — the easy `<0x98` tier is drained; the `0x98–0xf4` tier is
medium (not mined).** ov008's `<0x100` cohort is 48. The clean guarded-call /
dispatch / scan-loop / init-seq / clamp / range-map / row-clear shapes all live
**below 0x98** and gave **12 clean picks** (most first-try). Every remaining
unmatched `<0x100` function sits at **0x98–0xf4** and is a *medium* shape:
command-record packs, fixed-point div-magic, or byte-combine stride-52 builders
(below). So wave 1 = 12; a **wave 2 is warranted** for the medium tier — this
is a yield *transition*, not a thinning/mined flag (cf. ov000 wave 3's 3).

## The 12 picks (per-unit EUR objdiff 100%)

| family | funcs | objdiff |
|---|---|:---:|
| guarded-call / dispatch (`*021b270c` scene obj) | `021b2244` · `021b1ef4` · `021b2028` · `021b219c` | 100% |
| scan-loop over `021aa540` (popcount-sum) | `021aedfc` · `021aee54` | 100% |
| stride-52 paired popcount-sum | `021aa540` | 100% |
| stride-52 row-clear loop | `021aa900` | 100% |
| init-sequence (chained call + 6-loop) | `021aeeac` | 100% |
| clamp + scale + mla | `021ac590` | 100% |
| range-map with div-by-63 | `021ac06c` | 100% |
| guarded-call loop | `021ab120` | 100% |

All 12: EUR objdiff 100% (direct-mwcc, per-unit) · dropped from a clean ov008
re-delink · EUR `ninja sha1` OK with the wave applied.

## Recipes that carried over / were proven

- **Cached-base vs re-read**: most `*021b270c` accessors RE-READ the global each
  use; *caching* `o` in a local forces a callee-saved push the orig doesn't have
  (`021b219c`, and the `021b2268` near-miss). Match by dereferencing fresh.
- **Loop-counter declared before the accumulator** to land it in the orig's reg
  (`021aedfc` — the ov006 wave-5 gotcha, re-confirmed).
- **Unsigned u16 → `movhi`** clamp (declare the value `unsigned`) (`021ac590`).
- **Hoist `x - A` above the branches** in a range-map so the subtract sits right
  after the compare; mwcc regenerates the `/63` magic verbatim (`021ac06c`).
- **div-by-const magic** and the **`switch` / short-circuit** lowerings behave
  exactly as in the ov000/ov006 notes.

## Shared sinks recovered (cross-overlay)

`func_0201e5b8` / `func_02006e1c` (command-record, cf. ov006), `func_02037208`
(status/notify, cf. ov000/ov004), `func_02005dac` / `func_020944a4` /
`func_02094504` (VRAM), `func_020b3870` (scale lookup), `func_0201d47c` (record
alloc). `func_ov008_021aa540` = `popcount(row27a0[idx]) + popcount(row27a4[idx])`
(the leaf `021aa4a0` is a 32-bit parallel popcount).

## Medium tier (the `0x98–0xf4` cohort, ~20 funcs) — wave-2 / RE / permuter

1. **Command-record pack family** (`021abba0`, `021abb08`, `021aba3c`):
   `buf[0]=((a1-K)&0xff)|FLAG|(((a0-K)<<23)>>7); strh CONST,buf+4; 020944a4(buf,
   02005dac(2,0), 8);`. Logic byte-identical but the two `sub #K` + pack ops
   **schedule differently** from C (20v20 near-miss) → permuter, or a wave-2
   pass with a different operand structuring.
2. **Fixed-point / div-magic** (`021ac430`, `021ac4d0`, `021af4c4`): `(x<<29)…
   ror#29` modulo + asr-rounded divides — m2c / permuter territory.
3. **Byte-combine stride-52 builders** (`021acfa0`, `021ac208`, `021aceac`,
   `021adbbc`): index = `byte0 + byte1` of a u16, then `row[idx*52]` writes + a
   bitfield store — matchable with per-function RE.
4. **`021b2268`** guarded-setter — 29v31, a pure pool-layout offset (29 identical
   instructions); almost certainly matches on the real link — flagged for the
   brain to confirm on merge.

The popcount leaf **`021aa4a0`** is a 27v27 mask-scheduling near-miss (same class
as ov000 `021ab1b0`) — permuter target; not blocking (callers use extern+reloc).

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-unit) | **12/12 byte-identical** |
| clean re-delink drop-out (disasm-header scan) | **12/12** out of the ov008 gap objects |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| ov008 `delinks.txt` | 24 `complete` blocks (12 prior + 12; matched-set subtracted) |
| `ruff` / `tests/` / `check_match_invariants` | clean / pass / 0 errors |

`src/overlay008/` gains 12 `.c` + the new `ov008_core.h`. EUR ov008
`delinks.txt` +12 `complete`. No tool / USA / JPN change. Only shared file is
`docs/research/README.md` (regenerated, not hand-merged).

## Recommendation for the brain

1. **Queue an ov008 wave 2 for the `0x98–0xf4` medium tier** — it is NOT mined;
   the easy tier just ran out at 12. The command-record family + the byte-combine
   stride-52 builders are the richest next veins (shared `0201e5b8`/`02006e1c`
   sinks already recovered).
2. **Permuter the two near-misses** that are byte-essentially-correct: `021aa4a0`
   popcount (27v27 mask schedule) and the command-record pack family (20v20).
3. Confirm **`021b2268`** on merge (29v31 pool-layout — should be a match once
   linked, where the per-TU pool offset is moot).

## Cross-references

- `docs/research/brief-321-ov000-wave3-drain.md` — the ov000 thinning verdict +
  ov008 pivot recommendation this brief acts on.
- `docs/research/brief-300-ov006-premap.md` — the ov004 > ov000 > ov008 ranking.
- `src/overlay008/ov008_core.h` — the byte-proven ov008 globals / sink sigs /
  family recipes / medium-tier map (§VERIFIED wave-1 block).
