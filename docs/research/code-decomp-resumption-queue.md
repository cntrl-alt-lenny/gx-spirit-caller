# Code-decomp resumption queue — 52 ranked candidates

**Brief:** 187 Part 2 (scaffolder). The team has shipped 39
post-SHA1 briefs in 9 days — 8 patcher, 16 data clusters, 7
data-routing fixes, 4 tooling, 4 research. **Zero code-decomp
briefs.** With brief 182 (decomper, in flight) about to close
the W7 patcher chain at n=0, the team is ready to pivot. This
note publishes the ranked candidate queue brief 188+ should
drain.

## Context

| Metric | Pre-pivot value | Source |
|---|---|---|
| Matched data | **86.14 %** | `tools/progress.py` (delinks-based) |
| Matched code (delinks approx) | 0.70 % | `tools/progress.py` |
| Matched code (objdiff-verified) | **1.40 %** | `build/eur/report.json` (brief 187 Part 1) |
| Matched functions (objdiff-verified) | **14.78 %** (1,420 / 9,608) | `build/eur/report.json` |

The objdiff-verified percentages are the canonical metric.
`tools/progress.py`'s number is an under-counted approximation;
the objdiff-verified `matched_code_percent` from
`build/eur/report.json` (unblocked by brief 187 Part 1's filter)
is what brief 188+ should track.

## Selection methodology

`tools/next_targets.py --version eur` enumerates unmatched
functions per `analyze_symbols.classify`'s tier ladder, filters
against `config/eur/**/delinks.txt` `complete` markers, and
sorts easiest-first. Brief 187's queue picks ~50 candidates
across three buckets the brief defined:

- **Trivial** (size ≤ 0x20, no outgoing calls): leaf stubs,
  bit getters. 12 picks of 166 in the pool.
- **Easy** (size ≤ 0x60, ≤ 2 outgoing calls): wrappers, simple
  helpers, BIOS-svc thunks. 25 picks of 2,142 in the pool.
- **Medium-easy** (size ≤ 0x100, ≤ 4 outgoing calls): simple
  control flow + a few helper calls. 15 picks of 2,958 in the
  pool.

Total queue: **52 candidates** (the ≥ 50 brief target). The full
unranked list is at `build/eur/analysis/next_targets.md` —
8,183 unmatched functions total, sliceable by tier / module
via `tools/next_targets.py`'s flags.

## Known walls to consult before picking

Always cross-check candidates against `docs/research/codegen-walls.md`'s
wall taxonomy:

- **C-15** — flat-thunk arg-setup constant-pair: `.legacy.c` routing.
- **C-22** — adjacent-bitfield syntax: declare separate bitfields per
  window (default SP).
- **C-23** — MMIO base-folding + ANDS→TST: `.legacy.c` routing (DS
  HW divider, GX matrix, timers).
- **C-24** — indirect-call dispatch with pool-dedup: `.legacy_sp3.c`
  routing.
- **C-26** — same routing family as C-23 (related peephole shape).
- **P-1** — mwcc 2.0 mask-collapse on bit-flag tests: refactor source
  to avoid.
- **S-1** — struct padding off-by-one alignment scan.

Each candidate row's `reason` column hints at the function's
shape; cross-reference against the wall entry's "Recognition cue"
section before opening a decomp.me scratch. The `docs/decomp-workflow.md`
refresh in this same PR documents the routing-decision flow.

## Approach hints per bucket

- **Trivial:** Direct-write the C source from disassembly
  inspection. Most are `bx lr` stubs, single-instruction
  returns, or thunks that mirror an already-named adjacent
  function. decomp.me scratch unnecessary for cases this small.

- **Easy:** Use decomp.me scratch + `tools/scratch_bundle.py
  --prompt` to seed the LLM context. Mwccarm 2.0/sp1p5 default
  routing handles most cases. Check `docs/decomp-workflow.md` §
  *Routing decision* if the asm has any of the wall signatures.

- **Medium-easy:** Same as easy, but more likely to surface
  codegen walls. `tools/permute.py` (brief 098) stages a
  decomp-permuter workspace if the match is close-but-not-byte-
  identical. `tools/find_callsites.py` helps when call-context
  type info matters.

## Candidate queue

## Trivial (≤ 0x20, no calls) — 12 picks


| # | Module | Addr | Size | Calls | Name | Reason |
|---|--------|------|-----:|------:|------|--------|
| 1 | `ov003` | `0x021ca2b8` | `0x4` | 0 | `func_ov003_021ca2b8` | leaf, 4B - likely `bx lr` or SWI stub |
| 2 | `main` | `0x020a9914` | `0x8` | 0 | `func_020a9914` | leaf, 8B, no outgoing calls |
| 3 | `ov004` | `0x021dbdbc` | `0x8` | 0 | `func_ov004_021dbdbc` | leaf, 8B, no outgoing calls |
| 4 | `ov004` | `0x021dbdd0` | `0x8` | 0 | `func_ov004_021dbdd0` | leaf, 8B, no outgoing calls |
| 5 | `ov004` | `0x021de280` | `0x8` | 0 | `func_ov004_021de280` | leaf, 8B, no outgoing calls |
| 6 | `main` | `0x02074e4c` | `0xc` | 0 | `func_02074e4c` | leaf, 12B, no outgoing calls |
| 7 | `main` | `0x0208b0f0` | `0xc` | 0 | `func_0208b0f0` | leaf, 12B, no outgoing calls |
| 8 | `main` | `0x0208b0fc` | `0xc` | 0 | `func_0208b0fc` | leaf, 12B, no outgoing calls |
| 9 | `main` | `0x0209085c` | `0xc` | 0 | `func_0209085c` | leaf, 12B, no outgoing calls |
| 10 | `main` | `0x020b3808` | `0xc` | 0 | `func_020b3808` | leaf, 12B, no outgoing calls |
| 11 | `ov002` | `0x021b91c4` | `0xc` | 0 | `func_ov002_021b91c4` | leaf, 12B, no outgoing calls |
| 12 | `ov004` | `0x021dbdc4` | `0xc` | 0 | `func_ov004_021dbdc4` | leaf, 12B, no outgoing calls |

**Recommended approach:** Leaf functions, often `bx lr` / single-instruction stubs. Direct-write the C source from disassembly inspection. decomp.me scratch unnecessary for cases this small.

## Easy (≤ 0x60, ≤ 2 calls) — 25 picks


| # | Module | Addr | Size | Calls | Name | Reason |
|---|--------|------|-----:|------:|------|--------|
| 1 | `ov013` | `0x021c9d60` | `0x14` | 1 | `func_ov013_021c9d60` | 1 callees, none named yet |
| 2 | `ov012` | `0x021c9d8c` | `0x14` | 1 | `func_ov012_021c9d8c` | 1 callees, none named yet |
| 3 | `ov004` | `0x021d3dc8` | `0x14` | 1 | `func_ov004_021d3dc8` | 1 callees, none named yet |
| 4 | `ov011` | `0x021ca0ac` | `0x18` | 2 | `func_ov011_021ca0ac` | 2 callees, none named yet |
| 5 | `ov004` | `0x021cb278` | `0x18` | 1 | `func_ov004_021cb278` | 1 callees, none named yet |
| 6 | `ov004` | `0x021dbddc` | `0x18` | 1 | `func_ov004_021dbddc` | 1 callees, none named yet |
| 7 | `ov004` | `0x021dbe40` | `0x1a` | 1 | `func_ov004_021dbe40` | 1 callees, none named yet |
| 8 | `main` | `0x0205da2c` | `0x1c` | 1 | `func_0205da2c` | 1 callees, none named yet |
| 9 | `ov004` | `0x021cdd1c` | `0x1c` | 2 | `func_ov004_021cdd1c` | 2 callees, none named yet |
| 10 | `ov004` | `0x021cfb84` | `0x1c` | 2 | `func_ov004_021cfb84` | 2 callees, none named yet |
| 11 | `ov002` | `0x02211808` | `0x1c` | 1 | `func_ov002_02211808` | 1 callees, none named yet |
| 12 | `main` | `0x02095108` | `0x28` | 1 | `func_02095108` | 40B, all 1 callees already named |
| 13 | `main` | `0x02095130` | `0x28` | 1 | `func_02095130` | 40B, all 1 callees already named |
| 14 | `main` | `0x020951a8` | `0x28` | 1 | `func_020951a8` | 40B, all 1 callees already named |
| 15 | `ov011` | `0x021d2c64` | `0x28` | 1 | `func_ov011_021d2c64` | 40B, all 1 callees already named |
| 16 | `main` | `0x02094d18` | `0x34` | 1 | `SNDi_SetTrackParam` | already named (SNDi_SetTrackParam) |
| 17 | `main` | `0x0201904c` | `0x3c` | 1 | `func_0201904c` | 60B, all 1 callees already named |
| 18 | `itcm` | `0x01ff8770` | `0x50` | 2 | `func_01ff8770` | 80B, all 2 callees already named |
| 19 | `main` | `0x020323f4` | `0x58` | 2 | `func_020323f4` | 88B, all 2 callees already named |
| 20 | `ov011` | `0x021ca03c` | `0x58` | 1 | `func_ov011_021ca03c` | 88B, all 1 callees already named |
| 21 | `main` | `0x02001d0c` | `0x5c` | 1 | `func_02001d0c` | 92B, all 1 callees already named |
| 22 | `main` | `0x0200b0c8` | `0x5c` | 1 | `func_0200b0c8` | 92B, all 1 callees already named |
| 23 | `main` | `0x0201a32c` | `0x5c` | 1 | `func_0201a32c` | 92B, all 1 callees already named |
| 24 | `ov011` | `0x021d2ca8` | `0x5c` | 1 | `func_ov011_021d2ca8` | 92B, all 1 callees already named |
| 25 | `main` | `0x0207391c` | `0x60` | 2 | `func_0207391c` | 96B, all 2 callees already named |

**Recommended approach:** Wrappers, simple helpers, BIOS-svc thunks. Use decomp.me scratch + `tools/scratch_bundle.py --prompt` to seed the LLM context. Mwccarm 2.0/sp1p5 default routing.

## Medium-easy (≤ 0x100, ≤ 4 calls) — 15 picks


| # | Module | Addr | Size | Calls | Name | Reason |
|---|--------|------|-----:|------:|------|--------|
| 1 | `main` | `0x0207dbf8` | `0x64` | 1 | `func_0207dbf8` | 100B, all 1 callees already named |
| 2 | `main` | `0x0200b2f4` | `0x68` | 1 | `func_0200b2f4` | 104B, all 1 callees already named |
| 3 | `main` | `0x0203d078` | `0x68` | 1 | `func_0203d078` | 104B, all 1 callees already named |
| 4 | `main` | `0x0207db8c` | `0x6c` | 1 | `func_0207db8c` | 108B, all 1 callees already named |
| 5 | `main` | `0x02096434` | `0x6c` | 2 | `func_02096434` | 108B, all 2 callees already named |
| 6 | `main` | `0x0200ed48` | `0x70` | 1 | `func_0200ed48` | 112B, all 1 callees already named |
| 7 | `main` | `0x02023f7c` | `0x70` | 2 | `func_02023f7c` | 112B, all 2 callees already named |
| 8 | `main` | `0x02026fd8` | `0x70` | 2 | `func_02026fd8` | 112B, all 2 callees already named |
| 9 | `main` | `0x02093dc8` | `0x70` | 2 | `func_02093dc8` | 112B, all 2 callees already named |
| 10 | `itcm` | `0x01ff86fc` | `0x74` | 2 | `func_01ff86fc` | 116B, all 2 callees already named |
| 11 | `main` | `0x02021b38` | `0x74` | 1 | `func_02021b38` | 116B, all 1 callees already named |
| 12 | `main` | `0x02024574` | `0x74` | 1 | `func_02024574` | 116B, all 1 callees already named |
| 13 | `main` | `0x020270d0` | `0x74` | 1 | `func_020270d0` | 116B, all 1 callees already named |
| 14 | `main` | `0x02028790` | `0x74` | 1 | `func_02028790` | 116B, all 1 callees already named |
| 15 | `main` | `0x020904d4` | `0x9c` | 1 | `OSi_PostIrqEvent` | already named (OSi_PostIrqEvent) |

**Recommended approach:** Simple control flow + a handful of helper calls. Check `docs/research/codegen-walls.md` for known walls (C-15 / C-22 / C-23 / C-24 / C-26 routing decisions) before attempting. Permuter via `tools/permute.py` may help on near-matches.

## Note on `next_targets.py` output

The full output at `build/eur/analysis/next_targets.md` carries
"[NB: <module> module checksum failing]" parentheticals on
many entries — those are stale from before brief 140's
3-region SHA1 PASS landed (\`tools/next_targets.py:reason\` was
written when ov004 / main / DTCM were the documented red
modules). The notes are harmless but no longer accurate; brief
187 strips them from this curated queue. If brief 188+ wants
the rest of the worklist with up-to-date notes, regenerate
via:

```bash
python tools/next_targets.py --version eur
# Then strip the stale "NB" notes if needed.
```

A small follow-up brief could refresh `next_targets.py:reason`
to drop the obsolete checksum-failing annotation — flagged but
out of scope for brief 187.

## See also

- [`docs/decomp-workflow.md`](../decomp-workflow.md) — brief 187
  Part 3 (refreshed workflow doc; assumes `ninja report` works).
- [`docs/research/objdiff-arm-crash-workaround.md`](objdiff-arm-crash-workaround.md)
  — brief 187 Part 1 (the upstream crash + filter that unblocks
  this queue's progress metric).
- [`docs/research/codegen-walls.md`](codegen-walls.md) — the
  wall taxonomy decomper should consult before each pick.
- [`build/eur/analysis/next_targets.md`](../../build/eur/analysis/next_targets.md)
  — the full ranked worklist (regenerable via `tools/next_targets.py`).
- [`build/eur/report.json`](../../build/eur/report.json) — the
  canonical objdiff metric, regenerable via `ninja report`.
