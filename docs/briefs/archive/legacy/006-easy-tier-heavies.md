### claude-pc/easy-tier-heavies

**Goal:** Match ~30 easy-tier leaf functions across the four overlays
with the densest remaining easy-tier backlog — **ov000, ov010, ov011,
ov015**. Same category as brief 005 (hand-crafted C from
disassembly, 1–3 lines per match), just spread across overlays where
the decomp hasn't built context yet. Lean on the two Cloud tools
that landed alongside brief 005 to cut per-match setup cost.

**Context:**

- Brief 005 closed out 24 easy-tier matches across the "warm"
  overlays (ov005/ov006/ov007/ov009). Pattern is proven; this brief
  scales it to colder overlays.
- `python tools/next_targets.py --version eur --tier easy --module
  <ov> --top 100 --no-outputs` reports the current distribution:

  | Overlay | Easy unmatched | Top-5 starter addresses |
  |---------|----------------|--------------------------|
  | ov000   | 46             | `0x021ac530` (0x8), `0x021aaeb8` (0xc), `0x021acdc0` (0xc), `0x021aa4b4` (0x10), `0x021abe54` (0x10) |
  | ov011   | 37             | `0x021d2c5c` (0x8), `0x021d2c8c` (0x8), `0x021d2d3c` (0x8), `0x021c9e80` (0xc), `0x021c9e8c` (0xc) |
  | ov010   | 19             | `0x021b2480` (0x8), `0x021b2488` (0x8), `0x021b2888` (0x8), `0x021b3a14` (0x8), `0x021b287c` (0xc) |
  | ov015   | 12             | `0x021b2480` (0x8), `0x021b2488` (0x8), `0x021b2888` (0x8), `0x021b3520` (0x8), `0x021b5a64` (0x8) |
  | **Total available** | **114** | **Aim for ~30 matched in this brief** |

- All 4 modules are in the passing set (24/27 OK today). The `dsd
  check modules` baseline should stay stable.
- Pattern template reminder — see
  [`src/overlay005/ov005_021ab260.c`](../../src/overlay005/ov005_021ab260.c)
  and [`src/overlay007/ov007_021b2ce8.c`](../../src/overlay007/ov007_021b2ce8.c)
  (brief 005 matches) for the disassembly-prefaced-comment + minimal-C
  shape. Keep that shape.

**New tools you should actually use this time (both landed in the
last cycle):**

- **[`tools/scaffold_batch.py`](../../tools/scaffold_batch.py)** (#74)
  — pre-creates stub `.c` files with caller/callee/load context in
  the header comment. Run it first per overlay:

  ```
  python tools/scaffold_batch.py --version eur --tier easy \
    --module ov011 --count 10 --confirm
  ```

  Output: 10 pre-populated `.c` files under `src/overlay011/`, each
  with the function's context embedded. You then fill in the body
  and iterate against objdiff. Default is dry-run; `--confirm`
  required to write. It skips existing files safely.

- **[`tools/propagate_template.py`](../../tools/propagate_template.py)**
  (#73) — if during this brief you notice a cluster of functions in
  the same overlay that look near-identical (same size, same reloc
  shape), match ONE by hand then batch-propagate to the rest:

  ```
  python tools/propagate_template.py apply \
    --template src/overlay011/ov011_021d2c5c.c \
    --target ov011 0x021d2c8c
  ```

  It validates reloc shape before emitting — refuses with
  `TemplateMismatch` if they diverge, so you can't accidentally
  ship the wrong C.

- [`tools/find_callsites.py`](../../tools/find_callsites.py) (#61) —
  when signatures aren't obvious, check who calls the function:
  `python tools/find_callsites.py --version eur ov011 0x021d2c5c`.
- [`tools/check_match_invariants.py`](../../tools/check_match_invariants.py)
  (#67) — still the pre-PR hygiene gate. Also now runs in CI (#69)
  on every PR — your PR gets a clean comment if zero errors;
  `missing_tu_source` errors hard-gate merge.

**Scope:**

- `src/overlay<NN>/<filename>.c` for each matched function (one .c
  per function is still cleanest at easy-tier).
- `config/eur/arm9/overlays/ov<NN>/delinks.txt` — append `complete`
  entries as each TU lands.
- Renames are still *optional* — `find_callsites` + your judgment
  on signatures decide case-by-case. Keep `func_<mod>_<addr>` by
  default.

**Non-scope:**

- ❌ Failing modules (`main`, `dtcm`, `ov004`).
- ❌ The warm overlays (ov005/ov006/ov007/ov009) — brief 005 already
  drew down their easy tier. If you need more there, a separate
  follow-up sweeps the remainders.
- ❌ The 4 deferred sinit outliers (brief 007 territory).
- ❌ Medium/named/hard tier (brief 008+).
- ❌ Any `tools/`, `libs/`, or workflow changes.

**Success:**

- ~30 functions at 100% objdiff match, distributed roughly by
  overlay backlog — e.g. 10 in ov000, 9 in ov011, 6 in ov010, 5 in
  ov015. Adjust proportions as the work dictates; the count matters
  more than the exact split.
- `ninja rom && ./dsd check modules` still reports **24/27 OK**.
- `python tools/check_match_invariants.py --version eur` exits 0
  (warnings fine if they're the known brief-003 ctor/dtor category).
- **PR cadence: one PR per overlay** (so 4 PRs total, not all ~30
  in one). Each PR's body should cite its `check_match_invariants`
  result and `next_targets` tier-delta line.

**Branch:** `claude-pc/easy-tier-heavies` (or per-overlay,
`claude-pc/easy-tier-ov011` etc.).

**After this brief lands:**

1. **Brief 007** — the 4 deferred sinit outliers from PR #55. Each
   needs its own targeted C incantation (`volatile`, arg-order, or
   reasoned asm exemption). Small, slow, careful work.
2. **Brief 008** — named-medium tier (22 candidates). First
   genuinely-non-trivial matching — these have real logic that
   requires understanding the surrounding system.
3. Unmatched easy tier after brief 006: ~80 targets remaining,
   mostly in the same 4 overlays. Brief 009 can sweep the remainder
   or brain can fold into brief 007's scope if the outliers prove
   quick.
