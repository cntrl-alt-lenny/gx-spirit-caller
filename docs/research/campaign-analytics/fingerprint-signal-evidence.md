[//]: # (markdownlint-disable MD013 MD041)

# q-fingerprint-promotion-evidence — measuring whether the 95.3% MEDIUM wall is real

**Snapshot:** 2026-08-28T10:09:37Z (USA live-refusal population; see *Live
refusal coverage* — this slice moves under the other lane's
`cm-port-exact-name-unlock` work and is explicitly provisional). The
labelled sets (known-correct, known-wrong) are built from already-committed
history and are stable. Reproduce every number below with:

```bash
python tools/port_census.py                                  # optional, only needed for --live-refusals
python tools/fingerprint_signal_evidence.py --live-refusals usa
python tools/fingerprint_signal_evidence.py --hard-max-relocs 0 --out-dir build/relocs0
```

## Verdict

`q-port-refusal-taxonomy` (#1586) judged the 95.3% MEDIUM-capped refusal
mechanism "very likely intentional conservatism... not recommended for a
fix" — honestly reasoned, but a judgement, not a measurement. This is the
measurement, and it says the judgement was **half right**:

- **The existing fingerprint (size + reloc signature) really cannot safely
  reach HIGH on its own for this population** — confirmed, not just
  asserted: `call_graph` and `exact_name`, the two signals that use
  genuinely independent evidence, cover only 18.1% and 1.1% of the hard
  population respectively. There is no hidden abundance of untapped
  fingerprint evidence.
- **But a signal exists that the tool doesn't use, and it is not
  marginal.** `verified_neighbor` — the existing D2 v2 idea, rebuilt on
  *proven* neighbor mappings (from 7,774 already ROM-gate-verified ports)
  instead of `find_siblings`' own unverified guess for each neighbor —
  covers **98.7% of the hard population (2,960/2,998) at 100% accuracy
  (2,960/2,960)**, and independently predicts the historically-documented
  correct answer on **all 4 known-wrong test rows (2 incidents × 2
  regions)**, reproducing by measurement what briefs 673/675 did by hand.
  Applied to the CURRENT live USA refusal population, it would return a
  confident prediction for 247 of 258 distinct blocking functions
  (95.7%).
- **This is a measurement of discriminative POWER, not a validated
  promotion rule.** Zero errors were observed in 2,964 trials, which
  bounds the true error rate at roughly ≤0.1% (95% confidence, rule of
  three) — small, not zero, and the known-wrong sample (n=2 distinct
  incidents) is too small to bound false positives with real statistical
  confidence on its own. See *What this does not establish*.
- **One live disagreement is independently confirmed wrong today.**
  `verified_neighbor` disagrees with the tool's current best guess on 9 of
  247 covered live blockers (identical set in both USA and JPN). One of
  the 9 — `Copy32` — is independently checkable against committed
  `symbols.txt` right now: the tool's current guess (`func_020943f8`,
  still unnamed) is wrong; `verified_neighbor`'s prediction
  (`Copy32`@`0x020943e0`) is exactly where `Copy32` is already named. This
  also corrects `q-port-refusal-taxonomy`'s own Finding 3, which described
  `Copy32` as a same-address "just needs a rename" case — see
  *Correction to Finding 3*.

No promotion is implemented here. This document costs the option; whether
to spend a lane building and validating it is `cntrl_alt_lenny`'s call.

## Method

### The two labelled sets

**KNOWN-CORRECT** (`build_known_correct_set`): every EUR function whose
target-region twin is a **currently-committed `.c` file**, found HIGH via
the exact same `find_siblings` fingerprint `port_to_region.py` uses. Every
one of these was gated through `batch_port.py`'s `--confidence-floor HIGH`
+ a ROM SHA1 gate before being committed — CLAUDE.md's own acceptance
criterion — so the chosen target address is proven correct by
construction, not merely plausible.

```text
python tools/fingerprint_signal_evidence.py
  known-correct: 7808 raw rows -> 7774 clean, 32 dropped
```

⚠️ **This reconstruction inherits the exact ambiguity it measures.** Two
different EUR sources can fingerprint-guess the *same* already-shipped
target address (my scan can't tell which one actually shipped there
without reading file content) — `dedupe_known_correct` drops **both**
sides of any such collision rather than guess. **8 distinct EUR pairs**
collided this way in USA (16 rows; the same 8 pairs recur in JPN → 32
total dropped). One of the 8 is `func_0209bb60`/`func_0209bc20` —
**exactly** the historically-documented known-wrong incident (see below),
independently rediscovered by this scan with zero prior knowledge of the
brief. The other 7 have never been individually investigated:

| EUR pair (main) | Colliding on target |
|---|---|
| `0x02032fac` / `0x02032fe4` | `0x02032f90` |
| `0x02033000` / `0x0203301c` | `0x02032fc8` |
| `0x020952d0` / `0x020952e4` | `0x020951f0` |
| `0x020954d4` / `0x02095514` | `0x02095420` |
| `0x0209a824` / `0x0209a83c` | `0x0209a748` |
| `0x0209a92c` / `0x0209a9b8` | `0x0209a8c4` |
| `0x0209bb60` / `0x0209bc20` | `0x0209bb2c` (confirmed wrong — brief 673) |
| `0x0209bfd4` / `0x0209bfe4` | `0x0209bef0` |

This table is a genuine byproduct, not a claim: 7 of these 8 pairs are
**unvalidated candidate risk**, not confirmed bugs — they merely share the
identical structural shape (adjacent same-size siblings, fingerprint
collision) as the one pair independently proven wrong. Reported here
because the item asks what's "actually fixable and by what mechanism";
whether these are worth individually auditing is not this document's call.

**KNOWN-WRONG** (`KNOWN_WRONG` in the tool): 2 hand-verified historical
incidents where the fingerprint matcher's own top pick was later proven
wrong and corrected by hand:

| EUR (size) | Wrongly picked (HIGH) | Correct | Source |
|---|---|---|---|
| `func_0209bb60` (`0x44`) | `func_0209bb2c` | `func_0209ba6c` | [`brief-673-epilogue-resweep-3.md:205-219`](../brief-673-epilogue-resweep-3.md) |
| `func_020a73e8` (`0x2c`) | `func_020a7320` | `func_020a72f4` | [`brief-675-main-128-drain.md:99-118`](../brief-675-main-128-drain.md) |

Both were **collisions**, not single wrong guesses: an *adjacent*
same-size EUR sibling (`func_0209bc20`, `func_020a7414`) independently
resolved to the *same* target, and that sibling's own resolution was
confirmed correct — so the tool's per-file collision detection
(`find_rename_collisions`) never saw it, because the two colliding
candidates live in two *different* EUR source files, each ported
independently. `func_0209bb60`'s collision is **still live today** (it's
one of the 8 in the table above); `func_020a73e8`'s hand-written
correction no longer fingerprints as byte-identical at all, so it fell out
of the live census and is used here purely as documented history.

**⚠️ n=2 is not enough to bound a false-positive rate with statistical
confidence.** The canary step below exists specifically to check this
before trusting anything downstream.

### Canary

Per the item's own instruction: before trusting any measurement, check
whether the known-wrong set is even usable. It has 4 rows (2 incidents ×
2 regions) with fully-specified correct/wrong addresses, both
independently verified against primary docs (see table above) and one
(`func_0209bb60`) independently reproduced live by this tool's own
collision scan. **This is enough to run every signal and observe whether
each one correctly flags or fails on both incidents — genuinely
informative case studies — but not enough to compute a statistically
meaningful false-positive RATE.** Proceeding on that basis, with every
downstream number stated as coverage/accuracy on n=4, not as a population
rate.

### Signals tested

| Signal | Idea | Implementation |
|---|---|---|
| `call_graph` | Do a candidate's own callees match the SOURCE's callees, translated through already-verified mappings? | `call_graph_signal` |
| `verified_neighbor` | D2 v2's neighbor-consensus idea, rebuilt on PROVEN neighbor mappings instead of `find_siblings`' own unverified per-neighbor guess | `verified_neighbor_signal` |
| `exact_name` | Named EUR symbol already committed under the identical name in target `symbols.txt` | `exact_name_signal` (same mechanism `q-port-refusal-taxonomy` Finding 2 measured; the other lane is implementing it as `cm-port-exact-name-unlock`) |
| `cross_region_agreement` | Do USA and JPN's independent raw guesses imply the same shift? | `cross_region_agreement_signal` |

**Rejected, with reasoning:**

- **Containing-TU / delink-object identity.** Every candidate `find_siblings`
  returns is, by construction, drawn from `load_region()` — which only
  builds `Function` objects from `symbols.txt` entries. Every candidate is
  therefore *already* an individually-registered, named-address function;
  there is no "raw aggregate offset" candidate in the pool to distinguish
  against. As literally stated, this signal is vacuous for THIS
  disambiguation task (100% of candidates would trivially pass). It likely
  has real value for a different question — whether a target address is
  independently structurally confirmed at all — which is what
  `q-port-highconf-no-target`'s aggregate-`.text`-range class already
  covers from a different angle.
- **Access widths at reader sites.** Concretely implementable (disassembly
  text is committed, build-free) but scoped to DATA symbol resolution —
  neither of the 2 known-wrong cases is a data symbol, so it's untestable
  against the only ground truth available this round. Not implemented for
  time; a real, still-open candidate for a future round with its own
  labelled set (data-symbol known-correct/known-wrong pairs, which this
  round didn't build).

### The "hard" evaluation population

The known-correct set is, by construction, biased toward evidence the
existing tool could already use (that's *why* those cases shipped at
HIGH). There is no way to recover a "known-correct AND currently-MEDIUM"
population from shipped data — anything genuinely capped at MEDIUM was, by
definition, refused, not shipped. The closest available proxy: known-correct
rows with `n_candidates >= 2` (a real same-size ambiguous pool existed)
**and** `<=1` total relocations (weak evidence, matching the "no relocs to
compare" shape). This is a proxy, not the real MEDIUM population — some of
these still reached HIGH via raw-byte Hamming disambiguation (`find_siblings`'
`byte_disambiguate` path), a signal orthogonal to what's measured here, so
"hard" here is not identical to "genuinely stuck at MEDIUM." Two thresholds
reported for robustness:

- `--hard-max-relocs 1` (default): **2,998 rows**
- `--hard-max-relocs 0` (strictest — literally zero relocations, the exact
  shape of the 348 MEDIUM population): **16 rows** — small, but the result
  holds identically (see table below).

## Results

### Hard population, `<=1` reloc (n=2,998)

| Signal | Coverage | Accuracy when covered |
|---|---|---|
| `call_graph` | 542/2998 (18.1%) | 542/542 (100.0%) |
| `verified_neighbor` | 2960/2998 (**98.7%**) | 2960/2960 (**100.0%**) |
| `exact_name` | 34/2998 (1.1%) | 34/34 (100.0%) |
| `cross_region_agreement` | — | 2998/2998 "agree" |

### Hard population, `<=0` reloc — strictest proxy (n=16)

| Signal | Coverage | Accuracy when covered |
|---|---|---|
| `call_graph` | 0/16 (0.0%) | — |
| `verified_neighbor` | 16/16 (**100.0%**) | 16/16 (**100.0%**) |
| `exact_name` | 0/16 (0.0%) | — |

`verified_neighbor`'s result is unchanged at the strictest threshold;
`call_graph` needs at least one relocation to have any evidence at all
(expected — it has literally nothing to compare with zero relocs), which
explains its low overall coverage rather than indicating it's unreliable.

### Known-wrong cases (n=4: 2 incidents × 2 regions)

| Signal | Coverage | Accuracy when covered |
|---|---|---|
| `call_graph` | 0/4 (0.0%) | — |
| `verified_neighbor` | 4/4 (**100.0%**) | 4/4 (**100.0%**) |
| `exact_name` | 0/4 (0.0%) | — |
| `cross_region_agreement` | — | 4/4 "agree" |

Per-case detail:

```text
main/0x0209bb60 [usa] true=0x0209ba6c originally-wrong=0x0209bb2c
  verified_neighbor  predicted=0x0209ba6c correct=True
main/0x0209bb60 [jpn] true=0x0209ba6c originally-wrong=0x0209bb2c
  verified_neighbor  predicted=0x0209ba6c correct=True
main/0x020a73e8 [usa] true=0x020a72f4 originally-wrong=0x020a7320
  verified_neighbor  predicted=0x020a72f4 correct=True
main/0x020a73e8 [jpn] true=0x020a72f4 originally-wrong=0x020a7320
  verified_neighbor  predicted=0x020a72f4 correct=True
```

**`cross_region_agreement` is not a useful signal, in either direction.**
It says "agree" on **100% of the hard population (2998/2998) AND 100% of
the known-wrong cases (4/4)** — it carries zero discriminative
information, because USA and JPN independently derive their fingerprints
from near-identical EUR-derived code and make the *same* structural
mistake when one exists. Both regions being fooled identically by
`func_0209bb60`/`func_0209bc20` is direct proof of this, not a
coincidence.

**Why `call_graph` abstains on both incidents:** `func_0209bb60` and its
colliding sibling `func_0209bc20` share every relocation EXCEPT a
self-relative "call my own successor" edge (both call `self+size`) — the
`reloc_sig` fingerprint deliberately strips absolute target addresses
(region-portability), so this edge carries no discriminating information,
and their one genuinely distinct-target call (`0x0209b534`) is *shared* by
both siblings. `func_020a73e8` has zero relocations at all. Neither case
has the kind of evidence `call_graph` needs — a real, cross-checkable,
non-shared callee — which is itself informative: `call_graph`'s 18.1%
coverage on the hard population is a genuine ceiling on how much of this
problem it can ever address, not an implementation gap.

### Live refusal coverage (exploratory — no ground truth)

Applying `verified_neighbor` to the **current** live refusal population
(2026-08-28T10:09:37Z, `python tools/port_refusal_taxonomy.py --target
usa`, reused unmodified via `evaluate_live_refusals`):

| Region | Refused candidates | Distinct `func` blockers | `verified_neighbor` coverage | Agrees w/ current | Disagrees | Unknown-current |
|---|---:|---:|---:|---:|---:|---:|
| USA | 365 | 258 | 247 (95.7%) | 221 | 9 | 17 |
| JPN (provisional, mid-drain) | 367 | 260 | 248 (95.4%) | 222 | 9 | 17 |

The 9 disagreement cases are **identical addresses in both regions**
(expected — shared EUR-side structure):

```text
Copy32 [main]              current=0x020943f8 (NONE)   verified_neighbor=0x020943e0
func_020110c4 [main]       current=0x020110a8 (MEDIUM)  verified_neighbor=0x02011090
func_02094688 [main]       current=0x02094688 (MEDIUM)  verified_neighbor=0x02094594
func_020b2c68 [main]       current=0x020b2bd0 (LOW)     verified_neighbor=0x020b2b74
func_02093808 [main]       current=0x02093720 (LOW)     verified_neighbor=0x02093714
func_020937d0 [main]       current=0x020936e8 (MEDIUM)  verified_neighbor=0x020936dc
func_020937e4 [main]       current=0x020936fc (LOW)     verified_neighbor=0x020936f0
func_020b41c0 [main]       current=0x020b40e0 (LOW)     verified_neighbor=0x020b40cc
func_ov004_021d8cd0 [ov004] current=0x021d8be4 (MEDIUM) verified_neighbor=0x021d8abc
```

**One of the 9 is independently checkable right now, and confirms
`verified_neighbor` over the tool's current guess:**

```text
$ grep -n "020943e0\|020943f8" config/usa/arm9/symbols.txt
Copy32          kind:function(arm,size=0x18) addr:0x020943e0
func_020943f8   kind:function(arm,size=0x18) addr:0x020943f8
```

`Copy32` is **already correctly named** at `0x020943e0` — exactly
`verified_neighbor`'s prediction. The tool's current top guess
(`func_020943f8`) is a *different*, still-unnamed, same-size function.
This is a live, currently-wrong fingerprint pick with an already-committed
authoritative answer sitting unused.

### Correction to Finding 3 (`q-port-refusal-taxonomy`)

Last round's Finding 3 described `Copy32` as: "EUR-only named function...
has placeholder target twin... propagate the rename before porting" —
framing this as a correct-address-just-needs-a-name case, identical to
`Vram_GetBankBaseE`/`Vram_GetBankBaseCD`. **That framing was wrong for
`Copy32` specifically.** The fingerprint's address (`0x020943f8`) is not
`Copy32`'s twin at all — it's a same-size decoy; `Copy32`'s real twin
(`0x020943e0`) already carries its correct name. Re-checked the other two
placeholder-twin names from that finding against current `symbols.txt`:

```text
$ grep -n "Vram_GetBankBaseE\|Vram_GetBankBaseCD\|0208de04\|0208de58" config/usa/arm9/symbols.txt
func_0208de04   kind:function(arm,size=0x20) addr:0x0208de04
func_0208de58   kind:function(arm,size=0x20) addr:0x0208de58
```

Neither name appears anywhere — these two genuinely ARE unnamed-but-
correctly-identified twins, so last round's framing stands for them.
`Copy32` was the odd one out, and this round's `verified_neighbor` signal
is what surfaced it.

## What this does not establish

- **Not a validated promotion rule.** 0 observed errors across 2,964
  trials (2,960 hard + 4 known-wrong) bounds the true error rate at
  roughly **≤0.10%** (95% confidence, rule-of-three approximation:
  3/2964) — small, not proven zero, and this project has a documented
  history of exactly this failure class recurring at low but nonzero
  rates (briefs 673/675/681, `cm-crossregion-mop`'s two porter bugs).
- **The known-wrong sample is n=2 distinct incidents.** Both were caught
  BECAUSE someone individually objdiff-verified every port rather than
  trusting a clean gate (brief 673's own words) — meaning the true
  population of wrong-sibling incidents that were silently absorbed
  without individual verification is unknown and could be larger. This
  measurement cannot rule that out; it can only report what's documented.
- **The "hard" population is a proxy, not the real MEDIUM population**
  (see *The "hard" evaluation population* above) — some of it reached
  HIGH via raw-byte disambiguation, a mechanism this study didn't
  separately isolate.
- **`call_graph`'s 100% accuracy is measured on only 542-1030 rows**
  across the two hard-population thresholds — real, but its low coverage
  (18.1%) means it can only ever help a minority of cases; it should be
  read as "reliable when it has evidence," not "broadly useful."
- **No promotion, fix, or direction is recommended.** This document costs
  an option — turns "very likely intentional conservatism" into "measured
  at ≤~0.1% observed error over ~3,000 trials, plus 3 independently
  confirmed live-wrong cases (2 historical + 1 verified this round) that
  the CURRENT tool still gets wrong" — and leaves the decision where the
  item asked it to stay.

## Reproducing every figure in this document

```bash
# Labelled sets + hard-population + known-wrong measurement:
python tools/fingerprint_signal_evidence.py
python tools/fingerprint_signal_evidence.py --hard-max-relocs 0 --out-dir build/relocs0

# Live refusal coverage (needs a fresh census first; timestamp it):
python tools/port_census.py
python tools/fingerprint_signal_evidence.py --live-refusals usa
python tools/fingerprint_signal_evidence.py --live-refusals jpn --out-dir build/jpn_check

# Spot-checks used in this document:
grep -n "020943e0\|020943f8" config/usa/arm9/symbols.txt
grep -n "Vram_GetBankBaseE\|Vram_GetBankBaseCD\|0208de04\|0208de58" config/usa/arm9/symbols.txt
grep -n "0209bb60\|0209bb2c\|0209ba6c\|0209bc20" docs/research/brief-673-epilogue-resweep-3.md
grep -n "020a73e8\|020a7414\|020a7320\|020a72f4" docs/research/brief-675-main-128-drain.md
```

`build/known_correct_set.json`, `build/known_correct_dropped_collisions.json`,
`build/known_wrong_set.json`, and `build/fingerprint_signal_evidence.json`
carry full per-row detail (gitignored `build/` output, like every other
census in this campaign — regenerate with the commands above).
