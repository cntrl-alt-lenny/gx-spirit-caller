[//]: # (markdownlint-disable MD013 MD041)

# Brief 281 — cold-RE wave 4: ov002 simple-shape small functions

**Brief:** 281 (decomper). Wave 3 refined the rule — **control-flow
*shape*, not byte size, decides hand-matchability.** Keep running the
recipe (`m2c_feed` → name/type from banked verbs + band map → coerce →
3-region SHA1) on simple-shape (straight-line / accessor / dispatcher)
small funcs; triage each from the draft and **skip loop/liveness-heavy
bodies** (defer to permuter). brief 278's census: ov002 has ~1887 `<0x100`
funcs — long runway.

## Headline

**10 shipped, all 3-region SHA1 PASS.** Shape-triage held up: every
straight-line / call-combinator / dispatcher matched (often first try);
loops were skipped by the triage and never attempted. **New finding (the
wave-4 wall): a systematic +1 register-numbering offset on the per-player
`0x868` accessors** — my minimal signatures put the index/value temp in
`r1`/`r3` where the original used `r2`/`ip`. That, not shape, is what now
blocks a fraction of the otherwise-perfect simple accessors.

## Shipped (10)

| addr | size | shape / role | key |
|---|---|---|---|
| `021b90a8` | 0x80 | per-player slot classify → `0202de9c` → 3-way | **switch jump-table** + **bitfield-id** (mwcc canonicalises `&mask`/`(x<<N)>>N` to a pooled mask — only a bitfield forces `lsl;lsr`) |
| `021b9144` | 0x80 | event-code → required-phase predicate | **switch jump-table** (`addls pc,pc,r0,lsl#2`) + **dense-set bitmask** membership |
| `021b9e00` | 0x48 | guarded per-player `0x868` read | `func_020310d8` gate |
| `021b9e48` | 0x48 | sibling | `func_020312a0` gate |
| `021b9da4` | 0x30 | list-walk callback | clamp accumulator (`int v` → load/`movge`/store, not `strge`) |
| `021b9dd4` | 0x2c | min-cost query | callback wrapper over `021b42e4` (passes `&021b9da4`) |
| `021bb418` | 0x2c | sum over both players | `f(0,a)+f(1,a)` |
| `021bb91c` | 0x34 | sum over both players | `f(0,a,-1)+f(1,a,-1)` (`-1` derived from live const) |
| `021bb7b0` | 0x48 | per-player min ignoring zeros | guard-guard-min |
| `021ba4ec` | 0x38 | query-into-local + forward | `return r` (not literal `0`) drops a redundant `moveq` |

## New gotchas (added to recipe-gotchas.md)

- **G23 — dense switch → jump table.** Consecutive `case` values (e.g.
  5772..5778) lower to `sub; sub; cmp #n; addls pc, pc, idx, lsl #2` + a
  `b` table; the case **bodies are emitted in source order**, so order
  them to match the orig's block layout. (`021b90a8`, `021b9144`.)
- **G24 — small-set membership → bitmask, not cmp-chain.** mwcc compiles
  `x ∈ {a,b,c}`-returns-bool as `(1 << x) & MASK`. A `switch`/`||` over
  few cases gives a cmp-chain instead. To get the bitmask + the exact
  0/1 polarity, write: `int r = 0; if ((unsigned)x > max) return r;
  if ((1 << x) & MASK) r = 1; return r;`. (`021b9144`.)
- **G25 — only bitfields force `lsl;lsr` masking.** Both `x & MASK`
  (non-encodable MASK) and `(x << N) >> N` are canonicalised by mwcc to a
  **pooled-constant `and`**. To reproduce orig's `lsl #(32-off-N); lsr
  #(32-N)` you must read a real bitfield (`struct { u32 f : N; }` via a
  pointer — extends G21). (`021b90a8`, `021bcfe4`.)

Reaffirmed: G21 (bitfield via pointer stays in-register), the constant
materialised from a live neighbour (`-1` as `sub`), gotcha 11/14.

## The wave-4 wall — signature-driven register numbering

Five otherwise-perfect simple accessors are deferred for **one register**:

| pick(s) | the single diff |
|---|---|
| `021ba1a0` / `021ba1e8` | `0x868`/`cf16c` temp in `r1` (mine) vs `r2` (orig) |
| `021bad58` | index temp in `r3`/`ip` swapped vs orig |
| `021bcfe4` | loaded bitfield value in `r1` (mine) vs `r2` (orig, reusing the dead address reg) |
| `021b9ba0` | mwcc predicated the tail (`ldrne…`) where orig early-returns (`popeq`) + unconditional tail |

Each is **structurally byte-exact** — control flow, offsets, the `0x868`
index, the calls all match — diverging only in which scratch register
mwcc colours the index/value temp, or predication-vs-branch. The pattern
is consistent: my **minimal signatures** (`f(int arg0)` / `f(int a, int
b)`) free up `r1`/`r3` that the original author's code keeps reserved, so
mwcc picks a lower register. (`(void)arg1` doesn't help — mwcc drops a
dead param.) This is the same reg-alloc plateau the permuter hits, so
these are filed as permuter candidates — **but** a cheaper unlock may be
recovering the **canonical per-player-accessor signature** (likely
`(player, idx, …)` with a consistent arg count); worth a brief-282-style
probe, since it would unblock a whole tier of 1-reg-off accessors at once.

## Calibration (cumulative)

| | shape | hand result |
|---|---|---|
| straight-line / call-combinator / dispatcher (≤1 branch, ≤3 live) | matches | 10/10 attempted shipped |
| switch (jump-table / bitmask) | matches with G23/G24 | 2/2 |
| `0x868` accessor with tight reg pressure | 1-reg-off | deferred (signature probe) |
| loops / multi-value liveness | walls | not attempted (triaged out) |

Shape-triage (a fast in-process `m2c_feed.feed()` scan classifying by
backward-branch = loop, `blx`/`addls pc` = indirect, branch count) is the
right front-end — it kept me off the loops entirely.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 10/10 byte-identical |
| `tools/check_match_invariants.py` | 0 errors (4666 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2302 passed |

(`src/overlay002/` gains 10 `.c`; EUR ov002 `delinks.txt` gains 10
`complete` blocks. No USA/JPN config change. `tools/m2c_feed.py` drove
every draft; m2c itself wasn't needed — simple-shape GAS reads directly.)

## Recommendation for the brain

1. **Recover the canonical per-player-accessor signature** (a small
   probe): the 1-reg-off accessors (`021ba1a0` family etc.) likely match
   with the right arg count. Highest-leverage next step — unblocks a tier.
2. **Keep shape-triaging the `<0x100` vein** — straight-line/dispatcher
   shapes are a reliable hand-drain; the census says ~1887 ov002 funcs
   remain, a large fraction simple-shape.
3. Route the loop families (search-loop, list-walk from wave 3; the new
   `021b9b20`/`021b97d4`) and the predication/byte-unpack defers to the
   permuter.

## Cross-references

- `docs/research/brief-278-harvest-census-clusterA-map.md` — the `<0x100`
  census (runway) + `tools/size_census.py` / `find_shape_templates.py`.
- `docs/research/brief-279-coldre-wave3-clusterA.md` — the shape-not-size
  rule this wave applies; the `0x868` family.
- `docs/research/recipe-gotchas.md` — G20-22 (wave 2) + G23-25 (this wave).
