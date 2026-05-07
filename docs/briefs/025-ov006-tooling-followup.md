### cloud/ov006-tooling-followup

**Goal:** Implement the `find_shape_templates.py` tool brief 023's
research note recommended (Proposal #2). Surfaces clone-candidate
matched functions across the entire matched corpus by opcode-
sequence similarity, automating the brief-020 workflow that today
is manual asm-grepping.

**Context:**

Brief 023 (PR #299, `docs/research/ov006-cluster-stuck.md`)
diagnosed both top-of-pool ov006 clusters as heterogeneous bags
(≥15 distinct C shapes in cluster #1, ≥8 in cluster #2). The v2
fingerprint cannot subdivide them because they have 0/1 reloc —
nothing for `(size, [(offset, kind, target_kind)])` to constrain.

The brief 020 / brief 022 workflow handles this manually: the
decomper greps existing matched siblings across `src/` for shapes
similar to each unmatched function, clones the closest match, and
adapts. That worked for func_02006164 (87% yield) and func_0202b0e0
(77% yield, per the in-flight brief 022 commit). It's effective but
manual; cloud's research note proposed a tool that surfaces those
candidates automatically.

**This brief replaces the original brief 025 scope.** The pre-
queued A/B/C variants in brief 025's first version (modify
`find_pattern_clusters` itself) were rendered moot by brief 023's
finding that the predicted yields are *correct* — the clusters are
stuck because nobody's piloted them with the brief-020 unlock, not
because the tool's wrong.

**Scope:**

New file: `tools/find_shape_templates.py`. Approximately 150–300
lines per brief 023's estimate. CLI:

```
python tools/find_shape_templates.py --version eur --target <module> <addr>
```

Where `<module>` is e.g. `main` / `ov000` / `ov006` and `<addr>` is
the 8-hex address of the unmatched function. Output: a ranked list
of matched functions across the entire corpus whose opcode
sequences are most similar to the target's disassembly.

Implementation sketch (cloud picks the specifics):

- Disassemble target via `dsd dis` or equivalent.
- Build an opcode-class sequence (e.g. `[ldr_pc, ldr_reg,
  str_reg_imm, bx_lr]`) from the disassembly head, masking out
  registers, immediates, and reloc target details.
- For every matched function in the corpus (use the `report.json`
  / objdiff status to enumerate the matched-set), compute the same
  opcode-class sequence and a similarity score against the target.
- Rank by similarity descending; output top N (default 5–10).

The output should make it trivial for the decomper to copy the
matched function's `src/` file, edit one or two literals (offsets,
masks), and rebuild — i.e. the brief-020 workflow without the
asm-grepping step.

**Non-scope:**

- ❌ Modifying `tools/find_pattern_clusters.py` or its fingerprint.
  Brief 023 explicitly ruled out fingerprint-based fixes.
- ❌ Modifying `tools/propagate_template.py`. The sibling-arity
  variant from the original brief 025 is a separate concern; if
  it surfaces as needed during decomper use of the new tool, brain
  queues a follow-up brief.
- ❌ Any `src/`, `config/`, `libs/`, `include/` change.
- ❌ Touching `AGENTS.md` or `docs/state.md`.

**Success:**

- `python tools/find_shape_templates.py --version eur --target
  ov006 0x021c81a4` returns clone-candidates for that anchor.
  Spot-check at least three of the cluster #1 sample siblings from
  brief 023's research note (e.g. `func_020aaddc` strlen,
  `func_ov002_022ae414` guarded array write) — the tool should
  surface plausible matched-elsewhere shape sources for each.
- Test: extend `tests/` with a fixture that confirms the ranking
  produces the expected top result for a sibling whose shape is
  known to clone an existing match (use one of brief 020's or
  brief 022's documented clones as a regression case).
- Full test suite green; CI clean.
- PR body documents:
  - Sample CLI invocation + output for one ov006 sibling.
  - Performance ballpark (corpus is ~1100 matched functions; the
    tool should run in seconds per query).
  - One-line note on whether the output suggests the ov006
    clusters are now plausibly tractable (bias the next decomper
    brief's expectations).

**Branch:** `cloud/find-shape-templates`

**After this brief lands:**

1. Brain queues a decomper brief on cluster #1 or #2 (40–60%
   expectation per brief 023's calibration), routing the brief
   through the new tool's output.
2. If the tool's output is stronger than expected (e.g. surfaces
   high-confidence clones for >50% of targets), brain raises the
   yield expectation accordingly.
3. State.md gets a "Direction shift" entry documenting how the
   ov006 stuck-cluster problem unblocked.
