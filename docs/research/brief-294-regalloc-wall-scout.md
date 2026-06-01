[//]: # (markdownlint-disable MD013 MD041)

# Brief 294 — scouting the reg-alloc wall: prior art + crossability verdict

**Status:** scouted. decomp.me / research only — no SHA1, no `.c`/`.s`
shipped. Web sources treated as data (no install piped). **Verdict: the
reg-alloc wall is NOT a solved problem elsewhere — the whole CodeWarrior/
mwcc decomp scene uses the same indirect tool we do (decomp-permuter; no
reg-alloc oracle exists), and its accepted endgame for the unmatchable
tail is exactly ours: ship the original assembly (byte-exact, SHA1-
complete) with best-effort C as documentation. No untried mwcc C-level
allocator lever exists — `register` is inert, naive expression-duplication
folds, `volatile` is inert on the wall shape. The realistic endgame is
ship-as-`.s` for the ~46 % reg-alloc-walled cohort; a purpose-built
reg-alloc oracle is net-new R&D the scene itself has never built.**

## (1) Prior art — the scene has no better tool, and ships asm

How the CodeWarrior/mwcc (and broader) matching-decomp scene handles
reg-alloc-divergent functions:

- **The tool IS decomp-permuter — and it is indirect, not an oracle.** Its
  own README: it is "generally best towards the end, when mostly regalloc
  changes remain," but it has **no register-allocation-aware mode** — it
  mutates C source (temps, types, statement/line reorder) and finds
  allocation improvements "by accident," and is explicitly "quite bad at
  resolving stack differences." This is the same tool we vendor (brief
  276), and the same plateau we measured (briefs 288/292). ARM ports exist
  (`laqieer/decomp-permuter-arm`) but add no allocation-awareness.
- **The standard pipeline is ours.** The scene's documented flow is
  `m2c → compiler → objdiff → decomp-permuter` — exactly the brief-276
  loop. `objdiff` (encounter) is the diff/score backend; there is **no
  published "objdiff-guided search beyond the permuter," no allocation
  oracle, no reg-alloc-aware fork** — searches for one return only the
  permuter and academic register-allocation papers, nothing decomp-side.
- **The accepted endgame for unmatchable functions is ship-as-asm.** A
  matching-decomp repo "contains both assembly (`.s`) files and C code…
  once a function is successfully decompiled it is removed from the
  assembly." Functions that resist matching **stay as the original
  assembly** (the `NON_MATCHING` / `GLOBAL_ASM` convention) so the linked
  binary is byte-exact, with the best-effort C kept behind a flag as
  documentation. **This is exactly our `.s` hatch** (brief 290
  `asm_escape.py`; the hand `.s` precedent `func_ov002_021ff3bc.s`).
- **The frontier is unproven.** 2025-26 work on LLM-assisted matching
  decompilation (LLM4Decompile, "Can LLMs Really Do Matching
  Decompilation", Mizuchi, kappa) exists but is research-grade, not a
  byte-exact reg-alloc solution.

**Takeaway:** there is nothing to adopt. We already run the scene's best
tool and already have its endgame mechanism.

## (2) Untried mwcc allocator levers — piloted, all inert

The scene's reg-alloc source idioms (temps, type swaps, declaration
reorder, **expression duplication**) are what the permuter already
explores. The genuinely-untried, source-level allocator hints —
`register`, naive duplication, `volatile` — piloted under our exact cflags
(`mwcc 2.0/sp1p5`) on the **call-in-loop wall shape** (a value live across
a `bl`, the brief-292 dominant waller):

| lever | result |
|---|---|
| `register int acc, i;` | **identical codegen** — mwcc 2.0 **ignores `register`** for allocation |
| expression duplication (`+ p[i] - p[i]`) | **identical** — the optimizer **folds** it away |
| `volatile int acc;` | **identical on the wall shape** — the value is *already* stack-resident across the call, so `volatile` adds nothing (elsewhere it only adds loads/stores — wrong direction, gotcha 17) |

**Why the wall is not source-steerable.** In the baseline, the loop-carried
values land in **callee-saved registers r4–r7** (pushed at entry) because
they are live across the `bl helper`:

```text
push {r3,r4,r5,r6,r7,lr}   ; acc->r4  i->r5  p->r7  n->r6
...
1c: ldr r0,[r7,r5,lsl#2] ; bl helper ; ... ; add r4,r4,r0 ; blt 1c
```

*Which* callee-saved register each value occupies (acc=r4 vs r5 vs …) is
mwcc's allocation decision over the r4–r11 pool — a choice C cannot name
(`register` is inert) and the permuter can only shuffle by accident. The
only per-function lever that changes the allocation wholesale is switching
the **mwcc version** (the project's `.legacy.c` / `.legacy_sp3.c` routing)
— a coin-flip of a different compiler's allocator, already in the toolkit,
not a steering wheel.

**Verdict on levers: there is no untried C-level lever that steers
mwcc 2.0's register allocator.** The allocator is simply not exposed to
source control beyond what the permuter already (indirectly) reaches.

## (3) Crossability verdict + recommended endgame

**Is the reg-alloc-walled cohort eventually crossable in C?** Not
reliably, and not with any tool that exists today:

- It is **not source-expressible** (`register` inert; the allocation is a
  permutation of the callee-saved pool C cannot name).
- It is **not the `.s`-hatch class** — that hatch (brief 290) is for a
  *single* commutative-operand canonicalisation; the reg-alloc wall is a
  *whole-function* allocation difference, which `asm_escape.py` correctly
  **REFUSES**.
- It is **not permuter-crossable in general** — the permuter helps
  scheduling (brief 292: 37 % on a `>0x200` func) but plateaus on
  systematic allocation (hard plateau, 0 improvement), and the scene's own
  permuter is no better.

**Recommended endgame — adopt the scene's norm: ship-as-`.s` for the
walled tail.** For the ~46 % reg-alloc-walled bytes (call-in-loop loops +
call-heavy `>0x200`), the realistic, available path to **SHA1-completeness
is shipping the original function as a byte-exact assembly TU** — the same
`NON_MATCHING`/`GLOBAL_ASM` move the GC/Wii/DS scene uses for its
unmatchable tail. The machinery already exists: `asm_escape.py`'s
disasm→mwasm→assemble→byte-verify core produces byte-exact `.s`; a
**raw whole-function mode** (no byte-near-C guard) would emit a walled
function's `.s` directly (distinct from the surgical 1-instruction hatch).
The best-effort C stays as documentation, re-decompilable later if a tool
emerges.

This is an honest trade: it reaches **byte-identical / SHA1-complete** but
the walled half is **asm, not C** — which is precisely the compromise the
entire scene accepts. It does **not** require, and should **not** wait on,
a new tool.

**Do NOT build a reg-alloc oracle now.** Modelling or searching mwcc's
allocator directly is net-new R&D that the mwcc decomp community — with
far more person-years than this project — has not produced in a decade.
LLM-assisted matching is an unproven frontier. Either is a *contingent
future upgrade* (the shipped `.s` can be replaced with C if such a tool
ever lands), not a prerequisite for finishing the binary.

**Recommended path:** keep hand-RE + permuter + the surgical `.s` hatch as
the toolkit for the reachable ~50 %; add a **raw whole-function `.s`**
endgame (extend `asm_escape.py` with a guard-free mode, or a sibling
emitter) for the walled ~46 % to close the ROM to SHA1; treat a reg-alloc
oracle / LLM-matcher as a watch-item, not an investment.

## Falsification

- "no reg-alloc tool in the scene": searches for a reg-alloc-aware
  permuter fork / allocation oracle / objdiff-guided search return only
  decomp-permuter + academic papers (sources below). Flips if such a tool
  surfaces.
- "`register`/dup/volatile inert": A/B compiles under our cflags on the
  call-in-loop shape — identical codegen (re-runnable; `/tmp/sc294`).
- "ship-as-asm is the scene norm": the `.s`-stays-until-matched repo
  convention (sources below); our own `021ff3bc.s` precedent.
- The verdict flips iff a source lever or tool is shown to steer mwcc's
  callee-saved allocation to a named target — none found here or in prior
  art.

## Scope

Research only: no `.c`/`.s` shipped, no SHA1, no tool change (the
recommendation — a guard-free `.s` mode — is a proposal for a future
brief, not implemented here). Lever pilots are `/tmp` A/B compiles. Web
content was read as data.

## Sources (read as data)

- `simonlindholm/decomp-permuter` README — indirect regalloc, no oracle,
  "bad at stack diffs".
- `decomp.wiki` / Decompedia (MWCC, GameCube/Wii) + `doldecomp` melee
  getting-started — the `m2c→compiler→objdiff→permuter` flow + asm-stays-
  until-matched convention.
- `encounter/objdiff`, `encounter/decomp-toolkit` — the diff/score backend
  (no allocation search).
- `laqieer/decomp-permuter-arm` — ARM permuter port (no allocation-aware).
- LLM4Decompile / "Can LLMs Really Do Matching Decompilation" / Mizuchi —
  the unproven LLM frontier.

## Cross-references

- `docs/research/brief-292-loop-cohort-characterization.md` — the ~46 %
  reg-alloc-walled ceiling this scouts a path past.
- `docs/research/brief-288-wave7-addorder-residue.md` /
  `brief-290-asm-escape-hatch.md` — the surgical `.s` hatch the endgame
  extends to whole-function mode.
- `docs/research/brief-276-permuter-standup-pilot.md` — our permuter loop
  (= the scene's standard pipeline).
- `src/overlay002/func_ov002_021ff3bc.s` — the whole-function `.s`
  precedent the endgame generalises.
