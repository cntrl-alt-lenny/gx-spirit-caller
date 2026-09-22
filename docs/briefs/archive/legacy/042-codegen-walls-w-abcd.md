### cloud/codegen-walls-w-abcd

**Goal:** Document the 4 new codegen walls (W-A, W-B, W-C, W-D)
brief 040 surfaced. Update `docs/research/codegen-walls.md` with
each, including matched-vs-dropped evidence and a "use when" hint.
Some may also yield concrete C-variation coercions; if so, the
relevant brief 040 target unblocks.

**Context:**

Brief 040 (PR #332) shipped 7 of 11 targets via the `.legacy.c`
pipeline. The 4 dropped targets exposed walls that are
sp2p3-specific (or at least not in `codegen-walls.md` yet because
the file was written from sp1p5 evidence):

| Wall | Sym | Symptom |
|---|---|---|
| W-A | `func_020916c8` | `c < 0xffffffff` — sp2p3 emits 4 bytes more than target. Overflow-check codegen difference. |
| W-B | `func_020467f4` | `ldmia ..., {pc}` epilogue variant — even sp2p3 emits `{lr}+bx lr` here, not `{pc}`. 4 bytes over target. |
| W-C | `func_02023fec` | Pool-not-deduped + Style A combined. 4 bytes over. |
| W-D | `func_ov000_021ac85c` | Bit-chain reg-alloc. 8 bytes over target. Different reg-allocation strategy. |

Brief 040's PR body has the full per-target asm comparison.

**Scope:**

For each wall (W-A through W-D):

1. Pull the disassembly of brief 040's target via
   `./dsd dis --config-path config/eur/arm9/config.yaml --asm-path
   /tmp/wabcd-asm` and read it alongside the `.legacy.c` brief 040
   wrote (or would have written — the dropped sources aren't in
   `src/`, but the brief documented them).
2. Classify: coercible-with-knowledge (C-N), permanent (P-N), or
   codegen-inherent edge case (E-N) — same buckets as
   `codegen-walls.md`'s existing entries.
3. Add the wall to `docs/research/codegen-walls.md` with:
   - Worked example (target asm + dropped asm).
   - "Use when" hint.
   - If coercible: the C variation that would've worked.
   - If permanent: the precise trigger (e.g. "any function with
     `< 0xffffffff` overflow check"; "any function whose
     reg-allocation needs r3+r4+r5 chain").
4. Update the per-PR cross-reference table to add brief 040's 4
   drops with their bucket attribution.
5. Update the bucket-quantification headers
   ("16 distinct divergences" → "20"; bucket counts).

**Verification — required for merge:**

For W-A and W-B specifically, attempt to reproduce target asm with
sp2p3 + a different C variation. Brief 040 ran out of time
exploring; you have the budget. If you find a coercion that works,
**flag the wall as C-N coercible** and commit a one-line "How
brief 040 missed it" note in the wall's section. (Decomper will
then unblock those targets in a future brief.)

If neither W-A nor W-B coerces in 30+ minutes of variation
trials, mark them permanent and move on.

**Non-scope:**

- ❌ Re-running brief 040's targets in `src/`. Document only.
- ❌ Tooling changes (`patch_objects_legacy.py` etc.). Wall
  research only.
- ❌ AGENTS.md / state.md edits.

**Success:**

- 4 new wall entries (W-A through W-D) added to
  `docs/research/codegen-walls.md`.
- Per-PR cross-reference table updated with brief 040's drops.
- Bucket quantification headers updated.
- For W-A and W-B: a documented attempt at coercion (success
  flips them to C-N; failure documents the trigger more
  precisely than brief 040's PR body).
- Markdown lint clean (please run locally — brief 032 shipped
  with 30+ MD031 violations brain auto-fixed; please don't
  repeat).

**Branch:** `cloud/codegen-walls-w-abcd`

**Priority:** Medium. Decomper isn't blocked on this — brief 041
explicitly skips W-A..W-D and continues with fresh targets. But
this brief unlocks 4 documented targets when shipped, which
adds maybe 1-3 extra matches to brief 041's self-extends.

**After this brief lands:**

1. Brain may queue a small decomper brief to re-attack W-A..W-D
   with whatever coercions cloud surfaced (if any).
2. Otherwise, brief 041's self-extends continue absorbing the
   medium-tier pool naturally.
