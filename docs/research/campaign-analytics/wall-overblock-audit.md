[//]: # (markdownlint-disable MD013 MD041)

# q-wall-overblock-audit — are the walls blocking candidates they should not?

**Snapshot:** 2026-08-30T15:22:25Z, `origin/main` at HEAD `bfe189e44`
(round 0901 review) unless a figure states its own timestamp. Every
number below is re-derived from committed sources in this tree — the
vintage rule (`docs/research/band-rate-vintage.md`) applies here too.

## The finding this whole document turns on

**Nobody has the "currently-unattempted candidates blocked per wall"
number because the ledger cannot produce it — not for any wall, not
even P-20.** Across the entire 1,822-row `attempts.tsv`, only 31 rows
carry `result=not-attempted` at all, and of those, exactly **zero**
are tagged to any formal `P-NN` wall family. Every `P-NN`-tagged
ledger row instead records a candidate that was **individually
drafted and scored** before being diagnosed as wall-matching
(`result=parked`) — not one that was screened out before writing any
C. `cm-257-320-drain` (PR #1603) screening 6 P-20 candidates "on
sight" without writing a single ledger row is not a deviation from
this project's convention — it is the SAME convention this ledger has
always had (only 4 rows in its whole history record an on-sight,
never-attempted wall screening, and all 4 predate the `P-NN` naming
scheme entirely — see Methodology). **A wall's true "currently
blocked, unattempted" population can only be found by re-matching its
documented idiom against the live candidate pool directly** — the
ledger is structurally blind to it. This document does that once, in
full, for the canary (P-20); for the other 44 live walls it reports
what IS reconstructable (evidence strength, stale/broadened
membership) and leaves the blocked-candidate count honestly blank.

**Within what IS reconstructable, one result stands out: P-20 is the
only wall in the entire catalog with genuinely independent (mutually
unaware) 3+-round confirmation.** Every other live wall tops out at
2 rounds — and several of those 2-round cases are sequential/aware,
not independent. Several large member counts (P-11: 16, P-17: 17,
P-28: 16) rest on exactly 1-2 rounds, and — separately from round
count — this audit found concrete cases of walls whose own catalog
text documents STALE members (already shipped/matched, still listed
as blocking) and a generated-index defect that inflates apparent
evidence for at least two walls.

## Methodology

Two tools did the mechanical work; the reading and judgment were
done directly (canary, P-1) or by six parallel read-only workers
(all other live walls), each handed a corrected, precisely-bounded
slice of `docs/research/codegen-walls.md` and this document's own
established findings so no worker re-derived what was already known.
Findings were spot-checked against the raw catalog text before being
folded in, per this campaign's standing "verify your workers" rule.

```bash
$ python3 -c "
import csv, re
with open('docs/research/campaign-analytics/attempts.tsv', encoding='utf-8') as f:
    rows = list(csv.DictReader(f, delimiter='\t'))
na = [r for r in rows if r['result'].strip().lower() == 'not-attempted']
pnn = [r for r in na if re.fullmatch(r'P-\d+', (r.get('park_family') or '').strip())]
print(len(na), 'not-attempted rows total /', len(pnn), 'tagged to a P-NN wall')
"
```

```text
31 not-attempted rows total / 0 tagged to a P-NN wall
```

Derived 2026-08-30T15:01:06Z. Of the 31, 27 are `UNCLASSIFIED:unknown`
(no wall attribution at all) and the remaining 4 map to `C-31`,
`C-23+C-36`, `PROVISIONAL:permanent-header`, `PROVISIONAL:complexity`
— precisely `tools/wall_aware_headroom.py`'s own hardcoded
`_DIAGNOSED_WALL_PARK_CLASSES` set. That constant is the ONLY
mechanism in this project that ever excludes an on-sight-screened,
never-drafted candidate from re-dispatch, and it covers 4 raw
park-class strings out of the ~96 canonical wall families
`tools/park_class_map.tsv` recognizes. `tools/check_park_class_drift.py`
confirms the ledger's `park_family` column is drift-free against that
map (`CLEAN`, 0 unmapped values, run 2026-08-30), so this is a
complete, current count, not a stale one.

## Canary — P-20

Per the item's own instruction: reconstruct P-20's evidence before
surveying anything else, since it is the wall that did the screening
this round and the best-evidenced wall in the catalog.

**Member count: 55 confirmed, reading `docs/research/codegen-walls.md`
lines 10357-10454 directly** (the wall's own primary section, correctly
bounded — see Tooling defect below for why a naive read returns the
wrong number in either direction). A 56th member (`021d7054`,
`cm-ov002-unknown-sweep-17`, 2026-08-06) is genuinely confirmed but
physically misplaced after an unrelated intervening sub-heading
("P-20-mode-switch-selector") in the document, so it never got folded
into the entry's own running "confirmed cohort" total — a bookkeeping
gap, not a membership dispute.

**6 independent, mutually-unaware falsification rounds, 2026-07-27 to
2026-08-22:**

| Round | Date | New members | Independence |
|---|---|---:|---|
| `cm-ov002-unknown-sweep-4` | 2026-07-27 | 11 | Original discovery |
| `cm-ov002-unknown-sweep-5` | 2026-07-29 | 17 | Separate batch, same sweep series |
| `cm-ov002-unknown-sweep-6` | 2026-07-30 | 9 | Separate batch |
| `cm-ov002-unknown-sweep-17` | 2026-08-06 | 1 (+1 reconfirmation) | Explicitly "flagged only as an OBSERVED-NOT-CONFIRMED note... without cross-referencing this entry first" — genuinely blind |
| `cm-main-exploit-drain-2` | 2026-08-22 | 13 | Different pool (main ≤192B/193-256B, not the ov002 sweep series) |
| `cm-main-boundary-rerun` | 2026-08-22 | 5 | Different pool again |

All members land at a remarkably consistent residual (~87.9% match,
4 diff words, across 11 unrelated call sites in the original cohort) —
the kind of tight, repeated signature that reads as one genuine
allocator-internal decision, not 55 independent unsolved problems.

**Currently-blocking, unattempted count.** `cm-257-320-drain`
(PR #1603) screened 6 candidates on sight this round; confirmed
directly against the ledger that this left **zero** trace:

```bash
$ python3 -c "
import csv
with open('docs/research/campaign-analytics/attempts.tsv', encoding='utf-8') as f:
    rows = list(csv.DictReader(f, delimiter='\t'))
print(len([r for r in rows if 'cm-257-320-drain' in (r.get('brief') or '')]))
"
```

```text
17
```

17 rows cite `cm-257-320-drain` — exactly the 3 shipped + 14 parked
the round's own doc reports. The 6 screened candidates' addresses are
not named anywhere in `docs/research/cm-257-320-drain-2026-09-01.md`
either — they are genuinely unrecoverable from committed sources by
address, only by count.

Beyond those 6, a direct signature search of the CURRENT dispatch-ready
pool (1,777 candidates, `wall_aware_headroom.scan()`,
`--exclude-attempted`, `>=4` `bl`/`blx`, derived 2026-08-30T15:01Z)
for P-20's literal `0x868` row-stride constant, restricted to P-20's
own documented size profile (≤400 B, since every real confirmed
member sits in the 250-320 B range):

```bash
$ python3 -c "
import json, re
from pathlib import Path
pool = json.load(open('build/wall_audit_pool.json', encoding='utf-8'))
hits = [c for c in pool if c['text_size'] <= 400
        and re.search(r'\b0x868\b', Path(c['path']).read_text(encoding='utf-8', errors='ignore'), re.I)]
print(len(hits))
"
```

```text
0
```

**Zero.** By this proxy, no further currently-unattempted candidate in
the live pool carries P-20's literal signature. This is a genuine
lower-bound check, not a certified zero — a variant construction of
the same constant (e.g. built via two immediate instructions instead
of one pool literal) would not be caught by a literal-string search,
and the 6 already-screened PR #1603 candidates cannot be individually
re-verified as present/absent from this pool since their addresses
were never recorded. **Canary result: P-20's evidence is fully
reconstructable, and its currently-blocking count is 0 by direct
signature search plus 6 unrecoverable-by-address (PR #1603) — both
figures are more informative than the ledger's own answer, which is
simply "cannot be determined."**

## Deliverable 1 — currently-unattempted candidates blocked, per wall

**Blank for every wall except P-20 (above: 0 found + 6
unrecoverable-by-address).** Per the finding this document opens
with, the ledger returns zero for every wall, and a full disassembly
re-match of all 1,777 pool candidates against all 44 other walls'
documented idioms was outside this round's feasible scope — each
wall's signature requires genuine reading to recognize (P-20's own
canonical check took a targeted literal-constant search; several
other walls, per Deliverable 3 below, do not even have a
mechanically-checkable signature at all). **This is not zero — it is
unknown, and reported as such rather than estimated.**

## Deliverable 2 — evidence strength per wall

Every LIVE or tentative `P-NN` wall (49 total minus 4 RETIRED = 45),
read directly from `docs/research/codegen-walls.md` by six parallel
read-only workers plus the canary above. **STRONG** = 3+ independently
convergent (mutually-unaware) rounds. **MODERATE** = 2 rounds, though
several are flagged where the second round was aware of / building on
the first rather than blind. **THIN** = 1 round, a single investigation
session regardless of member count, or a status the catalog itself
marks tentative/under-reconsideration.

| Verdict | Walls |
|---|---|
| **STRONG** | **P-20 only** |
| MODERATE | P-1, P-4 (contested — see below), P-23, P-25, P-26, P-27, P-31, P-33, P-36, P-50, P-51 |
| THIN | P-2, P-3, P-9, P-11, P-12, P-13, P-14, P-15, P-16 (downgraded), P-17 (under reconsideration), P-18, P-19, P-21, P-22, P-24, P-28, P-29, P-30, P-32, P-34, P-35, P-37, P-40, P-41, P-42, P-43, P-44, P-45, P-46, P-47, P-48, P-49 |
| N/A (not a blocking wall) | P-5 (documented as a correct idiom, "Affected drops: zero") |

**Not one live wall besides P-20 reaches STRONG.** Several large
member counts do not correspond to strong evidence: P-11 (16 members,
5 rounds — but the rounds are accretive, not independently
convergent, and the LAST one found 10 of 16 already shipped), P-28
(16 members, 1 round, self-labeled "may turn out to be 2-3 separate
walls"), P-17 (17-member cohort built by header/comment grep, not
individual falsification — the catalog itself warns "do not infer
that the 17 headers represent 17 independent untested opportunities").
**Member count and evidence strength are different axes; several of
the catalog's largest cohorts sit on its thinnest evidence.**

## Deliverable 3 — membership tests broader than their evidence

Four distinct kinds of mismatch were found, each concrete and
address-level, none acted on (no wall re-classified, per the item's
own prohibition).

### A tooling defect that inflates apparent evidence

`tools/generate_walls_index.py`'s `_member_count()` sums every
`**Affected picks/drops (N):**` bracket found between one `### P-N.`
heading and the next — but its heading regex only recognizes an
EXACT `### P-N.`/`### C-N.` match. Any other level-3 heading in
between (a compound sub-entry like `### P-20-mode-switch-selector.`,
or an unrelated section like `### BR-1.`) is invisible to it, so its
content silently bleeds into the PRIOR wall's count:

- **P-20**: index shows **30** members. Real count (correctly
  bounded, see Canary): **55**. The 30 is `28` (P-20's own stale
  "Affected picks (28)" bracket, itself already superseded by three
  later rounds' additions) `+ 2` (the unrelated
  "P-20-mode-switch-selector" sub-entry's own bracket, silently
  merged in).
- **P-49**: index shows **9** members. Real count: **1** (`func_020858cc`,
  self-labeled "tentative, single instance"). Confirmed by direct
  inspection: P-49's true section ends at line 12292, but the next
  heading the OLD generator's regex recognizes as a boundary is
  `### P-51.` at line **14024** — sweeping in ~1,700 lines of
  unrelated "Band ship-rate closures" content (`BR-1` through the end
  of that appendix), from which its counter mis-extracted 9.

Both discovered mismatches inflate the apparent member count, the
worse direction for an over-block concern: a reader trusting
`codegen-walls-index.md` alone would believe P-49 has 9 confirmed
members instead of 1, and P-20 30 instead of 55 (an undercount for
P-20 specifically, but only because the true number is buried behind
the SAME class of bug that inflated P-49 — the generator is unreliable
in both directions depending on what happens to sit between two
formal headings). **Not fixed, per this item's own scope — flagged
for whoever owns `generate_walls_index.py` next.**

### Stale members: catalog-documented as still blocking, actually resolved

The clearest, most direct form of over-block: a wall's own text
records that a listed member was later matched/shipped, but the
member count / "why permanent" framing was never updated.

| Wall | Stale members | What happened |
|---|---|---|
| **P-1** | 7 of ~14 (50%) | Brief 049/wave 14 routed 7 `ov002` addresses through `.legacy.c` expecting a C-15-style fix; brief 596: "all 7 are now `complete` (matched) in the current tree." Two more (`func_0209aa48`, `func_0209d788`) were never genuine P-1 members at all (a later correction found one shipped via C-23, the other an unrelated register-swap). |
| **P-2** | 1 of 2 (50%) | `func_0209bf18` shipped via `.legacy.c` tier routing (2026-07-25) — the fusion this wall describes was dodged, not defeated, but the entry's "2 of 47 drops" line was never updated. |
| **P-4** | ≥3 (whack-a-mole) | `func_02084ac4` shipped (tier routing, not a new lever). `func_ov004_021dbe68`/`021de264` were confirmed-permanent in one round, then found to be wrong-arity misdiagnoses in a LATER round and explicitly "removed from the confirmed-permanent list" — the same two addresses flipped status more than once. |
| **P-9** | 3 (reclassified) | `func_02033488` (initially swept as mask-form) was shown by the permuter to be a genuine BASE RECOVERY — never actually walled. Two more reclassified from mask-form to the unrelated, non-walled early-return shape. |
| **P-11** | **10 of 16 (62.5%)** | The project's own re-audit (brief 677, cited in-catalog) states outright: 10 of 16 listed members "have ALREADY SHIPPED as matched C, via unrelated later work that never looped back to correct this entry." Only 6 remain genuinely unmatched. **The single largest stale-member fraction found in this audit.** |
| **P-16** | Core mechanism | The original "permanent, no known fix" verdict (based on 1 function) was walked back after `cm-parked-reaudit-1` found a general fix (a typed struct member over a raw pointer-offset cast) and `cm-ov002-unknown-sweep-7` independently reconfirmed it on a second, unrelated function. |
| **P-17** | 3 of 17 | `021f020c`, `021f1504`, `021eb630` explicitly "RECLASSIFIED: no longer P-17 members... now ordinary matched `.c` files, not `.s` walls." |
| **P-23** | 1 of 3 | `02253304` explicitly RETRACTED — it shipped clean via an unrelated callee-return-type fix, "never actually blocked by this wall." |

### Under-counted (evidence exists, never folded back — the opposite direction)

- **P-20**: `021d7054` (see Canary) — a real confirmed member missing
  from the running total due to document ordering.
- **P-50**: catalog documents `Affected picks (4)`. A LATER, separate
  round (`docs/research/data/cm-restock-carve-11-2026-08-24.md`,
  2026-08-22/24) found **17 walled descending-size pairs / 34
  symbols** under the identical mechanism — never folded back into
  the `codegen-walls.md` entry (last touched 2026-08-14).

### Explicit or demonstrated broader-than-evidence framing

Found directly in the walls' own catalog text, not inferred:

- **P-9**: the widest funnel found — an abstract signature initially
  flagged **281** unmatched functions; narrowing to the specific
  `mvnNE` idiom cut that to **36**; a further, still-unverified
  estimate suggests **~24** are genuine; only **2** are actually
  sweep/permuter-confirmed. 281 → 36 → ~24(est) → 2(confirmed).
- **P-30**: contains its OWN documented counter-example inside its own
  entry — `func_02043250` shares P-30's exact trigger shape but
  matched 100% on the first try with no lever needed, direct proof
  within the entry that its structural trigger does not reliably
  predict membership. The catalog already instructs verifying via
  `fastmatch.py` rather than pattern-matching on sight.
- **P-14**: self-flagged — "Not classifier-detectable... a detector
  would fire on essentially every struct-heavy function," backed by 1
  confirmed member.
- **P-13**: "~10-30 C-39c-shaped picks remain" — an unenumerated
  estimate up to 4x the 7 addresses actually named.
- **P-15**: "a fraction of the brief-268 NO_BL leaf grab-bag" — an
  uncounted population beyond the 4 named members.
- **P-21**: catalog itself: "likely under-counted... watch for the
  symptom broadly, not just in the shapes listed here" — 6 confirmed
  members from exactly 1 round.
- **P-26** (explicit P-20 variant, one of the two walls flagged for
  extra scrutiny given the round's P-20 screening incident): the
  address range originally scoped to the cohort was widened after one
  out-of-range hit, with the entry instructing "treat the range as
  descriptive... not a boundary condition" — an admittedly open-ended
  membership test on 9 confirmed instances.
- **P-28** (the other P-20-family wall, also flagged for extra
  scrutiny): title says outright "broader than P-20/P-23's literal
  `mla`-operand shape." 16 members, but from **1** round only — the
  largest member list of any THIN-verdict wall, on the thinnest round
  count. Self-admits it "may turn out to be 2-3 separate walls once a
  future round tests them independently rather than as one grab-bag,"
  and warns "do not treat membership here as confirmation that a fix
  exists for the specific sub-shape a new candidate shows."
- **P-27**: an explicit grab-bag umbrella — "several DIFFERENT
  symptoms" unified only by physical proximity to a call boundary — 3
  functions back it.
- **P-35**: "assign result to a local before testing" is an extremely
  common, generic pattern, backed by exactly 1 confirmed function.

### Internal count inconsistencies (independent of the above)

Found while reading, not otherwise acted on: **P-29** states "Falsified
on 6 members" but lists 7 in its own "Affected picks" bracket. **P-30**
mentions "a 6th member" while its own bracket lists 5. **P-32** and
**P-33** each have a formal `Provenance:` line that cites fewer rounds
than the entry's own body text describes. **P-46** is not labeled
"(tentative)" despite resting on the same single-round evidence as its
labeled peers (P-42 through P-49) — a labeling inconsistency, not a
membership dispute.

## Deliverable 4 — bottom line

**The literal requested figure — unattempted candidates and bytes sitting
behind thin-evidence walls — is blank, for the same reason it is blank
in Deliverable 1: the ledger cannot see an on-sight screening, and a
full pool re-match against 44 walls' idioms was not done this round.**

What IS honestly computable: bytes already drafted, scored, and
parked as members of a THIN-verdict wall (`park_family` exact match,
`docs/research/campaign-analytics/attempts.tsv`, derived
2026-08-30T15:22Z) — a lower bound, since not every catalog-listed
member necessarily carries a matching `park_family` tag:

```python
# THIN/MODERATE/STRONG sets = the verdicts from Deliverable 2's table.
import csv
from collections import defaultdict
with open("docs/research/campaign-analytics/attempts.tsv", encoding="utf-8") as f:
    rows = list(csv.DictReader(f, delimiter="\t"))
buckets = defaultdict(lambda: [0, 0])
for r in rows:
    fam = (r.get("park_family") or "").strip()
    if fam in THIN | MODERATE | STRONG:
        size = int(s) if (s := (r.get("text_size") or "").strip()).isdigit() else 0
        buckets[fam][0] += 1
        buckets[fam][1] += size
```

```text
THIN-evidence walls:    41 already-parked rows,  7,924 bytes
MODERATE-evidence walls: 84 already-parked rows, 12,052 bytes
STRONG (P-20 only):      63 already-parked rows, 13,204 bytes
```

Only 11 of the 33 THIN walls have any ledger rows carrying their exact
`park_family` string at all — most THIN walls' catalog-listed members
were never re-tagged with a matching family in the ledger, which is
itself consistent with this document's opening finding: this project's
bookkeeping does not reliably link a wall's catalog entry back to
individual ledger rows. The largest single THIN-wall contributor is
**P-30, 24 rows / 5,532 bytes** — notable because P-30's own entry (see
Deliverable 3) documents a direct counter-example inside itself. These
7,924 THIN-wall bytes are **already-drafted-and-parked** candidates,
not unattempted ones — re-testing them (not new-candidate discovery)
is the concretely actionable "worth one re-test round" population this
audit can support with real numbers.

## Synthesis, common units

| Question | Answer | Confidence |
|---|---|---|
| How many currently-unattempted candidates does each wall block? | Unknown for 44/45 walls (ledger structurally blind); 0 found + 6 unrecoverable-by-address for P-20 | High that the ledger cannot answer this; low/proxy-only for the P-20 figure itself |
| Which walls have strong (3+ independent rounds) evidence? | P-20 only | High — read directly, cross-checked by 6 workers |
| Does member count track evidence strength? | No — several of the largest cohorts (P-11, P-17, P-28) rest on 1-2 rounds | High |
| Are any walls' membership lists stale? | Yes, 8 walls, up to 62.5% of one wall's (P-11) listed members already shipped | High — all catalog-documented, not inferred |
| Is the generated index (`codegen-walls-index.md`) reliable for member counts? | No — confirmed wrong in both directions (P-20 undercounts, P-49 overcounts 9x) via the same class of heading-boundary bug | High — root cause diagnosed precisely |
| Bytes worth a re-test round? | 7,924 B already-parked (not unattempted) behind THIN-verdict walls — a lower bound | Moderate — ledger `park_family` coverage of catalog members is itself incomplete |

## Critic pass — what this audit itself does not verify

- **The STRONG/MODERATE/THIN classification rests on each wall's OWN
  cited round names and dates, not independent verification that two
  cited "rounds" were genuinely mutually unaware.** Several MODERATE
  verdicts (P-4, P-36, P-50) were explicitly downgraded by the workers
  reading them from a naive round-count because the text itself showed
  the later round was aware of / building on the earlier one — but
  this required a human (or agent) judgment call per wall, not a
  mechanical count, and a differently-calibrated reader could land
  some of these differently.
- **The "currently blocking" figure for P-20 rests on a single literal-
  constant search.** A P-20 instance whose row-offset constant is built
  via two separate immediate instructions (rather than one pool
  literal) would not be caught by this check and would silently read
  as "not blocked" when it might be.
- **The stale-member findings (Deliverable 3) are themselves catalog
  self-reports** — found by reading correction notes the catalog
  authors already wrote, not by independently re-verifying every
  listed member's current match status. A wall with NO documented
  correction note could still have stale members nobody has re-checked
  yet; absence of a found correction is not proof of freshness.
- **`park_family` ledger coverage is incomplete relative to the
  catalog's own member lists** (Deliverable 4) — the 7,924 B THIN-wall
  figure is a lower bound on already-parked mass, not a count of every
  catalog-listed member's current disk state.

## What this does not establish

- Whether any specific wall should be re-classified, narrowed, or
  retired — no wall's status was changed; every finding above is
  reported, not acted on, per the item's own explicit prohibition.
- The true "currently blocked, unattempted" population for 44 of the
  45 live walls — genuinely unknown, not zero, and not estimated here.
- Whether the generated-index bug (Tooling defect, above) affects any
  wall beyond the two confirmed instances (P-20, P-49) — plausible
  given the shared root cause, not individually checked for the other
  43 walls in this round.

No direction is recommended. cntrl_alt_lenny decides what, if
anything, happens with the tooling defect, the stale members, or the
thin-evidence walls named above.
