[//]: # (markdownlint-disable MD013 MD041)

# q-port-refusal-taxonomy — what the 365 USA port refusals actually block on

**Snapshot:** 2026-08-28T07:25Z, USA at `368` rows / `60,884` B `byte_sim==1.0`
backlog (post-#1584 drain), JPN at `653` rows / `99,388` B (mid-drain by the
other lane this round — see *JPN cross-check*, all JPN figures below are
provisional). Reproduce the census with `python tools/port_census.py`; every
count in this document is re-derived from that fresh run, per
[`band-rate-vintage.md`](../band-rate-vintage.md)'s standing rule — nothing
here is inherited from the pre-#1584 tree.

## Verdict

**Both hoped-for answers are half right.** The 365 refusals do **not**
cluster on a small number of recurring blocking *symbols* — 264 distinct
`(kind, module, addr)` blockers account for them, and the single most
common one blocks only 10 candidates. But they overwhelmingly cluster on
one blocking **mechanism**: 348 of 365 (95.3%) are blocked by at least one
callee/data reference that the fingerprint matcher can only place at
MEDIUM-or-below confidence (no relocations to disambiguate a same-size
sibling), and 203 of 365 (55.6%) are refused **solely** by exactly one such
reference. That mechanism is mostly not cheaply fixable without
reintroducing the wrong-sibling bug class this project has hit and fixed
repeatedly (briefs 673/676, `cm-crossregion-mop`) — see *Finding 1*.

Buried inside that diffuse majority, though, is a genuinely concentrated,
low-risk, previously-unscoped fix: **49 candidates (7,692 B, 13.4% of the
365) are refused *solely* by a callee that already carries an identical,
authoritative name in the target region's own `symbols.txt`** — the
resolver never checks for that exact-name ground truth before falling back
to ambiguous structural fingerprinting. See *Finding 2* — this is the
single highest-leverage item in this table by a wide margin. A further 38
candidates (6,156 B) would be partially helped by the same fix. Three
smaller genuinely-fixable classes (*Findings 3, 4 and 5*) account for a
further 10 sole-caused candidates (1,312 B combined).

Whether any of this is worth a lane is **not** this document's call
(per the item's own instruction) — this is a costed table, not a
recommendation.

## Method

1. `python tools/port_census.py` — refresh `build/port_backlog.json`
   (build-free; parses `config/**/symbols.txt` / `relocs.txt` and existing
   `src/` trees, no compiler invoked).
2. `python tools/port_refusal_taxonomy.py --target usa` — for every
   `byte_sim==1.0` backlog row, replicate `port_to_region.py main()`'s own
   `resolve_symbol()` / `FLOOR_RANK` / collision / needs-symbol sequence
   over **every** symbol reference in the EUR source, not just the ported
   function. This is the same computation the real (non-dry-run) tool
   performs before it ever writes a file — see the ⚠️ in the tool's own
   docstring and in the queue item: `--dry-run` **skips** the
   confidence-floor rejection branch entirely
   (`if failed and not args.dry_run:` in `port_to_region.py`), so a naive
   dry-run reports candidates as passing that a real run refuses. This
   tool never uses dry-run semantics; it calls the resolution machinery
   directly and never writes anything (verified — see *Canary* below).
3. `tools/port_refusal_taxonomy.py`'s `aggregate_blockers()` groups every
   refusal's blocking symbols by `(kind, module, addr)`, tracking both
   `sole` (this is the candidate's *only* blocker — a guaranteed unlock if
   fixed) and `total` (this blocker merely appears among others — an upper
   bound) candidate/byte counts.

### Canary

Before trusting the full 365, 5 refused candidates were hand-verified
against the **real, non-dry-run** tool
(`python tools/port_to_region.py <src> --target usa --confidence-floor HIGH
--json --output-path <scratch>` — `--output-path` redirects any would-be
write to a scratch file outside `src/`, so a false-negative prediction
could never actually port anything):

| Candidate | Predicted blocker(s) | Real tool's `failed` list | Match |
|---|---|---|---|
| `func_02004fcc` | `func_02001ef4` MEDIUM | identical | ✅ |
| `func_02006b30` | `func_020aadf8` MEDIUM, `func_02098388` MEDIUM | identical | ✅ |
| `func_02007f3c` | `func_020945f4` MEDIUM | identical | ✅ |
| `func_02008f08` | `func_02008c10` MEDIUM, `func_020945f4` LOW, `func_020aadf8` LOW | identical | ✅ |
| `func_0200a6e8` | `Copy32` NONE (placeholder-twin) | identical | ✅ |

5/5 agreed exactly (same blocking symbol, same confidence, same `notes`
text). Per the item's own instructions, this cleared the bar to proceed to
the full set without further ceremony.

## Top-level split

```text
python tools/port_refusal_taxonomy.py --target usa
```

| Status | Count | Bytes |
|---|---:|---:|
| `refused-floor` (this document's subject) | 365 | 60,556 |
| `needs-symbol` (SYNTHESIZED data symbol, needs a manual `symbols.txt` line) | 2 | — |
| `clear` (resolves fully; the harvest's 1 prefilter/fastmatch refusal — see *What's out of scope*) | 1 | — |
| **Total (`byte_sim==1.0` backlog)** | **368** | **60,884** |

This matches PR #1584's own reported split (283 ported + 365 refused + 2
needs-symbol + 1 prefilter = 651 candidates) exactly.

## Finding 1 — the dominant, diffuse, not-cheaply-fixable mechanism

348 of 365 candidates (95.3%) have at least one blocker whose `notes`
contains `size+ish match, no relocs to compare` — a callee or data
reference with **zero relocations of its own**, so the fingerprint
matcher's only signal is size. Brief 095's D2 v2 rule tries to rescue these
via neighbor-shift consensus (walk the 5 nearest HIGH-confidence siblings
in the same module, promote LOW→MEDIUM if the candidate's own EUR→target
shift matches theirs) — but **MEDIUM is the rule's own ceiling**, one tier
below the HIGH floor, by design, and a candidate whose shift does *not*
match the consensus stays at LOW (`func-low-anti-matched` /
`func-low-no-consensus`). 203 of 365 (55.6%, 33,816 B) are refused *solely*
by exactly one such blocker (201/33,648 B of those already capped at
MEDIUM; 2/168 B stuck anti-matched at LOW).

This is **not** concentrated on a handful of symbols: 264 distinct blockers
touch the 365 candidates, and 182 of those 264 touch only one candidate
each. The largest genuinely concentrated pair inside this bucket is
`OS_DisableIrq`/`OS_RestoreIrq` (NitroSDK's interrupt-mask enter/exit pair)
— every one of the 54 candidates that reference either one references
*both* (0 reference only one, confirming they're always used as a matched
pair), and 28 of those 54 (3,808 B) have no other blocker, so both symbols
resolving would unlock those 28 outright. But per *Finding 2*, both
`OS_DisableIrq` and `OS_RestoreIrq` already have an authoritative fix
available — they are not a case that needs new tooling.

**Fixability verdict: genuinely hard, not a quick win.** Lowering the
effective floor for referenced (non-ported-function) symbols to MEDIUM
would reintroduce exactly the class of bug this project has hit and fixed
multiple times: a wrong same-size sibling silently substituted for the
right one (brief 673's `func_0204c384` struct-offset bug, brief 676's
identical pattern, `cm-crossregion-mop`'s two porter bugs). The MEDIUM
ceiling is very likely intentional conservatism, not an oversight — see
`docs/research/brief-677-crossregion-ports.md` and its predecessors for
the incident history this guards against. This document does not
recommend touching it.

**Minor tool-quirk noted in passing, not acted on:** `resolve_symbol`'s D2
v2 promotion caches the neighbor-consensus shift under `(ref.module,
target_region)` — not `(ref.addr, ref.module, target_region)` — so within
one file, whichever LOW-confidence symbol is resolved *first* (source-scan
order) computes the consensus, and every *other* LOW symbol in the same
module reuses that same cached shift rather than its own neighbors' (this
is why the identical target symbol shows MEDIUM in one candidate file and
anti-matched LOW in another — confirmed directly: `func_020aadf8` is
MEDIUM when `func_02006b4c.c` resolves it first, LOW when
`func_02008f24.c`'s own first-resolved LOW symbol sets a different cached
shift). It does not change any outcome at the current HIGH floor (MEDIUM
either way still fails HIGH), so it is flagged here only as a documented
tool-behavior footnote, not a costed finding.

## Finding 2 — exact-name callees already sitting in the target's own symbols.txt (the headline item)

18 distinct blockers in the 365 carry a real EUR name (not a `func_<addr>`
/ `data_<addr>` placeholder) — these come from `extern` prototypes
resolved through EUR's own named-function table
(`port_to_region.py`'s `NAMED_EXTERN_RE`). **16 of those 18 already have an
exact-name match in USA's `config/usa/arm9/symbols.txt`**, at a size that
matches EUR's:

| Name | EUR addr/size | USA addr (exact-name match) | USA size |
|---|---|---|---|
| `OS_DisableIrq` | `0x020937a4` / `0x14` | `0x020936bc` | `0x14` |
| `OS_RestoreIrq` | `0x020937b8` / `0x18` | `0x020936d0` | `0x18` |
| `Copy32` | — | `0x020943e0` | — |
| `Fill32` | — | `0x020943cc` | — |
| `IsValue12D3Or147E` | — | `0x02031740` | — |
| `DC_WaitWriteBufferEmpty` | — | `0x02092840` | — |
| `MI_SwapWord` | — | `0x020946d4` | — |
| `MTX_Copy44To43_` | — | `0x0208b864` | — |
| `OS_SetDPermissionsForProtectionRegion` | — | `0x02092d84` | — |
| `OS_SetProtectionRegion1` | — | `0x02092d98` | — |
| `OS_SetProtectionRegion2` | — | `0x02092da0` | — |
| `OSi_EnqueueTail` | — | `0x02092580` | — |
| `OSi_InsertLinkToQueue` | — | `0x020920f4` | — |
| `OSi_RemoveMutexLinkFromQueue` | — | `0x0209203c` | — |
| `Strchr` | — | `0x020aaf94` | — |
| `WaitByLoop` | — | `0x02000442` | — |

(sizes omitted where not individually spot-checked; `OS_DisableIrq`/
`OS_RestoreIrq` verified exactly as the concrete example.) The remaining 2
— `Vram_GetBankBaseE`, `Vram_GetBankBaseCD` — are exactly the ones
`resolve_symbol` already correctly flags as `placeholder-twin` (their
target twin genuinely has no name yet); those belong to *Finding 3*, not
here.

For all 16, `resolve_symbol`'s func branch never checks USA's symbols.txt
for this exact-name match — it goes straight to `find_siblings_fn`'s
purely structural fingerprint search, which (for these tiny,
no-relocation SDK primitives) tops out at MEDIUM or anti-matches to LOW,
even when — as independently confirmed for `OS_DisableIrq`/`OS_RestoreIrq`
— **the structural matcher's own top candidate is already the exact same
address the symbols.txt name match would give** (EUR `0x020937a4` shifted
`-0xe8` lands exactly on USA's named `0x020936bc`). The structural search
is re-deriving, at reduced confidence, a fact that is already committed
and authoritative.

**Impact if a "check target symbols.txt for this exact name first"
priority tier were added** (ahead of structural fingerprinting, the same
way `EXACT_ADDR` already short-circuits data-symbol lookups):

| | Candidates | Bytes |
|---|---:|---:|
| Fully unlocked (every blocker on the candidate is one of these 16 names) | **49** | **7,692** |
| Partially helped (some, not all, blockers are these names) | 38 | 6,156 |
| **Combined touch** | **87 (23.8% of the 365)** | **13,848** |

This is by far the most concentrated, lowest-risk finding in this table:
the ground truth is a **committed, already-reviewed symbols.txt entry**,
not a heuristic guess — there is no new wrong-sibling risk class here, only
a lookup the resolver currently skips. **Not the same class as
`q-port-residual-fix` (#1462)**, which fixed a JSON/lookup crash for
*semantically-named EUR source filenames* and a naming-collision residue —
this is a gap in the *referenced-callee* resolution path specifically, and
appears to be previously unscoped by either `q-port-residual-fix` or
`q-port-highconf-no-target`.

## Finding 3 — placeholder-twin (same class `q-port-residual-fix` already fixed once)

10 touches / 8 distinct candidates carry the `resolve_symbol`-native
`"...has placeholder target twin ...; propagate the rename before
porting"` message — an EUR-named function whose target-region twin is
still an address-keyed `func_*` placeholder. 5 candidates (836 B) are
blocked *solely* by this:

| EUR name | Target placeholder | Candidates blocked (sole/total) |
|---|---|---|
| `Copy32` | `func_020943f8` | 5 / 8 |
| `Vram_GetBankBaseE` | `func_0208de04` | 0 / 2 |
| `Vram_GetBankBaseCD` | `func_0208de58` | 0 / 1 (co-occurs with `Vram_GetBankBaseE` on `func_ov010_021b2a08`) |

This is the **same mechanism** `q-port-residual-fix` (#1462) already fixed
once via rename propagation — it is a fresh recurrence after the tree
moved (283 rows shipped since), not a new class. The mechanical fix (per
that PR's own precedent) is propagating the EUR name to the target's
`symbols.txt` for these 3 addresses.

## Finding 4 — comment-parsing false positives (new tool bug, same class as `check_match_invariants.py`'s known fix)

Of the 10 `"no EUR symbol at <module>/<addr>"` touches, direct inspection
of each blocking candidate's EUR source (comment-stripped vs. raw regex
match) splits them:

| Sub-class | Touches | Sole candidates / bytes |
|---|---:|---:|
| Comment-artifact (see below) | 7 | 3 / 216 |
| Genuine ITCM cross-module gap (see *Finding 5*) | 3 | 2 / 260 |

`parse_symbols_in_source`'s `SYMBOL_RE` scans the **raw** source text,
including comments, before resolving. In 3 EUR files, a doc-comment
abbreviates an overlay function's name by dropping its `_ovNNN_` prefix as
shorthand prose (e.g. `src/overlay002/func_ov002_02295b08.legacy_sp3.c`'s
header comment writes `bl func_02259f74(b0)` describing the disassembly,
while the real code correctly calls the fully-qualified
`func_ov002_02259f74`). The bare mention gets parsed as a *separate*,
phantom `main`-module reference, which then fails to resolve (`no EUR
symbol at main/0x02259f74`) since the real function lives in `ov002`. A
second file (`func_02026fd8.c`) has a "see also" comment naming two other
*files* (`func_0202a1ec.c`, `func_02023f98.c`) by their bare stem, with the
identical false-positive effect.

This is the **exact same bug class** already found and fixed once in this
codebase — `q-invariants-green`'s item (b): `check_match_invariants.py`
"is not stripping comments before scanning for extern declarations." The
fix there does not directly apply here (different tool, different regex),
but the mechanism and the fix shape (strip comments before scanning) are
identical.

## Finding 5 — ITCM cross-module gap (real, not currently modeled)

3 touches (`func_01ff8180`, `func_01ff8624`, `func_01ff8770`) are real EUR
functions — confirmed present in `config/eur/arm9/itcm/symbols.txt`, not
comment artifacts — but `find_region_siblings.load_region()` only builds
`"main"` and `overlays/*` module entries; it never loads `itcm` at all
(`config/<region>/arm9/itcm/{symbols,relocs,delinks}.txt` exist for EUR,
USA, **and** JPN — the raw data is committed for all three regions, this
is purely a `load_region()` coverage gap, not a missing-data problem).
Since a bare `func_<addr>` reference is also unconditionally assigned
`module="main"` by `parse_symbols_in_source` regardless of the address's
real range, even fixing the module-inference half alone would not resolve
these without also teaching `load_region()` about `itcm`. 2 candidates
(260 B) are blocked solely by this.

## Finding 6 — the small remainder

- **`func-no-candidate-at-all`** (2 sole / 528 B): `find_siblings` returns
  zero size-matching candidates at all in `usa/ov006` and `usa/ov011` for
  these two EUR addresses — a stronger gap than
  `q-port-highconf-no-target`'s class (a HIGH sibling *exists* but lacks a
  per-function delink/TU); here no candidate of any confidence exists.
  Cross-checked directly against that item's 124-row worklist
  (`docs/research/campaign-analytics/port-highconf-no-target.md`) — neither
  `ov006/0x021ba364` nor `ov011/0x021d191c` appears there, so this is a
  distinct, previously-unscoped pair. Needs the target overlay's own
  independent C-match/naming progress first; not a `port_to_region.py`
  fix.
- **`data-unresolved-other`** (3 sole / 216 B): a data address with no
  parallel-reloc map entry, no exact-address match, and no D3 shift
  consensus. Needs deeper per-symbol investigation; likely the same
  "target hasn't independently named this data address yet" prerequisite
  as Finding 6's function case.
- **`other/MEDIUM`** (0 sole; 2 touches, always co-occurring): notes read
  `reloc bag Jaccard 1.00 | byte-sim=0.998` — a callee whose relocation
  *shape* matches perfectly but whose compiled bytes are 99.8% (not 100%)
  identical. This is very likely the already-documented region-specific
  struct-offset class (briefs 673/676) recurring on a referenced callee
  rather than the ported function itself; too small (0 sole bytes) to
  independently confirm here.

## What's out of scope for this document

The 1 `clear` USA candidate (resolves fully under this static replication)
is, by elimination, the harvest's reported "1 prefilter refusal" —
`fastmatch.py`'s resolved one-object compile check, which requires
compiling. That check cannot be reproduced build-free; identifying
*which* candidate it is and *why* fastmatch rejected it is left
unanswered here, honestly, rather than guessed.

Separately, `campaign-analytics/port-residual-recover.md` documents an
earlier, unrelated residual track — *compile-time* errors (macro-name
mismatches, missing linker aliases) surfacing only after a candidate has
already **passed** `port_to_region.py`'s confidence-floor check and gone
to the compiler. Every refusal in this document is upstream of that stage
— it never reaches a compiler at all — so the two tracks do not overlap.

## JPN cross-check (provisional — snapshot 2026-08-28T07:25Z, mid-drain)

The other lane is draining JPN's port backlog this round, so the numbers
below describe a **moving target**, not a stable state — re-derive before
acting on them. `python tools/port_refusal_taxonomy.py --target jpn`
against the same-moment census: `367` refused-floor / `2` needs-symbol /
`284` clear (out of `653` `byte_sim==1.0` rows — the large `clear` count is
consistent with an active drain still working through an unattempted
pool, not a structural difference from USA).

The refused-floor set itself, however, is a strong independent
confirmation of *this document's* findings, not a different picture: 266
distinct blockers (vs. USA's 264), **all 264 of USA's blockers also appear
in JPN's set** (0 USA-only), and the top 15 ranked blockers are byte-for-byte
identical between the two regions. The exact-name-lookup impact
(*Finding 2*) reproduces almost exactly: 50 candidates / 8,120 B fully
unlocked, 38 partially helped — both within 1-2 candidates of USA's 49/38.
This is expected: the blocking mechanism operates on EUR-side source
structure and target-region symbols.txt naming, both of which are
near-identical in shape across USA and JPN for shared main-module code.

## Reproducing every figure in this document

```bash
python tools/port_census.py                          # refresh build/port_backlog.json
python tools/port_refusal_taxonomy.py --target usa    # writes build/port_refusal_{taxonomy,blockers}_usa.json
python tools/port_refusal_taxonomy.py --target jpn    # same, jpn (provisional this round)
```

`build/port_refusal_blockers_usa.json` carries the full 264-row ranked
table (this document's tables above show the top entries only); it is not
committed (gitignored `build/` output, like `port_backlog.json`) —
regenerate it with the commands above.
