# Batch 13 — Worker

## Done

Created `worker/batch-13` from `origin/main` at `51fde3801`, linked all three baseroms with verified source SHA-1s, and copied the requested ignored helpers. No function attempted or matched; no source, routing, ledger or baseline changes. Only this summary is committed.

## Checked

| Command | Exit | Observed output |
|---|---:|---|
| `git fetch origin` | 0 | Fetch completed. |
| `git worktree add -b worker/batch-13 .worktrees/worker-batch-13 origin/main` | 0 | `HEAD is now at 51fde3801 Batch 09: 26 EUR main functions matched in C (+3,496 B natural-C) (#1647)` |
| `python tools/link_baseroms.py .worktrees/worker-batch-13` (primary checkout) | 0 | `baserom linking complete` |
| Requested Python helper-copy command | 0 | No output. |
| `python tools/fw.py status` | 0 | `on worker/batch-13; no uncommitted changes`; existing prose-cap warnings and other seats listed. |
| `git show cef359f54:docs/batches/batch-06-review.md` | 0 | Review retrieved. |
| `git show 3217320fd:docs/batches/batch-09-review.md` | 1 | `fatal: path 'docs/batches/batch-09-review.md' exists on disk, but not in '3217320fd'` |
| `git show --stat --oneline 3217320fd` | 0 | `3217320fd AGENTS.md: trim by a fifth, add side-by-side and merge-sequence rules (Small) (#1644)`; only `AGENTS.md` changed. |
| `python tools/progress.py --version eur` at starting commit | 0 | `Natural-C: 464790 / 2385948 bytes (19.48%)`; source: delinks.txt, approximate. |

| `python -m pytest -q tests` | 0 | `1329 passed, 16 skipped, 132 subtests passed in 22.09s` |
| `python -m unittest discover -s tests` | 0 | `Ran 1345 tests in 20.985s`; `OK (skipped=16)` |
| `python -m ruff check .` | 0 | `All checks passed!` |
| `python tools/fw.py check` | 0 | `0 error(s), 16 warning(s)`; all warnings concern existing batch prose caps. |
| `python tools/progress.py --version eur` at end, same starting commit | 0 | `Natural-C: 464790 / 2385948 bytes (19.48%)`; gain 0 B equals matched size 0 B. |

## Not checked

Candidate enumeration, the address-order walk, confirmed-permanent retry, compiler tiers, fastmatch, ledger/routing checks, three-region gate and its log check. No conversion claim is made. Other seats and their warnings were left untouched.

## Failed or blocked

BLOCKED before matching: the required batch-09 review does not exist at the specified revision. Worker role step 2 requires stopping when a prompt assumption is false.

Question for Brain: which revision should supply `docs/batches/batch-09-review.md`? Options are the copy on current `origin/main` or another exact revision supplied by Brain. No substitute was assumed.
