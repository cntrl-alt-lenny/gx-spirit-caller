### cloud/permuter-auto-runner

**Goal:** Extend `tools/permute.py` from bootstrap-only into an
auto-runner that invokes decomp-permuter on close-but-not-byte-
identical candidates, monitors for byte-matches, and reports back.
Replaces the manual "install permuter → cd into its checkout → run
import.py → wait for matches" cycle with a one-shot
`python tools/permute.py <func> --run` invocation.

**Context:**

`tools/permute.py` exists (see brief in tools-index) but only
*bootstraps* permuter — it prints the import command and optionally
stages files. Decomper still has to install upstream
decomp-permuter, configure it, run `import.py` manually, and
monitor `permuter.py` for byte-match hits.

decomp-permuter is most valuable on functions in the 0x40-0x100
range — small enough that the search space is tractable, large
enough that the "write C that looks right" approach doesn't
converge after a few iterations. Brief 057's 0x60 cap-raise hit
this band, and future cap-raises (≤0x80, ≤0x100) will hit it
harder. Lowering the friction to invoke permuter means decomper
reaches for it earlier in the iteration loop and burns less time
on cycles that should have been deferred to permuter.

**Method:**

1. **Auto-install path** (one-time, idempotent). If
   decomp-permuter isn't already installed under
   `tools/_vendor/decomp-permuter/` (or wherever the project
   convention puts vendored tools), `git clone` it into place.
   Pinned commit hash for reproducibility. Check upstream
   `requirements.txt` against the project's Python venv; install
   missing deps via `pip install`.

2. **`--run` mode.** After the existing bootstrap (resolving paths,
   staging files), invoke permuter as a subprocess with sensible
   defaults:
   - `--threads`: detect CPU count, use `max(1, ncpu - 1)`.
   - `--abort-exit-code`: pipe an early-exit when byte-match
     found.
   - Stream stdout to a log file under `permute_log/<func>.log`
     and tail-print the most recent "best score" line to stdout
     so decomper can see progress.

3. **Match-detection.** Permuter exits when it finds a byte-match
   (or hits its iteration cap). On byte-match:
   - Print the matching C source to stdout.
   - Copy the matching `.c` into the staging area under
     `perm_work/<func>/result.c`.
   - Print a one-liner: `MATCH FOUND: copy perm_work/<func>/
     result.c to src/<module>/<func>.c and verify with ninja`.

   On iteration cap:
   - Print best-score progress.
   - Print the best `.c` so far for decomper to manually pick up.

4. **Per-target tuning hooks.** Permuter takes a `--seed` and
   various search parameters. Defaults should work for most
   targets, but expose:
   - `--seed N` (default: time-based)
   - `--iterations N` (default: 100,000)
   - `--max-seconds N` (default: 600 — 10-minute cap)

   Defaults targeting "10-minute search, sensible-effort" so
   decomper can fire-and-forget.

**Test plan:**

- Unit test: bootstrap mode (existing) still works unchanged when
  `--run` not passed.
- Integration test: pick 1-2 historical decomper functions that
  permuter would have found, run the tool with a small iteration
  cap, assert it surfaces a match (or "best-score" output if cap
  hit).

**Non-scope:**

- ❌ Modifying upstream decomp-permuter. Vendor a pinned commit;
  don't fork.
- ❌ Replacing the manual matching loop. This is for the
  hard-to-match band where shape recognition has plateaued.
  Small-thunk cluster propagation (brief 060's primary input)
  doesn't need permuter.
- ❌ src/, libs/, AGENTS.md, state.md edits.

**Success:**

- `python tools/permute.py <func>` (no flags) prints bootstrap
  info unchanged.
- `python tools/permute.py <func> --run` clones permuter if
  missing, runs the search, returns either a byte-match or a
  best-score report.
- Vendored permuter at a pinned commit; reproducible across
  machines.
- Tests pass; tools-index regen current.

**Branch:** `cloud/permuter-auto-runner`

**Priority:** MEDIUM-LOW — incremental for the current
≤0x40-band hard-tier work (cluster propagation is more valuable
there). Becomes high-priority as soon as the next cap-raise hits
the 0x60-0x100 band where permuter shines. Independent of 061
and 062.

**After this brief lands:**

1. Decomper uses `--run` on stalled iterations during the next
   cap-raise wave.
2. If hit rate is positive, brain folds permuter into the
   standard apply-list as "try `--run` after 3 iterations
   without convergence".
3. If hit rate is low, brain notes the tool exists but defers
   broader integration; the tool itself is still a useful
   shortcut for one-off hard targets.
