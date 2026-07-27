# cm-ov002-unknown-sweep: 79/125 shipped (63.2%) (2026-07-25)

ov002's "unknown" pool (2,674 candidates, never individually assessed —
most mechanically `.s`-shipped by a size-tier sweep with zero C-drafting
attempts, per brief 416) is the single largest untouched concentration
in the project. Swept the smallest 125 (32-88 bytes, the size-gated
tier this campaign's own worklist flags as a 35-55% floor) via the
established WORKTREE-PARALLEL SWEEP PROTOCOL (`cm-overlay-small-sweep`
precedent: 5 independent `git worktree`s, 25 candidates each, `git
merge --no-ff` to consolidate).

**Result: 79/125 shipped (63.2%)** — well above both this tier's own
35-55% floor estimate and the prior overlay sweep's 54%. 3-region
`gate3.py --scope all --clean --no-tests` PASS.

## Method

Candidate list: `wall_aware_headroom.py --exclude-attempted --min-size
0 --max-size 256 --json`, the 125 smallest (32-88B) after excluding 5
addresses already personally investigated earlier this session
(`cm-sm64ds-lever-apply`'s lever-2 sweep touched a few ov002 functions
directly). Partitioned round-robin (not contiguous blocks) across 5
batches so each batch got a representative size mix rather than one
batch getting only the smallest/easiest.

Each of 5 `git worktree`s was seeded with the EUR baserom + downloaded
toolchain (hardlinked via `ln -s`, not copied — ~630MB saved) and fully
built once (`configure.py eur && ninja`) before dispatch, so every
worktree had its own populated `build/eur/delinks/` and a verified
starting SHA1. Agents worked directly in `src/overlay002/`, used
`tools/fastmatch.py` (per-function compile + RESOLVED comparison — see
tool fix below) for iteration, left all changes uncommitted, and
reported a clear per-candidate shipped/not-shipped breakdown. I
committed each batch and merged with `git merge --no-ff` — **zero
conflicts across all 5**, even with 4 of the 5 batches all touching
`config/eur/arm9/overlays/ov002/delinks.txt`.

## Per-batch results

| Batch | Shipped | Notes |
|---|---:|---|
| 1 | 9/25 | Discovered the C-34 tag on `func_ov002_022a1870` is a **mistag** (zero pool-duplication evidence — consistent with `cm-parked-reaudit-2`'s finding that C-34 citations are frequently stale) |
| 2 | 19/25 | Found `fastmatch.py`'s ninja-target collision (below); 21/25 had unverified prep-drafts in `docs/research/c-match-prep/` used as starting hypotheses, not trusted directly |
| 3 | 20/25 | **Reversed 2 documented wall verdicts** (`func_ov002_022abf88`, `func_ov002_021e2cd4`) — same "prior investigation used a since-superseded technique" pattern `cm-overlay-small-sweep` already found 6 instances of |
| 4 | 15/25 | Confirmed the same ninja-collision workaround independently; flagged 2 more `fastmatch.py` rough edges (below) |
| 5 | 16/25 | 23/25 had prep-drafts available; caught and fixed a real bug in one draft's padding array rather than trusting it |

## New/reconfirmed levers this sweep

- **`goto` to a shared return/tail label** forces mwcc to emit a real
  branch instead of predicating an early-return inline — used across
  batches 2, 3, and 5 independently, the single most common fix for
  the "predicate-vs-branch" wall shape in this pool. Generalizes past
  the single-guard case: also fixed 2+ textually-separate `return 0`
  sites converging on one shared tail once written as one label.
- **Bitfield struct member, not manual mask.** Writing `x & 1` (or any
  hand-rolled shift/mask) compiles to a plain `AND`; the target ROM's
  actual idiom is consistently a real bitfield member (`struct
  Ov002Self`-style `unsigned b0 : 1`), which compiles to the
  `lsl #31; lsr #31` (or equivalent) shift-embedded-in-compare shape —
  holds even when the bit feeds arithmetic (a multiply), not just a
  direct compare. Fixed 4+ candidates outright in batch 1 alone.
- **Declaration order steers register allocation** — reordering local
  variable declarations (no logic change) reliably nudges mwcc's
  allocator, confirmedly fixing register-role swaps in multiple
  candidates (though NOT universally — see negatives below, where the
  same lever tried on a similar-looking swap had no effect).
- **`(unsigned)` cast before a right-shift** (`asr`→`lsr`) needed in
  several candidates where a field is conceptually unsigned but a bare
  C `int` shift would sign-extend.
- **Explicit redundant `&1` re-mask** needed even when a value is
  already a bitfield narrowed to 0/1, in at least 2 candidates —
  omitting it (trusting the bitfield's own narrowing) doesn't match.
- **DISPATCH-ORDER-INVERSION** (an already-documented lever) reconfirmed
  twice more in batch 3.
- **C-14** (`codegen-walls.md`: 2-arg pass-through keeps a value live in
  a specific register) reconfirmed once in batch 2.

## Tool bugs found (own commit + flagged, not all fixed)

1. **Fixed, own commit**: `fastmatch.py`'s `arm-none-eabi-objdump`
   resolution was a bare PATH-relative name (same bug class as the
   `verify.py` fix from `cm-sm64ds-lever-apply` earlier this session) —
   fails immediately on native Windows where this project's own
   downloaded copy under `tools/arm-none-eabi/bin/` isn't on `PATH`.
   Fixed with the same `_binutil()`-style absolute-path resolution,
   falling back to the bare name for a system-installed toolchain.
2. **Flagged, not fixed (out of scope: outside `src/overlay002/` +
   its `delinks.txt`)**: `fastmatch.py`'s automatic gap-object
   discovery (`_dsd_gap@<module>_*.o`) never finds anything for a
   function whose `.s` has already been individually carved out of the
   dsd blob (true for effectively this entire candidate pool) —
   confirmed independently by 3 of the 5 batches. All worked around it
   the same way, convergently: resolve `build/eur/delinks/src/<module>/
   <func>.o` explicitly via `--gap`.
3. **Flagged, not fixed**: ninja hard-errors ("multiple rules generate
   build/.../X.o") if a candidate's `.c` draft and its still-`delinks.
   txt`-referenced `.s` coexist on disk simultaneously. All 5 batches
   independently discovered and worked around this by removing (or
   renaming aside) the `.s` before compiling a draft `.c`, restoring it
   on failure. Worth a real fix (`fastmatch.py` could do this
   move-aside/restore itself) in a future tooling item.
4. **Flagged, not fixed**: `fastmatch.py`'s `--gap` path crashes on an
   unhandled `Path.relative_to(ROOT)` for any gap path outside the
   repo root (one batch's own workaround used an absolute path that
   happened to trip this).

## Verification

`.c` files added (`src/overlay002/`): **79**
`.s` files deleted: **79**
`delinks.txt` `.s:`→`.c:` flips (`config/eur/arm9/overlays/ov002/delinks.txt`): **79**

All three counted by diff against `origin/main` on the consolidated
branch (not summed from per-batch self-reports).

## Gate

`python tools/check_delink_dupes.py`: OK (81 delinks.txt, no duplicate
`.text` addresses). `python tools/gate3.py --scope all --clean
--no-tests`: 3-region PASS (EUR/USA/JPN, forced-clean rebuild —
required this pass given the volume of file moves/deletions).

Ships are EUR-only, matching this campaign's established phased
EUR-first convention; USA/JPN porting not attempted this pass.

## What's left

46/125 of this size-gated slice remain parked (documented per-batch
above with best match % and residual class — overwhelmingly
register-allocation/scheduling near-misses, several at 80-95% with a
single isolated instruction difference). The broader ov002 unknown
pool has ~2,549 more candidates beyond this 125-slice (the 256B+ tier
untouched); a natural next batch given this tier's strong yield.
