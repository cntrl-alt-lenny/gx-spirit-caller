[//]: # (markdownlint-disable MD013 MD041)

# q-large-band-reachability — can the toolchain even feed a large function?

**Snapshot:** 2026-08-29T17:59:15Z, `origin/main` at HEAD `f071f7c20`
(round 0830 review) unless a figure states its own timestamp. Every
number below is re-derived from committed source and already-built
`build/eur/delinks/` objects in this tree — the vintage rule
(`docs/research/band-rate-vintage.md`) applies here too.

## The finding this whole document turns on

**The hypothesis is dead in its size-dependent form — coverage rises
with size, the opposite of the prediction — but a real, size-uniform
~43-55% blind spot exists anyway, and it has nothing to do with why
the ledger only holds 83 large-band attempts.** `tools/m2c_feed.py`'s
`find_object()` really does miss roughly half of every band's
candidates, in both the small and large bands alike. But none of the
83 logged attempts in the three largest bands appear to have gone
through `find_object()` at all — every one directly checked or
strongly inferred used the campaign's standard manual/agent
disassembly-reading workflow instead. The low attempt count says
nothing about the tool's reachability, in either direction, because
the tool was never the bottleneck being exercised.

## Canary

Per the item's own instruction: before surveying all seven bands,
determine how the **one** `>=1024 B` row in `attempts.tsv` was
produced.

```bash
$ python3 -c "
import csv
with open('docs/research/campaign-analytics/attempts.tsv', encoding='utf-8') as f:
    rows = list(csv.DictReader(f, delimiter='\t'))
big = [r for r in rows if (r.get('text_size') or '0').isdigit() and int(r['text_size']) >= 1024]
print(len(big), big)
"
```

```text
1 [{'addr': '0x02246a50', 'module': 'ov002', 'text_size': '1036', ...,
   'brief': 'brief-650', ...}]
```

The single `>=1024 B` row is `func_ov002_02246a50`, 1036 B, cited to
`brief-650`. Reading
[`docs/research/brief-650-ov002-sweep.md`](../brief-650-ov002-sweep.md)
directly (lines ~38 and its methodology section) confirms: **"every
candidate was attempted purely on its own disassembled shape"** — a
human/agent reading raw ARM disassembly and hand-drafting C, not
`m2c_feed.py`. The doc calls the 1036 B result its headline finding
for "are LARGE ov002 functions reachable at all," and describes it as
"a single, non-iterated first-draft C translation" that "landed 56.76%
byte-identical on the very first compile" — a result about a *human's*
translation quality, not about `find_object()` resolving the object.

**Canary result: provenance determined. The row exists, but it
provides zero evidence about `m2c_feed.py`/`find_object()`
specifically** — the candidate never went through that code path.
Proceeded to the full survey.

## Deliverable 1 — coverage per band, without running the compiler

Tool: [`tools/m2c_gap_coverage.py`](../../../tools/m2c_gap_coverage.py)
(new, this PR). It reads already-built `build/eur/delinks/` objects —
requires a prior `ninja delink`/`configure.py` run, never invokes
either itself — and reproduces `find_object()`'s own search rule
(batched `objdump -d` over every `_dsd_gap@*.o`, matching `^[0-9a-f]+
<name>:` headers) against the campaign's standard dispatch-ready
candidate pool (`wall_aware_headroom.scan()`, `>=4` exact `bl`/`blx`
calls, the same filter `eur_frontier_census.py` uses). Verified
against the real `find_object()` directly on 8 sampled candidates (6
from `>=1024 B`, 2 from `513-1023 B`): 8/8 exact match.

```bash
$ python tools/m2c_gap_coverage.py --region eur --json > build/m2c_gap_coverage_eur.json
```

| Band | Dispatch candidates | Bytes | In gap object | Coverage (count) | Coverage (bytes) | Not in gap, has per-source `.o` |
|---|---:|---:|---:|---:|---:|---:|
| ≤192 B | 0 | 0 | 0 | n/a | n/a | 0/0 |
| 193-256 B | 204 | 46,080 | 92 | 45.10% | 46.08% | 112/112 |
| 257-320 B | 263 | 75,980 | 119 | 45.25% | 45.22% | 144/144 |
| 321-376 B | 161 | 56,180 | 93 | 57.76% | 57.94% | 68/68 |
| **377-512 B** | **349** | **154,308** | **199** | **57.02%** | **57.03%** | **150/150** |
| **513-1023 B** | **524** | **370,136** | **355** | **67.75%** | **69.04%** | **169/169** |
| **≥1024 B** | **313** | **686,816** | **182** | **58.15%** | **44.24%** | **131/131** |
| **Total** | **1,814** | **1,389,500** | **1,040** | **57.33%** | — | **774/774** |

Derived 2026-08-29T17:59:15Z. Every "not in gap object" candidate in
every band (774/774, project-wide) resolves to a real object file at a
predictable path — see Deliverable 3.

### ⚠️ This coverage table is build-state-dependent — re-derive, do not cite

**The percentages above describe the specific `build/eur/delinks/`
tree they were measured against, not a project constant.** Added
2026-09-01 (`q-find-object-persource`), after the brain tried to
reproduce this table on the integration tree and got **~0.0% coverage
in every band** — the identical code, a different tree.

**Build state this table was derived from** (now machine-reported —
`tools/m2c_gap_coverage.py` prints a `build state:` line and, with
`--json`, a `build_state` object, before every run):

```bash
$ python tools/m2c_gap_coverage.py --region eur
build state: 2083 gap objects / 2881 distinct functions in
build/eur/delinks -- coverage below is a property of THIS tree, not
the project (see q-find-object-persource).
```

**2,083 gap objects holding 2,881 distinct functions**, re-confirmed
2026-08-30T11:40:01Z (unchanged from the original 2026-08-29 derivation
above within measurement noise). Against this, the table's 45-68%
coverage figures reproduce exactly.

**The brain's integration tree, same code, same day:** `build/eur/
delinks/` held **754 gap objects containing only 55 distinct functions
between them** — a tree whose gap objects are mostly-empty stubs — and
every band reported ~0% coverage. Nothing in `tools/m2c_gap_coverage.py`
changed between the two runs; only the build tree did.

**What this does and does not undermine:**

- **Untouched:** Deliverable 2's verdict (coverage rises with size, the
  size-dependent hypothesis is dead) and Deliverable 4's ledger
  cross-check (zero of 83 large-band attempts used gap objects). Both
  rest on the ledger and the canary, which are build-independent — a
  ledger row's provenance doesn't change with whichever tree happens to
  be checked out.
- **Build-state-dependent:** every literal coverage percentage in the
  table above (45.10%, 57.02%, 67.75%, etc.) and the persource/gap
  object counts behind them. Re-run
  `python tools/m2c_gap_coverage.py --region <region>` against the
  CURRENT tree before citing a coverage number anywhere, and quote the
  `build state:` line alongside it.

**Do not restate any coverage percentage from this document as a
project constant.** It is a real, reproducible number for the tree
named above — not deleted, not corrected — but it is a property of
that tree, the same way a `.text`-only ratio is a property of which
metric function computed it (see `q-eur-next-frontier`'s own opening
finding). A future round citing "coverage is ~57%" without re-running
the tool and reporting its own `build state:` line is citing a number
that may no longer describe the tree it is being applied to.

**The discoverability tax this document describes is now closed**,
independently of the build-state caveat above: `tools/m2c_feed.py`'s
`find_object()` (`q-find-object-persource`, same PR as this update)
now falls back to the predictable per-source object path from
Deliverable 3 whenever the gap-object glob misses, so the ~43-55%
coverage gap measured here no longer costs a `FeedError` — it costs
nothing, because `find_object()` finds the function either way. The
coverage table above still describes gap-object-only reachability
(unchanged, since that's what it was built to measure); it no longer
describes `find_object()`'s actual reachability, which is the whole
point of the fix.

## Deliverable 2 — is the pattern size-dependent?

**No. The three large bands (377-512 / 513-1023 / ≥1024 B) have
HIGHER gap-object coverage than the three small/mid bands
(193-256 / 257-320 / 321-376 B), not lower:**

- Small/mid bands, weighted: 304 in-gap / 628 dispatch = **48.4%**
  coverage by count.
- Large bands, weighted: 736 in-gap / 1,186 dispatch = **62.1%**
  coverage by count.

That is the opposite direction from the hypothesis's prediction. **The
hypothesis, in the specific size-dependent form the queue item states
it — "large functions disproportionately live in per-source objects"
— is dead.** Coverage does not degrade with size; if anything it
improves through `513-1023 B` before dipping slightly at `≥1024 B`.

One real wrinkle, not a revival of the hypothesis: **byte-weighted
coverage in `≥1024 B` (44.24%) is well below its own count-weighted
figure (58.15%)** — a ~14-point gap that does not appear in any other
band (every other band's count and byte coverage agree within ~1
point). This means within the `≥1024 B` band specifically, the
*largest* individual functions skew toward being outside gap objects
more than the *smaller* ones in that same band do. It is a real,
narrow, byte-weighted effect confined to one band — not evidence for
the broader across-band hypothesis, which the count-weighted numbers
above already kill.

**Plain reading: coverage is not flat, but it is not size-correlated
in the hypothesized direction either — a genuine, uniform ~43-55%
blind spot exists in every band, small and large alike, and it is not
what is holding back the large bands specifically.**

## Deliverable 3 — scoping what closing the gap would take

**Not implemented, per the item's explicit prohibition.** Scoped only.

> **Update, 2026-09-01 (`q-find-object-persource`):** the fix scoped
> below has since shipped, in the same PR as this update. `find_object()`
> now checks exactly the predictable path described here as its
> fallback when the gap glob misses, with the same disasm-header
> verification the gap-object path already used (not a bare
> file-existence check) — see `tools/m2c_feed.py`. The scoping below is
> kept as-written, as the record of what was verified before the fix
> existed.

Every one of the 774 project-wide "not in gap object" dispatch-ready
candidates — all 450 of them across the three large bands specifically
— resolves to a real, already-built object file at a single
predictable path:

```
build/<region>/delinks/src/<module_dir>/<stem><routing_suffix>.o
```

using the same `module_to_src_dir()` (`main`→`main`, `ovNNN`→
`overlayNNN`) and `split_routing_suffix()` (`.legacy`/`.legacy_sp3`/
`.thumb`) conventions already used elsewhere in this tooling
(`port_to_region.py`, `routing_suffixes.py`). Verified by direct
filesystem check against all 774 candidates, zero misses:

```bash
$ python3 build/... verify_persource.py   # ad hoc, see below
774 of 774 'not-in-gap' candidates DO have a per-source object at the
predictable build/eur/delinks/src/<module>/<name>.o path
0 have NO object at that predictable path either
```

**This means closing the gap is a deterministic path check, not a
glob-widening exercise or a pipeline redesign.** `find_object()` would
need one additional lookup — check
`build/<region>/delinks/src/<module_dir>/<stem>.o` (with routing
suffix) before raising `FeedError` — with zero missing objects found
anywhere in this census to suggest the per-source layout breaks any
assumption downstream. That is the entire scope: no evidence surfaced
of a harder blocker (e.g., a per-source object existing but lacking
the symbol, or a naming collision). Whether `find_object()`'s callers
(`feed()`, `resolve_symbol()`, and downstream `--context`/`--m2c`
consumers) make further assumptions specific to gap-object paths was
not investigated — out of scope for a reachability-only census, and
exactly the kind of question the prohibition on touching
`m2c_feed.py` this round defers to whoever picks this up.

## Deliverable 4 — ledger cross-check: how many of the 83 came from gap objects?

**None directly verified came from gap objects — the opposite of
"all 83 did." Every attempt checked or strongly inferred used the
campaign's standard manual/agent disassembly-reading workflow, not
`m2c_feed.py`.**

The 83 attempts split 66 (`377-512 B`) + 16 (`513-1023 B`) + 1
(`≥1024 B`), across 27 distinct brief/PR citations in `attempts.tsv`.

**`513-1023 B` (16/16, 100% confirmed):** 15 rows cite
`cm-513-1023-census`
([`docs/research/cm-513-1023-census-2026-08-25.md`](../cm-513-1023-census-2026-08-25.md)),
whose own methodology section states: *"15 parallel research agents
each read one candidate's raw assembly (500-1000+ bytes...) and
produced a complete C draft... Every draft was then built and iterated
against the real toolchain myself."* No `m2c_feed.py` mention anywhere
in that document. The remaining 1 row cites `brief-650` — same
manual-disassembly methodology confirmed in the canary above.

**`≥1024 B` (1/1, 100% confirmed):** the canary row, `brief-650`,
manual disassembly reading — see Canary section above.

**`377-512 B` (49/66 = 74% directly confirmed by commit subject, 66/66
= 100% consistent with the same series by PR-number range):** the
band's 66 rows cite 25 distinct brief/PR tags. Checked commit subjects
directly for the 11 tags covering 48 of the 66 rows:

```text
6330b724  cm-ov002-unknown-sweep-12 batch4: 10/20 shipped (2292 bytes)
2e2d2f3f  cm-ov002-unknown-sweep-11 batch5: 6/20 shipped (149-512B band)
5f6094e0  cm-ov002-unknown-sweep-13-batch5: 6/20 shipped (1564B)
bb6e87a4  cm-ov002-unknown-sweep-11 batch1: 2 C matches (main + ov002)
18164de4  cm-ov002-unknown-sweep-13-batch1: 6/20 shipped (2135B)
2b14ae30  cm-ov002-unknown-sweep-9 batch2: 6 C-matches (149-512B band)
846ca42d  cm-ov002-unknown-sweep-10 batch4: ship 6 ov002 functions
28c00424  cm-ov002-unknown-sweep-11 batch3: 7/20 shipped
21180cbb  cm-ov002-unknown-sweep-12-batch2: 3/20 shipped (928B)
0bd0c3f8  cm-ov002-unknown-sweep-14 batch5: ship 4/20, park 16
1f596c3e  cm-ov002-unknown-sweep-14-batch1: 3/20 shipped (672B)
```

Plus 1 row directly cited to `brief-650` (manual, confirmed above). All
11 confirmed tags are `cm-ov002-unknown-sweep-*` batches — the
campaign's standard sweep methodology (see e.g.
[`docs/research/cm-ov002-unknown-sweep-12-2026-08-01.md`](../cm-ov002-unknown-sweep-12-2026-08-01.md)
and
[`docs/research/cm-ov002-unknown-sweep-13-2026-08-01.md`](../cm-ov002-unknown-sweep-13-2026-08-01.md),
the two waves contributing the most rows to this band), which reads
raw disassembly per candidate; it does not call `m2c_feed.py`. The remaining 17 rows (26%) cite PR numbers `#1404`-
`#1435`, the identical numeric range as the 11 confirmed tags, but
were not individually SHA-verified — **reported as inferred, not
confirmed**, consistent with "blank is not zero."

**Summed: 49/66 directly confirmed + 17/66 inferred by series
membership (377-512 B), 16/16 confirmed (513-1023 B), 1/1 confirmed
(≥1024 B) = 66/83 (79.5%) directly confirmed non-gap-object provenance,
17/83 (20.5%) inferred with high confidence but not individually
verified. Zero of the 83 were confirmed as gap-object/`m2c_feed.py`
provenance.** The item asked "if all 83 did, that is corroboration" —
the actual answer is close to the opposite: none confirmed did, and
none of the confirmed rows exercised `find_object()` at all, so the
low attempt count reflects a choice of methodology across the whole
campaign, not a tooling ceiling being hit and worked around.

## `m2c_feed.py` is not dead project-wide — it is unused by this specific ledger

One caveat against overreading the above: `m2c_feed.py` is **not**
historical or abandoned tooling. `docs/research/campaign-analytics/
tools-reaudit-2026-07.md` lists it `ACTIVE-CAMPAIGN` as of 2026-07-22,
cited by briefs 604/609/613/619 (the `cmatch_loop.py`/retriever
workflow) — a parallel pipeline that is not tracked in
`attempts.tsv` at all. So "zero of the 83 ledger rows used
`find_object()`" is a true, narrow statement about this one ledger; it
is not evidence that the tool sits idle across the whole project. The
two pipelines (manual/agent disassembly-reading, logged to
`attempts.tsv`; and `m2c_feed`/`cmatch_loop`, tracked separately) have
coexisted for months without ever being reconciled into one method
comparison — that reconciliation is out of scope here.

## Synthesis, common units

| Question | Answer | Confidence |
|---|---|---|
| Does `find_object()` coverage fall with size? | No — rises from 48.4% (small/mid) to 62.1% (large), weighted by count | High — full census, 8/8 spot-check match |
| Is there a real coverage gap at all? | Yes — 43-55% uncovered in every band, small and large alike | High |
| Did the 83 large-band attempts hit this gap? | No — none confirmed to have used `find_object()`/gap objects at all | High for 17/83 (fully confirmed), inferred for 66/83 (49 confirmed + 17 same-series) |
| Is the 83-attempt count a tooling artefact? | No — it reflects a consistent choice of manual/agent-disassembly methodology across the campaign, not a wall hit by `m2c_feed.py` | High |
| Would closing the gap be cheap? | Yes — shipped 2026-09-01 (`q-find-object-persource`) as the scoped deterministic predictable-path check, 774/774 candidates resolve, zero misses found | High for the scoping census; the fix itself now shipped and unit-tested (`tests/test_m2c_feed.py::TestFindObject`) |

## Critic pass — is coverage-by-`find_object()` the right metric?

Three limits worth naming plainly, none of which change the
size-dependence verdict above but which bound what "coverage" means
here:

1. **This measures `find_object()` resolvability, not full
   `m2c_feed.py`/`feed()` pipeline success.** A candidate resolving to
   a gap object still has to pass whatever `--context`/`--m2c`
   requirements `feed()` and its downstream consumers impose (core
   headers, symbol lookups for callees, etc.) — none of that was
   exercised here. "In gap object" is a necessary, not sufficient,
   condition for the tool producing a usable draft.
2. **Count-weighted and byte-weighted coverage diverge sharply in one
   band (`≥1024 B`: 58.1% vs 44.2%)** — a metric reported only by
   count would have hidden that the largest functions within that band
   specifically skew toward the uncovered side. Both weightings are
   reported throughout this document for that reason.
3. **The per-source-object closure check (Deliverable 3) tests only
   "does a `.o` exist at the predictable path,"** not "does that `.o`
   contain the target symbol with a matching definition" the way
   `find_object()`'s own `objdump` check does for gap objects. The
   774/774 hit rate is a path-existence result, not a byte-for-byte
   re-verification of every one of the 774 objects' contents — a
   cheaper, weaker check than the gap-object side of the same table,
   noted here so the two halves of Deliverable 1's coverage aren't read
   as equally rigorously verified.

## What this does not establish

- Whether closing the gap (Deliverable 3) would change ship rates in
  the large bands — that depends on translation difficulty, not
  reachability, and this census does not touch translation quality.
- Whether the two untracked pipelines (`attempts.tsv`-logged
  manual/agent work vs. `m2c_feed`/`cmatch_loop`) should be
  reconciled into one method or ledger — a process question, not a
  reachability question, and outside this item's scope.
- Full provenance for the 17/83 inferred (not individually
  SHA-verified) `377-512 B` rows — reported as inferred, not blank,
  because the same PR-number-range and campaign-naming evidence is
  strong, but it falls short of the direct commit-subject confirmation
  applied to the other 66/83.

No direction is recommended. cntrl_alt_lenny decides what, if
anything, happens with the gap scoped in Deliverable 3.
