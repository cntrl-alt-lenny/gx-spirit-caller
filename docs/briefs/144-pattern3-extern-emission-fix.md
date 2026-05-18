### cloud/pattern3-extern-emission-fix

**Goal:** Fix `tools/cluster_c_pattern3_gen.py` so it emits the
required `.extern` declarations for `.word <name>` references in
generated chunks. Currently the generator emits the chunk but
omits the externs — every wave (briefs 135, 139, 141 attempts)
has had to add the externs manually post-generation. Time to
close the gap.

**Context — what brief 135 + 139 documented:**

Brief 135 first surfaced the gap:

> Generator gap: `.word <name>` needs manual `.extern`
> declarations (brief 137+ generator fix candidate).

Brief 139 re-confirmed:

> Known generator gap (per brief 135): `.word <name>` references
> in chunks need manual `.extern` declarations added post-
> generation. Add the externs manually; flag for brief 141+
> generator fix.

Brief 141's Part 4 (Pattern 3 on ov004 `.rodata`) was skipped
because of the veneer-count assertion, not directly because of
the generator gap — but every wave that DID use the generator
(briefs 135 + 139) had to manually add 1-5 `.extern` lines per
chunk.

**Brief 144 deliverables:**

1. **`tools/cluster_c_pattern3_gen.py` — emit `.extern`
   declarations.** For every `.word <name>` reference the
   generator emits in a chunk:
   - If `<name>` is NOT defined in the chunk itself, emit
     `.extern <name>` at the top of the chunk's `.s` file.
   - If `<name>` IS defined in the same chunk (e.g. cross-
     reference within the chunk), no extern needed.

2. **Detection.** Likely the generator already walks the symbol
   table to identify the `.word` references; the extern emission
   is just a small addition to that walk.

3. **Regression test.** Add a test that generates a chunk with
   known external references and asserts the `.extern` lines
   are present in the output `.s`.

4. **Backward compatibility.** Existing chunks (brief 135 wave 1
   + brief 139 wave 2) already have the externs added manually
   in their committed `.s` files. The fix doesn't need to
   regenerate them — it just makes future generator runs
   emit externs from the start. (Optional: regenerate the
   existing 14 chunks to verify the new generator produces
   byte-identical output to the hand-edited versions.)

5. **Documentation.** Update the generator's docstring / brief
   125 documentation to reflect the new behaviour. Remove the
   "known gap" note from briefs 135 / 139 cross-references.

**Method:**

1. Read `tools/cluster_c_pattern3_gen.py` (brief 125).
2. Read brief 135's PR + brief 139's PR for the empirical
   pattern of externs that need to be emitted.
3. Add the extern-emission logic.
4. Add the regression test.
5. (Optional) Regenerate a brief 135 chunk and diff against
   the committed hand-edited version to confirm byte-identical.

**Non-scope:**

- ❌ Other generator improvements beyond `.extern` emission.
- ❌ Cluster work / decomp / data-tier.
- ❌ Brief 145's ov004 .rodata cluster wave (decomper).
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- Generator emits `.extern` for every external `.word <name>`
  reference automatically.
- 1+ new regression test.
- 3-region 27/27 + `ninja sha1` PASS preserved.
- Markdown lint clean.

**Branch:** `cloud/pattern3-extern-emission-fix`

**Priority:** MEDIUM. Unblocks faster Pattern 3 application
waves (no more manual extern addition); not critical-path.

**After this brief lands:**

1. **Pattern 3 generator is fully turnkey.** Future Pattern 3
   waves (in main `.rodata` and ov004 `.rodata`) no longer
   require manual post-generation editing.
2. **Decomper unblocked on Pattern 3 in ov004** — brief 145
   (or follow-up wave) can now run brief 125 generator on
   ov004 `.rodata` chunks cleanly.
