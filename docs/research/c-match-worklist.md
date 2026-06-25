[//]: # (markdownlint-disable MD013 MD041)

# Brief 490 — EUR `.s` -> clean-C matchability triage (campaign worklist)

Read-only triage of the **6,573 EUR function `.s`** (2,802 main + 3,771 overlays; data `.s` excluded). Deterministic feature/clone pre-pass + a **133-agent read-only swarm** that refined the heuristic-tractable claims (history warns those are over-counted). No builds, no carves — collision-free with the decomper.

## Headline — TRACTABLE vs HARD vs SPECIAL

By realistic **tractability** (the swarm's sober call — the number that drives the time estimate):

| tractability | funcs | bytes |
|---|---:|---:|
| HIGH (draft/reshape matches) | 1,300 | 117,732 |
| MED (recipe + iteration) | 2,770 | 462,962 |
| LOW (permuter-territory) | 2,288 | 1,248,958 |
| NEVER (scheduling/coin-flip — stays .s) | 215 | 341,344 |
| **TRACTABLE (high+med)** | **4,070** | **580,694** |

By **difficulty class** (the brief's A-D / E-F / G split):

| group | classes | funcs | bytes |
|---|---|---:|---:|
| TRACTABLE | A-D | 4,321 | 654,070 |
| HARD | E-F | 2,188 | 1,501,472 |
| SPECIAL | G | 64 | 15,454 |

Per-class:

| class | meaning | funcs | bytes |
|---|---|---:|---:|
| A | clean/leaf | 1,157 | 105,184 |
| B | peephole/commutative | 432 | 47,926 |
| C | reg-alloc/decl-order | 1,250 | 218,884 |
| D | bitfield/divmod/store-order | 1,482 | 282,076 |
| E | scheduling/coin-flip/post-blx (permuter) | 495 | 129,700 |
| F | big-body/render/loop-reg-alloc | 1,693 | 1,371,772 |
| G | Thumb/data/SDK | 64 | 15,454 |

## Top clone clusters (crack-once-propagate targets)

Only **526 funcs sit in 194 multi-member clusters** (clones are rare here); the rest are structurally unique. The biggest families:

| cluster | members | dominant class | module(s) |
|---|---:|---|---|
| 0 | 16 | B | main |
| 1 | 14 | A | ov002 |
| 2 | 13 | A | ov002 |
| 3 | 9 | E | ov001,ov004,ov011,ov012,ov013,ov015,ov020,ov022 |
| 4 | 8 | D | ov002 |
| 5 | 7 | D | main |
| 6 | 7 | A | main |
| 7 | 7 | A | ov002 |
| 8 | 7 | B | ov002,ov009,ov014,ov016,ov017,ov019,ov023 |
| 9 | 6 | D | ov002 |
| 10 | 6 | C | ov002 |
| 11 | 6 | F | ov004,ov005,ov008,ov009,ov014,ov016 |
| 12 | 5 | A | ov002 |
| 13 | 5 | D | ov002 |
| 14 | 5 | D | ov002 |

## Prioritized campaign order

1. **Clone clusters that are A/B-class** (crack one, propagate to all members) — highest leverage.
2. **A (clean/leaf), HIGH** singletons — draft-C matches: 1,157 funcs / 105,184 bytes.
3. **B (peephole/commutative), HIGH** — reshape recipes: 432 funcs / 47,926 bytes.
4. **C (reg-alloc), MED** — register-reuse recipes: 1,250 funcs / 218,884 bytes.
5. **D (bitfield/divmod/store-order), MED** — special recipes: 1,482 funcs / 282,076 bytes.
6. STOP at E/F — permuter-class / big-body, ~0 clean-C yield; **leave as `.s`**.

## Honest tractable-count (the input to the time estimate)

ALL 6,573 funcs were swarm-judged (no extrapolation). Read this number with TWO lenses, because they diverge sharply:

- **By func count:** 4,070 (62%) are tractable (HIGH+MED). But that splits into **1,300 HIGH** (a clean-C draft or a known reshape recipe matches — the reliable core) and **2,770 MED** (needs a register-reuse / bitfield / divmod / store-order recipe + iteration — PARTIAL historical yield; the permuter/clean-C record shows these recipes flip SOME, not all).
- **By bytes (the truer effort signal):** tractable is only **580,694 of 2,170,996 bytes (27%)**. The tractable funcs are SMALL (leaf accessors, ~143 B avg); the mass — the 1,371,772-byte F big-body / render / loop-reg-alloc tier — is wall. So 62% of the funcs but only 27% of the code is realistically matchable.

A notable correction: the swarm reclassified **38% of the heuristic-'hard' (E/F) tier as actually tractable** — mostly simple counted loops the naive 'any-loop -> permuter' rule mis-binned. So the real reg-alloc/scheduling WALL is **2,288 LOW + 215 NEVER = 2,503 funcs / 1,590,302 bytes (73% of code)** — smaller by count than the ~46%-walled lore, but it owns most of the bytes.

**Bottom line for the time estimate:** budget the campaign against ~**1,300 HIGH funcs as near-certain matches** (plus the A/B clone clusters — crack-once), and the ~**2,770 MED funcs as the grind** (attemptable with recipes, expect a partial landing — realistically ~half match cleanly, the rest fall back to `.s`). Do NOT budget the 2,503 LOW/NEVER or the big-body F mass — they are the permuter walls and stay `.s`. Realistic clean-C landing zone: **~1,300-2,685 funcs** (the HIGH core + a fraction of MED), NOT the full 6,573.

Full per-func records (addr, class, tractability, cluster, note) in `c-match-worklist.json`. Methodology: deterministic feature/clone pre-pass (`build/triage_prepass.py`) + a read-only multi-agent swarm (294 agents across the run + redo passes) that judged EVERY func's class + tractability from its asm — no builds, no carves.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
