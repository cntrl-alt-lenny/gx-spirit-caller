[//]: # (markdownlint-disable MD013 MD041)

# Brief 264 — lock the over-fire StyleA helper-family recipe templates

**Status:** 5 family templates locked, all byte-identical; the stretch
stub-emitter built + validated. Direct-mwcc only (no ROM build, no
SHA1). Every template was compiled on the `.legacy.c` tier
(mwcc 1.2/sp2p3) and diffed against the named orig.

## Headline

**The over-fire StyleA-real tier (~614 lr-save picks) reduces to 5
regular helper-family templates, each byte-identical from one source
pattern.** Brief 265+ batch-drains a whole family by transcribing only
the per-pick literal + arg-shape. The big one — the `func_02094c94`
5-arg family (12 picks) — is fully locked across all 3 arg-shapes, and
a `tools/stylea_c94_stub.py` emitter auto-generates its `.legacy.c`
from disasm (validated end-to-end).

| Family | Picks | Template | Rep (byte-identical) |
|---|---:|---|---|
| A — c94 5-arg `helper(CODE,a0,a1,0,0)` | 12 | `func_02094c94(CODE, a0, a1, 0, 0)` | `02094cec`/`02094d80`/`02094e0c` |
| B — arg-shuffle | 3 | `func_02094688(a2, a1, a3); return 0` | `02097ce8` |
| C — `global = helper()` | 2 | `data_X = helper();` | `0208f284` |
| D — 6-arg-stack | 2 | `helper(a0, a1, a2, 0, 0, a3)` | `0206ed54` |
| E — two-void-call (base) | 1+ | `h1(K1); h2(K2);` | `02094c70` |

All ship as `*.legacy.c` (the Style-A epilogue `stmfd {lr}; sub sp,#4 …
ldmfd {lr}; bx lr` is mwcc 1.2/sp2p3; sp1p5 emits the wrong `push
{r3,lr}` / `pop {r3,pc}`). Full templates in
[`recipe-gotchas.md` § StyleA over-fire families](recipe-gotchas.md).

## Family A — c94 5-arg helper (the 12-pick win)

`func_02094c94(CODE, a0, a1, 0, 0)` — r0=CODE, r1=a0, r2=a1, r3=0,
`[sp]`=0. The trailing zeros are CSE'd; the call has three arg-shapes:

```c
extern int func_02094c94(int code, int a0, int a1, int z3, int z4);
void f_1arg(int a0)         { func_02094c94(CODE, a0,  0, 0, 0); }  /* 02094cec */
void f_noarg(void)          { func_02094c94(CODE, -1,  0, 0, 0); }  /* 02094d80 */
void f_2arg(int a0, int a1) { func_02094c94(CODE, a0, a1, 0, 0); }  /* 02094e0c */
```

All three byte-identical on sp2p3 (e.g. 1-arg `02094cec`: 11/11 words,
`mov r2,#0; mov r1,r0; mov r3,r2; mov r0,#22; str r2,[sp]; bl`). Per
pick, only the `mov r0, #CODE` literal and the arg-shape vary.

## Stretch — `tools/stylea_c94_stub.py` (validated)

A Python emitter that reads a c94-family pick's disasm, classifies the
arg-shape, extracts the CODE literal, and prints the candidate
`.legacy.c`. It recognizes ONLY the exact c94 shape (`bl func_02094c94`
+ the r0/r1/r2/r3/`[sp]` setup) and returns None otherwise — a hint
generator, never a ship; output is still `ninja sha1`-gated. Generating
files in Python sidesteps the zsh word-splitting trap brief 263 hit.

Validated end-to-end on real gap-obj disasm (extracts CODE + shape
correctly): `02094cec`→`(22,a0,0,0,0)`, `02094d80`→`(24,-1,0,0,0)`,
`02094e0c`→`(32,a0,a1,0,0)`, `02095244`→`(3,a0,0,0,0)`.
`tests/test_stylea_c94_stub.py` (9 cases): the 3 arg-shapes + 2 negative
(wrong helper / no stack arg) + the disasm slicer.

## Falsification tests

Per template (universal): compile as `*.legacy.c` (sp2p3) → predict
byte-identical to the named orig; a `sp1p5` compile gives the wrong
epilogue. Each family's representative passed (byte counts: A 11, B 9,
C 9, D 10, E 9 — all identical modulo the `bl` reloc). For the emitter:
a disasm that is not the exact c94 shape must return None — verified on
a different-helper wrapper and a no-stack-arg shape (both None).

## What did NOT pan out

1. **No new gotcha was needed for the templates.** Every family is just
   "transcribe the call as natural C + route `.legacy.c`" (gotcha 10) —
   the value is the *cataloged template per shape*, not a new codegen
   lever. The recipe-gotchas section is a batch-drain reference, not a
   new wall.
2. **The emitter is c94-only by design.** Generalizing it to families
   B–E would add parsing surface for little gain — B/C/D/E are 2-3
   picks each and trivially hand-written from the template. The 12-pick
   c94 family is where auto-generation pays off; the emitter is scoped
   to it and refuses (returns None) on anything else rather than guess.

## Cross-references

- `docs/research/brief-263-overfire-drain-wave1.md` — named the StyleA
  families this locks.
- `docs/research/recipe-gotchas.md` § StyleA over-fire families (the
  templates) + gotcha 10 (`.legacy.c` routing).
- `docs/research/style-a-epilogue.md` — why `.legacy.c` (mwcc
  1.2/sp2p3) emits the Style-A epilogue.
- `docs/research/brief-256-c39-table-index-and-overfire-scope.md` /
  `brief-260-…` — the over-fire cohort sizing + the refined detector.
