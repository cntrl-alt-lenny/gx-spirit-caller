### cloud/diff-to-coercion-suggester

**Goal:** Build `tools/suggest_coercion.py` — a rule engine that
reads objdiff's machine-readable diff output for an unmatched
function and surfaces candidate codegen-walls.md entries with
their recipes. v0 covers the 5-7 most-frequent walls. Replaces a
chunk of the manual "stare at diff → look up wall in
codegen-walls.md → pick coercion" iteration loop with a one-line
tool invocation.

**Context:**

Every decomper iteration cycle (typically 3-8 per match) involves
reading the objdiff output and pattern-matching against the
codegen-walls.md catalog. The catalog has ~21 structured entries
(C-N coercible, P-N permanent, S-N source-layout, W-letter named,
plus subfamilies like C-1r / C-2a / C-20a) — each with a "Pattern"
section and "How to spot it in the diff" section. The diagnostic
signatures are already structured enough for a rule engine to
surface candidates automatically.

Wave 24 + 25 of brief 060 shipped 20 matches at 80% combined
yield, but the per-match iteration time is still dominated by this
manual diff-reading step. A rule engine that resolves the right
wall on cycle 1-2 in ~60% of cases is roughly a 2-3x iteration-
time speedup, which roughly doubles per-wave throughput.

**Method:**

1. **objdiff JSON output as the input.** Run
   `objdiff-cli diff --format json <function>` to get
   machine-readable diff data (per-instruction differences with
   register names, immediate values, opcode changes). This is the
   tool's input.

2. **Rule library, one rule per wall.** v0 covers the highest-
   frequency walls from the codegen-walls catalog:

   | Wall | Diff fingerprint | Suggestion |
   |---|---|---|
   | **C-1 / C-1r** | predicated body interleaved with fallback, ordering differs | "Try ternary form (or reverse-ternary)" |
   | **C-15 / W-G** | `sub rN, rM, #1` (mwcc) vs `mvn rN, #0` (target) on a −1 constant | "Route via `.legacy.c` (mwcc 1.2/sp2p3)" |
   | **C-16 / W-H** | `ldr ip` vs `ldr r1` on tail-call target | "C-coercion via 4-arg signature, see C-16 entry" |
   | **C-20 / C-20a** | halfword-pack triplet or byte-pack quad shape | "Route `.legacy.c` for halfword; inline-asm recipe for byte-pack (C-20a)" |
   | **C-21** | ternary-emitted-as-constant-load shape | "Try explicit-K ternary form" |
   | **S-1** | uniform `+K` offset shift on all `ldr/str` after a `char _pad[]` field | "Check `_pad` size — see S-1 worked example" |
   | **Cascade (S-1 variants b+c)** | downstream-TU mis-place OR cross-`.o` BL pool literal off-target | "Suspect upstream TU is wall-blocked; drop it from delinks.txt" |
   | **P-1** | `lsl K; lsr K` (target) vs `and #mask` (mwcc) on zero-extend | "Permanent wall — abandon this candidate, all SPs hit" |

3. **Output format.** For each candidate match:

   ```
   $ python tools/suggest_coercion.py func_02123456
   Reading objdiff output for func_02123456 (size 0x30, main)...

   2 candidate walls detected:

   [HIGH] C-15 / W-G — mvn-vs-sub peephole on -1 constant
     Diff signature: `sub r1, r0, #1` at line 4 (target uses `mvn r1, #0`)
     Recipe: route via `.legacy.c` (rename to func_02123456.legacy.c)
     Reference: docs/research/codegen-walls.md#c-15--w-g-mvn-vs-sub-peephole
     Verified in: 4 prior decomper PRs

   [LOW] S-1 (variant b — cascade) — possible downstream mis-place
     Diff signature: uniform +4 shift across 6 ldr/str instructions
     But: no recent upstream-TU addition in delinks.txt → low confidence
     Reference: docs/research/codegen-walls.md#s-1-padding-off-by-one

   Recommended order to try: HIGH first.
   ```

4. **Confidence model.** Each rule has a primary signature (must
   match) and a set of corroborating signals (boost / dampen
   confidence). HIGH = primary + ≥2 corroborating. MEDIUM = primary
   + 1 corroborating. LOW = primary only or weak signature match.

5. **Reuse existing infrastructure.** Read codegen-walls.md as the
   source of truth for the recipes — the tool prints anchors into
   the doc rather than restating the recipes. That way the doc
   stays the single source of truth and new walls can be added by
   editing the doc + adding one rule (no tool churn for content).

**Test plan:**

- Unit tests per rule: feed each rule a minimal synthetic objdiff
  JSON snippet with the wall's primary signature, assert the rule
  fires at HIGH/MEDIUM/LOW as expected.
- Integration test: pick 3-5 historical decomper PRs where the
  wall was identified manually, run the tool against the
  pre-fix diff, assert it would have surfaced the right wall.
  This validates v0 against real decomper iteration history.

**Non-scope:**

- ❌ **Auto-applying the coercion.** Tool only *suggests*;
  decomper still writes the C and verifies via objdiff. The tool
  is iteration-assist, not auto-match.
- ❌ Covering all 21 walls in v0. Start with the 5-7 most-
  frequent; the rule library is extensible by design.
- ❌ Replacing `codegen-walls.md` as the reference doc. The tool
  prints anchors into the doc, never duplicates the recipes.
- ❌ Modifying objdiff / objdiff-cli upstream.
- ❌ src/, libs/, AGENTS.md, state.md edits.

**Success:**

- `tools/suggest_coercion.py` works on the wave 24 + 25 PR
  candidates' diffs and surfaces the right wall in ≥60% of cases.
- Unit tests cover each shipped rule.
- Integration test against ≥3 historical decomper PRs passes.
- Markdown lint + ruff clean. tools-index regen current.

**Branch:** `cloud/diff-to-coercion-suggester`

**Priority:** MEDIUM-HIGH — compounds across every future
decomper wave. Lower ceiling than brief 061 (which can unlock
entire regions) but lower risk and faster to ship. Independent
of 061 — both can run in parallel without interaction.

**After this brief lands:**

1. Decomper picks up the tool on the next wave and reports
   actual iteration-time impact (positive → keep, negative →
   tune the rule confidence thresholds).
2. As new walls land in `codegen-walls.md` over time, the rule
   library extends. Each new wall is one rule per the v0
   pattern.
3. If hit rate plateaus, brain queues a v1 brief to extend
   coverage to the remaining walls + add ML-based pattern
   discovery (lower priority; the structured catalog gets us
   most of the way).
