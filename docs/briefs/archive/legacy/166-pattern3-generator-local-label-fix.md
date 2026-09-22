### cloud/pattern3-generator-local-label-fix

**Goal:** Extend `tools/cluster_c_pattern3_gen.py` to emit
raw hex literals for `kind:label(arm)` cross-TU references,
instead of `.word .L_*` symbol references that mwasmarm
rejects. Closes the generator gap brief 163 surfaced on the
4.9 KB `data_020c7b44` mega.

**Context — what brief 163 documented:**

Brief 163's wave 3 hit a new generator gap on the 4,924-byte
mega `data_020c7b44`:

> The generator emitted `.word .L_02021008` / `.word
> .L_02021018` for two cross-TU references to local labels
> (`kind:label(arm)` in `symbols.txt`). mwasmarm rejects
> these because local labels (`.L_*`) are file-scoped in ELF
> — not exported across TU boundaries.

Decomper applied a manual fix: replaced `.word .L_02021008`
→ `.word 0x02021008` (raw hex literal) + removed
corresponding `.extern .L_02021008` declarations. The fix
shipped clean; brief 163 funnel flagged the generator
extension as a brief 166+ candidate.

Brief 165 (PR #598) shipped the 30 KB main mega-array
(`data_020b6ec4`) — that chunk had **zero** `.L_*` references
(pure data, no internal-to-function labels), so brief 163's
gap didn't trigger. But future chunks referencing label-
kinded symbols will need the fix.

**Brief 166 deliverables:**

### Part 1 — Detect `kind:label` references

The generator already walks the symbol table to identify
`.word <name>` references for `.extern` emission (brief 144).
Extend that walk to inspect the target symbol's `kind` field:

- If `kind:label(arm)` (or any `label(*)` variant):
  - Emit `.word 0x<addr>` (raw hex literal) instead of
    `.word <name>`.
  - **Do NOT** emit `.extern <name>` for this reference.
- Otherwise (function, data, etc.):
  - Existing behaviour (emit `.word <name>` + `.extern
    <name>`).

### Part 2 — Tests

1-2 regression tests covering:

- A chunk with a `.word` reference to a `label(arm)` symbol:
  assert the generator emits the raw hex literal + does NOT
  emit `.extern` for that name.
- A chunk with mixed references (some label-kinded, some
  data-kinded): assert each reference is emitted correctly
  per its kind.

### Part 3 — Optional: regenerate brief 163's affected chunk

`src/main/data/data_020c7b44.s` was manually patched by
decomper. Optionally regenerate the chunk via the new
generator and verify the output is byte-identical to the
manually-patched version. If identical, replace
(maintaining provenance). If not, the difference is worth
investigating before brief 166 lands.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved.
- New tests pin the label-kind emission behaviour.
- Full project suite green (1836+ baseline post-brief 164).
- If Part 3 regenerates `data_020c7b44.s`: confirm
  byte-identical to manually-patched version.

**Non-scope:**

- ❌ Other generator improvements beyond label-kind emission.
- ❌ Source-claim shipping (decomper brief 167+ owns path-2
  scale-up; brief 168+ owns subsequent data-tier waves).
- ❌ Odd-aligned slot recipe (brief 160 finding #4).
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- Generator detects `kind:label` references via symbol-table
  walk.
- Emits raw hex literals for label refs; suppresses
  `.extern` emission for them.
- 1-2 regression tests pin the behaviour.
- 3-region SHA1 PASS preserved.

**Branch:** `cloud/pattern3-generator-local-label-fix`

**Priority:** MEDIUM. Small focused tooling fix; not
critical-path. Removes a class of manual post-generation
fixups for future Pattern 3 waves.

**After this brief lands:**

1. Pattern 3 generator becomes fully turnkey across all
   reference shapes (data, function, label).
2. Future decomper waves don't need manual hex-literal
   substitution for label-kinded refs.
