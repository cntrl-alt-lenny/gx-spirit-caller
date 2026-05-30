[//]: # (markdownlint-disable MD013 MD041)

# Brief 276 — decomp-permuter standup + pilot (de-risk the Track-2 byte-match wall)

**Status:** setup re-validated end-to-end; both deferred picks piloted.
decomp.me / research / tools only — no SHA1, no `.c` shipped (pilots are
research artifacts in `/tmp` + the gitignored `tools/_vendor/`). Fetched
content treated as data; no install script piped to a shell.

## Headline — works, but not a silver bullet for this band

The permuter is **real and validated** (clones, patches, compiles,
scores, anneals at ~127 iter/min). On the pilot picks it **helped on the
scheduling pick but plateaued on the reg-alloc pick — neither
byte-matched** in a ~10-18 min run:

| Pick | wall (brief 275) | base score | best | result |
|---|---|---:|---:|---|
| `func_ov002_021d91e0` | arg-pack **scheduling** | 1775 | **1090** (−39 %) | annealed, no match |
| `func_ov002_021b05d0` | repeated-block **reg-alloc** | 690 | **690** (0 improvements) | hard plateau, no match |

**Verdict: the permuter is worth keeping in the loop, but it does NOT
unlock the 0x200-0x400 band by itself.** It anneals
*scheduling*-type divergence (pick 1) but **plateaus on the systematic
*reg-alloc* divergence that dominates the band** (pick 2 — the P-11
class). This matches the project's own history (briefs 196/198/200:
permuter cracked some, plateaued on P-11 at scores 480-500) and
**reinforces brief 277's hub/leaf-first strategy** (small funcs = fewer
reg-alloc DOF = both hand-coercible *and* more permuter-tractable).

## (A) Standup — already wired; re-validated

decomp-permuter is **established project tooling** (`tools/permute.py`,
brief 096), not a from-scratch build. `tools/permute.py <func> --run`
auto-installs + runs. Re-validated this session on `func_02000c44`:

- **Clones** simonlindholm/decomp-permuter at pin `efc5c5e7`, applies the
  brief-096 macOS/ARM patches (import.py ×3 + prelude.inc).
- **Deps** into `.venv_permuter/` (PEP 668 fallback — pip-refused
  handled).
- **Compiler** = `mwccarm 2.0/sp1p5` via the exact project cflags
  (generated `compile.sh`); **target** assembled by `arm-none-eabi-as
  -mcpu=arm946e-s -mthumb-interwork`.
- **Loop confirmed:** loaded base.c, compiled, scored, ran 227
  iterations in 25 s (7 threads). The setup is healthy.

**Setup cost: ~0 (already wired) + ~1 min first-run clone/deps.** No new
install. Prereqs (all present): `wine`, `arm-none-eabi-as`, `mwccarm`,
`dsd`.

**Friction found (tooling gap):** `tools/permute.py --run` resolves the
function via `delinks.txt` → a **src-claimed TU**. The cold-RE picks are
**unclaimed overlay** functions (no `src/` stub), so the wrapper can't
target them directly. I set the permuter up **manually** (below) — a
`tools/permute.py --from-gap <func> --base <draft.c>` mode that
auto-extracts the gap-object disasm + uses an m2c draft would make the
cold-RE loop one command. (Not built here — the verdict argues against
doubling down on the permuter for this band; flagged for the brain.)

## (B) Pilots — the m2c-draft → permuter loop, run for real

For each pick I drove the raw permuter (bypassing the delinks
dependency):

1. **draft** — `tools/m2c_feed.py` (brief 274) → m2c comprehension draft.
2. **base.c** — added typedefs + extern/struct decls so it compiles
   under `mwccarm`. Both compiled; pick 1's prologue + first 8 insns are
   already byte-identical to orig (the ~67 % start).
3. **target.s** — extracted the function from its `dsd dis` gap-object
   `.s`, normalized to the permuter's `glabel` form, assembled to
   `target.o`.
4. **nonmatchings dir** — base.c + compile.sh + settings.toml
   (`compiler_type = "mwcc"`) + target.o → `permuter.py <dir> -j 7
   --stop-on-zero`.

### `func_ov002_021d91e0` — arg-pack **scheduling** (annealed 39 %)

Base **1775** → best **1090** over **2439 iterations (~18 min)**. The
permuter found many better permutations (10+ `output-<score>` dirs:
1090/1245/1310/1330/…) — it is **actively annealing the 4 arg-pack
call-site scheduling**, the exact wall brief 275 hit. But it did **not**
reach 0 in the run. Trajectory is a slow descent, not a cliff to 0.

### `func_ov002_021b05d0` — repeated-block **reg-alloc** (hard plateau)

Base **690** (closer — 82 %) → **0 improvements** over **1447 iterations
(~10 min)**. The permuter could **not reduce the score at all**: the
per-block indexed-read temps not landing in orig's registers across the
3 repeated blocks is a **local minimum the source-level passes don't
escape** — textbook P-11 reg-alloc plateau. The permuter's passes
(reorder-stmts, retype, split-assignment, …) don't change *which
registers mwcc picks*, which is the entire diff here.

## (C) Verdict, recipe, caveats

**Does it crack the reg-alloc/scheduling wall? Partially.** Scheduling:
yes-ish (anneals, may converge over hours). Systematic reg-alloc: **no**
(plateaus immediately) — the same wall the project filed as P-11.

**The permuter-in-the-loop recipe (validated):**

```text
m2c_feed.py <func>  →  m2c draft
   ↓  declare structs/externs so it compiles under mwccarm  (base.c)
extract gap-obj dsd-dis .s → glabel target.s → as → target.o
   ↓  base.c + compile.sh(mwcc) + settings.toml + target.o
permuter.py <dir> -j7 --stop-on-zero   →  output-0/source.c on a match
```

**Honest caveats (bound the conclusion):**

1. The base.c drafts are **my reconstructions** (m2c + struct guesses),
   not the decomper's exact 67 %/82 % sources — the bases (1775/690)
   reflect my drafts. A definitive run wants the decomper's exact
   starting C.
2. **Short runs** (~10-18 min) vs the tool's **multi-hour** design.
   "0 improvement in 10 min" is strongly suggestive (and matches P-11)
   but not a proof of impossibility.
3. **Default weights** — no `[weight_overrides]` tuning (e.g. boosting
   `perm_reorder_stmts` / `perm_temp_for_expr` for scheduling).

**Recommendation:**

- **Keep the permuter for scheduling-bound picks** (it anneals) and for
  long unattended runs — but **do not expect it to unlock the big
  branchy band**; its dominant wall (systematic reg-alloc) is the P-11
  class it plateaus on.
- **Prefer brief 277's hub/leaf-first** (small funcs): fewer reg-alloc
  DOF → hand-coercible AND, if needed, the permuter has a smaller space
  to search. That is the higher-EV path to ships than permuter-grinding
  the 0x200-0x400 dispatchers.
- If the brain wants a fuller permuter test: re-run with the decomper's
  exact drafts, **hours** of wall-clock, and weight tuning, before
  committing the band to a permuter strategy. This pilot de-risks the
  *bet* (it works, it's not magic), not a full convergence study.

## Verification

| Gate | Status |
|---|:---:|
| permuter setup (clone/patch/deps/compile/score) | ✅ validated |
| pick 1 run | base 1775 → 1090 (2439 iter, ~18 min); no match |
| pick 2 run | base 690 → 690 (1447 iter, 0 improvements); no match |
| `ruff` / `tests/` | unchanged (docs-only) |
| artifacts gitignored (`tools/_vendor`, `.venv_permuter`, `permute_log`, `build/`) | ✅ |

## Cross-references

- `docs/research/permuter-workflow.md` — the brief-096 macOS/ARM setup
  this re-validates.
- `docs/research/brief-275-coldre-wave1-ov002-band.md` — the 2 deferred
  picks + their walls.
- `docs/research/first-wave-wall-reg-alloc-plateau.md` — P-11 (the
  reg-alloc plateau pick 2 reproduces).
- `tools/m2c_feed.py` (brief 274) — the draft generator feeding step 1.
- `tools/permute.py` (brief 063/096) — the auto-runner re-validated.
