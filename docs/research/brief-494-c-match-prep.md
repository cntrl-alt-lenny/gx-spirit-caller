[//]: # (markdownlint-disable MD013 MD041)

# Brief 494 — C-match campaign-prep bundle (HIGH-tractability funcs)

**1186 ready-to-build C match-candidates** for the HIGH-tractability EUR `.s` funcs (the A/B + a few C/D tier from the brief-490 worklist). Build-free: each candidate was reasoned from the function's target `.s` + the project's register-reuse recipe library (m2c was unavailable in this env — no `tools/_vendor/m2c`/WSL clone — so candidates are reasoning-derived, which suits the simple A/B tier). Collision-free: written only under `docs/research/c-match-prep/`.

## How the campaign uses this

Per func: **drop `docs/research/c-match-prep/<addr>.c` into `src/<module>/` → `ninja` → `objdiff`**. If <100%, the candidate's header `risk:` note says the likely codegen delta to tweak (reg-alloc temp, struct offset, store order, divisor magic…). The candidate is UNVERIFIED — it stays in the prep area until it byte-matches.

## Confidence (swarm's first-build-match estimate)

| confidence | funcs |
|---|---:|
| high | 372 |
| med | 617 |
| low | 197 |

## Recipe coverage (top)

| recipe | funcs |
|---|---:|
| counted loop | 10 |
| bitfield bit0 | 9 |
| GetSystemWork bitfield-guard + | 8 |
| id bitfield | 8 |
| relative-offset table walk | 7 |
| guard-branch + bind-vs-reload  | 7 |
| guard-chain | 6 |
| scan loop | 6 |
| guard==0 | 6 |
| DISPATCH switch returning cons | 5 |
| guard (handle!=-1 && n>imm) -> | 5 |
| sign-bit flag | 5 |

Per-func index (addr, module, class, recipe, risk, confidence): `c-match-prep/INDEX.json`. Next tier (the 2453 MED C/D funcs) is the follow-up prep wave.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
