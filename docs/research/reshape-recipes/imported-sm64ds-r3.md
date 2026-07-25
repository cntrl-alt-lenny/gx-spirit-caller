[//]: # (markdownlint-disable MD013 MD041)

# sm64ds mwccarm catalogue delta — re-ingest r3 (commit-mined)

**Status:** build-free source re-ingest, 2026-07-25. Supersedes
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

## New levers, commit-mined (UNVERIFIED-ON-2.0 — none of these have been
## re-tested against our own tree or compiler tier; see the gate below)

All are 1.2/sp2p3-observed register-coloring/scheduling nudges from the
"refine fan-out" commit series (`bf92a5900`, `e876b8fc9`, `b76999aa8`;
2026-07-23), each a `div N -> 0` closure on an OPUS-narrowed draft. Format
matches the peer's own commit convention: `target — technique`.

| Technique | Example target (peer's, not ours) |
|---|---|
| Inverted-guard suppresses pool-ldr hoist over a following store | `func_ov006_020c8680` |
| A fake dependency on a virtual-call argument colors `self+idx*4` into a specific register | `func_ov002_020e4768` |
| Declaring a callee's real 3rd argument (even if the callee ignores it) keeps it live and changes coloring — "hidden-arg liveness" | `_ZN6Player14St_Squish_MainEv` |
| If/else block layout (vs. the equivalent guard-clause form) stops the scheduler from batching a pool-load above a store | `func_ov006_020c9d7c` |
| `col = (u16)(x >> 1)` canonicalizes an `lsl 15; lsr 16` pair without perturbing coloring elsewhere | `func_0201d6a0` (peer's own address; unrelated to any same-numbered function in our tree — see caution below) |
| A `volatile`-cast read pins an `ldrb` between two copy loads/stores that would otherwise reorder | `func_ov002_020f7780` / `func_ov060_02112ee0` |
| Volatile WRITES plus plain reads changes residency without pinning order (the asymmetric case of the read-pinning lever above) | `func_ov002_020ce9c8` |
| An identity ternary (`x = c ? x : x`-shaped) pins `rsb`-before-`sub` argument evaluation order | `func_ov006_02100bac` |
| u64-laundering a whole base pointer (cast through `unsigned long long` and back) defeats store-batching/scheduling | `__sinit_ov002_02100f84` |
| Plain-base pointer with full explicit offsets (no intermediate narrowed pointer) closed a 19-word divergence in one try | `func_ov006_0211c478` |
| Reordering a zero-init assignment to sit ABOVE an early-return (not below it, as natural top-down C reads) | `func_ov075_0211b260` |
| Field-by-field vector copy plus an explicit `if (Spawn != 0)` guard (not a single struct-assignment) | `func_ov065_021180d4` |
| Hoisting unconditional tail stores out of both arms of an if/else, rather than duplicating them per-arm | `func_ov002_020b76ec` |
| Splitting a combined pointer-plus-offset expression into two statements (`end = p; end += 0x47e4;`) rather than one | untitled `PathLift::BaseInitResources` fix, commit `b76999aa8` |

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

## Not re-tested against our corpus this pass

None of the 14 levers above were tried against a local near-miss this
brief — this ingest's own effort went to the higher-confidence, more
concretely-scoped internal leads (C-23 routing retry, byte-swap draft;
both executed, see queue doc). The `.legacy_sp3`/tier caveat from r2 still
holds: even a lever that DOES reproduce a `div N->0` closure on 1.2/sp2p3
needs a second check on our own 2.0/sp1p5 default tier before use, since
our tiers span a full major-version gap the peer's do not.

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
