[//]: # (markdownlint-disable MD013 MD041)

# Brief 496 — C-match campaign-prep, MED tier (class C/D)

Extends the brief-494 prep bundle (1,291 HIGH candidates) with **2699 MED-tier candidates** — class C (reg-alloc / decl-order) + class D (bitfield / divmod / store-order). Same build-free shape: each was reasoned from the function's target `.s` + the class recipe into a ready-to-build `docs/research/c-match-prep/<addr>.c`. `INDEX.json` now covers both tiers (3990 total: 1291 high + 2699 med).

## The MED tier needs iteration — read the risk flag

Unlike the HIGH tier, these rarely byte-match on the first build. Every candidate's header carries a **specific codegen-risk flag** classifying the most likely divergence so the campaign knows the move:

| risk class | meaning | campaign move | funcs |
|---|---|---|---:|
| reshape-able | a C rewrite should close it (decl-order, bind/reload, operand-order…) | iterate the C | 925 |
| permuter-class | register rotation / scheduling coin-flip | run permuter or escape to .s | 1029 |
| struct-guessed | offsets/sizes inferred | confirm the struct, then rebuild | 738 |
| other | see the note | read the risk line | 7 |

## Confidence + class

| | funcs |
|---|---:|
| class C (reg-alloc/decl-order) | 1236 |
| class D (bitfield/divmod/store-order) | 1463 |
| confidence high | 107 |
| confidence med | 1508 |
| confidence low | 1084 |

## How the campaign uses it

Drop `<addr>.c` into `src/<module>/` → `ninja` → `objdiff`. If <100% (expected here), the header `risk:` line names what to tweak. reshape-able → edit the C; permuter-class → `tools/permuter` or ship the `.s`; struct-guessed → fix offsets first. Candidates stay in the prep area until they byte-match. Per-func data: `c-match-prep/INDEX.json` (filter `tier=med`).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
