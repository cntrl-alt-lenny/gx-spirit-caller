[//]: # (markdownlint-disable MD013 MD041)

# sm64ds mwccarm catalogue delta — re-ingest r3 (commit-mined)

**Status:** all 14 "refine fan-out" levers below verified against our own
2.0/sp1p5 tree, 2026-07-25 (queue item `cm-sm64ds-lever-verify`, brief 681
follow-on — see brief-682). 5 VERIFIED-ON-2.0 (mechanism confirmed real on
our compiler), 5 FAILED-ON-2.0 (tested, does not reproduce the claimed
effect or has zero observable effect here), 3 NO-CANDIDATE (no real local
function has the matching residual shape), 1 moot (the lever's precondition
doesn't arise on the only candidate found). **5 real ships landed** — 3
where the lever itself was load-bearing (L3, L6, L12), 2 where the
candidate matched anyway via an approach OTHER than the tested lever (L13's
duplicate form beat its own hoist proposal; L14 needed correct
reconstruction, not the offset-split). Full per-lever ledger below the
table this ingest originally produced. Supersedes
[`imported-sm64ds-r2.md`](imported-sm64ds-r2.md) as the CURRENT snapshot —
not because r2 was wrong, but because r2's own source (`notes/
mwccarm-codegen.md`) turned out to be a lagging summary, not the primary
lever source. This report changes the ingestion METHOD, not just the
content: keyed on the peer repo's commit/PR stream (`gh api .../commits`)
rather than the notes file's own section numbering, per the r11 finding
that motivated this brief (`docs/research/rnd-swarm-2026-07-24-r11-postwall.md`,
"sm64ds catalogue: notes frozen at our ingest, but 100+ commits/37h carry
new levers").

## Why a third pass, and why the method changed

r2 (2026-07-23) transcribed `notes/mwccarm-codegen.md` faithfully. That
file has not grown since — still 1,465 lines, still ending at section 7c
— but the peer repo's commit stream kept moving: **147 commits landed
between the r2 cutoff (2026-07-23T04:00Z) and this ingest**
(`gh api repos/tangosdev/sm64ds-decomp/commits?since=...`), and none of
that work has been folded back into the notes file. The project appears
to have shifted its own primary record-keeping to two machine-readable
artifacts introduced in that window:

- **`nearmiss/db.jsonl`** (683 rows, ~3MB as of this ingest) — one row per
  attempted function, keyed by `(module, addr)`, carrying the best draft's
  full C source, its target hex, divergence count, and (when unmatched) a
  structured `floor` object with a `class` and free-text `evidence`. This
  is a strictly richer source than prose notes: it is queryable.
- **`config/match_provenance.jsonl`** / **`config/match_attempts.jsonl`**
  — append-only ledgers of which model/method landed which function,
  introduced in commits `9992fae60`/`7a6adb0fa` (2026-07-23) specifically
  because "only about 13% of the 10,711 matched functions landed in a
  commit that names a method" beforehand. Both still building up; not
  mined here beyond noting they exist.

**Action for any future re-ingest:** query `nearmiss/db.jsonl` and the
commit stream directly (this report's method), not the notes file. The
notes file may never get a "7d" section at all if the project has
genuinely moved its record-keeping elsewhere.

## Methodology caution: the peer's own match count just dropped

Commit `fcdfc66d5` (2026-07-24T20:37:46Z) **reclassified 116 game-logic
functions from MATCHED to NONMATCHING**: they were byte-exact only via
hand-written assembly on a proven mwccarm 1.2 register-allocation/
scheduling wall, not real C decompilation, and the project now considers
whole-function hand-asm disqualifying (same principle this project
already follows — see `CLAUDE.md`'s "byte-identical ROM rebuilt from C
source" framing). A related same-day commit (`99f568ea2`) reverted 9 more
"lunavyqo HAND-ASM" matches, keeping only the 1 of the 9 that a fresh pass
cracked in genuine C. **Net effect: any "N% matched" headline figure
quoted from this project before 2026-07-24 (including this campaign's own
brief-524 import note, "68.8% matched... at fetch time") is now overstated
by an unknown-but-nontrivial amount** — treat their match-rate claims as a
moving target, and treat any INDIVIDUAL lever citation on its own
technical merits rather than on the strength of the project's aggregate
match rate. This does not affect our own `sim==1.0`/`ninja sha1` gating,
which was never rate-based, but it's worth banking as a reason to keep
demanding byte-level verification from any external source rather than
trusting a percentage.

## Negative result, reconfirmed on richer data: still nothing for our 3 residuals

r11 already searched the (then-current) peer notes files and found no
TST-vs-ANDS or byte-swap content. This ingest re-ran that check against
the **structured `nearmiss/db.jsonl`** — a stronger source, since it's
683 real attempted-function records (full C source + floor evidence) with
147 more commits of coverage than r11 had:

| Residual | Query | Hits |
|---|---|---|
| TST-vs-ANDS instruction selection | `\btst\b` co-occurring with `ands`/`instruction`/`discard` anywhere in the row (name, C source, floor evidence) | **0** |
| Byte-swap / endian | `byteswap`, `byte-swap`, `endian`, `__rev` | **0** |
| 4-register argument-spill (`stmdb sp!,{r0,r1,r2,r3}` home-area) | `hidden-arg`/`hidden_arg`, `va_list`/`va_start`, or an `stmdb`+r0+r1+r2+r3 sequence anywhere in the row | **0** |

The only "spill" hits (5 rows) are all mwcc **register spill-SLOT
ordering** for local variables under pressure (`func_ov006_021173c8`,
`func_ov006_02114800`, `func_ov006_020e513c`, `_ZN7Wiggler8BehaviorEv`,
`func_ov006_020e1dc8`) — a different mechanism from our parameter
home-area puzzle (brief 675/676's `stmdb sp!,{r0,r1,r2,r3}` cluster); not
false negatives, just a different "spill."

**Bank this as the second independent confirmation** (r11's notes-grep,
now this ingest's structured-DB query) that nothing external addresses
these three — future sweeps should stop searching this specific peer for
them. Two of the three DO have concrete internal leads from this
session's own r11 report instead (the C-23 routing-fix retry for
TST-vs-ANDS, the corpus-grep byte-swap draft for `func_0206ea00`) — both
executed in this same brief; see the queue doc's Result note.

## New levers, commit-mined — VERIFIED-ON-2.0 as of 2026-07-25 (brief 682)

All are 1.2/sp2p3-observed register-coloring/scheduling nudges from the
"refine fan-out" commit series (`bf92a5900`, `e876b8fc9`, `b76999aa8`;
2026-07-23), each a `div N -> 0` closure on an OPUS-narrowed draft. Format
matches the peer's own commit convention: `target — technique`. **Verdict**
column added 2026-07-25 (queue item `cm-sm64ds-lever-verify`) — see
brief-682-sm64ds-lever-verify.md for the full per-lever writeup (candidate
search methodology, exact C forms tried, byte-diffs).

| # | Technique | Example target (peer's, not ours) | Verdict | Local candidate | Result |
|---|---|---|---|---|---|
| 1 | Inverted-guard suppresses pool-ldr hoist over a following store | `func_ov006_020c8680` | **FAILED-ON-2.0** | `func_0208ddec` | Guard-polarity inversion: byte-identical to baseline or worse (32v24) on all 3 tiers — mwcc doesn't tail-merge the duplicated return this creates. |
| 2 | A fake dependency on a virtual-call argument colors `self+idx*4` into a specific register | `func_ov002_020e4768` | **VERIFIED-ON-2.0** | `func_02097004` | Mechanism confirmed real: declaring the callback pointer as an initialized local (not a deferred assignment) shifts register coloring exactly to target, reproduced across 4 independent variants. Not shipped — an orthogonal, unrelated prologue/epilogue frame-shape wall (compact `push{r3,lr}` vs target's expanded `stmfd`+`sub sp,#4`) persists regardless. |
| 3 | Declaring a callee's real 3rd argument (even if the callee ignores it) keeps it live and changes coloring — "hidden-arg liveness" | `_ZN6Player14St_Squish_MainEv` | **VERIFIED-ON-2.0 — SHIPPED** | `func_02087e54` | The caller was missing a real forwarded 3rd argument to `func_0208b0a4`, leaving r2 free for the compiler to reuse for a cached self-pointer (target wants r3). Modeling the real pass-through argument forces the correct split. Byte-exact, `.legacy_sp3.c`. |
| 4 | If/else block layout (vs. the equivalent guard-clause form) stops the scheduler from batching a pool-load above a store | `func_ov006_020c9d7c` | **FAILED-ON-2.0** | `func_0208ddec` (same as #1) | Both full 3-arm and minimal 2-arm if/else forms: 32v24, worse than baseline on all 3 tiers — C requires a return on every path once the fallthrough guard is removed, and mwcc doesn't merge the duplicated return. |
| 5 | `col = (u16)(x >> 1)` canonicalizes an `lsl 15; lsr 16` pair without perturbing coloring elsewhere | `func_0201d6a0` (peer's own address; unrelated to our tree) | **NO-CANDIDATE** | — | Confirmed genuinely distinct from our own P-1 wall (asymmetric K,K+1 shift pair vs P-1's symmetric same-K truncations) — but a repo-wide search for the exact `lsl #0xf` → `lsr #0x10` shape returned zero hits across every `.s` file. |
| 6 | A `volatile`-cast read pins an `ldrb` between two copy loads/stores that would otherwise reorder | `func_ov002_020f7780` / `func_ov060_02112ee0` | **VERIFIED-ON-2.0 — SHIPPED** | `func_02066ea0` | Casting the first read of each byte-load pair through `volatile` pins it at its source position, fixing exactly the pair(s) cast (partial application confirmed the two batches are independently controlled). Byte-exact, 16/16 insns, `.legacy_sp3.c`. |
| 7 | Volatile WRITES plus plain reads changes residency without pinning order (the asymmetric case of the read-pinning lever above) | `func_ov002_020ce9c8` | **FAILED-ON-2.0** | `func_02066ea0` (same as #6) | 3 variants (both/first/second store of each pair volatile): all byte-identical to the unmodified base draft — zero observable effect on either order or register residency for this candidate. |
| 8 | An identity ternary (`x = c ? x : x`-shaped) pins `rsb`-before-`sub` argument evaluation order | `func_ov006_02100bac` | **moot — not exercised** | `func_ov004_021cd3b4` | The lever wasn't needed: a straightforward transliteration already produces the exact ground-truth `sub`-then-`rsb` order mechanically (register reuse: r0 already holds the literal needed for the `sub`). Bonus: reached 93% (176/189 insns) on this previously-untried 784B function — flagged as a follow-up, not closed this pass (2 unrelated residuals remain; no baserom in that worktree to run the real gate). |
| 9 | u64-laundering a whole base pointer (cast through `unsigned long long` and back) defeats store-batching/scheduling | `__sinit_ov002_02100f84` | **VERIFIED-ON-2.0** | `func_020947b8` | Mechanism confirmed real and reproducible (11→19 words, moves away from target) — but empirically confirmed to work in the *opposite* direction from what this candidate needs (target requires MORE `stmia` batching, not less). Not shipped; flagged directionality concern from the research phase held up under a real test, not just prediction. |
| 10 | Plain-base pointer with full explicit offsets (no intermediate narrowed pointer) closed a 19-word divergence in one try | `func_ov006_0211c478` | **NO-CANDIDATE** | — | Closest analog (`func_ov002_02269534`, our own P-16 wall) already has this exact fix applied for an unrelated reason; its current residual is a separate register-scheduling swap. No fresh candidate with the narrowed-intermediate-pointer shape at a comparable divergence size found. |
| 11 | Reordering a zero-init assignment to sit ABOVE an early-return (not below it, as natural top-down C reads) | `func_ov075_0211b260` | **NO-CANDIDATE** | — | Our own C-9/C-10/C-13 entries cover adjacent-but-different "source order controls emission" mechanisms; several dossiers corroborate the general mechanism class is plausible on our tier, but no currently-parked function has this specific zero-init-near-guard residual. |
| 12 | Field-by-field vector copy plus an explicit `if (Spawn != 0)` guard (not a single struct-assignment) | `func_ov065_021180d4` | **VERIFIED-ON-2.0 — SHIPPED** | `func_02085664` | Confirmed as a controlled A/B, not a lucky draft: field-by-field copy matches byte-exact (15/15 insns); the aggregate `*dst = *src` struct-assignment control WALLs on all 3 tiers (12 insns, diverges from instruction 0). `.legacy.c`. |
| 13 | Hoisting unconditional tail stores out of both arms of an if/else, rather than duplicating them per-arm | `func_ov002_020b76ec` | **FAILED-ON-2.0 — candidate SHIPPED anyway** | `func_ov002_022a822c` | The lever itself is refuted here: the call's argument is condition-dependent, so it can't be hoisted to one site without changing the function's shape (hoist-full and hoist-store-only both measurably worse, 30v35 and 34v35). The *opposite* (duplicate) form matches byte-exact (35/35). Commit `77a38b4b`. |
| 14 | Splitting a combined pointer-plus-offset expression into two statements (`end = p; end += 0x47e4;`) rather than one | untitled `PathLift::BaseInitResources` fix, commit `b76999aa8` | **FAILED-ON-2.0 — candidate SHIPPED anyway** | `func_ov006_021b60a4` | Tested as a controlled A/B: the two-statement split has no effect — mwcc already naturally emits the correct two-ADD-immediate sequence for the combined single-statement form. Matched via correct full reconstruction (a citing retriage doc's "already matched" claim was stale/wrong), not via this lever. Byte-exact, 107/107 words, default 2.0/sp1p5 tier. |

**Tally: 5 VERIFIED-ON-2.0, 5 FAILED-ON-2.0, 3 NO-CANDIDATE, 1 moot. 5 real
ships** (3 where the lever itself was load-bearing: #3, #6, #12; 2 where the
candidate matched via a DIFFERENT approach than the tested lever: #13, #14).

**Caution on names/addresses:** every target above is the PEER PROJECT'S
own function at the PEER PROJECT'S own address in a DIFFERENT game (Super
Mario 64 DS). Two names in this campaign's own delta tables so far
(`func_02068398`, and now `func_0201d6a0` above) happen to numerically
coincide with plausible-looking addresses in our own main module purely
because both are NDS ARM9 programs starting around `0x02000000` — neither
is a hit against anything in our tree (`func_02068398` does not exist in
`config/eur/arm9/symbols.txt`; not re-checked for `0201d6a0` here). Treat
every row as a TECHNIQUE to try on a same-shaped LOCAL candidate, never as
an address to look up directly.

## Update 2026-07-25 — all 14 levers now tried (brief 682)

Superseded: all 14 levers above WERE subsequently tried against real local
candidates (queue item `cm-sm64ds-lever-verify`, this same day) — see the
Verdict column in the table above and `brief-682-sm64ds-lever-verify.md`
for the full methodology and per-lever writeup. The `.legacy_sp3`/tier
caveat from r2 held up as predicted: several of the 5 real ships landed on
the `.legacy_sp3`/`.legacy.c` routing tiers, not the 2.0/sp1p5 default,
confirming a lever reproducing on our tree at all still needs a per-tier
check before use.

None of the 14 levers touch this project's 3 open residuals (TST-vs-ANDS
instruction selection, the 4-register argument-spill ABI puzzle,
byte-swap value-correct/order-wrong) — reconfirmed once more during this
verification pass, consistent with this ingest's own earlier structured-DB
query (0 hits for all 3, see above). Those residuals' own internal leads
were separately executed in brief 680 (C-23 routing retry, byte-swap
draft) — nothing new for any of the 3 from this lever set.

## Update 2026-07-25 — the 5 verified levers swept at scale (queue item `cm-sm64ds-lever-apply`)

The 5 VERIFIED-ON-2.0 levers (#2, #3, #6, #9, #12) had each only been
tried on their single brief-682 test candidate. Swept each across the
parked corpus instead — see
[`cm-sm64ds-lever-apply-2026-07-25.md`](../cm-sm64ds-lever-apply-2026-07-25.md)
for the full per-lever ledger. Headline: **every one of the 5 real
ships this pass landed via a mechanism OTHER than the lever being
tested on that candidate** — the same pattern brief 682 itself
already flagged for levers 13/14. At scale, across 23 total
candidate checks:

- **Lever 3** (hidden-arg liveness) is the one that most often
  genuinely applies (2/7 candidates) — both left as confirmed
  near-misses behind a separate residual, not full ships.
- **Lever 2** (fake-dependency coloring) is confirmed load-bearing on
  2/2 ov002 C-39-residue candidates it was tried against — a 2-for-2
  reproduction, strong evidence this is a real, reusable technique for
  that specific symptom (see `codegen-walls.md`'s C-39-residue entry),
  even though neither closed all the way.
- **Levers 6 and 9** both looked strong in their own single
  brief-682 worked example but did not close a single ADDITIONAL
  candidate this pass (0/4 and 0/3) — lever 6 in particular now has 2
  independent data points (brief-682's own candidate plus this pass's
  3) suggesting its documented scope should narrow to true
  load-then-immediate-store copy shapes, not general arithmetic.
- **Lever 12** had only 2 real shape-matches in the swept corpus, and
  both had already shipped independently before this pass started.

Net: real, verified evidence that "a lever works once" and "a lever
is worth sweeping at scale" are different claims — worth checking
before importing a large batch from any single worked example in a
future re-ingest.

## Source URLs

- Current repository: [`tangosdev/sm64ds-decomp`](https://github.com/tangosdev/sm64ds-decomp)
  (`pushed_at` 2026-07-25T01:12:56Z at ingest time).
- Near-miss database (the primary source this ingest mined):
  [`nearmiss/db.jsonl`](https://github.com/tangosdev/sm64ds-decomp/blob/main/nearmiss/db.jsonl).
- Commit stream since the r2 cutoff: `gh api repos/tangosdev/sm64ds-decomp/commits?since=2026-07-23T04:00:00Z` (147 commits, 2 pages).
- Hand-asm reclassification: commit [`fcdfc66d5`](https://github.com/tangosdev/sm64ds-decomp/commit/fcdfc66d5).
- Refine-fan-out lever source commits: [`bf92a5900`](https://github.com/tangosdev/sm64ds-decomp/commit/bf92a5900), [`e876b8fc9`](https://github.com/tangosdev/sm64ds-decomp/commit/e876b8fc9), [`b76999aa8`](https://github.com/tangosdev/sm64ds-decomp/commit/b76999aa8).
- Previous imported snapshots, retained for history:
  [`imported-sm64ds.md`](imported-sm64ds.md) (r1, `bmanus2-dotcom/sm64ds-decomp`),
  [`imported-sm64ds-r2.md`](imported-sm64ds-r2.md) (r2, notes-file transcription).

The peer source is used as research evidence only. Techniques and
observations are summarized in our own words from commit messages and
near-miss floor evidence; no peer source code or ROM asset is copied into
this repository.
