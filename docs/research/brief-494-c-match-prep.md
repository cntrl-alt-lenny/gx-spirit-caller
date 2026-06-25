[//]: # (markdownlint-disable MD013 MD041)

# Brief 494 — C-match campaign-prep bundle (HIGH-tractability funcs)

**336 ready-to-build C match-candidates** for the HIGH-tractability EUR `.s` funcs (the A/B + a few C/D tier from the brief-490 worklist). Build-free: each candidate was reasoned from the function's target `.s` + the project's register-reuse recipe library (m2c was unavailable in this env — no `tools/_vendor/m2c`/WSL clone — so candidates are reasoning-derived, which suits the simple A/B tier). Collision-free: written only under `docs/research/c-match-prep/`.

## How the campaign uses this

Per func: **drop `docs/research/c-match-prep/<addr>.c` into `src/<module>/` → `ninja` → `objdiff`**. If <100%, the candidate's header `risk:` note says the likely codegen delta to tweak (reg-alloc temp, struct offset, store order, divisor magic…). The candidate is UNVERIFIED — it stays in the prep area until it byte-matches.

## Confidence (swarm's first-build-match estimate)

| confidence | funcs |
|---|---:|
| high | 124 |
| med | 159 |
| low | 53 |

## Recipe coverage (top)

| recipe | funcs |
|---|---:|
| GetSystemWork bitfield-guard + | 8 |
| counted loop | 4 |
| clone of 5800 | 3 |
| guard chain | 3 |
| guard | 3 |
| chained-eq membership (|| of = | 3 |
| lock/call/unlock wrapper | 3 |
| null-default-to-global + singl | 3 |
| GUARD/DISPATCH switch + TAIL C | 2 |
| DISPATCH switch -> jump-table | 2 |
| GUARD chain | 2 |
| guard/branch-tail | 2 |

Per-func index (addr, module, class, recipe, risk, confidence): `c-match-prep/INDEX.json`. Next tier (the 2453 MED C/D funcs) is the follow-up prep wave.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
