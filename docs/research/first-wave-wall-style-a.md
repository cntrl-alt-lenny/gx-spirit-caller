# First-wave wall — Style A epilogue (`.legacy.c` routing)

**Brief:** 189 Part 2 (scaffolder). The Style A epilogue is the
single most common wall in the code-decomp resumption queue
(8 / 40 picks = 20 %; project-wide 2,074 / 9,849 functions ≈
21 %). This note documents the recognition cue, the known
workaround (it's been a shipped recipe since briefs 036 / 037),
and the routing decision for brief 190+'s match wave.

## Recognition cue

The target ARM disasm ends with **two separate instructions**:

```text
... function body ...
ldmfd  sp!, {regs}      ; pop frame WITHOUT pc
bx     lr               ; explicit return
```

vs the Style B (default mwcc 2.0/sp1p5) form which fuses them:

```text
... function body ...
ldmfd  sp!, {regs, pc}  ; OR `pop {regs, pc}` — single-instruction return
```

The `tools/predict_walls.py` classifier checks the last 3
instructions of the function for `bx\tlr` AND the absence of any
`ldmfd ... pc` / `pop ..., pc` line. Either signal alone is
insufficient — Style B can have a `bx lr` after a tail-call
sequence, and some Style A functions don't pop anything (leaf
functions with `bx lr` and no `stmfd`). The combined check is
the regex-detectable cue.

Some examples from the queue:

| Pick | Module | Size | Detected at |
|---|---|---|---|
| `0x02095108` | main | 0x28 | epilogue line `ldmfd sp!, {lr}; bx lr` |
| `SNDi_SetTrackParam` (`0x02094d18`) | main | 0x34 | epilogue line `add sp, sp, #4; ldmfd sp!, {lr}; bx lr` |
| `func_01ff8770` | itcm | 0x50 | epilogue line `pop {r4-r7, lr}; bx lr` |
| `func_02093dc8` | main | 0x70 | epilogue line `ldmfd sp!, {r4, lr}; bx lr` |

## Routing decision

**Always: `.legacy.c` (mwcc 1.2/sp2p3).** This has been the
project's standard recipe since briefs 036 / 037 surfaced the
Style A epilogue (the first ~50 matches all hit this wall).

The filename suffix `.legacy.c` triggers `tools/configure.py`'s
per-TU routing override — mwcc 1.2/sp2p3 emits the Style A
epilogue cleanly. mwcc 2.0/sp1p5 (default) emits Style B and
can't be coerced into Style A through any C-level source change
the project has tried.

```bash
# Standard recipe for a Style A target — name the file with the
# `.legacy.c` suffix BEFORE writing C source:
touch src/main/<func>.legacy.c
```

## Workaround — none required, just route correctly

Unlike most walls, Style A has **no source-level workaround**.
The `.legacy.c` suffix routing produces byte-identical Style A
epilogues without any C contortion. The "workaround" IS the
routing.

Don't try to coerce mwcc 2.0 into Style A via inline asm,
`__attribute__((naked))`, or split-function tricks — none of
those have ever worked on this project, and the existing
`.legacy.c` routing handles ~21 % of all functions cleanly.

## Permuter strategy

**Not needed.** Style A is a deterministic routing decision —
once you've renamed to `.legacy.c`, the function compiles
byte-identical (assuming the C source is otherwise correct).
Permuter time is better spent on functions where the recipe
choice is right but the C source iteration is the bottleneck.

## False-positive risks

The `predict_walls.py` classifier is reasonably specific, but
two edge cases produce false positives:

1. **Tail-call sequences ending in `bx rN`** (where rN is not
   lr). The classifier's `bx\tlr` check correctly distinguishes
   `bx lr` (return) from `bx rN` (indirect call), but a function
   that *both* has `bx lr` AND lacks `pop ..., pc` for some
   structural reason (e.g. a `mov pc, lr` fallback path) will
   trigger StyleA detection. Verify by re-disassembling and
   checking the epilogue shape.

2. **Functions that share a `.text` block** with their next
   sibling (the linker may have placed a `bx lr` before the
   next function starts, and the disasm window captures it).
   Unlikely on this project — dsd's delink pads each function
   into its own object — but worth checking if a tiny pick
   reports StyleA and the disasm looks like a single ARM
   instruction.

## Cross-references

- [`docs/research/codegen-walls.md` § C-15](codegen-walls.md#c-15)
  — flat-thunk arg setup that ALSO routes via `.legacy.c`. Many
  Style A picks ALSO hit C-15 because they're in the same
  routing-tier family (mwcc 1.2/sp2p3 is the
  Style-A-and-C-15-compatible compiler).
- [`CLAUDE.md`](../../CLAUDE.md) § *Toolchain* — the
  `*.legacy.c` filename-suffix routing convention.
- [`docs/research/style-a-epilogue.md`](style-a-epilogue.md)
  — the brief 036 / 037 origin of the recipe (if present in
  this checkout; otherwise see the briefs/036-*.md +
  briefs/037-*.md task briefs).
- [`docs/decomp-workflow.md` § *Code-decomp resumption*](../decomp-workflow.md#code-decomp-resumption--the-post-scaffold-playbook)
  — brief 187's routing-decision tree references this note.
