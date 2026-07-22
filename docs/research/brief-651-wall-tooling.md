# Brief 651 — fix `wall_aware_headroom.py`

Date: 2026-07-22
Branch: `claude/wall-tooling-651`

## Headline

**Fixed the classifier. New honest EUR candidate pool: 6,122** (139
coercible with a documented lever + 5,951 unknown/never-assessed + 32
no-marker), versus the previous tool's **44** on the same repo state.
Only **32 files project-wide are confirmed-permanent.** Both CC queue
lanes (`claude-decomper`, `claude-scaffolder`) had new `[TODO]` items
added so `work_queue.py next` no longer returns `QUEUE-EMPTY`.

## Defects fixed (per brief 640 + wall-marker-census.md)

1. **C-NN/P-NN conflation.** The old regex's `\b[CP]-\d+\b` alternative
   treated any taxonomy citation as a wall. `docs/research/codegen-
   walls.md`'s own bucket structure puts C-NN under "coercible with
   knowledge" (a documented recipe exists — the opposite of permanent)
   and only P-NN under "permanent" (exhaustively swept, no C form
   found across all mwcc SPs). A bare mention in prose was also
   sufficient to trigger it, with no check that the citation actually
   matched the entry's own criteria.
2. **Blanket-cohort stamp treated as per-function evidence.** The
   `GLOBAL_ASM`/"brief 294"/"brief 302" text is `asm_escape.py`'s own
   `generate_whole()` header, emitted unconditionally on every
   `--whole-function` carve — a mechanical-tool bulk stamp, not a
   verified claim about any specific function. It covers 5,969 of
   6,261 tracked EUR `.s` files (wall-marker-census.md).
3. **0/5 confirmed.** Brief 640 sample-tested 5 wall-marked functions;
   none actually matched their own cited taxonomy entry's criteria (one
   shipped byte-identical on the first attempt).

## The fix

Reworked `is_wall()` (removed) into `classify_text()` returning one of
4 classes, highest-priority match wins:

1. **permanent** — a `P-NN` citation, OR an unconditional
   `mcr`/`mrc`/`msr`/`mrs`/`swi` instruction in the body (genuinely
   inexpressible in portable C without inline assembly). Deliberately
   excludes the **conditional** form of these mnemonics (`mcrne`,
   `svclt`, ...): `asm_escape.py`'s own `_DATA_AS_CODE_RE` (brief 488)
   already established that the conditional form is *always* disguised
   non-code data in this specific game's disassembly, never a real
   privileged instruction — reusing that established distinction here
   avoids reintroducing a new over-broad regex to fix an over-broad
   regex.
2. **coercible** — a `C-NN` citation, reported *with* the code(s) so
   the operator looks up the lever in codegen-walls.md instead of
   re-deriving it from scratch.
3. **unknown** — the blanket cohort stamp or other free-form wall
   prose with no citable code. Real candidates, just never
   independently assessed — most of ov002's 2,740 were carved by a
   pure mechanical size-tier sweep with zero C-drafting attempts
   (brief 416, traced in brief 640).
4. **no_marker** — nothing matched. Unchanged from before.

`candidate` = coercible + unknown + no_marker (everything that is NOT
confirmed-permanent). Still an explicit upper bound, not a work-list —
the tool's own docstring and every queue item this brief adds repeats
the header-read-before-compiling caveat.

### A real corpus case that validates the priority order

`src/main/func_020928cc.s` cites `C-8` ("mwasmarm syntax for inline-
asm escapes") but its body is a genuine cache-line-invalidate loop
containing a real unconditional `mcr p15, #0, r0, c7, c6, #1`. Its own
header text reads: *"Per codegen-walls.md C-8: privileged `mcr` not
accessible from C; ships as `.s`."* — the citation here means "see why
this is impossible," not "here is the lever." The new classifier
correctly routes this to `permanent` via the ISA-impossible check
(not a false-positive citation match), demonstrating the priority
order (ISA-impossible / P-NN beats a bare C-NN mention) is doing real
work, not just theoretical.

## Before / after (same repo state, both runs on `origin/main` tip)

Old tool (binary wall/convertible split):

```
module        total.s   wall  convertible
----------------------------------------
main             2493   2453           40
overlay004        161    158            3
overlay011         87     86            1
overlay002       2773   2773            0
...(21 more modules, all 0)...
----------------------------------------
TOTAL genuinely-convertible EUR .s remaining: 44
```

New tool (4-way split):

```
module        total.s   perm  coerc    unk  no-mrk  candidate
------------------------------------------------------------------
overlay002       2773      0     33   2740       0       2773
main             2493     31     62   2372      28       2462
overlay004        161      0      8    150       3        161
overlay006        161      0      3    158       0        161
overlay011         87      1     15     70       1         86
overlay008         62      0      6     56       0         62
overlay000         59      0      1     58       0         59
overlay010         49      0      1     48       0         49
overlay016         43      0      2     41       0         43
overlay005         32      0      0     32       0         32
overlay017         30      0      1     29       0         30
overlay020         27      0      1     26       0         27
overlay015         26      0      0     26       0         26
overlay019         25      0      0     25       0         25
overlay014         21      0      1     20       0         21
overlay003         18      0      0     18       0         18
overlay009         17      0      0     17       0         17
overlay012         16      0      2     14       0         16
overlay022         12      0      0     12       0         12
overlay007         10      0      0     10       0         10
overlay018         10      0      1      9       0         10
overlay013          9      0      1      8       0          9
overlay021          9      0      0      9       0          9
overlay001          2      0      1      1       0          2
overlay023          2      0      0      2       0          2
------------------------------------------------------------------
TOTAL candidate EUR .s remaining: 6122 (coercible 139 + unknown/never-assessed 5951 + no-marker 32)
TOTAL confirmed-permanent: 32
```

The 44→6,122 jump is almost entirely the `unknown` bucket (5,951 files)
— exactly the blanket-cohort population brief 640 identified as never
individually assessed.

## Cross-check against `wall-marker-census.md`

The census scanned all 20,170 tracked `.s` (EUR+USA+JPN, not
live-filtered); this tool scopes to EUR-baseline **live** files only
(referenced by a committed `delinks.txt`). Reconciling the EUR-only
rows:

| | census (tracked, EUR) | this tool (live, EUR) | gap | explanation |
|---|---:|---:|---:|---|
| Total | 6,261 | 6,154 (6,122+32) | 107 | orphaned/non-live `.s` on disk (not build inputs) + real repo drift since the census snapshot (several batches shipped C matches between brief 640 and this brief — see `docs/queue/*.md` history) |
| P-NN citations | 1 | 1 (folded into `permanent`) | 0 | exact match |
| C-NN citations (sum of per-code columns) | 142 | — | — | census explicitly notes this sum is **not** a disjoint file count (a file can cite 2+ codes) |
| C-NN citations (unique files, direct check) | — | 140 on disk, all live | — | confirmed via direct scan (see below) |
| `coercible` (this tool) | — | 139 | 1 | one file (`func_020928cc`, above) has both a `C-8` citation and a genuine unconditional `mcr` — correctly routed to `permanent`, not `coercible` |
| `unknown` (cohort + free-form) | 5,969 + 2 = 5,971 | 5,951 | 20 | live-filtering + drift, same as the total-row explanation |
| No marker | 148 | 32 (`no_marker` here) | 116 | **not directly comparable** — the census's "no marker" bucket is itself broken down into orphan-heavy categories (bss/data stubs, dead `ov004`/`ov010`/`ov015` etc. copies flagged in the queue docs' own history as pre-existing dead files); this tool's live-filter already removes most of that overlap before classification even runs |

Ran a direct, independent check (not just re-reading the census) for
the one interesting reconciling number: **140 unique on-disk EUR files
cite a `C-NN` code, and all 140 are live** (zero orphans among the
citers specifically) — so the 139-vs-142 gap is fully explained by (a)
the census's own documented multi-code-per-file non-disjointness and
(b) the single `func_020928cc` priority case, not by a bug in the live
filter or the classifier.

## Queue docs updated

`docs/queue/claude-decomper.md` and `docs/queue/claude-scaffolder.md`
(the two CC lanes reading `wall_aware_headroom.py`'s numbers) both had
stale "~245 convertible project-wide" notes and all-`[DONE]` items —
confirmed `work_queue.py next` returned `QUEUE-EMPTY` for both before
this brief. Added:

- **`claude-decomper.md`**: `cm-coercible-651` (the 139-file coercible
  pool project-wide), `cm-unknown-main-651`, `cm-unknown-ov002-651`
  (main + ov002 — the two biggest modules, matching this lane's
  existing main/ov004 history).
- **`claude-scaffolder.md`**: `cm-coercible-overlays-651` (the
  coercible pool in overlay004/006/008/011 — the next-biggest
  concentrations after main/ov002), `cm-unknown-overlays-651` (those
  same 4 modules' unknown pool — 434 files combined, small enough for
  a real sweep instead of a bottomless one like ov002's).

Both files' top-level protocol notes were updated to explain the new
4-way split and point at `--coercible` for the leveraged list. Both
new decomper items carry an explicit caveat (and by-name skip list) for
the 2 files brief 641 already found the classifier still can't catch
automatically: `func_ov004_021dbdbc.s` / `func_ov011_021d2c64.s` cite
"Brief 191"/"Brief 192" in prose with no taxonomy code at all, so they
land in `no_marker`/`unknown` despite being exhaustively documented
permanent walls. This is a genuine, acknowledged limitation (see
below), not silently swept under the rug.

Verified both files still parse correctly with `work_queue.py list
<lane>` after editing (see Gate section).

## Known limitation

The classifier can only key off machine-checkable evidence: a real
`[CP]-NN` taxonomy code, or a real unconditional privileged
instruction. A prose "Brief NNN worked example" citation with **no**
taxonomy code — even when the brief itself is an exhaustively
documented permanent wall, as with the two files above — still lands
in `unknown`/`no_marker`. Building a regex for "any brief-number
citation" would reopen exactly the over-broad-matching problem this
brief exists to fix (most brief citations are informational, not wall
claims). The sustainable fix is to give already-proven-permanent
patterns like these a real `P-NN` codegen-walls.md entry, not a
special-cased tool regex — flagged as a follow-up, not attempted here
(doc/tool-only scope, no new taxonomy entries authored in this brief).

## Gate

- `python -m pytest -q tests`: **12 failed, 2849 passed, 14 skipped**
  — identical to the pre-existing baseline (confirmed via `git stash`
  before/after: the same 12 files fail with or without this change).
  10 net new tests added (`test_wall_aware_headroom.py`: 5 old tests
  replaced with 15 new ones covering all 4 classes, priority ordering,
  the conditional-vs-unconditional ISA-impossible distinction, and the
  backward-compatible JSON keys).
- `docs/tools-index.md` regenerated (this file's docstring changed,
  one test caught it — fixed before the final gate run).
- `docs/research/README.md` regenerated (this report).
- Both `docs/queue/*.md` files verified to still parse with
  `python tools/work_queue.py list <lane>` after editing.
- Doc/tool-only change: no `src/`, `config/`, or `libs/` file touched;
  no ROM build or `ninja sha1` run (not applicable to this brief's
  scope).

## Files changed

- `tools/wall_aware_headroom.py` — the 4-way classifier rework.
- `tests/test_wall_aware_headroom.py` — 15 tests (was 5).
- `docs/queue/claude-decomper.md`, `docs/queue/claude-scaffolder.md` —
  new `[TODO]` items + updated protocol notes.
- `docs/tools-index.md`, `docs/research/README.md` — regenerated.
- `docs/research/brief-651-wall-tooling.md` — this report.
