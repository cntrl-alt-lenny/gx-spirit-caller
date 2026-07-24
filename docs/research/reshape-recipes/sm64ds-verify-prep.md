[//]: # (markdownlint-disable MD013 MD033)

# sm64ds delta verification prep

**Purpose:** a build-free, mechanical checklist for the CC lane. The forms
below are transcribed from the current `tangosdev/sm64ds-decomp` catalogue;
the peer results are hypotheses until reproduced against this tree. No peer
source is copied into this repository.

## Compiler and harness contract

The peer catalogue identifies its main compiler as **mwccarm 1.2/sp2p3** with
`-lang c99`. That corresponds to this repository's legacy 1.2/sp2p3 route
(`*.legacy.c` / `*.thumb.c`). The default 2.0/sp1p5 route is a second check;
there is no local “2.0/sp2p3” tier. Use plain `python` on Windows.

For every row, the CC agent should fill `Local candidate .s` from the local
worklist before editing anything. A peer symbol or source path is not assumed
to be the same address in this tree. Preserve the candidate's module and
function body, then test one form at a time:

```text
python tools/verify.py <scratch.c> <func> --cc all --module <main|overlayNNN>
```

The first meaningful comparison is the 1.2/sp2p3/legacy result, then the
2.0/sp1p5 result. `--cc all` is convenient when the scratch file has the
appropriate route variants. Record baseline and best `div`, the exact byte
diff, and relocation/link verdict. A smaller diff is not a match: a win means
byte-identical `.text` plus a clean relocation/link result. The harness and
options are documented in [`brief-524-lever-verification.md`](../brief-524-lever-verification.md).

| Local candidate `.s` | Peer claimed target/source | Baseline div | Best div | Bytes/relocs | Result | Form tried |
|---|---|---:|---:|---|---|---|
| _fill before run_ | _fill from row below_ | | | | | |

## Priority 1 — §7a: categorizer-failure head

The peer's §7a report says that a uniform `register allocation` label was a
categorizer failure, not proof of a register-allocation wall. Six of eight
head candidates matched after ordinary C-structure refinement. Therefore the
CC lane must run the six forms below before routing a residual to the
permuter/floor. The peer's reported target source is reference material; map
the local `.s` by symptom.

| Lever | Local candidate `.s` | Peer target/source | Control → lever form |
|---|---|---|---|
| Reverse-order independent stores | _fill_ | `func_020338b0.c` ([source](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_020338b0.c)) | Write independent stores in the reverse C statement order; optionally hoist one above the guard. Example: `B = b; A = a;` when the desired emission is store A then B. |
| Block-scope loop pointer; counter declared last | _fill_ | `func_0203128c.c` ([source](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_0203128c.c)) | Control: `T *p = ...; int i;` at function/loop scope. Lever: `if (cond) { T *p = ...; int i; }`. Keep the counter declaration after the pointer. |
| Stage a store triple through a local struct | _fill_ | `func_0200c394.c` ([source](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_0200c394.c)) | Control: `out->x=x; out->z=z; out->y=y;`. Lever: `struct { int x,z,y; } t; t.x=x; t.z=z; t.y=y; out->x=t.x; out->z=t.z; out->y=t.y;`. Preserve the target's field/order and widths. |
| Short-typed callee parameters | _fill_ | `func_0205f77c.c` ([source](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_0205f77c.c)) | Control: `int f(int a,int b) { unsigned short x=a; ... }`. Lever: `int f(unsigned short a,unsigned short b) { ... }`. Check ABI/prototype consequences before applying. |
| Argument pass-through keeps r0–r2 live | _fill_ | `func_02068dc8.c` ([source](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_02068dc8.c)) | Control: `callee();`. Lever: declare/pass the real three arguments: `callee(a,b,c);`. The peer reports zero instruction cost and scratch rotation to r3. |
| Drop an index temporary for pure array subscripts | _fill_ | `func_0203bc7c.c` ([source](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_0203bc7c.c)) | Control: `int ofs=i*2; v=arr[ofs];`. Lever: `v=arr[i];`. Pair with `#pragma opt_loop_invariants off` only when the candidate's symptom calls for it. |

Run order for §7a:

1. Snapshot the local `.s`, its header, and the initial category.
2. Re-run the categorizer/refiner with all categories included; do not filter to
   `register allocation`.
3. Apply each of the six structural forms independently, legacy first and 2.0
   second.
4. Record baseline/best `div`, byte/relocation verdict, and the exact form.
5. Only after all six fail may the residual be routed to permuter/floor.

Peer negative controls, which survived the peer's refinement cascade, are
`_ZN3OAM6RenderEbP7OamAttriiiiP9Matrix2x2` (reported div 2) and
`func_020729f4` (reported div 3). They are useful controls against assuming
that every §7a head is source-controllable.

## §6k — reverse declaration order

Peer rule: long-lived callee-saved locals are assigned in reverse C declaration
order. The peer target is `_ZN5Stage9PS_RenderEv` (reported 724 instructions,
div 21 → 0). Source: [`_ZN5Stage9PS_RenderEv.cpp`](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/_ZN5Stage9PS_RenderEv.cpp).

| Local candidate `.s` | Control form | Lever form | Expected symptom |
|---|---|---|---|
| _fill_ | Same locals in natural/forward declaration order. | Use this exact peer order: `int var_sl; unsigned char var_sb; unsigned char var_r8; int var_r7; int sp18;`. Keep types, uses, and body fixed. | A callee-saved register swap/spill with otherwise matching code. |

Do not combine this with a value-identity swap (§6q); the experiment must say
whether declaration order or the value assigned to a name moved the web.

## §6q — variable identity, not declaration order

Peer target: `func_ov006_020d6e8c`, with an `r8`/`sb` residual. Source:
[`func_ov006_020d6e8c.c`](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_ov006_020d6e8c.c).
After declaration-order and definition-order permutations fail, keep
declarations and statements fixed and swap which value is carried by the two
named locals:

```c
/* control */
int r8_value = value_A;
int sb_value = value_B;

/* lever */
int r8_value = value_B;
int sb_value = value_A;
```

Apply the corresponding identity swap at uses without changing types or
control flow. The required local target field is the `.s` with exactly the
two-callee-saved-web symptom; do not use the peer address as a local address.

## §6u — backend conditional optimisation

Peer target `func_02068398` has a single-condition `cmp; beq; mov` residual;
the peer reports a floor at div 1. The matching precedent is the genuinely
two-condition CFG in `func_0205c048`.

| Local candidate `.s` | Control | Lever/control comparison | Note |
|---|---|---|---|
| _fill_ | `if (p != 0) { sel = y; }` | Compare against: `if (r8 != 0) goto Lsep1; if (spflag == 0) goto Lskip1; Lsep1: r8=1; Lskip1:`. | The backend generally predicates a short single-predecessor block, but will not predicate a block with two CFG predecessors. Calls, flag setters, and live loops also refuse this transformation. |

Use the peer sources [`func_02068398.c`](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_02068398.c)
and [`func_0205c048.c`](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_0205c048.c)
as the control-flow references. This is a backend-shape check, not a request
for inline assembly or a pragma workaround.

## §6y — callee-saved register-web steering

The peer records four source-level steering forms. Its examples are
`_ZN3OAM6RenderEbP7OamAttriiii5Fix12IiES3_ii` (reported div 67 → 2) and
`_ZN12WithMeshClsn20UpdateExtraContinousEv` (reported div 246 → 5). No peer
symbol is an automatic local-address mapping; select a local candidate by the
same register-web symptom.

| Lever | Local candidate `.s` | Control → lever form |
|---|---|---|
| Zero-instruction self-select | _fill_ | `h = GetObjHeight(...);` → `h = GetObjHeight(...); h = h ? h : h;` (or `h = h ? h : h;`). |
| Scope depth | _fill_ | Function-top `int h;` → loop-scope `while (...) { int h; }` or nested-block `{ int h; }`. The peer measured distinct callee-saved placements for these scopes. |
| Copy placement across calls | _fill_ | Before: `y=u; call_a(); call_b();` → after: `call_a(); y=u; call_b();`. Keep the competing definition and calls otherwise unchanged. |
| Volatile memory source | _fill_ | `c0 = src->si.w0;` → `c0 = *(volatile s32 *)&src->si.w0;`. Use only where the candidate already has a memory-ordering/load-shape symptom. |

## §6z — seven lever cascade

These are seven peer-reported forms from the 2026-07-21 cascade. Each local
target must be selected by symptom; the peer target/source column records what
the peer says cracked.

| # | Lever | Local candidate `.s` | Peer target/source | Exact control → lever form |
|---:|---|---|---|---|
| 1 | Disable loop-invariant motion around a laundered RMW | _fill_ | `func_0205e6e4.c` ([source](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_0205e6e4.c)) | Control: `int *p=LAUNDER(base); use(p);`. Lever: put `#pragma opt_loop_invariants off` around that code, then `#pragma opt_loop_invariants reset`. |
| 2 | Use the array element's short type | _fill_ | `func_0202048c.cpp` ([source](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_0202048c.cpp)) | `int v = data_02082214[i];` → `short v = data_02082214[i];`. |
| 3 | Use `char *` for pointer arithmetic | _fill_ | `func_ov075_021190a4.c` ([source](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_ov075_021190a4.c)) | `int *p;` → `char *p;` where the pointer arithmetic is the scheduler symptom. |
| 4 | Make both globals in a load/store pair volatile | _fill_ | `func_ov006_020ed8a4.c` ([source](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_ov006_020ed8a4.c)) | Plain globals/lvalues → `volatile` on both sides of the pair; do not mark only one side. |
| 5 | Invert the if-arm to defeat if-conversion | _fill_ | `func_ov063_0211aa34.c` (peer catalogue target) | `if (cond) then_store(); else plain_store();` → `if (!cond) plain_store(); else then_store();`. |
| 6 | Split `count++` from the indexed store | _fill_ | `func_0205e280.c` (peer catalogue target) | `buf[c->count++] = v;` → `old=c->count; c->count++; buf[old]=v;`. |
| 7 | Move volatile stack captures before the multiply | _fill_ | `func_ov006_02124088.c` ([source](https://github.com/tangosdev/sm64ds-decomp/blob/main/src/func_ov006_02124088.c)) | Preserve both volatile captures but move their statements before the multiply; the peer reports this rotates the multiply destination. |

The peer also recommends escalating div ≤ 20 before declaring a floor and
records a truncated-target tooling bug (`func_ov064_0211a4c4`). Treat both as
workflow guardrails, not additional levers.

## §7b — exact forms and assembly syntax correction

The peer's amended §7b says that the assembler accepts conditional
`ldmeqia sp!, {lr}`, `bxeq lr`, and `DCD 0x<word>`. The older claim that C
cannot express those conditional forms is therefore not an assembler-syntax
claim. It remains a readable-C feasibility question: whole-function asm is not
a readable-C match.

| Lever | Local candidate `.s` | Control → lever form |
|---|---|---|
| Fake-dependency store reorder | _fill_ | `vy = y_expr; v.x = vy ? (sx << 3) : (sx << 3);` before the store; preserve the target store order. |
| Mixed temp/RMW writeback | _fill_ | For the six-element writeback, keep the target store statements in order but use temporaries for the subset whose definitions must interleave with the stores. Record the exact per-element before/after form in the worksheet. |
| Volatile both sides | _fill_ | `i=cnt-1; cnt=i; arr[i]();` with both the global counter and function-pointer array volatile, rather than volatile on one side only. |
| Real callee width/arity | _fill_ | Use the actual `long long` return width and third argument where present. A missing `mov r2,#0` can be a live CSE zero, not proof of a missing argument. |
| Basic-block placement | _fill_ | If a duplicated constant suggests the wrong CFG, move the five related statements into the `else` block; do not infer a missing operation from the duplicate alone. |

For syntax-only scratch validation, test `ldmeqia`, `bxeq`, and `DCD` in an
isolated file. Do not put inline asm into the game-function candidate as a
substitute for a readable-C source match.

## Verification worksheet

Copy one row per experiment. The “before” and “after” columns must contain the
actual local C diff, not just the recipe name.

| Section/lever | Local `.s` | Module | Before C form | After C form | CC tier | Baseline div | Best div | Byte-identical? | Relocs/link clean? | Notes |
|---|---|---|---|---|---|---:|---:|---|---|---|
| | | | | | 1.2/sp2p3 | | | | | |
| | | | | | 2.0/sp1p5 | | | | | |

Final disposition must be one of `MATCH`, `NEAR-MISS`, `NO CHANGE`, or
`NOT APPLICABLE`. A `NO CHANGE` result is useful negative evidence; do not
rename it a floor until the candidate's relevant alternate categories and the
required compiler tiers have been checked.

## Source

The complete peer catalogue snapshot used for this prep is
[`mwccarm-codegen.md`](https://github.com/tangosdev/sm64ds-decomp/blob/75213e58f490c64fdf9646a711129addd366c893/notes/mwccarm-codegen.md)
(commit `75213e58f490c64fdf9646a711129addd366c893`).
