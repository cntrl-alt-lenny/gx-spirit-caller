[//]: # (markdownlint-disable MD013 MD041)

# Brief 596 — carve census autopsy + the P-1 probe

**Asked:** three independent objectives. (1) `size_census.py` reports
150+ small unclaimed ARM functions project-wide, but `batch_carve.py
--dry-run` censuses 0 candidates on every module — diagnose why, fix
what's genuinely wrong, and make an empty census self-describing. (2)
Reconcile PR #1160's flagged mismatches between `size_census.py`'s
per-module byte counts and `endgame-ledger.md`'s rows, ov004
especially. (3) Direct-mwcc-probe the P-1 wall class (25% of
documented walls per brief 590's r6 verification) against
SonicRushAdventure-Decomp's `(s32)(u16)` cast-chain hint, on one real
exemplar, dual-compiled under both mwcc SP tiers.

**Short answer:** all three landed with concrete, verified results.
(1) Two independent regex bugs in `batch_carve.py` — not the brief's
own leading hypothesis, which was directly tested and ruled out.
Fixed; the fix legitimately re-opens **116 USA / 115 JPN / 58 EUR**
ARM candidates project-wide (`--min-addr 0x0` isolation). (2) The
"mismatch" PR #1160 promised to compute never actually rendered (a
literal, never-substituted `${rows}` template placeholder) — brief
596 ran the comparison for the first time. 55 of 57 nonzero-gap
module/region rows match exactly; the other two (ov004, `main`) are
now fully root-caused with **zero unexplained residual bytes**.
Neither tool is wrong — they measure different things — but `main`'s
delta exposed a genuinely new, previously invisible ~2,048 B block of
un-symbolized ARM9 startup code. (3) The cast-chain hint is correct
for a shape P-1's own catalogue had *mis-filed*, not for the shape
P-1 actually names: brief 596 found all 7 of P-1's own "permanent"
ov002 example addresses are **already matched** in the tree, and a
fresh dual-tier direct-mwcc probe pins the exact mechanism (byte-exact
on both `2.0/sp1p5` and `1.2/sp2p3`). P-1's core return-value-extract
wall (Family 7, brief 250) is **re-confirmed permanent** — this is a
scope correction, not a reversal. The real remaining P-1 count is
**10 of 69 (14.5%), not 17/69 (25%)**.

## Objective 1 — the batch_carve enumeration bug(s)

### The leading hypothesis was tested and ruled out

The brief's hypothesis was that `carved_addrs()` counts `_dsd_gap@*`
delink entries as "carved." Directly tested against USA `main`: zero
false positives from that mechanism. Consistent with brief 583's own
prior finding — `_dsd_gap@` is a build-time-only synthesized
object-filename convention that never appears in a committed
`delinks.txt`. Diagnosis continued past this (per the brief's actual
instruction — "diagnose why," not "confirm the hypothesis") and found
two different, more precise bugs that together fully explain the
symptom.

### Bug 1 — renamed symbols were invisible to the carve-candidate scan

`_SYM_RE` / `_SYM_ADDR_RE` hardcoded a literal `func_` name prefix.
dsd/decomper convention renames a function (`OS_DisableIrq`,
`Copy32`, `main`, …) once it's identified via signature-matching —
**naming and carving are independent steps**, so a renamed-but-
uncarved function is common, not an edge case. Every renamed function
was silently invisible to the whole candidate pipeline. Widened both
regexes from a literal `func_` prefix to `\S+`; added
`parse_all_symbols()` (ARM + Thumb, reporting-only) and a new
`real_addr()` helper that resolves a candidate's true ROM address via
the authoritative `addr:` field first, falling back to the
name-derived `func_addr()` only when a symbol carries no `addr:`
field at all.

### Bug 2 — the module-header line false-positive

`carved_addrs()`'s address-collecting regex was unanchored and matched
`start:0x…` *anywhere* in the text — including the module-level
section-map header at the top of every `delinks.txt` (multiple spaces
+ a `kind:`/`align:` suffix, e.g. `"    .text       start:0x021aa3c0
end:0x022bdeb4 kind:code align:32"`), not just per-TU claim lines
(single space, no suffix). Since a module's nominal start address
always coincides with whichever function sits at the module's first
byte, this silently marked exactly **one** real function "carved" per
module — a small, easy-to-miss bug (one false negative per module)
that nonetheless compounds with Bug 1 project-wide. This is the exact
same false-positive shape `size_census.py`'s `_CODE_RANGE_RE` was
fixed for in brief 583; `carved_addrs()` just never got the matching
fix. `_CARVED_RANGE_RE` now requires the single-space, no-suffix
per-TU shape.

### Self-describing census

A bare `"0 candidates"` line gives no signal for *why* — and fooled
the brain twice into concluding a module had no residue when it
actually had 100+. New `CensusBreakdown` dataclass + pure
`census_breakdown()`: classifies every `kind:function` entry (ARM and
Thumb) into exactly one bucket — `thumb_excluded`, `below_min_addr`,
`size_out_of_range`, `already_carved`, `skiplisted`, `on_disk_dedup`,
or `candidate` — and its `.summary()` renders either `"N candidates"`
or an explanatory `"0 candidates (N thumb excluded by mode filter, M
already carved, …)"`. Wired into `BatchCarver.run()`'s existing log
line.

### How many candidates the fix re-opens (dry-run only, not carved)

Using `--min-addr 0x0` to isolate the regex fix from the pre-existing,
separately-documented `--min-addr` default trap (`0x02234000`, an
ov002-overlay-swap-specific boundary that was never appropriate for
`main`):

| Region | Candidates | Bytes | Modules touched |
|---|---:|---:|---:|
| USA | 116 | 0x2d44 | 24 |
| JPN | 115 | 0x2cd0 | 24 |
| EUR | 58 | 0x1534 | 13 |

Live end-to-end confirmation (`--dry-run`, USA `main`, real scope):
`scope main 0x0-0x10000: 19 candidates (of 4137 total; batch=20,
dry_run=True)` — up from "1 candidate" pre-fix for the identical
scope. The 34-vs-19 gap between the raw regex-fix count and this live
run is the pipeline's existing, correct on-disk `.s`/`.c` dedup filter
(prevents re-carving over in-progress or abandoned drafts) — not a
new bug.

### A third, narrower limitation — found, not fixed

`carved_addrs()` is point-based (collects only discrete per-TU *start*
addresses), not interval-based (range containment). This causes EUR
ov006's 11 known "phantom absorbed" addresses (brief 583: each 4 bytes
inside a larger `complete` TU) to still surface as candidates in a
fresh dry-run, even though `progress.py`'s interval-aware gap
computation correctly shows ov006's gap as exactly 0. Traced through
`asm_escape.py`'s `gap_object()` logic: attempting to carve one of
these would hit the exit-2 "not found in build/…/delinks" path, which
(post brief-583's own fix) correctly returns `tool-error` — never
parked, never falsely shipped. Reasoned through the code, not yet
empirically re-verified via an actual build attempt. Left unfixed —
out of scope for this brief, and the point-based/interval-based
distinction is a real design question (does "carved" mean "a TU
starts here" or "this byte is claimed by something"?) that deserves
its own brief rather than a drive-by change.

## Objective 2 — the size_census / endgame-ledger reconciliation

### PR #1160's "flagged mismatches" never actually existed

PR #1160 (brief 592) planned a per-module comparison table. Its `##
Comparison` section is a literal, never-substituted `${rows}`
template placeholder — confirmed both in the PR body (`gh pr view`)
and in the committed `docs/research/brief-592-census-bundle.md`
(lines 130/132). No prose anywhere in that doc or PR describes any
specific mismatch either. The promised comparison was silently
dropped, not merely unread — this brief is the first time it's
actually been run.

### Method and result

Compared `size_census.collect()`'s per-module unmatched-function byte
total against this ledger's `module_gap()` byte total, for all 57
module/region combinations with a nonzero ledger gap. **55 of 57
match exactly (0 B delta).** The other two, both fully root-caused
with zero unexplained residual:

- **ov004, all 3 regions (34 B delta):** 17 discrete 2-byte "orphan"
  gaps sitting between named, already-enumerated functions — real
  unclaimed bytes the ledger correctly counts, but with no symbol of
  their own for a function-level tool to see. Inter-function alignment
  padding.
- **`main`, all 3 regions (2,270 B delta, identical byte count in
  EUR/USA/JPN despite very different ledger totals):** dominated by a
  ~2,048 B block at the very start of ARM9 `main` (`0x02000000`
  through `~0x02000800`) with **no `symbols.txt` entry whatsoever** —
  not `kind:function`, not `kind:data`. `Entry` (the real ARM9 entry
  point, `0x02000800`, `0x13c` B) is already matched and sits just
  past this block. EUR's `main` shows 0 unmatched *functions* in
  `size_census` — its entire remaining ledger gap *is* this
  unsymbolized block. USA/JPN carry the identical 2,270 B block plus
  their own separate, ordinarily-visible unmatched functions.

Neither artifact is wrong — `size_census.py` is function-level by
design (its own docstring: "bucket every UNMATCHED function"); the
ledger measures raw uncovered bytes regardless of whether a symbol
exists. They now provably agree everywhere except two fully-explained
cases. Full writeup, including the address-level derivation, added to
`endgame-ledger.md`'s new "Reconciliation against size_census.py"
section; `size_census.py`'s docstring gained a scope note
cross-referencing it.

**New lead, not fixed here:** the `main` startup-code block is
invisible to `size_census.py` *and* `batch_carve.py` alike (both are
`symbols.txt`-driven) — it isn't a queued, carvable candidate
anywhere right now. Naming it would need dsd re-analysis or manual
symbol authoring, not a carve wave.

## Objective 3 — the P-1 probe

### The exemplar picked itself

P-1 ("shift-pair vs mask collapse") is documented as **permanent
across all mwcc SPs** — mwcc always collapses `(x<<K)>>K` to
`and x,#mask`, confirmed by brief 250's 5-idiom matrix (including the
literal cast-chain form) on the *return-value* shape (Family 7: value
computed and returned via the same register, e.g. `r0→r0`). The
brief's 7 documented ov002 "misapplications" (brief 049 wave 14) were
the obvious real-tree exemplar — and reading their current state
before touching wine turned up the actual finding: **all 7 are
already `complete` (matched) in the current tree**, each using a
`(u16)x` cast forwarding a value as a *different* function's call
argument (a tail-call dispatch shim), not returning it from the same
register.

### Dual-tier direct-mwcc probe (the wine-light step)

Paused when wineserver contention with a concurrent lane (`claude-597`,
a large batch of `mwasmarm.exe` compiles) was observed, per the
brief's explicit safety instruction; resumed once the process list
cleared. Compiled 3 idioms for `func_ov002_0226af78`'s body — cast
(`(u16)arg1`, the shipped form), mask (`arg1 & 0xffffu`), and the
literal shift-pair (`(unsigned)(arg1 << 16) >> 16`) — under both
`mwccarm 2.0/sp1p5` and `1.2/sp2p3`, using the project's exact
`CC_FLAGS` from `tools/configure.py`. `.text`-section sha1:

| C idiom | mwcc emits | sha1 (both tiers identical) | Matches orig? |
|---|---|---|---|
| `(u16)arg1` (cast) | `lsl r1,r1,#16; lsr r3,r1,#16` (+ ldr/mov/mov/bx) | `2164ac87…` (28 B) | **yes** |
| `arg1 & 0xffffu` (mask) | identical instructions | `2164ac87…` (28 B) | **yes** — byte-identical to cast |
| `(unsigned)(arg1<<16)>>16` (literal shift-pair) | 4 shift insns (double-truncates) | `6e1fa595…` (36 B) | **no** — larger *and* wrong |

Cross-checked by compiling the actual committed file (not the
hand-copied variant) under `2.0/sp1p5`: identical `2164ac87…`. All 6
scratch compiles ran clean; wineserver returned to idle immediately
after.

### Verdict

**The lever flips the codegen, but the mechanism isn't "cast beats
shift" in general — it's register-pressure context.** When the
truncated value must move into a *different* register as part of
another call's argument setup, mwcc naturally lowers it as the target's
shift pair (cast and mask are equivalent; both work, on both SP
tiers). When the value is returned from the *same* register it started
in (Family 7's shape), mwcc collapses to `and` regardless of C idiom —
re-confirmed, not overturned. Writing the shift pair *literally* in C
is the one idiom that fails in the argument-marshalling context too
(it computes the truncation twice, 36 B, matching neither target nor
being minimal) — the same "obvious" instinct that already doesn't work
for Family 7.

**Correction landed in `docs/research/codegen-walls.md`:** P-1's
"Affected drops" list and the C-15-vs-P-1 wall-family note both
carried the 7 ov002 addresses as still-permanent; both now note they
're already matched, with the mechanism, the byte-exact evidence
table, and a revised discriminator ("same register → P-1, permanent"
vs "different register for a call argument → not a wall"). **Real
remaining P-1 count: 10 of 69 drops (14.5%)**, down from the
previously-recorded 17/69 (25%) — P-1 stays the largest single wall
in the set, just smaller than the catalogue said. This is the same
"wall catalogs go stale" pattern the backlog re-sweep pilot already
documented, caught here on a wall the r6-verification round had just
flagged as a top-3 priority to look at again.

## Tests

`pytest -q` from the worktree root: `2664 passed, 12 skipped, 9
subtests passed`. New coverage: `TestCarvedAddrsModuleHeaderExclusion`
(5 tests), `TestRenamedSymbolVisibility` (5 tests),
`TestParseAllSymbols` (3 tests), `TestCensusBreakdown` (7 tests,
including a cross-check that `census_breakdown()` and
`filter_candidates()` agree on the same scope) — all in
`tests/test_batch_carve.py`. One existing test in
`tests/test_emit_data_blob.py` was rewritten, not just patched to
pass: `resolve_name_and_declared_size_from_text()`'s own docstring
("Prefers the real symbol at addr") had no `func_`-prefix caveat, so
the old test — which asserted a `BlobError` for a renamed-symbol
lookup — was pinning a bug in the underlying parser, not documenting
a real design boundary. It now asserts the corrected resolve.

## Cross-references

- `docs/research/campaign-analytics/endgame-ledger.md` — brief 583
  (byte-derived gap ledger, this brief's Objective 2 target); new
  "Reconciliation against size_census.py" section.
- `docs/research/codegen-walls.md` §P-1 and the C-15-vs-P-1 wall-family
  note — this brief's Objective 3 correction.
- `docs/research/brief-592-census-bundle.md` — the PR #1160 doc with
  the never-rendered `${rows}` placeholder.
- `docs/research/brief-250-c42-escape-classify-family5-n3-family7.md`
  — Family 7's original, still-valid return-value P-1 confirmation.
- `docs/research/rnd-swarm-r6-verified.md` — brief 590, source of the
  P-1-as-top-3-priority and the SonicRushAdventure cast-chain hint.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
