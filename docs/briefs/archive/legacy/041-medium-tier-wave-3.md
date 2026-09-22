### decomper/medium-tier-wave-3

**Goal:** Continue medium-tier work past brief 040's 11-target
seed list. Pipeline is now end-to-end working
(briefs 036+037+039 chain). Pick fresh medium-tier candidates,
mix Style A (`.legacy.c` routing) and Style B (default routing)
as needed per disassembly.

**Context:**

Brief 040 (PR #332) shipped 7 byte-identical matches via the
`.legacy.c` pipeline. Medium tier moved 60.3% → 64.7% matched
(94 → 101 of 156). Style A pipeline is now warm.

Brief 040's remaining 4 targets are deferred:
- `func_020916c8` — W-A wall (`c < 0xffffffff` codegen)
- `func_020467f4` — W-B wall (`ldmia {pc}` epilogue variant)
- `func_02023fec` — W-C wall (pool-not-deduped + Style A)
- `func_ov000_021ac85c` — W-D wall (bit-chain reg-alloc)

Brief 042 (cloud) updates `codegen-walls.md` with W-A..W-D so
future pilots can grep them. Until then, leave these 4 alone in
this brief.

**Anchor selection:**

1. Run:

   ```
   python tools/next_targets.py --version eur
   ```

   Pull the medium-tier section.

2. Pick 6–10 candidates. Prefer:
   - **Smaller sizes first** (0x24–0x40 — same range as brief 040's
     wins).
   - **Both Style A and Style B targets.** Brief 040 only attacked
     Style A; medium tier has a mix. Disassemble each candidate's
     anchor and decide routing per disassembly. Style A → write at
     `src/<module>/func_<addr>.legacy.c`. Style B → default
     `src/<module>/func_<addr>.c`.
   - **Variety across modules.** Brief 040 was all in `src/main/`;
     spreading across overlays exercises the routing more broadly.

3. **Skip the 4 W-A..W-D blocked targets.** Brief 042 unblocks
   them.

**Workflow:**

Standard. find_shape_templates per target if the function looks
like a clone of an already-matched .legacy.c sibling (the matched
sp2p3 corpus is now 7 functions; tool leverage starts to compound
after this wave).

For style detection: look at the disassembled function's
epilogue. If it uses `sub sp, #N` + `ldmia ..., {lr}; bx lr`,
that's Style A → use `.legacy.c`. If it uses `ldmia ..., {pc}`
in one step, that's Style B → default `.c`. Cloud's
`docs/research/style-a-epilogue.md` has full diagnostic detail.

**Scope:**

- Match 6–10 medium-tier functions across both styles.
- Use `.legacy.c` for Style A, default `.c` for Style B.
- Standard rename / verification gate: `ninja rom`,
  `dsd check modules` 24/27, `check_match_invariants` no new
  error categories, `pr-tier-delta` matches +N count.

**Non-scope:**

- ❌ The 4 W-A..W-D blocked targets (brief 042 territory).
- ❌ Tools / libs / include / AGENTS.md / state.md / docs/research
  edits.

**Success:**

- ≥ 6 byte-identical matches.
- All matches verified locally + `pr-tier-delta` green.
- PR body documents:
  - Per-match shape (one-line C-equivalent or shape-class).
  - Style A vs Style B decision per match (which routing was used,
    why).
  - Drops if any (with codegen-walls bucket attribution; new
    walls flagged for brief 042 / 044).
  - Read on whether the 7-strong sp2p3 matched corpus has started
    to surface useful clone candidates via find_shape_templates.

**Branch:** `decomper/medium-tier-wave-3`

## Self-extend clause

After this brief lands, decomper may file up to 2 follow-up
medium-tier waves without a fresh brain brief if:

- The same selection rule (medium-tier, mixed Style A/B, skip
  W-A..W-D) applies.
- One wave per PR.
- Stop after 2 self-extends OR if a new wall appears that
  warrants a research follow-up OR if eligible candidates drain
  to <6 viable targets per wave.

Same constraints as brief 030's self-extend clause. If self-
extend works smoothly, brain considers graduating to AGENTS.md.

**After this brief (and self-extends) land:**

1. Brain refreshes state.md + cluster yield track record.
2. If the 4 W-A..W-D walls have been written up by brief 042 +
   surface concrete C variations, brain queues a brief that
   re-attacks them.
