### cloud/cluster-tooling-upgrade

**Goal:** Ship the two propagation-tooling improvements that brief
015 + 016 + 017 collectively diagnosed as the bottleneck of the
cluster-pilot pipeline. Concrete fix list comes straight from
**PR #241's diagnostic write-up** (the decomper enumerated exactly
what's needed). Ship as one PR or two — your call.

**Context:**

- Three cluster-propagation pilots ran (briefs 015 → 016 → 017
  shipping over the recent waves). Yield rates: 12.5%, 2.9%,
  TBD-but-expected-12-15%. The brief 016 yield collapse exposed
  the two systemic issues; brief 017 is a workaround (pick
  no-literal anchors) until you fix them.
- Once your two upgrades land, brief 019 will retry brief 016's
  cluster (`func_ov000_021aa4a0`, 68 still unmatched) and we'll
  see whether yield jumps from 2.9% to closer to 80% — that's the
  win condition for this brief.

**Two specific fixes:**

### 1. `propagate_template.py --substitute-imm`

Today: when `propagate_template` emits a sibling `.c` from a
template, all numeric literals (struct padding sizes, field
offsets, immediate operands in inline-asm-style writes) are copied
verbatim from the template. Siblings whose baserom uses different
offsets fail the byte-compare even though the C *shape* is right.

Add a `--substitute-imm` mode (or default-on, opt-out) that:

- Identifies the per-sibling baserom offset by inspecting the
  sibling's actual disassembly (or its reloc/ldr-imm structure
  via `dsd dis` / objdiff metadata — pick whichever is reliably
  parseable).
- Substitutes the literal in the emitted C: `_pad[0xN]`,
  `field_<hex>` field name, `+ 0xN` offset, etc.
- Refuses to emit if the disassembly has *more than one* literal
  that differs from the template (multi-literal mismatches are
  brief-019+ territory).

Reference shape, from PR #241's brief 016 work: anchor is
`func_ov000_021aa4a0` writing to `+0x144`; siblings write to
`+0x1a0`, `+0x14`, `+0x20c`, `+0xc20`, `+0x80c`, `+0xf1`, `+0x102`,
`+0x9`, `+0x0`, `+0x270`. Decomper hand-patched two of these
post-emission and disclosed it; that's the workflow `--substitute-imm`
should automate.

### 2. Finer cluster fingerprint in `find_pattern_clusters.py`

Today: clusters key on `(size, reloc-sig)`. Per #241's diagnosis,
the "size 0x14, 1 reloc" bucket actually contains:

- tail-call thunks `ldr ip; mov rN; bx ip`
- constant-write setters `ldr r0; mov r1, #N; str r1, [r0]`
- byte-store doubles `ldr r2; strb r0, [r2,#X]; strb r1, [r2,#Y]`
- lookup-table loads `ldr r1; sub r0; ldrb r0, [r1, r0]`
- the `*data->field = arg` shape (the one we wanted)

These are wildly different functions sharing only size + reloc
count. Add a *deeper* signature dimension to `find_pattern_clusters`
that splits these. Suggested approaches (pick whichever you can
implement reliably from the data we already have):

- **Instruction-shape histogram** — bucket by `(opcode-class
  sequence)` from the disassembly. e.g. `[ldr_pc, ldr_reg,
  str_reg_imm, bx]` becomes one signature; `[ldr_pc, mov_imm,
  bx_reg]` is another. Doesn't need exact bytes, just the
  control-flow / memory-op shape.
- **Prefix-byte fingerprint** — first N opcode-byte-pairs, masking
  out registers and immediates. If the first 4 hash differently,
  they're different shapes.
- **Reloc-context tuple** — for each reloc, its position-in-
  function and the opcode it lands inside. Captures "load at
  insn 0 of an `ldr_pc`" vs "load at insn 1 of an `str`".

Whichever variant you pick, the test is: brief 015's anchor (38
matched) vs brief 016's anchor (11 matched) should now be in
*different* clusters even though both are size 0x10 / 0x14, sig 1.

**Scope:**

- `tools/propagate_template.py` — add `--substitute-imm` mode.
- `tools/find_pattern_clusters.py` — add deeper signature.
- `tests/test_propagate_template.py`,
  `tests/test_find_pattern_clusters.py` — extend with cases that
  verify the new behavior.
- `docs/tools-index.md` — auto-regen via
  `tools/generate_tool_index.py`.

**Non-scope:**

- ❌ Any `src/` change. This is tools-only.
- ❌ Replacing existing fingerprint with a strict superset that
  invalidates merged clusters' historical decisions. Add the new
  signal as an additional dimension (or a `--strict-shape` opt-in)
  so old behavior is preserved.
- ❌ Touching `config/`, `libs/`, or anything outside `tools/`
  + `tests/` + auto-regen docs.
- ❌ The pre-existing `objdiff-cli` panic (upstream bug, separate
  cleanup).

**Success:**

- `python tools/find_pattern_clusters.py --version eur main
  0x020085d4` and `... ov000 0x021aa4a0` produce visibly different
  cluster compositions when the new signature is enabled. `--top
  10` ranking output should look more "homogeneous within each
  cluster" rather than dominated by mixed-shape buckets.
- `python tools/propagate_template.py apply --template
  src/overlay000/ov000_021aa4a0.c --cluster ov000 0x021aa4a0
  --version eur --substitute-imm`  emits siblings whose `_pad` and
  `field_<hex>` reflect the per-sibling offsets, not the template's.
- All existing tests still pass.
- Full test suite green; CI clean.
- PR body documents:
  - Before/after cluster #1 / cluster #2 ranking diff.
  - One example showing `--substitute-imm` rewrote a literal
    correctly.

**Branch:** `cloud/cluster-tooling-upgrade` (or split into
`cloud/propagate-substitute-imm` + `cloud/cluster-finer-fingerprint`
if you want two narrower PRs).

**After this brief lands:**

1. Brain queues **brief 019** for decomper: rerun brief 016's
   cluster (`func_ov000_021aa4a0`, 68 unmatched) with the new
   tooling. Predicted yield: 2.9% → ~50-80% if literal
   substitution + finer fingerprint together unblock the cluster.
2. Brain audits `find_pattern_clusters` for net cluster
   reachability under the new tooling — the answer to "how much
   of easy-tier 765 unmatched is realistically propagatable" goes
   from estimated to known.
