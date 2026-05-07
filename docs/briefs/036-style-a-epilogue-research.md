### cloud/style-a-epilogue-research

**Goal:** Investigate why mwcc 2.0/sp1p5 (the project's compiler)
emits Style B epilogues for the medium-tier IRQ-bracket
functions while target ROM consistently uses Style A. Identify
whether the trigger is a compiler flag, a source pragma, a
different mwcc version, or fundamentally codegen-resistant.

**Context:**

Brief 034 (PR #323) attempted 11 medium-tier candidates and
matched **zero**. The blocker is a single divergence pattern that
applies to every IRQ-bracket / Task-Locked / Fill32-pattern
function in the medium tier:

- **Target ROM (Style A):**

  ```
  stmdb sp!, {lr}              ; or {r4, lr}
  sub   sp, sp, #0x4            ; explicit alignment slot
  ... body ...
  add   sp, sp, #0x4
  ldmia sp!, {lr}              ; or {r4, lr}
  bx    lr                     ; explicit interworking return
  ```

- **mwcc 2.0/sp1p5 (Style B):**

  ```
  stmdb sp!, {r3, lr}           ; r3 spilled for alignment
  ... body ...
  ldmia sp!, {r3, pc}           ; pop and jump in one insn
  ```

Both produce 8-byte-aligned, ARMv5-interworking-safe stack
frames. mwcc 2.0/sp1p5 with the project's current flags refuses
to emit Style A across 5 source variations the decomper tried in
brief 034.

This wall blocks ~50% of medium-tier candidates by inspection
(IRQ-bracket / Task-Locked / Fill32-pattern functions all use
Style A in the target ROM). Solving it unlocks a sizeable chunk
of the remaining 62 unmatched medium-tier targets — and likely
many in the hard tier too.

**Scope (research-only):**

Investigate plausible Style A triggers, in roughly decreasing
likelihood:

1. **Compiler-flag hypothesis.** mwcc 2.0/sp1p5 has dozens of
   flags, and the project's current invocation
   (`tools/configure.py` → `CC_FLAGS`) is `-O4,p -enum int -char
   signed -str noreuse -proc arm946e -gccext,on -fp soft -inline
   noauto -Cpp_exceptions off -RTTI off -interworking -w off
   -sym on -gccinc -nolink -msgstyle gcc`. Try toggling /
   adding flags that might affect epilogue style:
   - `-O3` / `-O2` / `-O1` / `-O0` — different optimisation
     levels often pick different epilogue strategies.
   - `-stack_align`, `-align_loop`, `-stack_check_off` —
     stack-related knobs.
   - `-no_align_blocks`, `-jump_table_off` — codegen knobs.
   - `-gccext` variants — `,off` is rare but possible.
   - Any flag listed in `mwccarm.exe -help` that mentions
     "stack" or "frame" or "return".

2. **mwcc version hypothesis.** CLAUDE.md says 2.0/sp1p5 with a
   "revisit after first matching attempt" note. Check whether
   sp1p4 / sp1p3 / sp2 emit Style A. dqix and pokediamond decomp
   projects have notes on which mwcc revisions emit which
   patterns — search their docs / commits.

3. **Source-pragma hypothesis.** Less likely but cheap to check
   — `#pragma`s like `interworking`, `arm`, `force_active` may
   affect prologue/epilogue. Try the same source through each
   pragma.

4. **Per-function ABI hypothesis.** Maybe the IRQ-bracket
   functions in target ROM were built with a different
   compiler / `.s`-source workflow, not mwcc-from-C. Check
   whether decomp.me has any GX Spirit Caller scratches or
   similar dragquest-IX / pokemon-platinum equivalent functions
   that document this.

**Deliverable:** `docs/research/style-a-epilogue.md` — same
format as `docs/research/codegen-walls.md`, with:

- 1-paragraph exec summary.
- Method (what hypotheses tested, what flags / versions tried).
- Per-hypothesis verdict (worked / didn't / inconclusive).
- Recommendation: one concrete next step. Three plausible
  outcomes:
  - **(a) Found it** — specific flag / pragma / version emits
    Style A. Brain queues a `tools/configure.py` patch + decomper
    medium-tier wave 2 with the unlocked candidates.
  - **(b) `.s` is the answer** — Style A is achievable only via
    hand-written `.s` files (per the brief 013 pattern).
    Acceptable but limits per-function leverage. Brain queues a
    decomper brief that walks 5-10 IRQ-bracket targets via `.s`.
  - **(c) Permanent wall** — no known coercion. Brain pivots
    decomper to Style-B-friendly medium-tier candidates (need
    cloud to also classify which medium-tier targets *aren't*
    Style A — separate brief if so).

**Non-scope:**

- ❌ Implementing any tooling (compiler config update, etc.).
  Research-only; brain queues an implementation brief if (a) or
  (b) lands.
- ❌ Source-side decomp work. Decomper is on hold pending this
  brief's findings.
- ❌ AGENTS.md / state.md edits — brain owns those.

**Success:**

- One concrete recommendation ((a), (b), or (c) above) backed
  by reproducible evidence.
- If (a): the exact flag / version that triggered Style A,
  with a 2-3 line snippet showing before/after asm output on
  one of brief 034's targets (e.g. `func_0207cbbc`).
- If (b) or (c): confidence level + what would change the
  verdict.

**Branch:** `cloud/style-a-epilogue-research`

**Priority:** **HIGH.** This blocks medium-tier work entirely.
Decomper is on hold pending this brief's findings. Skip brief
035-style "low priority" framing — this is the next critical
path item.

**After this brief lands:**

1. Brain reads the recommendation, queues the appropriate
   follow-up brief.
2. Decomper resumes medium-tier work under whatever workflow
   the research surfaced.
