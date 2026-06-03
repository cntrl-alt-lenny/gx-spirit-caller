[//]: # (markdownlint-disable MD013 MD041)

# Brief 331 — pivot to ov015: clean-C wave 1 (fresh, richer overlay)

**Brief:** 331 (scaffolder, co-drain). ov005's easy `<0x98` tier is drained (the
THINNING flag of brief 329 held), so pivot to **ov015** — 31 funcs `<0x100`, the
richest untouched vein (the decomper took ov020). Per-pick gate = EUR objdiff
100% (direct-mwcc); the brain runs the 3-region SHA1 on merge. Own
`src/overlay015/`, the ov015 `delinks.txt`, and a new `ov015_core.h`. Target ~12.

## Headline

**12 shipped (all `.c`), all EUR objdiff 100% + `ninja rom` OK.** The pivot
validates: ov015's reachable cohort is **productive** — small dispatchers /
accessors / predicates over two central structs (`data_ov015_021b5e44`,
`021b5e28`) plus a text-metrics layer. Unlike ov006 it is singleton-dominated
(one 0x78 clone pair), but unlike ov005's tail the functions are clean — **10 of
12 matched first-try or with a single targeted reshape**, and the two deferrals
are a permuter-class `blx` and two reg-alloc near-misses. ov015 matched: → +12.

## The lever — the divmod r0/r1 recipe (new, banked)

The text-metrics functions lean on **`func_020b3870` = mwcc's renamed signed
divmod runtime** (quotient r0, **remainder r1**). Two facts make it matchable:

1. **Call it by name for division**, not the `/`/`%` operators. A variable-divisor
   `a/b` emits a `bl _s32_div_f` reloc, which traps against the orig's
   `func_020b3870` (symbol mismatch). The matched funcs (021b34cc, 021b23f4,
   021b238c, …) call `func_020b3870(a,b)` explicitly → reloc matches, quotient in
   r0.
2. **For the remainder, declare it `long long`.** `021b36c4` computes
   `w += n - (w % n)` — the orig uses the divmod's r1. An `int`-returning call
   only exposes r0, so:
   `extern long long func_020b3870(int,int); … n - (int)(func_020b3870(w,n) >> 32);`
   The `>> 32` selects the high result word (r1 = remainder). 95% → 100%.

## The 12 picks

| func | size | shape |
|---|---|---|
| `021b5a6c` | 0x20 | init two subobjects, return self |
| `021b2bf8` | 0x20 | register two callback records |
| `021b2b08`/`021b2b80` | 0x78 | 8-case VRAM-bank selectors (jump table) — clone pair |
| `021b35d0` | 0x44 | cell-addr resolve (2 guards → base + table[idx*4]) |
| `021b31f0` | 0x50 | load 4-short rect + seed scaled field |
| `021b3528` | 0x50 | printer config (`<<22>>28` 4-bit field + the `:3` channel) |
| `021b34cc` | 0x54 | scroll-advance (divmod quotient) |
| `021b3578` | 0x58 | build two printers on a stack cfg |
| `021b36c4` | 0x54 | run width (divmod **remainder**; calls into ov005 metrics) |
| `021b59a4` | 0x70 | text-job teardown (guarded frees) |
| `021b238c` | 0x68 | dirty-gated interp (1-bit bitfield struct → `lsl#31;lsr#31`) |

## Reshape recipe re-applied (the wave-2 lever, carried from `ov005_core.h`)

Four of the 12 came in as 70–95% near-misses fixed by **reshaping** (not
rewriting): bind a multiply-referenced struct base to a `char *` local so it
loads once up front (`021b35d0`, 70%→100%); force a bit-test to `lsl#31;lsr#31`
with a 1-bit bitfield struct instead of `& 1` → `and` (`021b238c`, 92%→100%);
the divmod-remainder `long long` trick (`021b36c4`, 95%→100%); and the standard
"call divmod by name for the quotient."

## Deferred near-misses (NOT shipped — catalogued for the Mac permuter lane)

| func | % | class |
|---|:---:|---|
| `021b5a14` | — | **permuter** (indirect `blx` dispatch; same as ov005 `021acfb0`) |
| `021b23f4` | 78% | reg-alloc/scheduling (sa/sb split + r2/r3 coin-flip; reshaped from 65%) |
| `021b28a8` | 89% | cond-move order (`!=0` → `movne;moveq`; orig `moveq;movne`) |

Per the brief I reshaped both 70%+ misses before deferring; they resist without
grinding. `021b5a14` is the only permuter-class one.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (per-unit, direct-mwcc) | **12/12 byte-identical** |
| EUR objdiff (`report.json` `fuzzy_match_percent`) | **12/12 = 100.0** |
| in-tree build + link (`ninja rom`) | compiled (12 `.o`) + linked, ROM written |
| ov015 `delinks.txt` | +12 `complete .text`, clean re-dis drop-out |
| `check_match_invariants.py` | **0 errors** (placeholder-name warns only) |
| `ruff check tools/ tests/` | clean |
| 3-region `ninja sha1` | deferred to the brain on merge (per brief) |

## Recommendation for the brain

1. **ov015 is a productive vein — keep the scaffolder here for wave 2.** ~18
   funcs `<0x100` remain (the 0x80–0xe8 tier of accessors/loops + the bigger
   0x100+ render functions like `021b30f0`, which already calls the matched
   `021b2b80`). The divmod + reshape recipes make them tractable.
2. **The divmod r0/r1 recipe generalizes** — bank it for any overlay whose code
   does integer division/modulo through `func_020b3870`.
3. **`021b5a14` → the permuter backlog** with ov005 `021acfb0` / ov008
   `021aafa4` for the eventual Mac lane.
4. **Run the 3-region SHA1 on merge** — per-pick gate here is EUR objdiff only.

## Cross-references

- `docs/research/brief-329-ov005-wave2-drain.md` — the THINNING flag + the
  register-reshape recipe this wave re-applies.
- `src/overlay015/ov015_core.h` — §VERIFIED wave-1 block + the divmod recipe +
  the deferred near-miss catalogue.
