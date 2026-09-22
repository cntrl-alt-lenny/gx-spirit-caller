### cloud/permuter-vs-p4-validation

**Goal:** Validate whether permuter (brief 063 / PR #473)
recovers byte-identical builds for **P-4 family** walls —
the register-allocation class brief 091 surfaced via
`func_02000cc4`. If yes, P-4 becomes coercible-with-tooling
and the next single-region wave (brief 092) can unwind its
P-4-skipped candidates as permuter passes. If no, P-4 stays
permanent and the skip-rule is calibrated.

**Context — what P-4 currently looks like:**

Brief 091 (PR #484) classified `func_02000cc4` as P-4
family after 75 compiles across 5 source variants × 15 SPs:

- Orig allocates `&ctx` → r5 (higher-numbered), `idx` →
  r4 (lower-numbered).
- mwcc 2.0's usage-order allocator assigns the
  first-loaded operand to the lower-numbered register.
  Every (variant, SP) combination produces the opposite
  ordering.
- `entry_ptr` + `idx_first` variants reach size-match
  (0x48) at most SPs, but registers stay swapped in 6
  positions.
- Source-form interventions (`local_ptrs`, `entry_ptr`,
  `idx_first`, `batched_loads`) all hit the same wall.

**Reason permuter is the right tool:** the wall is in the
allocator's allocation decision, not the source form. A
register-renaming permutation pass can swap r4 ↔ r5 + the
downstream uses while preserving semantics — exactly
permuter's domain.

**Candidates (suggested pool — cloud's discretion):**

1. **`func_02000cc4`** (brief 091, EUR 0x48) — the
   datapoint that motivated the brief. Highest-confidence
   P-4 family member.
2. **1-2 other known P-4 candidates** — cloud may scan
   `docs/research/codegen-walls.md` for P-4 family
   entries from earlier briefs (P-4 appears in the
   permanent walls list). If only `func_02000cc4` is
   currently documented as P-4, that's fine — single-
   datapoint validation is sufficient for this brief.

**Method:**

1. **Bring up permuter** on `func_02000cc4`'s current
   best-attempt `.c` source (the `entry_ptr` variant that
   reaches size-match per brief 091's table). Use
   `tools/permute.py --run` mode (brief 063 D2).

2. **Configure permuter passes:**
   - Register-rename pass (the obvious one — swap r4 ↔ r5
     for the affected scope).
   - Local-reordering pass (helper-call vs ctx-load
     sequencing).
   - Const-fold pass (low-priority; usually doesn't
     affect reg-alloc).

3. **Run** with reasonable iteration cap (1000-10000
   per pass, cloud's call based on permuter's
   throughput). Score function: objdiff bytes-diff
   against EUR baseline.

4. **Outcome tracking:**
   - If any permutation produces a byte-identical match:
     document the winning permutation (which pass, which
     scope, cycle-cost in iterations) as a recipe in
     codegen-walls.md under P-4.
   - If no permutation lands byte-identical in
     reasonable iteration budget: classify P-4 family
     as **confirmed permanent** for the default-tier
     source-form pipeline. Document the iteration cap +
     closest-attempt score as the discriminator.

5. **Repeat for any additional P-4 candidates** the cloud
   surfaces from the catalog.

**Non-scope:**

- ❌ New permuter features (use existing brief 063 D2
  shipped in PR #473 as-is).
- ❌ P-N candidates (`func_02009758`) — those are
  mwcc-version-locked peepholes, not reg-alloc. Permuter
  can't recover those.
- ❌ C-22 / C-23 / S-2 — coercible-with-source already.
- ❌ AGENTS.md / state.md edits.

**Success:**

- Either:
  - **At least one P-4 candidate** recovered byte-
    identical via permuter, recipe documented under P-4
    entry in codegen-walls.md with cycle-cost table.
  - **All tried candidates** failed with full attempt
    log — P-4 confirmed permanent, asm-discriminator +
    skip-rule documented as the brief 091 entry's
    "permuter rule-out" sub-note.
- Per-PR results table: candidate × pass × iterations ×
  closest-score grid.
- Markdown lint clean.

**Branch:** `cloud/permuter-vs-p4-validation`

**Priority:** MEDIUM. Brief 092 (decomper cap-raise to
≤0x80) is the higher-leverage immediate move. Brief 093
runs in parallel; result feeds brief 094 selection (if
permuter recovers, brief 094 becomes "permuter sweep
across all P-4 catalog entries").

**After this brief lands:**

1. **Permuter-recovers case:** brain queues brief 094 as
   a P-4 sweep — run permuter against every known P-4
   datapoint from briefs 057-091. Expected unlock: 3-5
   additional matches. Also folds into brief 092's pool
   if any P-4-skipped candidates remain unwound.
2. **Permuter-rules-out case:** brief 092's skip-list is
   final. Brain's selection rule treats P-4 asm
   discriminator (`mov rN_HIGH, r0; mov rN_LOW, r1`) as
   a hard skip. No further P-4 attempts.
