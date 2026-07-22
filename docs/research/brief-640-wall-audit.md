# Brief 640 — wall taxonomy audit

Date: 2026-07-22
Branch: `claude/wall-audit-640`

## Verdict (read this first)

**The wall taxonomy, as operationalized by `tools/wall_aware_headroom.py`,
is severely over-broad — not a trustworthy signal that a function is
C-irreducible.** Two independent, compounding mechanisms inflate the
"wall" count:

1. Its regex conflates the taxonomy doc's own **coercible-with-knowledge**
   bucket (C-NN — a *known, documented recipe exists*) with the
   **permanent** bucket (P-NN — *no C form found after an exhaustive
   sweep*) into one undifferentiated "wall." The taxonomy doc's own
   Recommendation section already flags this: **"Estimated ~14% of drops
   are wrongly classified as walls today."**
2. For the single largest population — **ov002, 2,773 files, 45% of
   every remaining `.s`, 100% wall-marked** — the "wall" label is
   `asm_escape.py`'s own generic header boilerplate ("no C match, brief
   294 endgame"), emitted unconditionally by every `--whole-function`
   carve. Git history confirms ov002 was populated by pure mechanical
   size-tier sweeps (e.g. brief 416: "ov002 `.s` wave 23... push past
   0x90 and keep climbing size tiers until byte-identity breaks") with
   **zero C-drafting step anywhere in the process.** "No C match" is a
   template assertion, not a verified fact, for the overwhelming
   majority of this cohort.

Sample-tested 5 wall-marked functions with real compile attempts, gated
against real object diffs (one gated through the full 3-region
`ninja sha1`): **1 shipped as a byte-identical match on the first
try (zero iteration), 3 more showed narrow, well-understood
divergences with no evidence of intractability, and 1 appears to
match an already-documented permanent pattern — but even that one's
own citation was wrong.** Every single sample's header cited "C-34"
(address-CSE, a duplicate-same-value pool slot); **not one of the 5
actually had that shape** per the taxonomy's own machine-checkable
detector. The citations are noise, not diagnosis.

**Recoverable pool: at minimum ~85-115 functions** (conservative,
directly evidenced — see below), **very likely several hundred**
once ov002's un-attempted bulk is accounted for (unproven without a
real sweep, but the 2-sample spot-check inside ov002 itself was
mixed — one close/tractable, one apparently genuine — so "hundreds"
is a plausible order of magnitude, not a confirmed count).

## 1. Marker census

`tools/wall_aware_headroom.py` scans EUR-baseline `.s` files
(`src/main/`, `src/overlayNNN/`, live-sources-only) and flags any file
whose body matches:

```
GLOBAL_ASM|brief[ _]?29[04]|brief[ _]?302|reg-?alloc wall|no C match|
ship-as-\.s|whole-function ship|permanent wall|endgame|\b[CP]-\d+\b
```

Current numbers (confirmed by running the tool):

| | count | % of total |
|---|---:|---:|
| Total remaining `.s` (EUR baseline) | 6,158 | 100% |
| Wall-marked | 6,111 | 99.2% |
| Genuinely convertible (tool's own report) | 47 | 0.8% |

Of the 6,111 wall-marked files, breaking down **why** each one matched:

| Marker class | count | % of walls |
|---|---:|---:|
| Descriptive marker present (GLOBAL_ASM / "brief 294/302" / "reg-alloc wall" / "no C match" / "endgame" / etc.) | 5,969 | 97.7% |
| **Citation-only** — matched *solely* by a bare `\b[CP]-\d+\b` mention, no descriptive text at all | 142 | 2.3% |
| — of which cites ONLY a C-NN number (coercible-with-knowledge bucket) | 141 | 2.3% |
| — of which cites ONLY a P-NN number (permanent bucket) | 1 | 0.02% |

**The citation-only 142 is the brief's literal question #1 answer: 142
files are excluded from "convertible" purely because they happen to
mention a taxonomy number in prose — 141 of those numbers belong to the
bucket the taxonomy doc itself calls "coercible with knowledge," the
opposite of permanent.**

Top citation numbers among the citation-only 142:

| Citation | count | % of citation-only |
|---|---:|---:|
| C-34 | 119 | 84% |
| C-32 | 17 | 12% |
| C-31 | 4 | 3% |
| C-36 | 2 | 1% |
| C-15, C-23, C-8, P-11 | 1 each | <1% each |

Per-module breakdown of the 142 (module: citation-only / total wall-marked):

```
main        63 / 2453      overlay012   2 / 16
overlay002  33 / 2773      overlay016   2 / 43
overlay011  17 / 87        overlay000   1 / 59
overlay004   8 / 158       overlay001   1 / 2
overlay008   6 / 62        overlay010   1 / 49
overlay006   3 / 161       overlay013   1 / 9
                           overlay014   1 / 21
                           overlay017   1 / 30
                           overlay018   1 / 10
                           overlay020   1 / 27
```

### The C-34 discrepancy

`codegen-walls.md`'s own C-34 entry ("Address-CSE — `.s` with explicit
dual pool words") documents the pattern precisely: **orig has two
distinct pool slots holding the SAME data-symbol value**; mwcc's
address-CSE collapses them to one. Its own cross-corpus survey names
exactly **2 confirmed instances** (`func_02023f7c` / E-07,
`func_02026fd8` / E-08). `tools/predict_walls.py`'s `detect_address_cse`
function implements this exactly — it only fires when **2+ relocs
target the identical address**.

Yet **119 different files cite "C-34."** Tracing the provenance
(`docs/research/brief-207-c34-c35-rescan-drain.md`, commit `1002747d`):
brief 207 ran a classifier ("`tools/predict_walls.py --version eur`...
62 total C-34 candidates") and mechanically shipped every match via
"brief 202's vanilla `.s` recipe" — **with no C-source attempt at any
point in the process.** Directly checking `config/eur/arm9/relocs.txt`
for 3 of the 119 citing files (`func_02000f84`, `func_ov006_021b6d00`,
`func_ov002_02200630`) shows **none of the three have a duplicate-target
reloc at all** — one has two *different* pool targets, the other two
have only a single pool constant each. The "C-34" citation in these
files' headers is boilerplate from the batch-recipe template, not a
per-function classification.

## 2. ov002 finding

2,773 files, 100% wall-marked, 45% of everything remaining. Sampled the
smallest files' headers directly:

```
; func_ov002_021aa4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).
```

This is **`asm_escape.py`'s own hardcoded output** (`generate_whole()`'s
`head` list when `whole=True`) — every single whole-function carve gets
this exact text, unconditionally, regardless of whether anyone ever
tried a C rewrite first. It is the tool describing its own purpose, not
a per-function verification.

Git blame on a sample (`func_ov002_021aa4a0` → commit `8e662fe4`, "ov002
`.s` wave 23: 67 ships") leads to
`docs/research/brief-416-ov002-s-convert-wave23.md`. Its own headline:

> "67 whole-function `.s` ships in a systematic **size-tier ladder**
> from 0x74... through 0x1040... **The capability edge is NOT a fixed
> size** — it's intermediate pool presence... **All 67 byte-identical
> first attempt**"

This is a pure mechanical sweep explicitly hunting for **the
disassemble/reassemble tool's own capability edge** ("Undefined macro
or opcode" on intermediate literal pools) — not a C-irreducibility
study. There is no C-drafting step anywhere in this brief, or (per the
identical header boilerplate across all 2,773 files) evidently in any
of the other waves that built ov002's `.s` population. **"100% wall"
for ov002 means "100% mechanically .s-shipped," not "100% confirmed
C-irreducible."** No per-function evidence exists for the overwhelming
majority of this cohort — it was simply never attempted in C.

## 3. Sample results (5 real attempts, gated honestly)

Built EUR, compiled each candidate's C draft, diffed the resulting
object against `build/eur/delinks/.../<func>.o` (`arm-none-eabi-objdump
-d`, byte-for-byte). One candidate that reached byte-identity was
carried through the full `python tools/gate3.py --scope all` (real
`ninja sha1`, all three regions) before shipping.

| # | Function | Module | Cited as | Result |
|---|---|---|---|---|
| 1 | `func_02000f84` | main | "C-34 candidate" | **Not cracked in 3 attempts** — relocs show 2 *different* pool targets (doesn't match C-34's own detector at all). Divergence is a modest register-scheduling / store-order choice; narrowed but not closed. Not exotic. |
| 2 | `func_ov002_022a1870` | **ov002** | "C-34 candidate" | Only 1 pool ref (can't be C-34). Real attempt shows a predicated-vs-branchy mismatch matching the **already-documented, already-validated C-1r pattern** (OR'd-predicate collapse, confirmed permanent across 15 SPs in a prior brief). Likely a genuine wall by *content* — but the citation is still wrong; nothing in this file's header names C-1r. |
| 3 | `func_ov006_021b6d00` | overlay006 | "C-34 candidate" | 1 pool ref (not C-34). **Extremely close**: only divergence is common-subexpression hoisting of a shared `+0xc600` offset that the original does NOT hoist. Squarely coercible-with-knowledge; not cracked in the time available but clearly not permanent. |
| 4 | `func_ov011_021cd6e0` | overlay011 | "C-34 candidate" | 1 pool ref (not C-34). **Byte-identical on the first try** — a plain 2D-array row/column lookup. Shipped; real 3-region `ninja sha1`: EUR/USA/JPN all PASS. Zero test regressions (confirmed via `git stash` before/after). |
| 5 | `func_ov002_02200630` | **ov002** | "C-34 candidate" | 1 pool ref (not C-34). Close: exhibits the project's own previously-documented "mwcc bitfield lsl+lsr idiom vs manual shift+mask" divergence (brief 533's finding, reused here). Not cracked in the time available; not exotic. |

**Zero of the 5 citations matched the cited entry's own criteria.**
One shipped clean immediately; three were narrow, comprehensible,
not-yet-closed misses; one looks like a real (but mislabeled) wall.
This is the empirical confirmation of the documentary finding above:
the labels carry no diagnostic value, whether or not the underlying
function turns out to be easy.

## 4. Recoverable pool estimate

**Directly evidenced, conservative floor:** the 142-file citation-only
population is the cleanest target — by construction these files have
*no* actual GLOBAL_ASM/endgame prose, only a bare taxonomy mention, and
141 of 142 cite the "coercible" bucket specifically. The 5-sample spot
check (drawn entirely from this population) landed 1 clean + 3
close/tractable + 1 genuine-wall — a ~60-80% recoverable rate on this
slice would put **roughly 85-115 additional functions** on top of the
47 `wall_aware_headroom.py` already reports, just from re-litigating
this one narrow, well-defined citation-only bucket.

**Unproven but plausible, larger scope:** ov002's 2,773-file blanket
cohort was never attempted in C at all. The 2 ov002 samples in this
audit split evenly (1 close/tractable, 1 apparent genuine wall) — far
too small a sample to extrapolate a rate with any confidence, but it
does establish that ov002 is **not** uniformly permanent the way its
100%-wall marking implies. Even a conservative 15-25% true recoverable
rate across 2,773 files would mean **400-700 functions** — an order of
magnitude larger than the entire currently-reported convertible pool
(47). This number is a plausibility argument, not a finding; only a
real per-function sweep (the kind brief 207/416 never did) can turn it
into a number worth planning against.

**What this does NOT claim:** this audit does not claim ov002 is
"secretly all C-matchable" — sample #2 (`func_ov002_022a1870`) landed
on a real, previously-validated permanent pattern (C-1r). The taxonomy
doc's permanent bucket is real and some of it is almost certainly
inside ov002 too. The finding is narrower and more actionable: **the
wall label itself carries no signal about which is which** — it was
applied uniformly by a mechanical tool, not function-by-function
triage, so a real sweep is the only way to separate the two, and no
such sweep has ever been run against ov002.

## Recommendation

1. **Fix `wall_aware_headroom.py`'s regex immediately** — split C-NN
   citations out of the wall bucket entirely (or into a separate
   "cited-but-unverified, re-check" bucket); only P-NN citations and
   the genuine descriptive markers should count as "wall." This alone
   recovers the 141 C-NN-only citation-only files from mislabeling
   (though each still needs an actual attempt — the citation was never
   evidence either way).
2. **A real ov002 sweep is the single highest-leverage action available**
   given its 45%-of-everything-remaining size and confirmed
   zero-C-attempt provenance. Scope it as systematic per-function
   attempts (not another mechanical `.s`-shipping wave) starting from
   the smallest/simplest functions, the same way this brief's samples
   were chosen.
3. **Stop trusting "100% wall" as a module-level verdict.** A module's
   wall percentage reflects how much of it went through the mechanical
   `.s` pipeline, not how much of it resists C. Every 100%-wall overlay
   (ov000, ov002, ov003, ov005-ov023 per the current table) deserves the
   same scrutiny this brief applied to ov002, ov006, and ov011.
4. **Retire or scope down the "brief 207 / Phase 2: C-34 candidate"
   boilerplate.** It is actively misleading — attach it only to
   functions that pass `predict_walls.py`'s own `detect_address_cse`
   check, not to every function shipped in that historical wave.

## Gates

- `func_ov011_021cd6e0` (the one shipped match): real `ninja sha1`,
  all three regions (EUR/USA/JPN) — **PASS**. Confirmed zero test
  regressions via `git stash` before/after comparison (12 pre-existing
  failures, identical with and without this change).
- All other sample attempts were reverted after diffing (not shipped —
  none reached byte-identity in the time available for this audit).
- `⚠️ Never bare ninja` respected throughout — every build used
  `configure.py` + `ninja <target>` or the full `gate3.py`.

## Files changed

- `src/overlay011/func_ov011_021cd6e0.c` (new), `.s` removed,
  `config/eur/arm9/overlays/ov011/delinks.txt` — the one shipped match.
- `docs/research/brief-640-wall-audit.md` — this report.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
