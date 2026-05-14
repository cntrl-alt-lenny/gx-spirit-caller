### decomper/cross-region-apply-existing-ports

**Goal:** Apply `tools/cross_apply_libs_port.py` (PR #451) to
the 87 existing cross-project ports in `libs/nitro/` so each
one lands in USA + JPN as well as EUR. **First time USA + JPN
badges move substantially from 0.19%.**

**Context:**

Brief 073 (PR #451) shipped the per-region cross-application
tool + Approach A research + 1-port worked example
(`func_02007218.legacy.c`). All 3 regions verified at 24/27
baseline. The tooling refuses cleanly on ambiguity / unresolved
data refs / rename collisions, so the 87-port batch is
mechanically safe.

The 87-port set is the cumulative cross-project work from:

| Brief | Wave | Ports landed (EUR-only) |
|---|---|---:|
| 069 wave 1 | wave 1 | 10 |
| 071 wave 1 | wave 1 | 64 |
| 071 wave 2 | wave 2 | 13 |
| **Total in `libs/nitro/`** | | **87** |

(Brief 074 wave 3 is in flight separately; its new ports will
get cross-applied in a follow-up wave after 075 closes.)

**Selection rule:**

- **Primary pool:** every `libs/nitro/*.legacy.c` currently
  on main. Enumerate via:

  ```bash
  ls libs/nitro/*.legacy.c | sort
  ```

- **Per-port workflow:**

  ```bash
  # Dry-run preview (catches refusals before any writes)
  python tools/cross_apply_libs_port.py libs/nitro/<port>.legacy.c \
      --dry-run

  # Apply for real (default: USA + JPN both regions)
  python tools/cross_apply_libs_port.py libs/nitro/<port>.legacy.c
  ```

- **Batch verification cadence (recommended):** apply 10-15
  ports, then `configure.py usa && ninja rom && dsd check
  modules`. Same for JPN. Catches any cascading issues
  early. If 24/27 baseline preserved, continue. If not, the
  most recent batch is the suspect — bisect.

**Workflow:**

1. Pull main (PR #451's tooling).
2. Enumerate the 87 ports.
3. Batch through them (10-15 at a time), with verify gate
   between batches.
4. Track per-port refusals (ambiguous / unresolved-data /
   rename-collision). The tool surfaces these cleanly; just
   skip + document.
5. PR body reports: cumulative ports cross-applied per
   region, refusal counts by reason, final 3-region 24/27
   baseline status.

**Scope:**

- Apply 70-87 of the 87 existing ports to USA + JPN. A 5-10%
  refusal rate is acceptable (tool refusals are correctness
  signals, not failures).
- Per-region badge expected impact:
  - USA: 0.19% → ~0.6-0.7% (each port × ~25 bytes avg × 2
    regions × 174 net per-region landings)
  - JPN: 0.19% → ~0.6-0.7% (symmetric)
- All 3 regions at 24/27 baseline post-batch.

**Non-scope:**

- ❌ Brief 074's new ports — those cross-apply in a
  follow-up after 075 closes.
- ❌ Approach B refactor (upstream NitroSDK names) — defer
  to brief 076+ if iteration noise becomes a real problem.
- ❌ Tool changes — `cross_apply_libs_port.py` is shipped.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 70 of 87 ports successfully cross-applied to BOTH
  USA + JPN.
- All 3 regions remain at 24/27 baseline.
- USA + JPN README badges visibly move from 0.19% to
  measurably higher.
- PR body's per-port + per-refusal table is useful
  calibration for brief 074-onwards' new ports.

**Branch:** `decomper/cross-region-apply-existing-ports`

**No self-extend clause** — this is a one-time backfill, not
a recurring wave. If refusals exceed ~30%, hand back to
brain (tool tuning needed).

**After this brief lands:**

1. USA + JPN badges visibly higher — the 3× compounding
   multiplier the entire brief 064→065→069→071→073 chain
   was designed to unlock.
2. Brief 077 (future) — brief 074's new cross-project ports
   get the same cross-region application, on a regular
   per-wave cadence rather than a one-time backfill.
3. If Approach A's semantic noise (USA's symbols.txt naming
   `func_<eur_addr>` at a different actual address) ever
   bites decomper iteration, brain queues brief 076 for the
   Approach B refactor (rename libs/ ports to upstream
   NitroSDK names).
