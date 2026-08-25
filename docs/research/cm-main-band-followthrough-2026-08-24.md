[//]: # (markdownlint-disable MD013 MD041)

# cm-main-band-followthrough: 257-320 B pilot after the 193-256 B rate collapsed

**Status:** done, partial sample. 2/9 fully-processed candidates shipped
(22.2%), 11/20 of the drawn sample not attempted this round. See
`codegen-walls.md` BR-3 for the permanent record; this doc carries the
per-candidate detail.

## Why this round is scoped the way it is

`cm-main-boundary-rerun` (#1545) settled the 193-256 B band: 0/60 across
two disjoint samples, matched effort making the numbers *worse* than
reduced effort, and the `<=192 B` pool fully drained. The natural next
step — per `post-small-pool-strategy.md`'s pre-staged Outcome B — was a
257-512 B pilot, justified by sweep-7's 23.5% ship rate on 257-320 B.

Before that pilot started, `band-rate-vintage.md` (brain, 2026-08-24)
showed why that justification doesn't hold: sweep-7's 193-256 B figure
(27.6%) was the exact same vintage as the 23.5% quoted for 257-320 B,
and the 27.6% had *just* collapsed to 0.0% on a disjoint sample. The
campaign harvests in descending order of tractability, so a historical
band rate describes the pool at the moment it was measured, not the
band itself — using sweep-7's number to justify a drain would repeat
the same error one band higher.

This round is scoped as a **test of that hypothesis**, not a
pre-justified drain: sample n=20 from the *unattempted* 257-320 B
residue, run it under the same protocol as `cm-main-boundary-rerun`,
and apply pre-registered thresholds (>=25% band holds, <=10% frontier
closed, 10-25% marginal) to whatever the sample says — not to what
sweep-7 said three vintages ago.

## Part 1: closing the 193-256 B record

`codegen-walls.md` gained a `## Band ship-rate closures` section with
two entries:

- **BR-1**: the 193-256 B closure itself, both runs' evidence side by
  side (0/40 reduced-effort, 0/20 matched-effort, match_pct
  distributions, disjointness confirmation, the near-miss callout for
  the two P-20-mode-switch-selector hits at 92%+).
- **BR-2**: the general vintage-stamping rule, tying BR-1's collapse to
  `cm-main-exploit-drain-2` Part 1's own unrecognized instance
  (5/32 = 15.6% on a tail vs 73/100 = 73% on the same band's fresh pool
  one round earlier).

Both cite `band-rate-vintage.md` as the source finding.

## Part 2: the 257-320 B pilot

### Pool and sample

`>=4 bl/blx` filter applied to the 257-320 B slice: 283 candidates,
81,680 B, module distribution dominated by overlay002 (163) and main
(90), with 1-3 candidates each across 14 other modules.

Stratified sample, n=20, seed `20260824` (1 floor per module with any
candidates, remainder split proportionally between overlay002/main,
cap 8, addresses sorted before shuffling for determinism). Screened
every sampled address against every `**Affected picks**` line in
`codegen-walls.md`: zero collisions at draw time.

### What happened to each of the 20

| # | Function | Module | Size | Outcome | match% | Attempts | Note |
|---|---|---|---|---|---|---|---|
| 1 | `func_02071fb0` | main | 260 | not attempted | — | 0 | complex byte-swap/16-bit-pack chain feeding a dispatch call; deferred |
| 2 | `func_02072f00` | main | 320 | not attempted | — | 0 | 8x repeated 16-bit byte-swap idiom into a packed struct across 5 struct-relative sources; deferred |
| 3 | `func_ov000_021ac920` | ov000 | 264 | parked | 55.2 | 1 | correct structurally, but 2 extra callee-saved registers (r3,r7) vs orig's r4-r6 — register-pressure cascade from the multi-temp `func_0201ef90` call site, resistant to source restructuring |
| 4 | `func_ov002_022112f8` | ov002 | 312 | not attempted | — | 0 | 7-way jump-table dispatch; one case (`.L_67c`) carries the confirmed P-20-row-offset idiom, guaranteeing a partial wall even with a correct dispatcher — deferred given the guaranteed partial failure |
| 5 | `func_ov002_022178fc` | ov002 | 296 | parked | 2.6 | 2 | 2 out-param unpacks + 4 downstream calls; stack-frame layout diverged sharply (65-78w mine vs 74w orig across two type variations) — deeper restructuring needed than this round's budget allowed |
| 6 | `func_ov002_0222427c` | ov002 | 284 | parked (wall) | — | 0 | confirmed P-20-row-offset member (`(bit&1)*0x868` against `data_ov002_022cf16c`, same literal constant as the documented 55-member cohort) — excluded on sight |
| 7 | `func_ov002_022341c8` | ov002 | 264 | parked (wall) | — | 0 | same P-20-row-offset signature, same table |
| 8 | `func_ov003_021cbf08` | ov003 | 264 | not attempted | — | 0 | nested double loop (23x32 iterations) with signed `asr`-based division and conditional NDS tile-map bitfield writes; deferred |
| 9 | `func_ov005_021aef74` | ov005 | 284 | not attempted | — | 0 | loop with a variable-shift mask computation (`lsl r1` with a register shift amount) and multiple ternary-style flag selects; deferred |
| 10 | `func_ov008_021b1ad8` | ov008 | 316 | parked | 70.0 | 2 | clean 2-variable register-letter swap (self-holder vs scratch-pointer-holder use r6/r4 vs orig's r5/r6) — fully resistant to source reordering, matching the session-wide resistant-residual pattern |
| 11 | `func_ov010_021b476c` | ov010 | 280 | parked | 4.2 | 1 | structural prologue mismatch (wrong register count/assignment); not pursued further |
| 12 | `func_ov012_021ca6dc` | ov012 | 312 | not attempted | — | 0 | large local-buffer construction with many `bic`/`orr` bitfield packs; deferred |
| 13 | `func_ov013_021ca15c` | ov013 | 312 | not attempted | — | 0 | near-identical `bic`/`orr` Task-config bitfield pack executed twice; deferred |
| 14 | `func_ov014_021b4294` | ov014 | 292 | **shipped** | 100.0 | 2 | 4x `OS_SPrintf` + byte-extract; first attempt (8.2%, 6 words short) traced to an `(unsigned char)` cast collapsing the source's real `(x<<24)>>24`-as-unsigned shift-pair to a single `AND` — fixed by writing the shift pair explicitly with an unsigned intermediate cast to force `LSR` over `ASR` |
| 15 | `func_ov015_021b429c` | ov015 | 268 | **shipped** | 100.0 | 5 | guard-chain dispatcher; a `docs/research/c-match-prep/021b429c.c` draft existed but had an inverted predicate (missed an early-return path) and wrong branch-block layout order, both fixed; final 92.5%->100% step was dropping an intermediate `key` pointer local entirely rather than caching it — the SAME "cache it and the register choice diverges" pattern seen elsewhere this round, but here removing the cache (rather than adding one, as worked in Part 1's #1545) was the fix |
| 16 | `func_ov016_021b6f08` | ov016 | 260 | parked | 73.8 | 3 | dispatcher + one case matched exactly; the other two cases show a resistant multi-register permutation (letter swap + instruction-order swap) unmoved by 3 source variations, including replicating the exact style that matched in the first case |
| 17 | `func_ov017_021b40d8` | ov017 | 292 | not attempted | — | 0 | `smull` magic-constant division-by-10 idiom inside a loop; deferred |
| 18 | `func_ov018_021ace68` | ov018 | 280 | not attempted | — | 0 | RGB555 min/mid/max selection network + hue-sector branch; deferred |
| 19 | `func_ov019_021b2938` | ov019 | 272 | not attempted | — | 0 | 10 saved registers, multiple `asr`/`lsr` division-by-constant idioms inside a loop; deferred |
| 20 | `func_ov020_021ad910` | ov020 | 268 | not attempted | — | 0 | nested-index table lookup (double-indexed through two computed offsets) feeding a threshold count; deferred |

### Coverage and result

**9/20 fully processed** (build-tested or wall-recognized): 2 shipped,
7 parked. **11/20 not attempted** — read in full, each carrying a
specific complexity marker (nested loop + signed division, repeated
heavy bitfield packing, a magic-constant division idiom, a min/max/hue
network, or a guaranteed-partial wall-contaminated dispatch case) that
none of the shipped or near-miss candidates carried. They are
unmodified from before this round and remain available to a future
round at full budget.

**On the 9 processed: 2/9 = 22.2%**, inside the pre-registered 10-25%
marginal zone. **This is not evaluated against the pre-registered
threshold as a verdict on the band** — those thresholds were written
against a full n=20 denominator, and only 9 of 20 were reached. Per
this round's own decision rule and `band-rate-vintage.md`'s standing
warning against quoting a rate against the wrong population, this
round reports the partial result honestly rather than rounding it up
to a closed verdict either way. Recommendation: **do not drain this
band by default** on the strength of this round alone; a future round
completing the remaining 11 (or a fresh matched-effort sample of
similar size) would give a real n=20 read.

### The canary and the near-misses

Two clean, hand-verified, real-`ninja sha1`-confirmed ships:
`func_ov014_021b4294` and `func_ov015_021b429c`. Both are documented in
`attempts.tsv` (`result=shipped`, `match_pct=100.0`,
`attempts=2`/`5`) and the ledger's `--attempts` column is populated for
every row this round produced, per this round's new requirement — the
effort confound flagged in `cm-main-exploit-drain-2` and
`cm-main-boundary-rerun` is now measurable directly in the data rather
than only in prose.

Three parked candidates (70.0%, 73.8%, and an earlier 92.5% en route to
one of the ships) show the same class of resistant register-letter/
permutation residual documented repeatedly this session — none moved
under genuine source-level variation within this round's 2-4-iteration
budget, consistent with prior rounds' findings that this residual
class does not respond to source restructuring once identified.

### Toolchain contention

CC Scaffolder's `cm-restock-carve-12` build was active for a stretch
mid-round (`tasklist` showed 2-18 `mwcc`/`mwld`/`mwasm`/`ninja`
processes fluctuating across ~12 bounded polls, roughly 3 minutes). No
full-ROM build (`ninja sha1`, the region gates) was run while that
contention was showing; per-candidate `fastmatch.py` calls (single-`.o`
resolved-relocation compiles, no link step) continued throughout, since
they don't touch the shared link stage. The two real `batch_sha1.py`
confirmations and all three region `--clean` gates were run only after
contention cleared.

## Recommendation

- Do not treat 22.2%/n=9 as a closed read on 257-320 B in either
  direction. It is a real, honestly-reported data point, not a
  verdict.
- The 11 deferred candidates are a natural next increment: same pool,
  same screening, higher per-candidate effort budget allocated up
  front (they are disproportionately loop- and bitfield-pack-heavy,
  which this round's data suggests costs more per attempt than the
  guard-chain/printf-shaped candidates that shipped).
- The two P-20-row-offset hits (bringing that cohort to 57) reinforce
  BR's existing recommendation that this wall family is permanent and
  should stay excluded on sight rather than re-attempted.
