# First-wave wall — permuter batch results (brief 196)

**Brief:** 196 (scaffolder). Briefs 190 + 193 together skipped 9
picks across two clusters where the failure mode is mwcc
register-allocation or expression-scheduling drift. Brief 196
wraps `tools/permute.py` (brief 098) for batch use so future
waves can drive permuter against a worklist + budget cap and
aggregate per-pick outcomes, then runs the wrapper against the
9 affected picks and documents the outcome.

## Worklist + wrapper

- **Worklist:** [`docs/research/cluster-b-e-permuter-targets.json`](cluster-b-e-permuter-targets.json) — 9 picks, schema documented in the wrapper module docstring.
- **Wrapper:** [`tools/permute_batch.py`](../../tools/permute_batch.py).
- **Tests:** [`tests/test_permute_batch.py`](../../tests/test_permute_batch.py) — 36 cases covering load_worklist, stub_path, parse_subprocess_output, classify_subprocess_outcome, build_permute_command, run_one_pick (5 outcome paths), run_worklist (budget + dry-run), summarise/write_results.

Run:

```bash
python tools/permute_batch.py \
    --worklist docs/research/cluster-b-e-permuter-targets.json \
    --out build/eur/analysis/permute_batch_results.json \
    --per-pick-seconds 60 \
    --total-seconds 600 \
    --threads 4
```

The wrapper invokes `tools/permute.py <addr> --run --max-seconds
N` as a subprocess per pick. Each subprocess inherits the full
single-shot logic from brief 098 / 096 (auto-install,
`.s` normalisation, log streaming, match detection). The
wrapper adds worklist parsing, per-pick + total wall-clock
caps, stub-existence gate, and a results JSON.

## Per-pick outcome (dry-run audit)

The wrapper has a `--dry-run` mode that runs ONLY the stub-
existence gate per pick — useful for triaging a worklist
before committing real CPU. Running it against the brief 196
worklist surfaces the empirical scope problem this brief
clarified:

| Pick | Module | Addr | Size | Cluster | Stub status | Brief 196 outcome |
|---|---|---|---:|---|---|---|
| B-08 | `main` | `0x0205da2c` | `0x1c` (28 B) | B (mwcc-elide) | **missing** | needs stub |
| B-18 | `itcm` | `0x01ff8770` | `0x50` (80 B) | B (mwcc-elide) | **missing** | needs stub |
| B-22 | `main` | `0x0200b0c8` | `0x5c` (92 B) | B (mwcc-elide / P-4 control) | **missing** | needs stub; brief 091/093 ruled out P-4 recovery — keeping as wrapper sanity gate |
| B-24 | `ov011` | `0x021d2ca8` | `0x5c` (92 B) | B (mwcc-elide) | **missing** | needs stub |
| E-07 | `main` | `0x02023f7c` | `0x70` (112 B) | E (reg-alloc drift) | **missing** | needs stub |
| E-08 | `main` | `0x02026fd8` | `0x70` (112 B) | E (clone-of-E-07) | **missing** | needs stub |
| E-12 | `main` | `0x02024574` | `0x74` (116 B) | E (reg-alloc drift) | **missing** | needs stub |
| E-13 | `main` | `0x020270d0` | `0x74` (116 B) | E (clone-of-E-12) | **missing** | needs stub |
| E-14 | `main` | `0x02028790` | `0x74` (116 B) | E (clone-of-E-12) | **missing** | needs stub |

Summary: **9 / 9 picks `stub_missing`** — neither brief 190
(PR #637) nor brief 193 (PR #640) left `.c` stubs in the tree
for any of these picks (both briefs reverted attempted source
claims before commit). Confirmed via:

```bash
git log --diff-filter=A --name-only -- 'src/**/func_*.c'  \
    | grep -E "0205da2c|01ff8770|0200b0c8|021d2ca8|02023f7c|02026fd8|02024574|020270d0|02028790"
# (no matches)
```

## Why this is still a useful outcome

The brief noted (verbatim): "Realistic expectation: Permuter
waves are PROBABILISTIC. ≥ 1 of 9 converging is the minimum
bar to call this a win; … 0 means permuter isn't the right
tool for THIS wall family and we'd need to surface that as
signal for brief 199+. Either outcome is useful — don't
over-promise."

The 0/9 outcome here is NOT "permuter isn't the right tool",
because permuter never got to run. It's "the pipeline from
'skip during a decomp wave' to 'run permuter against the
result' is missing a stub-creation step". Brief 198+ (decomper)
has a clear next-action:

1. **Write a `.c` stub** for each of the 9 picks based on the
   disasm + the brief 190/193 attempted recipes (or pull the
   reverted source from the brief 193 attempt logs in PR #640's
   conversation history if available).
2. **Re-run `tools/permute_batch.py`** against the same
   worklist — picks now flip from `stub_missing` to one of
   `match` / `no_match` / `timeout` / `import_failed`.
3. **Per pick result:**
   - `match` → ship the result.c as the matched source. Recipe
     locked.
   - `no_match` + low best score (< 4 instructions diff) →
     manual coercion of the stub may close the remaining diff;
     iterate with the source-shape changes the permuter found.
   - `no_match` + high best score → permuter isn't tracking the
     wall; escalate as a brief 199+ research candidate (likely
     a new wall family).
   - `import_failed` → the stub's signature doesn't match the
     orig. Fix the stub.

## What the wrapper provides for that follow-up

The wrapper's result JSON is shaped for downstream pipeline
consumption. Brief 198+ can:

- Iterate `picks[].status == "match"` to enumerate
  newly-matched functions for direct symbols.txt + delinks.txt
  application.
- Iterate `picks[].status == "no_match"` to bucket by best
  score for triage.
- Iterate `picks[].status == "stub_missing"` to know what stubs
  still need to be written.
- Use the `picks[].metadata.cluster` tag to apply different
  follow-up strategies (Cluster B vs Cluster E may want
  different stub templates).

## Permuter prereqs validated on this host

- `arm-none-eabi-as` → `/opt/homebrew/bin/arm-none-eabi-as` ✓
- `gcc` (for cpp-15) → `/usr/bin/gcc` ✓
- `cpp-15` → `/opt/homebrew/bin/cpp-15` ✓
- `tools/_vendor/decomp-permuter/` → not yet cloned (first
  `tools/permute.py --run` invocation will clone it; the
  wrapper passes through to permute.py for this step).

Per brief 096 (`docs/research/permuter-workflow.md`) the
auto-install path on macOS Apple Silicon is known-working. The
wrapper has no extra macOS-specific gates; whatever single-
shot permute.py does, batch mode does too.

## Real-run cost calibration (when brief 198+ runs it)

From brief 096's empirical timing (`docs/research/permuter-
workflow.md`):

- Cold-clone of decomp-permuter (first pick): ~30s.
- Cold pip-install of permuter's deps (first pick): ~10s.
- Steady-state iteration: ~104 iter/30s on 2 threads (~3.5
  iter/s/thread). With 4 threads + 60s per-pick budget:
  ~840 attempts per pick.
- Total batch wall-clock for 9 picks at 60s each + a 30s
  cold-clone amortised on pick 1: ~570s ≈ 10 minutes.

Recommended brief 198+ budgets:

```bash
python tools/permute_batch.py \
    --worklist docs/research/cluster-b-e-permuter-targets.json \
    --out build/eur/analysis/permute_batch_results.json \
    --per-pick-seconds 120 \
    --total-seconds 1800 \
    --threads 4
```

= 2 min per pick × 9 picks + cold-install grace = ~20 min batch.

## Cross-references

- [`docs/research/permuter-workflow.md`](permuter-workflow.md) — brief 096 macOS workflow + vendor patches.
- [`tools/permute.py`](../../tools/permute.py) — brief 098 single-shot wrapper.
- [`tools/permute_batch.py`](../../tools/permute_batch.py) — brief 196 batch wrapper.
- [`docs/research/cluster-b-e-permuter-targets.json`](cluster-b-e-permuter-targets.json) — the 9-pick worklist.
- [Brief 190 PR #637](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/637) — Cluster B discovery (picks #8, #18, #22, #24).
- [Brief 193 PR #640](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/640) — Cluster E discovery (picks #7, #8, #12, #13, #14).
- [Brief 098](../briefs/098-permuter-sweep-byte-diff.md) — original permuter sweep brief (8 candidates in main + ov000, conventions for batch use established).
