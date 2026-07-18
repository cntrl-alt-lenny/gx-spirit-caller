[//]: # (markdownlint-disable MD013 MD041)

# Singleton C-match re-queue (brief 605)

**Asked:** the r6-verified #1 strategic move — family-census queueing
structurally covers under 3% of the two biggest modules, so singleton
queueing (per-function, retriever-seeded) replaces it as the campaign's
primary lane, now that brief 604 confirmed the retriever underneath it
actually works (family-hit@5 = 23/24). Build the queue: for each
never-attempted ARM singleton, record identity, top-5 retrieved matched
siblings, a tractability score, and a batch grouping for the wine lane.

**Short answer:** the committed `pick-lists.md` (brief 603) reads
**0** never-attempted ARM singletons — stale, not current state; see
below. Regenerated fresh: **28 distinct functions** (55 region-rows;
27 of the 28 are simultaneously unmatched-and-singleton in *both* USA
and JPN at the identical address — not the "~40 smallest, EUR-first"
the brief anticipated, because **EUR itself has zero remaining
never-attempted singletons** — EUR has been the most-drained region
throughout this campaign, confirmed independently in briefs 596/600/604).
All 28 are queued below (not a 40-item slice — the full current backlog
is smaller than the brief's sizing assumption). Two confirmed twin
pairs and one confirmed near-twin pair emerged from direct mnemonic
comparison (not from the retriever, which can only surface *already-
matched* siblings — these are still-unmatched candidates matching each
other); six batches of 4-6 candidates each group by module and shared
shape for the wine lane.

## Why `pick-lists.md` reads 0 — regenerated, not trusted as committed

`tools/build_master_ledger.py --pick-lists` failed silently-to-empty at
some point in its history — not from a code bug, but an **environment**
one: its research-evidence sweep shells out to `rg` (ripgrep) with
`check=True`, and `rg` was not on `PATH` in this worktree at brief-605
setup time (`FileNotFoundError`, uncaught). Installed `ripgrep` via
`brew` and reran the tool from scratch. Fresh result: **28 distinct
functions, 55 region-rows** (`eur=30 usa=183 jpn=182` total unmatched
ledger rows per the tool's own summary — the 55 is the never-attempted-
ARM-singleton subset specifically). This doc's queue is built from that
fresh run, not the committed 0. The regenerated `pick-lists.md` is
included in this PR's diff for the record; whether the *committed* 0
predates ripgrep being available in whatever environment last ran it,
or reflects a real but since-reversed tree state, wasn't chased further
— out of scope for this brief, and moot either way once the fresh
number is in hand.

**EUR-first, as literally instructed, yields zero candidates.** This
isn't a bug in the brief's framing — the campaign's own prior briefs
already independently established EUR as the most-complete region
(brief 596: EUR `main` census showed 0 unmatched named functions;
brief 600: EUR's only remaining `main` residue was un-symbolized
crypto content, not a real singleton; brief 604's own demo picked an
EUR `ov004` function specifically *because* ov004 was EUR's last
pocket). The queue below is built from USA+JPN, "smallest first" as
instructed, with the EUR-first assumption explicitly noted as moot for
this specific backlog rather than silently dropped.

## Method note

1. Family-census queueing (the prior strategic default) enumerates
   *documented* families — but per the r6 audit, those families cover
   under 3% of the two biggest modules' remaining unmatched functions.
   Singletons (`twin == null`, never attempted) are the other 97%+;
   ignoring them left almost the whole backlog un-queued.
2. Singleton queueing was previously unattractive because a cold,
   context-free unmatched function is expensive to draft from asm
   alone — no sibling to crib from, no recipe to reuse.
3. Brief 604 removed that blocker: `--fewshot` retrieval surfaces
   real, already-matched, structurally-similar functions on demand,
   for *any* target, not just documented-family members.
4. Expected yield, per brief 604's own family-hit@5 evidence
   (23/24 = 95.8% on documented families): most singletons should get
   at least one genuinely relevant retrieved sibling, *not* a
   guarantee every one will — the one real miss in that probe
   (`RowGroup4_Rebuild`) was a genuine structural divergence BM25 over
   bare mnemonics can't bridge, and this queue's own batch E/F entries
   already show the weaker-signal case in the wild (module-scattered,
   no confirmed twin).
5. **Honest caveat:** the retriever surfaces *structure* — a plausible
   shape/idiom neighbor — not a guaranteed match. It cannot verify
   anything; only `ninja sha1` (a real build, in the wine lane) can.
   Treat every "top-5" column below as a drafting aid, not a promise.
6. Tractability scoring here is a transparent, additive heuristic
   (size band + region-pair + confirmed twin + retriever same-module
   signal), not a prediction of match difficulty in the codegen sense
   — codegen-walls.md screening was mechanical (bare `lsl`/`lsr`
   token adjacency) and deliberately conservative; treat any flag as
   "worth a first look," not "confirmed wall."

## Full ranked candidate list (28)

| # | Score | Name | Region | Module | Size | Batch |
|---:|---:|---|---|---|---:|---|
| 1 | +5 | `func_02032074` | JPN+USA | main | 48 | A |
| 2 | +5 | `func_02032ca8` | JPN+USA | main | 48 | A |
| 3 | +5 | `func_02033304` | JPN+USA | main | 60 | A |
| 4 | +5 | `__sinit_ov010_021b88a8` | JPN+USA | ov010 | 72 | B |
| 5 | +5 | `__sinit_ov010_021b88f0` | JPN+USA | ov010 | 72 | B |
| 6 | +5 | `func_ov008_021aa3c0` | JPN+USA | ov008 | 108 | D |
| 7 | +5 | `func_ov017_021b2180` | JPN+USA | ov017 | 108 | D |
| 8 | +5 | `func_ov010_021b2180` | JPN+USA | ov010 | 180 | D |
| 9 | +5 | `func_ov015_021b2180` | JPN+USA | ov015 | 180 | D |
| 10 | +4 | `func_02032bf0` | JPN+USA | main | 52 | A |
| 11 | +4 | `func_0202a1ec` | JPN+USA | main | 60 | A |
| 12 | +4 | `__sinit_ov015_021b5a28` | JPN+USA | ov015 | 60 | B |
| 13 | +4 | `func_02020304` | JPN+USA | main | 64 | C |
| 14 | +4 | `func_020b41bc` | JPN+USA | main | 68 | C |
| 15 | +4 | `func_0201f700` | JPN+USA | main | 80 | C |
| 16 | +4 | `func_0201fc78` | JPN+USA | main | 88 | C |
| 17 | +4 | `func_ov002_021aa3c0` | JPN+USA | ov002 | 184 | E |
| 18 | +3 | `__sinit_ov011_021d3530` | JPN+USA | ov011 | 52 | B |
| 19 | +3 | `func_02031864` | USA | main | 116 | C |
| 20 | +3 | `func_ov014_021b2180` | JPN+USA | ov014 | 816 | F |
| 21 | +3 | `func_ov019_021b2180` | JPN+USA | ov019 | 912 | F |
| 22 | +2 | `func_ov007_021b2180` | JPN+USA | ov007 | 88 | D |
| 23 | +2 | `func_ov023_021b2180` | JPN+USA | ov023 | 100 | D |
| 24 | +2 | `func_ov022_021aa3c0` | JPN+USA | ov022 | 160 | E |
| 25 | +2 | `func_ov018_021aa3c0` | JPN+USA | ov018 | 348 | E |
| 26 | +1 | `func_ov001_021c9c80` | JPN+USA | ov001 | 452 | F |
| 27 | +1 | `func_ov020_021aa3c0` | JPN+USA | ov020 | 476 | E |
| 28 | +0 | `func_ov003_021c9c80` | JPN+USA | ov003 | 872 | F |

Score = size band (tiny ≤0x40: +3, cold-RE knee ≤0x100: +2, marginal
≤0x200: +1, above knee: +0 — brief 277's own established hand-match
threshold) + USA∧JPN pair (+1, port-once opportunity) + confirmed
twin/near-twin (+2, verified by direct mnemonic comparison, not the
retriever) + ≥2 same-module retrieved neighbors (+1) − all-5-neighbors
cross-module with no twin (−1, the brief's explicit "flag and
deprioritize" case).

## Batches (wine-lane grouping, ~4-6 per session)

### Batch A — main tiny singles (5 candidates, 268 B)

All `main`, all <=60B, no confirmed twins -- batched purely on module+size context (shared headers/scratch already warm from the same TU neighborhood).

| Name | Region | Module | Size | Mode | Score | Top-5 retrieved matched siblings |
|---|---|---|---:|---|---:|---|
| `func_02032074` | JPN+USA | main | 48 | arm | +5 | func_ov004_021dd388(ov004), func_0209e7dc(main), func_ov004_021dc2ec(ov004), func_0203c0ec(main), func_02032020(main) |
| `func_02032ca8` | JPN+USA | main | 48 | arm | +5 | func_02020ad0(main), func_020542a0(main), func_02062734(main), func_02020084(main), func_ov000_021ada90(ov000) |
| `func_02032bf0` | JPN+USA | main | 52 | arm | +4 | func_ov000_021ac9cc(ov000), func_ov004_021cbe58(ov004), func_ov004_021d0214(ov004), func_02020ad0(main), func_ov016_021b38e4(ov016) |
| `func_0202a1ec` | JPN+USA | main | 60 | arm | +4 | func_ov004_021cfac0(ov004), func_ov004_021c9eb4(ov004), func_ov005_021abb1c(ov005), func_02013a6c(main), func_ov011_021d2e60(ov011) |
| `func_02033304` | JPN+USA | main | 60 | arm | +5 | func_ov004_021d3c4c(ov004), func_ov002_022abe84(ov002), func_ov002_022abeb8(ov002), func_0201bb88(main), func_02032294(main) |

### Batch B — sinit-trampoline theme (4 candidates, 256 B)

All `__sinit_*` static-init trampolines. The two ov010 members are a **verified byte-for-byte mnemonic twin pair** -- crack one, the other is close to free. ov011/ov015 aren't twins of these two but share the class shape; worth a look once the ov010 pair's recipe is in hand.

| Name | Region | Module | Size | Mode | Score | Top-5 retrieved matched siblings |
|---|---|---|---:|---|---:|---|
| `__sinit_ov010_021b88a8` | JPN+USA | ov010 | 72 | arm | +5 | func_02067280(main), func_0207dbc0(main), func_02007224(main), func_02005ec4(main), func_ov004_021d6608(ov004) |
| `__sinit_ov010_021b88f0` | JPN+USA | ov010 | 72 | arm | +5 | func_02067280(main), func_0207dbc0(main), func_02007224(main), func_02005ec4(main), func_ov004_021d6608(ov004) |
| `__sinit_ov011_021d3530` | JPN+USA | ov011 | 52 | arm | +3 | func_02000ec8(main), func_ov002_021cb15c(ov002), func_ov002_02259274(ov002), func_02031ae4(main), func_ov009_021ab768(ov009) |
| `__sinit_ov015_021b5a28` | JPN+USA | ov015 | 60 | arm | +4 | func_ov010_021b2af8(ov010), func_ov015_021b2af8(ov015), func_ov011_021cc718(ov011), func_ov002_0227afa0(ov002), func_02018b14(main) |

### Batch C — main mid-tier (5 candidates, 416 B)

All `main`, 64-116B, several with 3+ same-module retrieved neighbors -- a real local recipe likely already exists in matched `main` code nearby.

| Name | Region | Module | Size | Mode | Score | Top-5 retrieved matched siblings |
|---|---|---|---:|---|---:|---|
| `func_02020304` | JPN+USA | main | 64 | arm | +4 | func_0202cda4(main), func_ov002_022574ac(ov002), func_ov002_02257b6c(ov002), func_ov002_02257bc0(ov002), func_ov002_02257ba0(ov002) |
| `func_020b41bc` | JPN+USA | main | 68 | arm | +4 | func_0200c268(main), func_020872e4(main), func_02065f04(main), func_020069d8(main), func_ov000_021aad90(ov000) |
| `func_0201f700` | JPN+USA | main | 80 | arm | +4 | func_0201f1a4(main), func_02020164(main), func_0201f268(main), func_ov002_02208670(ov002), func_ov002_0220753c(ov002) |
| `func_0201fc78` | JPN+USA | main | 88 | arm | +4 | func_0201f1a4(main), func_02020164(main), func_0201f268(main), func_ov002_02208670(ov002), func_ov002_0228bb7c(ov002) |
| `func_02031864` | USA | main | 116 | arm | +3 | func_0207ce90(main), func_02076bd8(main), func_ov016_021b87e0(ov016), func_ov016_021b89a4(ov016), func_ov016_021b8a88(ov016) |

### Batch D — overlay-entry-stub cluster (small/mid) (6 candidates, 764 B)

All sit at their module's overlay-swap-group base address (`0x021aa3c0` or `0x021b2180`) -- the first function loaded in the overlay. Two confirmed twin pairs anchor this batch (ov008<->ov017, ov010<->ov015); ov007/ov023 share the same structural role even though not byte-identical to the anchors.

| Name | Region | Module | Size | Mode | Score | Top-5 retrieved matched siblings |
|---|---|---|---:|---|---:|---|
| `func_ov008_021aa3c0` | JPN+USA | ov008 | 108 | arm | +5 | func_0203ecdc(main), func_ov002_0223dda4(ov002), func_02009788(main), func_ov002_02201d84(ov002), func_ov002_0222a558(ov002) |
| `func_ov017_021b2180` | JPN+USA | ov017 | 108 | arm | +5 | func_0203ecdc(main), func_ov002_0223dda4(ov002), func_02009788(main), func_ov002_02201d84(ov002), func_ov002_0222a558(ov002) |
| `func_ov010_021b2180` | JPN+USA | ov010 | 180 | arm | +5 | func_ov003_021ced78(ov003), func_0202edec(main), func_ov012_021ca1c0(ov012), func_ov006_021b6b30(ov006), func_ov010_021b228c(ov010) |
| `func_ov015_021b2180` | JPN+USA | ov015 | 180 | arm | +5 | func_ov003_021ced78(ov003), func_0202edec(main), func_ov012_021ca1c0(ov012), func_ov006_021b6b30(ov006), func_ov010_021b228c(ov010) |
| `func_ov007_021b2180` | JPN+USA | ov007 | 88 | arm | +2 | func_ov005_021acea8(ov005), func_ov009_021ad6f4(ov009), func_ov023_021b2214(ov023), func_ov019_021b25d0(ov019), func_ov014_021b25ec(ov014) |
| `func_ov023_021b2180` | JPN+USA | ov023 | 100 | arm | +2 | func_ov002_02240904(ov002), func_ov002_022431a8(ov002), func_ov002_02244968(ov002), func_ov002_021f6214(ov002), func_ov011_021cfe84(ov011) |

### Batch E — overlay-entry-stub cluster (large, weak signal) (4 candidates, 1168 B)

Same base-address family as batch D, no confirmed twins among these four, retrieved neighbors are real but module-scattered -- deprioritize below D.

| Name | Region | Module | Size | Mode | Score | Top-5 retrieved matched siblings |
|---|---|---|---:|---|---:|---|
| `func_ov002_021aa3c0` | JPN+USA | ov002 | 184 | arm | +4 | func_0208e334(main), func_ov002_0220b940(ov002), func_ov002_02238730(ov002), func_ov002_022035b8(ov002), func_ov002_02203600(ov002) |
| `func_ov022_021aa3c0` | JPN+USA | ov022 | 160 | arm | +2 | func_ov011_021cca14(ov011), func_ov018_021aaaf8(ov018), func_02036474(main), func_ov011_021cc310(ov011), func_ov010_021b228c(ov010) |
| `func_ov018_021aa3c0` | JPN+USA | ov018 | 348 | arm | +2 | func_ov006_021c15cc(ov006), func_ov006_021c5bf4(ov006), func_ov018_021aa6b4(ov018), func_ov010_021b31ac(ov010), func_ov020_021aaa9c(ov020) |
| `func_ov020_021aa3c0` | JPN+USA | ov020 | 476 | arm | +1 | func_02038220(main), func_ov004_021dc1a4(ov004), func_020070c0(main), func_ov004_021cc210(ov004), func_ov004_021da764(ov004) |

### Batch F — overlay-entry-stub cluster (largest, hardest) (4 candidates, 3052 B)

The four biggest candidates (452-912B, all above the cold-RE knee). ov014<->ov019 are a confirmed near-twin pair (shared template, different per-instance content) and anchor the batch; all four repeatedly retrieve the SAME matched-neighbor cluster (`func_ov006_021c15cc`/`021c5bf4`, `func_ov018_021aa6b4`, the `func_ov020_021aa*` family, `func_ov010_021b31ac`), suggesting one shared underlying idiom worth studying once, not four cold starts.

| Name | Region | Module | Size | Mode | Score | Top-5 retrieved matched siblings |
|---|---|---|---:|---|---:|---|
| `func_ov001_021c9c80` | JPN+USA | ov001 | 452 | arm | +1 | func_ov006_021c15cc(ov006), func_ov006_021c5bf4(ov006), func_ov020_021aaa9c(ov020), func_ov018_021aa6b4(ov018), func_ov020_021aa908(ov020) |
| `func_ov003_021c9c80` | JPN+USA | ov003 | 872 | arm | +0 | func_ov006_021c15cc(ov006), func_ov006_021c5bf4(ov006), func_ov018_021aa6b4(ov018), func_ov020_021aaa9c(ov020), func_ov010_021b31ac(ov010) |
| `func_ov014_021b2180` | JPN+USA | ov014 | 816 | arm | +3 | func_ov006_021c15cc(ov006), func_ov006_021c5bf4(ov006), func_ov018_021aa6b4(ov018), func_ov020_021aab10(ov020), func_ov020_021aab98(ov020) |
| `func_ov019_021b2180` | JPN+USA | ov019 | 912 | arm | +3 | func_ov006_021c15cc(ov006), func_ov006_021c5bf4(ov006), func_ov018_021aa6b4(ov018), func_ov020_021aaa9c(ov020), func_ov010_021b31ac(ov010) |

## Cross-module-noise flags (brief's explicit ask)

Seven candidates retrieve **zero** same-module neighbors *and* have no
confirmed twin — the −1 rows in the ranked table above:
`__sinit_ov011_021d3530`, `func_ov007_021b2180`, `func_ov023_021b2180`,
`func_ov022_021aa3c0`, `func_ov001_021c9c80`, `func_ov020_021aa3c0`,
`func_ov003_021c9c80`. Their retrieved siblings aren't necessarily
*wrong* — `func_ov023_021b2180`'s
five neighbors are all real, matched `ov002` functions, consistently —
but a consistently single-foreign-module result is exactly as
consistent with "ov002 is simply the largest matched corpus and
dominates by volume" as with genuine shape similarity. Flagged, scored
down, not excluded — the wine lane should treat these top-5 columns
with more skepticism than the twin-anchored batches.

## Reproduction

```bash
# regenerate the pick-list (needs ripgrep on PATH)
python tools/build_master_ledger.py --pick-lists /tmp/pick-lists.md \
    --output /tmp/master-ledger.jsonl --summary /tmp/summary.md

# per-candidate retrieval (needs a delinked build/usa/ tree)
python tools/configure.py usa && ninja delink
python3 -c "
import sys; sys.path.insert(0, 'tools')
from m2c_feed import find_object, retrieve_fewshot
obj = find_object('usa', 'func_02032074', 'arm-none-eabi-objdump', 'main')
for ex in retrieve_fewshot('usa', obj, 'func_02032074', 5, objdump='arm-none-eabi-objdump'):
    print(ex.name, ex.module, hex(ex.addr))
"
```

Twin/near-twin pairs were confirmed by direct `mnemonics_from_objdump`
comparison (`tools/export_matched_pairs.py`), not by the retriever —
`retrieve_fewshot` can only surface *already-matched* siblings, so it
structurally cannot detect that two still-unmatched candidates share a
shape with each other. That cross-candidate check is this brief's own
addition on top of brief 604's tooling, not something `--fewshot`
does on its own.

## Cross-references

- `docs/research/campaign-analytics/pick-lists.md` — regenerated by
  this brief; see the "Why `pick-lists.md` reads 0" section above.
- `docs/research/brief-604-retriever-go.md` — the retriever this queue
  depends on; family-hit@5 = 23/24, the evidence this brief's method
  note cites.
- `tools/build_master_ledger.py` — the ledger/pick-list generator.
- `tools/m2c_feed.py` (`retrieve_fewshot`, `find_object`) — the
  retrieval + object-lookup machinery this brief calls directly.
- `docs/research/codegen-walls.md` — P-1's `lsl`/`lsr` signature, the
  basis for this brief's mechanical (conservative, unverified) wall
  screen.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
