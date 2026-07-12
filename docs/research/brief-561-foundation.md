# Brief 561 — foundation fixes (safety, stale docs, runbook portability, C% metric)

Date: 2026-07-09
Branch: `claude/foundation-561`
Source: `docs/research/improvement-swarm-2026-07-09-r3.md` (145-agent swarm,
recovered from a session-limit hit; S/A-tier findings + the "Safety flags"
section)

Build-free lane throughout — no baserom, no `ninja rom`/`objdiff`/`sha1`.
Gate was `python -m pytest -q tests` after each fix. Four independent
fixes, each committed separately per the brief.

## Fix 1 — SAFETY: `batch_carve.py` branch guard + dupes preflight

**Problem:** `batch_carve.py` auto-commits every green-gated batch (by
design — see its own module docstring). An unattended launch in the wrong
worktree, with HEAD still on `main` (or a detached HEAD pointing at
`origin/main`'s tip), would ship carve waves straight past review. No
guard existed.

**What changed** (`tools/batch_carve.py`, `tests/test_batch_carve.py`):

- New pure function `branch_guard_message(branch, detached_at_origin_main,
  force) -> str | None` — refuses on `"main"` or a detached HEAD at
  `origin/main`'s tip, unless `force=True`. Fully unit-tested (6 new
  tests): main, detached-at-main, a real work branch, detached-elsewhere
  (not guarded — e.g. mid-rebase), and both force-bypass cases.
- New `Ops` methods `current_branch()`, `is_detached_at_origin_main()`,
  and `check_delink_dupes()` (thin subprocess wrappers, consistent with
  the file's existing PURE/IMPURE split).
- New CLI flags: `--force-branch` (bypass) and `--skip-dupe-check`
  (bypass the new preflight).
- `main()` now runs the branch guard, then (unless skipped) the
  `check_delink_dupes.py` preflight, before constructing the scope or
  touching any candidate — both print a clear message and exit 2 on
  failure.

**Verified live** (not just unit-tested): created a temporary detached
worktree at `origin/main`, confirmed `batch_carve.py --dry-run` there
refuses with exit 2 and the expected message, confirmed `--force-branch`
bypasses it and runs normally, then removed the worktree. A normal
`--dry-run` on the real work branch (`claude/foundation-561`) is
unaffected — 0 candidates in that scope, no guard/preflight errors.

## Fix 2 — STALE CONFIGS: `scaffolder.md` + `decomper.md` rewritten

**Problem:** both agent configs were ~6-7 weeks stale, explicitly stating
"you have NO local toolchain, cannot run ninja/dsd" — the exact opposite
of current reality (both roles run with the full toolchain + all three
baseroms, same as `brain`, since the toolchain rollout). Flagged A-tier:
"actively misconfigures agents."

**What changed** (`.claude/agents/scaffolder.md`, `.claude/agents/decomper.md`):
full rewrite against `brain.md`'s 2026-07-09 template/tone. Both now
describe:

- **Local toolchain access** — the "cannot verify locally" framing is
  gone; every PR should carry real gate output, not a delegated
  "brain will verify."
- **The `batch_carve.py` drain lane** — the deterministic carve/gate/
  commit-on-pass driver, its branch-safety guard (new in Fix 1), the
  per-candidate byte-verify + per-batch `ninja sha1` gate, bisect-on-red,
  and `--dry-run` for sizing a wave.
- **`gate3.py`** — the same 3-region gate `brain` uses to review PRs is
  directly runnable by both roles; paste the real tail into the PR.
- **The worktree convention** — pointing at `AGENTS.md § Worktree
  convention` (the canonical section covering both the Mac manual
  sibling-worktree and Windows Claude Code sandbox-worktree mechanisms)
  rather than duplicating it inline.

Kept each file's still-valid content: PR discipline, the tool catalogue,
decomper's escape hatches (`asm void`, standalone `.s`), commit-message
style, production-fire self-merge authority.

## Fix 3 — RUNBOOK PORTABILITY: `post-ov002-runbook.md` + Wave 11

**Problem:** every command block in the 10-wave runbook hardcoded
`python3.13` and the one-time setup block hardcoded a Mac-only absolute
path (`/Users/leo/Dev/spirit-caller/brain`) — a Windows agent couldn't
copy-paste it as-is.

**What changed** (`docs/research/campaign-analytics/post-ov002-runbook.md`):

- All 62 `python3.13` occurrences → plain `python` (verified: 0 remaining
  after the fix, confirmed by grep).
- The one-time setup block's hardcoded absolute path replaced with a
  pointer to `AGENTS.md § Worktree convention` (which already documents
  the path/mechanism for both platforms) + a note on what to do if the
  `../brain/...` relative-copy assumption doesn't hold on your worktree
  layout.
- **New "Wave 11 — `ov002` mop-up" section**, appended after Wave 10: the
  drain's pivot logic moves a region off `ov002` once its remaining count
  looks "nearly done," and no later wave returns to finish it — orphaning
  ~180 real candidates (USA ~107, JPN ~73 per the r3 census). Wave 11 is
  the one-time sweep: the same standard `ov002` recipe
  (`--min-addr 0x021aa3c0`), with an optional `--dry-run` sanity check
  first, run to exhaustion instead of stopping early. Updated the
  runbook's "Do not touch ov002" caveat to clarify Wave 11 is the
  intentional exception (runs *after* the active lane, not concurrent
  with it).

## Fix 4 — C% METRIC: true C-decompiled bytes/% + `state.md` correction

**Problem:** the headline `units`/`fn`/`code` metrics can't distinguish an
`.s` ship from a real C match — all three count them identically. The
`.s` drain moves all three; converting a shipped `.s` → C moves none of
them. True decompiled-to-C was measured by the swarm at ~8.0% EUR / 7.0%
USA / 7.0% JPN, and no committed metric tracked it (S-tier finding).

**What changed:**

- **`tools/progress.py`**: new `c_code_bytes(config_dir)` — sums `.text`
  bytes for TUs sourced from a `.c`/`.cpp` file only (never `.s`), scanned
  straight from committed `delinks.txt` (no build required, same data
  source `summarize_delinks()` already reads). `print_report()` now
  prints a 4th line, `C-decompiled: X / Y bytes (Z%)`, and the `--json`
  path adds a top-level `c_code_bytes` key alongside the existing
  `measures` dict (additive — `update_progress_badge.py`'s own 28-test
  suite still passes unmodified, and a live `--check` run confirms it
  reads the new JSON fine, failing only on a pre-existing unrelated
  README badge-URL lookup issue, not on parsing).
- **`tools/generate_progress_bars.py`**: its own `c_code_bytes(version)`
  (the function the swarm report named directly) is now imported from
  `progress.py` instead of duplicated — `progress.py` is the root of the
  `progress ← generate_heatmap ← generate_progress_bars` import chain, so
  moving it there (rather than the reverse) avoids a circular import.
  Verified the SVG generator still runs and produces the same numbers as
  before the refactor (EUR 7.9% / USA 7.0% / JPN 7.0% — matches the
  swarm's cited ~8.0/7.0/7.0 closely, small EUR drift being normal
  time-based progress since the report was written).
- **`tests/test_progress.py`**: 8 new unit tests for `c_code_bytes`
  (empty tree, `.c` counted, `.cpp` counted, `.s` NOT counted, mixed
  `.c`+`.s` sums only the `.c` range, `libs/` prefix, incomplete TUs still
  counted — pins the documented "no `complete`-status gate" behaviour
  inherited unchanged from the original implementation, and multi-file
  subtree walking).
- **`docs/state.md`**: corrected the specific stale entry the swarm
  flagged by address (finding #2) — `USA code 49.17%` / `JPN code
  48.10%` were ~25pp stale, sourced from a gitignored machine-local
  `build/<ver>/report.json` that hadn't been regenerated since before
  several drain waves landed. Added a correction note (kept the original
  historical numbers in place — this is a churn-heavy log, not a
  rewrite) pointing at the real committed-tier numbers: **USA 73.82%,
  JPN 68.59%**, which the live `progress.py --version <ver>` run in this
  session reproduces exactly. Also established **units/fn/code/C** as
  the 4-metric convention going forward and recorded today's full
  snapshot for all three regions.

## Gate

`python -m pytest -q tests` run after every fix. Baseline established
before any changes: **10 failed / 2485 passed / 15 skipped** — all 10
failures are pre-existing Windows path-separator issues unrelated to this
brief's scope (per the brief's own note, a separate task owns fixing
them). Final state after all 4 fixes: **10 failed / 2493 passed / 15
skipped** — same 10 failures, +8 new tests (all passing), zero
regressions.

No ROM build was run or required at any point in this brief.

## Follow-ups not in this brief's scope

- The swarm report's other A-tier findings (VRAM threshold-dispatch
  family clone sweep, the 7-clone relative-offset-table-walker family,
  `#pragma optimization_level`/`thumb` levers, Windows Defender
  build-tree exclusions, `gate3 --parallel`, NitroSDK matched-C import
  lane, etc.) are each their own brief — this one was scoped strictly to
  the four items the brief named.
- Wave 11 (Fix 3) is documented and ready but not run — running it is a
  drain-lane brief, not a build-free foundation fix.
