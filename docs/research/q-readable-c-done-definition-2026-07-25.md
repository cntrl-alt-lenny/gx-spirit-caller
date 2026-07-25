# q-readable-c-done-definition — retire the self-contradicting ceiling, define "done"

Queue item `q-readable-c-done-definition` (r11 finding, [S] size). Two
deliverables plus a closeout item. This doc shows the arithmetic for
deliverable 1, gives 3 candidate "readable-C done" definitions with a
recommendation for deliverable 2, and documents the README SVG bar fix.

## Deliverable 1 — the ceiling model's arithmetic, and the fix

### Where 48.03% came from

`tools/progress.py`'s `tractable_ceiling_bytes()` estimates, per module,
how much of the remaining non-C `.text` will ever realistically become
readable C. Two tiers:

- **Asymptotic** (`main`, `ov002`): a named, module-specific headroom
  fraction.
- **Finishable** (every other module): one flat `FINISHABLE_HEADROOM_FRACTION`
  (0.75, unchanged by this item — see below).

Before this fix, `main`'s fraction was **0.75**, set in commit `f8e1dad5`
(2026-07-24) and justified by "+33,832 C-bytes ~49% of the old headroom
in one month." Live arithmetic at that setting (`python tools/progress.py
--version eur --by-module`, verified 2026-07-25):

```
main:  c_bytes=83,256  c_total=738,080  remaining=654,824
       ceiling = 83,256 + round(0.75 * 654,824) = 574,374  (77.82% of main)
ov002: c_bytes=56,728  c_total=1,129,252  (fraction 0.10, unchanged)
       ceiling = 56,728 + round(0.10 * 1,072,524) = 163,980  (14.52% of ov002)
TOTAL: 1,145,890 / 2,385,948 B = 48.03% of EUR .text; attainment 18.70%
```

r11 flagged this as self-contradicting: `docs/research/rnd-swarm-r7-verified.md`
(r7-14) independently derived a "~14-24% of headline bytes" ceiling band,
2-3.4x lower. Two committed data points r11 cites as the reason 0.75 was
too high — both verified directly against their source docs before use here:

- **Brief 661** (`docs/research/brief-661-main-unknown-probe.md`): a TRUE
  RANDOM sample of main's unknown tranche, 35 files across every size
  tier. **3/35 shipped = 8.57%.** Unbiased sampling, but diluted by 20/35
  files in the 257B+ range that were header-read (real code, no wall
  signature) but never compile-attempted — a conservative floor, not a
  precise rate. Within just the <=256B tier alone (14 real attempts) the
  rate was 21% shipped + 14% "close" (blocked only by the epilogue wall).
- **Brief 675** (`docs/research/brief-675-main-128-drain.md`): deliberately
  the single EASIEST cell (main's <=128B tranche only). **9/30 = 30%.**
  A best-case upper bound by construction — cherry-picking the easiest
  cell is exactly the methodology that produced the original 0.75
  overshoot, so this number is cited but NOT used as the new fraction.

### The fix: main's fraction 0.75 -> 0.10, with the residual honestly flagged

`ASYMPTOTIC_HEADROOM_FRACTIONS["main"]` is now **0.10** — anchored to
brief 661's unbiased 8.57% floor, rounded to match `ov002`'s existing
conservative-round-number precedent. New arithmetic:

```
main:  ceiling = 83,256 + round(0.10 * 654,824) = 148,738  (20.15% of main)
TOTAL: 720,254 / 2,385,948 B = 30.19% of EUR .text; attainment 29.75%
```

**This does not fully reconcile to the 14-24% band, and forcing it to
would be false precision.** Independent check performed while deriving
this fix: even at `main`'s fraction set to **zero**, every OTHER module's
ceiling (the 24 finishable modules under the unchanged 0.75 flat
fraction, plus `ov002`'s unchanged 0.10) already sums to **23.95%** of
the region-wide `.text` total on its own —

```python
everything_else = total_ceiling(main=0) - main_ceiling(0) = 407,536 + 163,980
407,536 + 163,980 = 571,516 / 2,385,948 = 23.9534...% ~= 23.95%
```

— meaning ANY nonzero `main` contribution structurally pushes the
region-wide total above the top of the 14-24% band. The larger, still
undocumented-as-fixed contributor is `FINISHABLE_HEADROOM_FRACTION`
(0.75, applied flat across 24 modules with no per-module wall census) —
the existing code comment already named the proper fix for this
(r7-15's curated "14 finishable modules (~92 kB .s)" subset, built from
a per-module wall census whose raw workflow-journal data isn't
reproducible from committed data alone). Redoing that census is
out of scope for this item's [S] sizing; **flagged, not silently
absorbed** — see the `FINISHABLE_HEADROOM_FRACTION` comment in
`tools/progress.py` for the full note.

### Why "fix the number precisely" is the wrong framing anyway

r7-14's own band is described as "~2-3x the CURRENT matched rate" — a
RELATIVE multiplier, not a fixed absolute percentage. Actual matched
bytes have grown substantially since r7-14 was computed (this campaign
alone shipped dozens of PRs in the current stint), so re-applying "2-3x
current" today mechanically produces a higher number than "14-24%" even
with unchanged methodology — the band itself is understood to have
drifted. Chasing an exact match between two independently-aging
estimates computed at different times, with different methods, is not
a fix; it manufactures false precision. Given that, this item's
resolution combines a **real, evidence-anchored fix** (main:
0.75 -> 0.10, cutting the region-wide gap from 48.03% to 30.19%) with
an explicit **retraction of the ceiling/attainment pair's authority as
a completion criterion** — in the `tractable_ceiling_bytes()` module
docstring, the `ASYMPTOTIC_HEADROOM_FRACTIONS` / `FINISHABLE_HEADROOM_FRACTION`
comments, and the `print_by_module()` CLI footer, all updated in this
PR. Every one of those surfaces now says explicitly: rough,
time-varying estimate; not a measurement; not a completion criterion;
see this doc's deliverable 2 for the real "done" definition. This
satisfies the item's "fix it or delete it — do NOT leave two
contradictory numbers in the tree": the numbers no longer compete for
the same authority, because only one of them (the actual done
definition below) claims any.

## Deliverable 2 — three candidate "readable-C done" definitions

r11 pre-drafted this analysis (`rnd-swarm-2026-07-24-r11-postwall.md`
lines 220-225); the three candidates below build on it, independently
re-checked against live data rather than restated on faith.

### Candidate (a) — pret-style 3-tier public ladder

D1 byte-matched, D2 decompiled-modulo-documented-floor, D3
documented/named — the convention pret/pokeemerald and similar
communities use (verified via public repo survey): a byte-matching
build with full C source is "decompiled," full documentation is an
explicitly separate, later tier. **D1 is ALREADY ACHIEVED** — re-verified
live this session: `complete_units`/units 10,335/10,335 (matched), code%
99.44%, and `ninja sha1` is this project's own standing 3-region gate
(CLAUDE.md). D2's floor is already named: `docs/research/campaign-analytics/
endgame-ledger.md`'s ISA-inexpressible `.s` files (`mcr`/`mrc`/`swi`/`msr`/`mrs`-carrying,
cited in `tools/progress.py`'s `FINISHABLE_HEADROOM_FRACTION` comment as
~42 EUR / 26 USA / 26 JPN files project-wide — genuinely inexpressible
in C, not a wall to crack). D3 is currently at literal zero (r11's own
census: 2/10,901 named symbols, both infrastructure) — an honest,
far-off tier, not yet a near-term target.

- **Pros:** community-legible (matches how outside decomp projects
  communicate progress); D1 is free (already true); gives a real,
  visible near-term target (D2) distinct from the far-off D3.
- **Cons:** D2 needs the wall registry to function as a public
  exception list, which peer projects mostly don't need to the same
  degree — this project's mwcc byte-exact register-allocation walls are
  real and numerous (~2,750 independently verified in `ov002` alone per
  state.md's honest pool), so the "exception list" is large and requires
  ongoing curation to stay credible rather than becoming a dumping
  ground for un-investigated parks.

### Candidate (b) — attainment = 100% of the tractable ceiling

The mechanism this item's deliverable 1 already implements
(`tractable_ceiling_bytes()` / `attainment` column) reaches 100% as its
own completion signal.

- **Pros:** already implemented, per-module, cheap to compute, zero new
  infrastructure needed, useful as a rough trend indicator today.
- **Cons:** **rejected as a completion criterion**, per deliverable 1
  above and r11's own explicit rejection. Its denominator is an
  estimate that moved 18.5 percentage points of `.text` in a single
  commit before this fix, and even after the fix depends on an
  unresolved, flagged-not-fixed flat 0.75 assumption across 24 modules
  with no per-module census. A number whose target can silently shift
  by double digits from one commit is not a criterion anyone can build
  a milestone around. Retained ONLY as a rough trend indicator (its
  print output now says so explicitly), never as "done."

### Candidate (c) — internal verdict-complete gate

Every `.text` byte is in exactly one state: natural-C, on the
ISA-inexpressible floor (candidate a's D2 set), or carries a
per-function wall verdict **dated after the verdict-relevant lever
convention it depends on**. "Done" means zero un-adjudicated bytes —
not an arbitrary percentage.

- **Pros:** falsifiable, no estimated denominator anywhere in the
  definition, mechanically auditable from committed data (a script can
  walk every `.text` byte's owning TU and check its state — no baserom
  or build required, same style as the rest of `progress.py`).
- **Cons:** requires per-function investigation of the full un-adjudicated
  pool (state.md's honest-pool count: 6,093 candidates / 32
  confirmed-permanent as of this campaign's wall-classifier fix) —
  real, ongoing labor, not a one-time metric fix. Also requires solving
  **verdict freshness** correctly, which is harder than it first looks
  (see below) — a naive single fixed cutoff date is not enough.

**Verdict freshness is load-bearing, and the obvious approach
undercounts it.** r11 cites the overlay-small-sweep reversing six
pre-convention "permanent" verdicts as evidence a freshness gate is
needed. This session's own `cm-parked-reaudit-1` item (2026-07-25,
`docs/research/cm-parked-reaudit-1-2026-07-25.md`) reversed six MORE
"documented permanent wall" verdicts, all via the SAME root cause: a
lever description (typed-struct-member access) that had been on record
since 2026-06-03 (`ov000_core.h` recipe #1, brief 319) was itself
**incomplete** — the actual working mechanism (distinct-symbol
identity: literal-address-cast, or registered-symbol + BSS-split alias)
wasn't correctly documented until this item's own sibling PR rewrote
`docs/research/codegen-walls.md`'s C-34 entry, also 2026-07-25. A verdict
recorded on, say, 2026-06-15 — AFTER the 06-03 convention date — would
still pass a naive "verdict-date >= convention-date" freshness check,
yet could easily be one of exactly this kind of false-permanent
mistake, because the convention it was checked against was itself wrong
until today. **Recommendation for whoever implements candidate (c):**
key freshness off the lever catalog's own last-corrected date per wall
family (`docs/research/codegen-walls.md`'s per-entry history), not one
global cutoff — a verdict is only as fresh as the most recent
correction to the SPECIFIC lever family it was checked against.

### Recommendation

**Adopt (a) + (c) together; reject (b) as a completion criterion**
(retain only as a trend indicator, matching deliverable 1's fix). This
matches r11's own recommendation, independently re-confirmed here: (a)
gives outside observers and new contributors a legible public
narrative with a real near-term target (D2); (c) gives the project
itself a falsifiable, estimate-free internal gate that can't silently
move. Neither requires the large per-tier ceiling stratification this
item explicitly scopes out. Implementing (c)'s actual byte-walking
gate (a `bytes-with-fresh-verdict / total-.text` counter in
`progress.py --by-module`, per r11's suggested action) is a real,
separate, larger follow-up — not attempted in this [S]-sized item —
flagged in `docs/state.md`'s Next-brain TODO below rather than
half-built here.

## Closeout — README SVG bar's asm-inflation (last asm-inflated surface)

`tools/generate_progress_bars.py`'s `region_metrics()` computed
`c = sum(c_split.values())`, folding `asm-C` (byte-matched
`asm {}`-bodied `.c` placeholder files) into the green "decompiled to
C" bar's numerator — the one surface in the metrics chain that hadn't
picked up the natural-C/asm-C split already shipped everywhere else
(`progress.py`'s CLI/JSON output, `state.md`'s metric block, the
per-PR `asm_void_counter`). Fixed: `c = c_split["natural-c"]`. Verified
live (`python tools/generate_progress_bars.py`):

```
EUR: Natural-C 210822/2385948 B, asm-C 3456/2385948 B, C 8.8%  (was 8.98% combined)
USA: Natural-C 176680/2384964 B, asm-C  832/2384964 B, C 7.4%  (was 7.44% combined)
JPN: Natural-C 176680/2384964 B, asm-C  840/2384964 B, C 7.4%  (was 7.44% combined)
```

Also fixed 4 stale queue-header lines (`docs/queue/{claude,codex}-{scaffolder,decomper}.md`,
all sharing one boilerplate sentence) that still described the
natural-C/asm-C split as "incoming" even though `q-natural-c-metric`
has read `[DONE]` since it shipped — the same class of asm-inflation
inaccuracy this item's motivating text calls out, caught by r11 and
verified still-stale immediately before this fix.

## Gate

- `python -m pytest -q tests` — full suite green (see PR).
- Ceiling: fixed with shown arithmetic (deliverable 1 above); NOT
  deleted — retained as an explicitly-labeled rough estimate/trend
  indicator, its authority as a completion criterion retracted in code
  comments + CLI output.
- 3 candidate done-definitions with a recommendation: deliverable 2
  above; pointer added to `docs/state.md`'s Next-brain TODO for the
  brain's actual decision, per the item's "the brain decides."
- README SVG bar: fixed to report natural-C only (closeout section
  above).
