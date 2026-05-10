### cloud/wave-12-wall-investigations

**Goal:** Three-part research/fold-in brief from wave 12's PR #366
findings:

1. **C-2 refinement** — fold the struct-copy form into
   `codegen-walls.md`'s C-2 entry as a worked-example refinement.
2. **mvn-vs-sub peephole** investigation — sweep C variations to
   classify the wall (provisional new C-N or P-N).
3. **ov004 BSS layout shift** — investigate the
   `data_ov004_0229159c` → `0x0229199c` resolution mismatch.
   Likely a dsd lcf interaction with the ov004 placeholder-symbol
   issue (one of the 3 expected baseline failures).

**Context:**

Wave 12 PR body documented all three findings. Each fits a
different research depth — (1) is fold-only, (2) is a coercion
sweep like brief 050's W-F, (3) is a tooling/infrastructure
investigation that may have wider implications.

**Part 1 — C-2 struct-copy refinement (fast):**

Wave 12 found that C-2's "local pointer cache" recipe alone
doesn't enforce load-load-store-store ordering on multi-field
copies; mwcc may interleave. The fix is to use struct-assignment
form:

```c
/* C-2 baseline (interleavable):
 *   p->a = src->a;
 *   p->b = src->b;
 */

/* C-2 struct-copy refinement (forces order):
 *   *(struct T *)p = *src;
 */
```

Action: append a "Struct-copy variant" subsection under C-2's
existing entry with the worked example + provenance link to wave
12 PR.

**Part 2 — mvn-vs-sub peephole (sweep):**

Wave 12 found mwcc 2.0/sp1p5 peephole-optimises a `(0, -1)` arg
pair into `sub r1, r0, #1` form. Tried `~0`, `(int)~0u`,
`(int)(unsigned int)-1` — all kept the sub form. Target ROM uses
`mvn r0, #0` directly.

Sweep order:
1. **C-variation sweep (~10 shapes):** various ways to encode -1
   that might dodge the peephole — separate statement, intermediate
   variable with explicit type, inline-asm hint, function-pointer
   indirection, switch with `case -1`.
2. **mwcc-version sweep** if C-variation flat. Some SP may not
   have the peephole.
3. Classify as **C-N coercible** / **P-N permanent**. Add to
   codegen-walls.md.

**Part 3 — ov004 BSS layout shift (investigation):**

Wave 12's `func_ov004_021c9d8c` matched but `func_ov004_021cb278`
+ `func_ov004_021dbf30` (ov004 BSS-resolved-data targets) failed
with the data symbol `data_ov004_0229159c` resolving to
`0x0229199c` — exactly **0x400 (1024) bytes off**. That's
suspicious; suggests a section-padding / alignment bug.

Investigation steps:
1. Check `build/eur/objects.txt` and `build/eur/arm9.lcf` for
   ov004's BSS section ranges before vs after the `.legacy.c`
   adjustments.
2. Verify against ov004's `config/eur/arm9/overlays/ov004/
   delinks.txt` BSS markers.
3. Cross-reference the ov004 placeholder-symbol issue noted in
   state.md as a baseline-failure carryover.
4. Land findings as `docs/research/ov004-bss-shift.md` (research
   note format). If actionable, brain queues a follow-up brief.

**Non-scope:**

- ❌ Implementing any tooling fix surfaced in part 3 — research
  only; brain queues follow-up if needed.
- ❌ src/, libs/, AGENTS.md, state.md.

**Success:**

- C-2 entry refined with struct-copy variant.
- mvn/sub peephole verdict in codegen-walls.md (C-N or P-N).
- `docs/research/ov004-bss-shift.md` exists with findings +
  recommendation.
- Markdown lint clean (run locally).

**Branch:** `cloud/wave-12-wall-investigations`

**Priority:** Medium. Decomper isn't blocked on this; brief 051
explicitly skips ov004 candidates. Part 1 is ~30 min; parts 2 + 3
are the time-consuming pieces.

**After this brief lands:**

1. If part 2 surfaces C-N coercion → tiny decomper brief unblocks
   the affected targets.
2. If part 3 finds a real BSS-shift bug → brain queues a tooling
   fix brief (likely cloud) along the brief 037 / 039 chain shape.
3. If part 3 finds it's an artifact of ov004 placeholder symbols
   → state.md notes it as carryover, deferred until ov004 is
   first-class.
