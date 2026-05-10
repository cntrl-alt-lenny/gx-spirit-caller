### cloud/codegen-walls-c13-plus-r2-research

**Goal:** Two-part docs/research brief —

1. **Fold C-13** (predicated if-X order) into `codegen-walls.md`
   from brief 047 wave 9 (PR #357).
2. **Investigate the wave-9 provisional reg-alloc wall**
   (`func_ov002_021fbba8`, `_02243740` — target uses r2 for
   cmp-scratch, mwcc picks r1). Sweep C variations + mwcc SP
   versions to classify as coercible (C-N), tooling-tractable
   (T-N), edge case (E-N), or permanent (P-N).

**Context:**

Brief 047 wave 9 (PR #357) shipped 11/15 with 4 drops:

- 2 of 4 → P-1 (already documented permanent): `func_ov002_02211808`,
  `_0223fd10`. No work needed; codegen-walls.md cross-reference
  table just needs the rows added.
- 2 of 4 → **provisional reg-alloc wall**:
  `func_ov002_021fbba8`, `_02243740`. Decomper noted: "Target
  uses r2 for cmp-scratch; mwcc picks r1. Tried 2-arg signature
  (reserve r1) — didn't flip." This is the wall to research.

The same PR also surfaced **C-13** (predicated if-X order):
> when both branches are predicated, source order of the if-blocks
> determines emitted instruction order

That's a fold-only update; the research already happened in wave
9.

**Scope (part 1, fold C-13):**

- Add C-13 entry to `docs/research/codegen-walls.md` mirroring
  C-9/C-10/C-11's shape:
  - Worked example from `func_ov002_021b41e8` (wave 9 PR body
    has it).
  - "Use when": both branches use predication; source order
    flips emission order.
  - "How brief 047 missed it" provenance link to the wave 9 PR.
- Update C-N quantification + bucket count in the doc's
  intro/summary table.
- Add brief 047 wave 9's drops to the cross-reference table:
  - 2 P-1 rows (already documented; just attribution).
  - 2 rows for the provisional reg-alloc wall as **W-F**
    pending part 2's verdict.

**Scope (part 2, r2 reg-alloc research):**

Same method order brief 048 used:

1. **C-variation sweep** (~10 shapes against
   `func_ov002_021fbba8` with mwcc 2.0/sp1p5):
   - 2-arg, 3-arg signatures with different positional types
   - Explicit `register int x asm("r2")` if mwcc supports it
   - Inline-asm preamble that establishes r2 then proceeds
   - Different argument types (int vs unsigned int vs pointer)
   - Decomper tried "reserve r1 with 2-arg signature" — didn't
     flip. Document what they did, then try the rest.

2. **mwcc-version sweep** across all 15 SPs (1.2/* + 2.0/*) in
   case some SP picks r2 by default.

3. **Inline-asm hypothesis** if neither (1) nor (2) coerces.

**Verdict update W-F to one of:**
- C-N (coercible) → next decomper brief unblocks both targets.
- T-N (new SP / tier) → potential future routing tier.
- E-N (edge case, asm-only) → mark for `.s` file route.
- P-N (permanent) → defer; mark in cross-reference.

**Non-scope:**

- ❌ Implementing any new tooling or routing tier (separate
  brief if (T-N)).
- ❌ src/, libs/, AGENTS.md, state.md edits.
- ❌ Other walls beyond C-13 fold + W-F research.

**Success:**

- C-13 entry in codegen-walls.md (fold-only — no new research
  needed).
- W-F entry with verdict + evidence.
- Markdown lint clean (run locally).

**Branch:** `cloud/codegen-walls-c13-plus-r2-research`

**Priority:** Medium. Decomper's brief 049 explicitly skips W-F
candidates so they aren't blocked. C-13 fold is fast (~30 min);
W-F research is the time-consuming part.

**After this brief lands:**

1. If W-F is C-N → small decomper brief unblocking
   `func_ov002_021fbba8` + `_02243740`.
2. Otherwise W-F entry stays as documented permanent / edge.
