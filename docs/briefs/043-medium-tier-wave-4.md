### decomper/medium-tier-wave-4

**Goal:** Medium-tier wave 4 with brief 042's W-A coercion newly
available + brief 041's declaration-order lesson + the still-warm
sp2p3 corpus. Re-attack `func_020916c8` (W-A) and pick fresh
candidates. Skip W-B (`func_020467f4`) and W-C (`func_02023fec`)
until brief 044 decides on sp3 routing.

**Context:**

Brief 041 (PR #335) shipped 8 matches across 4 modules; medium
tier moved to 69.9%. Brief 042 (PR #334) updated codegen-walls.md
with 4 new walls + coercion findings:

- **W-A → C-9 coercible** (uninitialised temp trick). Re-attack
  `func_020916c8` with the documented C variation.
- **W-B → T-3** (needs mwcc 1.2/sp3). Skip until brief 044.
- **W-C → T-3 + P-7**. Skip until brief 044.
- **W-D → P-8 permanent**. Skip; no known coercion.

Brief 041 surfaced one provisional new wall (clamped 16-bit add
predicated idiom; `func_0201904c`). Treat as permanent for now;
brief 044 will pick it up if cloud has time.

**Targets:**

1. **Re-attack: `func_020916c8`** — W-A unblock from brief 042.
   The coercion is documented in `docs/research/codegen-walls.md`
   under C-9. Source goes at `src/main/func_020916c8.legacy.c`
   (Style A, IRQ-bracket).

2. **Fresh medium-tier candidates** — pick 5–10 more from
   `next_targets.py`. Mix Style A (`.legacy.c`) and Style B
   (default) per disassembly. Module variety preferred (brief
   041 spread across 4 modules; keep that going).

3. **Skip:** `func_020467f4` (W-B, T-3); `func_02023fec` (W-C,
   T-3); `func_ov000_021ac85c` (W-D, P-8); `func_0201904c`
   (provisional new wall).

**Workflow:**

Standard. Apply brief 041's declaration-order trick when
callee-save register allocation matters
(`r4 ↔ r5` swaps). Apply C-9 (uninitialised temp) for any
`f(prev) ; if (cond) prev = ... ; return prev` shape that
mismatches by an extra `mov rN, #0`.

`find_shape_templates` corpus is now 7 sp2p3-matched .legacy.c
files; tool leverage on Style A targets has compounded since
brief 040.

**Scope / non-scope / verification gate:** identical to brief 041.

**Success:**

- ≥ 6 byte-identical matches.
- Re-attempt of `func_020916c8` documented (matched or not — if
  the C-9 coercion didn't quite work, flag the residual mismatch
  for brief 042's wall page to refine).
- All matches verified locally + `pr-tier-delta` green.

**Branch:** `decomper/medium-tier-wave-4`

## Self-extend clause

Same as brief 041 — up to 2 follow-up waves without fresh brief
if same selection rule (skip the 3 sp3-T-3 + the provisional
clamped-add wall). Constraints:

- One wave per PR.
- Stop after 2 self-extends OR if the medium-tier eligible pool
  drops below 6 viable targets per wave OR if a NEW
  systemic wall (not just per-target codegen quirks) appears.

If self-extend continues working, brain considers graduating it
to AGENTS.md as the standard medium-tier workflow.

**After this brief lands:**

1. Brain refreshes state.md + cluster yield record.
2. If brief 044 has shipped a sp3 routing tier, brain queues a
   small wave specifically for the W-B/W-C/T-3 targets.
3. If easy tier still has stragglers worth picking, brain may
   queue an opportunistic wave there too — easy tier has been
   parked at 81.5% since brief 033.
