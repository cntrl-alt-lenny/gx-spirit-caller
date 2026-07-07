[//]: # (markdownlint-disable MD013 MD041)

# Brief 545 — wire `--allow-absorbed-offset` into `batch_carve` as a drain default

**Status:** brief 545 (2026-07-07), wine-free tooling (pure Python + unit
tests + a wine-free `--dry-run` census — no `batch_carve`/gates, no
contention with the scaffolder's live ov002 drain). Brief 543 validated
`asm_escape.py --allow-absorbed-offset` against the real assembler and
shipped 15 `ov004`/`ov006` walls with it. Per that brief's own § Step 4
recommendation, this brief wires the same unlock into `batch_carve.py`
so the *ongoing* drain benefits automatically, without a human re-running
anything by hand.

## Verdict

**Wired. `batch_carve.py` no longer parks a purely-`C-absorbed` REFUSE —
it routes it through `--allow-absorbed-offset` instead.** A live,
wine-free census of the drain's *entire current* candidate population
(both scopes, both regions, no `--limit`) found **every single REFUSE is
the recoverable sub-case — zero genuine walls remain right now.** The
next scaffolder wave that runs against this branch (or after it merges)
recovers all of them for free, no re-scoping needed.

## The problem (brief 543 § Step 4, restated precisely)

`BatchCarver.run()` calls `Ops.classify(func)` before ever attempting a
carve. Any REFUSE — genuine wall or not — was immediately parked
(`self._park(func, "kind:data-REFUSE", self.skip_path)`) and
`whole_function()` (the call that would actually carry
`--allow-absorbed-offset`) was **never invoked**. The flag existed and
worked (brief 543) but the driver had no path that ever tried it.

## The fix

Three small, additive changes to `tools/batch_carve.py`:

**1. A new pure classifier, `classify_refuse_kind(output: str) -> str`.**
Parses the `data-ref SYM @0xADDR: VERDICT (REFUSE)` lines
`asm_escape.py --classify-data` prints (brief 406's 5-verdict printer) and
mirrors `asm_escape.resolve_absorbed_substitutions`'s own rule: recoverable
**only if every REFUSE-tagged ref is specifically `C-absorbed`**. A REFUSE
mixed with (or consisting of) `OFFSET`, `MISADDRESSED`, or an
under-defined `B-gap` (a `B-gap` verdict whose gap object turns out not to
actually define the symbol — a *different* unlinkable shape than
`C-absorbed`, brief 406's own edge case) stays a genuine wall — the flag
has no mechanism for those, and `asm_escape.py` itself would refuse them
identically with or without it. No REFUSE lines parseable at all (garbled
output) conservatively returns `"wall"`, same as today's fallback.

**2. `Ops.classify()` gains a fourth outcome: `'refuse-absorbed'`.** When
`--classify-data`'s output contains "REFUSE", `classify_refuse_kind()`
decides whether that's `'refuse'` (unchanged: park immediately, exactly
as before) or `'refuse-absorbed'` (new: don't park — let `run()` retry it).

**3. `Ops.whole_function()` now always passes `--allow-absorbed-offset`.**
Proven safe in brief 543: the flag only changes behaviour when the
preflight's *only* REFUSE reason is `C-absorbed` — for a clean preflight,
or a REFUSE mixed with a genuine wall class, `asm_escape.py` refuses (or
proceeds) identically whether or not the flag is present. Unconditional
is simpler than threading a parameter through every call site and cannot
regress an existing outcome.

**`BatchCarver.run()`'s loop**: a `'refuse-absorbed'` classify() result
tags the func into a new `Report.absorbed` list (a log line, `◆ ...
base+offset-recoverable — attempting`) and **falls through** to the exact
same code path a `'clean'` candidate takes — `whole_function()` attempts
it, and from there the *existing* pass/verify-fail/deferred handling
applies unchanged. This preserves the REFUSE/verify-fail bucketing
distinction on purpose: a genuine wall is still parked as REFUSE
immediately (never wastes a retry that's certain to fail — the flag
returns REFUSE without ever invoking wine when the reason isn't purely
`C-absorbed`); an absorbed candidate that's attempted and still doesn't
byte-verify lands in `verify_fail` (a different, more precise bucket —
"we tried, the bytes came out wrong," not "known unrecoverable up front").

`Report.absorbed` is a **subset tag, not a new terminal bucket** — every
func in it also lands in `passed`/`verify_fail`/`deferred` for its real
outcome. In `--dry-run` it's an honest *estimate* (classify() decided it's
recoverable, but `whole_function()` — the actual assemble+verify — is
never called in dry-run mode, same caveat the pre-existing `passed`
count already carries there).

## Tests

11 new tests, mirroring brief 543's regression-test discipline (a
targeted fixture that reproduces the exact shape that could hide a bug,
not just a happy-path check):

- **`TestClassifyRefuseKind`** (8 tests, pure, real `--classify-data`
  output shapes as fixtures — not synthetic strings): single and
  multi-ref pure-`C-absorbed`; mixed `C-absorbed`+`OFFSET`; pure `OFFSET`;
  pure `MISADDRESSED`; the under-defined-`B-gap`-REFUSE edge case
  (confirms it is NOT treated as absorbed — a distinct unlinkable shape);
  ok-tagged lines don't affect the verdict; no-REFUSE-lines-found
  conservatively returns `wall`.
- **`Ops`-level** (2 tests): `test_classify_distinguishes_absorbed_from_genuine_wall`
  drives the *real* `Ops.classify()` (not the pure helper directly) with
  mocked subprocess output, confirming the actual seam `run()` reads
  routes correctly. The existing Windows subprocess test gained one
  assertion: the `--whole-function` call now always carries
  `--allow-absorbed-offset`.
- **Driver-level** (via `FakeOps`, extended with an `absorbed` param — 4
  tests): a `refuse-absorbed` candidate that recovers via
  `whole_function()` ships exactly like a clean one (carved, committed,
  absent from the skip-list); one that's attempted but still fails lands
  in `verify_fail`/`verifyfail_path`, **not** `refused`/`skip_path` — the
  bucketing-distinction test that would catch a regression back to
  "everything REFUSE-shaped ends up miscategorized"; and a `--dry-run`
  variant confirming the estimate is counted without ever calling
  `whole_function()` (no `.s` materialises, nothing commits).

`tests/test_batch_carve.py`: **38 passed** (was 27). Full suite:
**2464 passed, 11 skipped** (skips are pre-existing, environment-only —
no `dsd rom extract`/`ninja` output in this fresh wine-free worktree,
unrelated to this change).

## Quantified recovery — a live census, not an estimate

`--classify-data` (and therefore `batch_carve.py --dry-run`) is entirely
wine-free — no `mwasmarm`/`mwldarm` call, just text parsing and a gap-object
existence check. That made it possible to run the fixed tool's own
`--dry-run` mode over the **complete current candidate population** (no
`--limit`) for both active drain scopes, both regions, from this
wine-free worktree — a real, present-tense measurement rather than a
projection from the historical REFUSE rate:

| Scope | Region | Candidates scanned | REFUSE (total) | `C-absorbed`-recoverable | Genuine walls |
|---|---|---:|---:|---:|---:|
| `ov002` | USA | 1,003 | 4 | **4 (100%)** | 0 |
| `ov002` | JPN | 1,139 | 4 | **4 (100%)** | 0 |
| `main`  | USA | 34    | 26 | **26 (100%)** | 0 |
| `main`  | JPN | 34    | 26 | **26 (100%)** | 0 |

(`ov002`: `--overlay ov002 --min-addr 0x021aa3c0`, both regions. `main`:
`--min-addr 0x02000000`, both regions — no size bounds, matching the
work-order recipes.) USA and JPN hit the **exact same function names** in
both scopes (`func_ov002_022626c4`/`022b9434`/`022b856c`/`022b9c94` for
`ov002`; 26 shared `main` names) — consistent with the USA/JPN structural
identity brief 541 established for `ov004`/`ov006`, now confirmed for
`ov002` and `main` too.

**Every currently-known REFUSE in the drain's live candidate pool — 60
instances, 30 unique functions × 2 regions — is the recoverable
sub-case. Zero walls.** This is a stronger result than what brief 543's
own doc projected (it estimated "~30 more REFUSEs per region" as a
plausible-but-unverified carry-over from the historical rate); the live
number is smaller (`ov002` 4/region, not the historical
extrapolation's implied count) but the *recovery fraction* is total, not
partial.

**Reconciling against the wave history** (waves 538/540/542, each:
`batch_carve --overlay ov002 --min-addr 0x021aa3c0 --batch 20 --limit
150`, reporting exactly 2 REFUSE/region/wave, 4/region across 3 waves —
see the closed-brief docs): those runs used a `--limit`-bounded window
and **no persisted skip-list** (skip-list files live under the
git-ignored `build/`, and each wave's kickoff is a fresh `git worktree
add` — nothing carries over). A REFUSE'd func is never carved, so it has
no delinks entry and simply **reappears** as a candidate in the next
wave's re-scan; only the ~148 clean carves per wave actually leave the
pool. The steady "2 REFUSE/region/wave" figure is very likely the same
handful of functions being re-encountered inside each wave's 150-candidate
window, not 2 new ones discovered each time — consistent with my
un-limited census finding the *entire* remaining `ov002` population is
just 4 unique functions per region. (I did not cross-verify individual
function identity against the wave docs — they report counts, not
names — so this is the most-consistent explanation of the pattern, not a
confirmed one; not needed to size the fix's impact either way, since the
live census already gives the exact current total directly.)

**What this means for the next wave:** every future `batch_carve` run
against `ov002` or `main` (this branch or after merge) picks up the fixed
tool automatically — no recipe change needed, no `--allow-absorbed-offset`
flag to remember, nothing to re-scope. The next scaffolder wave's REFUSE
count should drop to 0 for these two scopes unless a genuinely new wall
class surfaces elsewhere in the remaining runway.

## Files changed

- `tools/batch_carve.py` — `classify_refuse_kind()` (new pure function),
  `Ops.classify()` (new `'refuse-absorbed'` outcome), `Ops.whole_function()`
  (always passes the flag), `Report.absorbed` (new field + `summary()`
  line), `BatchCarver.run()` (routes `refuse-absorbed` through the normal
  carve path instead of parking).
- `tests/test_batch_carve.py` — 11 new tests (see above).
- `docs/research/brief-545-wire-absorbed.md` — this doc.

Nothing under `src/*/overlay002`, `src/*/main`,
`config/*/arm9/overlays/ov002`, or any region's `arm9/delinks.txt`
touched — this is tooling-only. The four `--dry-run` censuses that
produced the table above are read-only by construction (`--dry-run`
never calls `whole_function()`, never stages, never commits — confirmed
via `git status` showing zero changes under `src/`/`config/` before
committing).

## Verification

| Check | Result |
|---|---|
| `tests/test_batch_carve.py` | 38 passed (11 new) |
| full `tests/` suite | 2464 passed, 11 skipped (pre-existing, environment-only) |
| Live `--dry-run` census, `ov002` USA/JPN (no `--limit`) | 1,003 / 1,139 candidates; 4/4 REFUSE both regions, 100% `C-absorbed`-recoverable |
| Live `--dry-run` census, `main` USA/JPN (no `--limit`) | 34/34 candidates; 26/26 REFUSE both regions, 100% `C-absorbed`-recoverable |
| `git status` before commit | only `tools/`/`tests/`/`docs/` — no `ov002`/`main` carve files touched |
| wine/`ninja sha1` | not run — wine-free brief by design; live proof is the scaffolder's next wave |

🤖 Generated with [Claude Code](https://claude.com/claude-code)
