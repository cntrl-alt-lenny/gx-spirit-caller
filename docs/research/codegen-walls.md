# codegen-walls

**Asked:** brain noted that briefs 020, 022, 028, 029, 030, 031
have each shipped a "Reg-alloc carryover" or "Dropped (with
reason)" section in the PR body, and the same patterns are
recurring across pilots. Consolidate into a single grep-able
reference so future cluster pilots stop re-discovering each wall.
Same research format as
[`ov006-cluster-stuck.md`](ov006-cluster-stuck.md) /
[`hard-tier-clustering.md`](hard-tier-clustering.md) /
[`medium-tier-plateau.md`](medium-tier-plateau.md).

**Short answer:** **25 distinct mwcc-vs-baserom codegen
divergences** account for the **55+ dropped matches across the
eight pilot waves** (020 / 022 / 028 / 029 / 030 / 031 / 040 /
047-wave9; the per-PR cross-reference table below covers
these; brief 046 waves 5–7 added three new C-N coercions
documented in C-10 / C-11 / C-12; brief 047 wave 9 surfaced
**C-13** (predicated if-X order) — fold-only, the research
already happened in the wave PR — and **W-F** (r2-vs-r1
cmp-scratch reg-alloc) which brief 050's research classified
as **C-14** (2-arg pass-through coercion). Most fall into one
of three buckets: **coercible-with-knowledge**
(14 patterns — the right C variation matches; future briefs
can grep here first), **permanent** (8 patterns — mwcc keeps
"winning" the codegen choice regardless of C variation; budget
zero matches in the yield band), and **tooling-tractable**
(3 patterns —
`propagate_template` could ship a register-renaming or
literal-substitution variant — T-1, T-2 still proposed; T-3
third compiler routing tier **shipped in PR #340** via brief
045). Brief 031's HIGH 78% under-delivery (22%) was dominated
by 2-3 walls (r2-vs-r3 spill on swap thunks, pool-load vs
add-imm chain, ldmib fusion) that all sit in the *permanent*
bucket. Brief 040's 4 drops surfaced a third compiler flavour
(mwcc 1.2/sp3) that the project's two-tier routing didn't reach
— now reached via the `*.legacy_sp3.c` convention; see T-3.
The full table of patterns + the per-PR dropped-symbol
cross-reference is below; future pilots that hit a partial-match
shape should grep the *Permanent* and *Coercible* sections first
before iterating on C variations.

## Method

Read the PR bodies for the six cluster pilots most recently shipped
(PRs #297 / #301 / #309 / #311 / #313 / #315). Each has a
`## Dropped (...)` section listing per-symbol drop reasons, and
several have a `## Reg-alloc notes (carryover)` section listing
diagnostic patterns the decomper found while iterating. Pulled
every named pattern, deduplicated by codegen mechanism (so brief
022's `lsl 24 / lsr 24` low-byte-zero-test and brief 028's
`(x << 30) >> 30` mask-collapse merge into one entry, since the
underlying mwcc transform is identical), and classified each by
whether a known C variation matches it.

Source-PR coverage:

| Brief | PR  | Yield | Matched | Dropped |
|------:|----:|------:|--------:|--------:|
| 020   | 297 | 87.0% |     20  |       3 |
| 022   | 301 | 77.4% |     24  |       7 |
| 028   | 309 | 61.4% |     27  |      17 |
| 029   | 311 | 70.0% |     21  |       9 |
| 030   | 313 | 71.4% |     10  |       4 |
| 031   | 315 | 22.2% |      2  |       7 |
| 040   | 332 | 63.6% |      7  |       4 |
| 047/wave9 | 357 | 73.3% |  11  |       4 |
| —     | —   |   —   | **122** |  **55** |

Each pattern gets: a name, the target asm shape, the mwcc-emitted
asm shape, the C source variation that *did* coerce it (when
known) or *didn't* (with a one-line reason), and a *use when*
hint. The bucket header indicates how to budget the pattern in a
yield prediction.

## Coercible-with-knowledge (14 patterns)

Specific C source variation matches; the right shape is known.
Grep these first when a partial-match drop shape looks familiar.

### C-1. Predicated-execution: pure pred-exec vs early-return

**Target asm:**

```

cmp r0, ...; movle ...; bxle lr; ...; bx lr

```

i.e. pure conditional movs + conditional bx, no branches.

**mwcc emits when miscoded:**

```

cmp r0, ...; bne .L1; ...; bx lr; .L1: ...; bx lr

```

i.e. real branches with separate basic blocks.

**C that coerces it:**

```c
int f(int a) {
    if (cond) { side_effect; a = b; }
    return a;
}

```

Combine the conditional side effect *and* the conditional value
update into a single non-returning if-body, then return at the
end. mwcc's predication pass picks up 2-3-op if-bodies. Pred-exec
only fires when **no early `return`** appears in the if-body.

**C that breaks it (drops to early-return shape):**

```c
if (cond) { side_effect; return b; }
return a;       // forces bxeq lr branch

```

**ARM-op limit (≤3-op if-body):** brief 033's pilot of
`func_0201397c`'s residue cluster surfaced a hard threshold. The
predication pass reliably switches to early-`bxXX lr` once the
if-body expands to **≥4 ARM instructions**, regardless of which C
phrasing is used. mwcc has no flag or pragma exposed to raise the
limit, and no source-shape variation tested in brief 033 changed
the emit. The matched-vs-dropped historic data:

| Function              | If-body ARM-ops | Outcome           |
|-----------------------|----------------:|-------------------|
| `func_02054ea8` (b020)|               3 | predication ✓     |
| `func_02052798`/`b8`/`d8`/`f8` (b022) |  3 | predication ✓     |
| `func_02067b8c` (b028, b033) |        4 | `bxge lr` early-return ✗ |
| `func_0207f8f8` (b028, b033) |        4 | `bxge lr` early-return ✗ |
| `func_02087d10` (b028, b033) |        4 | `bxge lr` early-return ✗ |

The 4-op trigger applies even for the canonical recipe
`if (cond) { side; a = b; } return a;` — adding a fourth ARM op
(typical: a second store, or an arithmetic chain that doesn't
fold into a single instruction) tips mwcc into the branch form.
Brief 033 tried 5 source variations on a 4-op body before
escalating; none matched.

**Use when:** the target has any sequence of conditional movs +
conditional bx **AND** the equivalent if-body would expand to ≤3
ARM instructions. Above that, treat the function as a permanent
wall (P-6 below) and skip without iterating.

**Provenance:** matched — brief 020 `func_02054ea8`, brief 022
`func_02052798`/`b8`/`d8`/`f8`. Dropped at the 4-op limit —
brief 028 `func_02067b8c`/`func_0207f8f8`/`func_02087d10`
(originally tagged C-1-coercible; brief 033 reattempted the
same residue-cluster siblings and confirmed the threshold via
the 5-variation iteration above, reclassified to P-6).

### C-2. Local-pointer reuse for two-field reads

**Target asm:**

```

ldr  r3, =data
ldr  r1, [r3, #N]
str  r1, [r3, #M]

```

Single `&data` materialisation, both ops use `r3`.

**mwcc emits when miscoded:**

```

ldr  r3, =data
ldr  r1, [r3, #N]
ldr  r2, =data            ; second materialisation
str  r1, [r2, #M]

```

or interleaves an unrelated store between the two operations.

**C that coerces it:**

```c
T *p = data;        /* local-cached */
p->m = p->n;        /* two ops via the same p */

```

**C that breaks it:**

```c
data->m = data->n;  /* mwcc may re-materialise on the second access */
volatile T *vp = data;
vp->m = vp->n;      /* volatile forces TWO reads, worse than miscoded form */

```

**Use when:** target has one address materialisation + two ops.
This pattern was specifically called out in briefs 022's
carryover notes (cleaner than `volatile` for one-read flow) and
broke `func_0208904c` (brief 022) when missed.

**Provenance:** brief 022 carryover + drop, brief 028 implicit.

### C-3. Volatile-cast to suppress CSE on self-copy / redundant load

**Target asm:**

```

ldr  r1, [r3, #N]
str  r1, [r3, #N]            ; re-store same value (e.g. memory-mapped flush)

```

**mwcc emits when miscoded:**
mwcc CSE-elides the load-then-store-same-value because it knows
the value didn't change. Output is empty for this fragment.

**C that coerces it:**

```c
struct {
    volatile int field;     /* or cast at the access site */
} *p = data;
p->field = p->field;

```

The `volatile` qualifier blocks CSE.

**Use when:** target has an obvious memory-mapped or
synchronisation flush (load + immediate re-store of the same
field, no transformation in between).

**Provenance:** brief 020 carryover note + `func_020388f0` match.

### C-4. Range-check pure pred-exec (1≤x≤K bool)

**Target asm:**

```

cmp r0, #L
movge r0, #1
bxge lr
cmp r0, #H
movle r0, #1
bxle lr
mov r0, #0
bx lr

```

**mwcc emits when miscoded** (fragmented branches): regular
`cmp/blt/cmp/bgt/mov/bx` pattern.

**C that coerces it:**

```c
int f(int a) {
    if (a < L) return 0;
    if (a > H) return 0;
    return 1;
}

```

Two separate early-returns produce predicated movs.

**Or alternatively** for the `(x<A?0:x<B?1:2)` 3-way classifier
(brief 028 `func_0201397c`): nested ternary collapses cleanly to
the conditional-mov ladder.

**Provenance:** brief 028 `020190d0`, `0201397c`, `020a099c`.

### C-5. Pass-through dispatcher fnptr in r1

**Target asm:**

```

push {r3, lr}
ldr  r1, =data
ldr  r1, [r1, #N]            ; r1 = data->fnptr_N
blx  r1                      ; r0 = caller's unmodified arg
pop  {r3, pc}

```

**The trick:** mwcc materialises the fnptr in **r1** (not r0)
because r0 already holds the caller's unmodified arg passed
through to the callee.

**C that coerces it:**

```c
typedef int (*fn_int_t)(int arg);
typedef struct { ... fn_int_t fnptr_N; } data_t;
extern data_t data;
int f(int arg) {
    return data.fnptr_N(arg);  /* arg flows through r0 untouched */
}

```

**Use when:** target has push/ldr/ldr/blx-reg/pop shape and the
call target is loaded from a global struct.

**Provenance:** brief 020 carryover + `func_02031d80`,
`ov000_021adb58`.

### C-6. Long-long return via pointer cast (avoid arithmetic pack)

**Target asm:**

```

ldr  r2, [r0, #N]
ldr  r1, [r0, #N+4]
mov  r0, r2
bx   lr

```

**mwcc emits when miscoded** (arithmetic pack):

```

... ldr r2 / ldr r1 / orr r1, r1, #0 / orr r0, r0, #0 / bx lr

```

The two `orr ..., #0` are no-op moves that mwcc inserts for
`((u64)hi << 32) | lo` arithmetic packing.

**C that coerces it:**

```c
unsigned long long f(T *p) {
    return *(unsigned long long *)&p->field;
}

```

Pointer-cast to `u64*` produces clean two-load-and-mov.

**C that breaks it:**

```c
return ((u64)p->hi << 32) | (u32)p->lo;   /* spurious orr/0 pack */

```

**Use when:** target has 2 consecutive loads + a `mov r0, r2` +
`bx lr`. The pointer cast is the way; arithmetic shape is not.

**Provenance:** brief 030 `func_02033308`, carryover note.

### C-7. Strlen variants (post-increment vs indexed)

Two distinct strlen-shape codegens, picked by which C source form
matches:

- **Post-increment form** — target uses `ldrsb r1, [r0], #1`:

  ```c
  size_t strlen_b(const signed char *p) {
      size_t n = (size_t)-1;
      while (*p++) n++;
      return n;
  }

  ```

  (brief 028 `func_020aaddc` matched.)

- **Indexed form** — target uses `[r0, r2]`:

  ```c
  size_t strlen_b_indexed(const signed char *p) {
      size_t i = 0;
      while (p[i]) i++;
      return i;
  }

  ```

  (brief 029 `func_ov004_021dbd08` *did not match* with the
  post-increment form; needed the indexed C form. Future
  pilots: read the asm and pick the C shape that matches the
  addressing mode.)

**Use when:** target asm is a 5–7-instruction byte/halfword
counting loop. Look at the load addressing mode first.

**Provenance:** brief 028 match + brief 029 drop.

### C-8. mwasmarm syntax for inline-asm escapes

When pure C can't reach the target shape, drop into a `.s` file.
mwasmarm has two non-obvious operand-syntax rules:

- **`swi` operand has no `#` prefix:** `swi 0x123456`, not `swi
  #0x123456`.
- **`mrc`/`mcr` coprocessor numbers / opc1 / opc2 have no `#`
  prefix:** `mrc p15, 0, r0, c9, c1, 0`.

The existing `src/main/OS_DisableIrq.s` is a usable template for:

| Privileged operation                       | Where it appears                          |
|--------------------------------------------|-------------------------------------------|
| `mrs/msr cpsr_c` IRQ enable/disable        | brief 029 `02093790`, `020937d0`           |
| `mrc p15 c9/c1` (DTCM region read + mask)  | brief 029 `02092e38`                       |
| `mrc/mcr p15 c5/c0` cache RMW              | brief 029 `02092e6c`                       |
| `mrc/orr/mcr p15 c1/c0` MMU enable         | brief 030 `func_02092e4c` / `_5c`          |
| `swi 0x123456` debugger trap               | brief 029 `020b41c0/d4`, brief 030 `_e8`   |

**Use when:** target instruction set includes coprocessor /
status-register / SWI operations. Direct `.s` is faster than
fighting mwcc inline-asm escapes.

**Provenance:** brief 029 carryover note + 6 / 30 matches in
that brief came via `.s` files; brief 030 reused the pattern.

### C-9. Saturating-cap predicate: leave the prev temp uninitialized

Target asm (W-A in brief 040):

```

push  {r4, lr}
bl    OS_DisableIrq
ldr   r2, .L_data
mvn   r1, #0x0                ; r1 = 0xffffffff cap
ldr   r3, [r2, #0x0]
cmp   r3, r1
addlo r1, r3, #0x1            ; predicated body — 3 ops
movlo r4, r3
strlo r1, [r2, #0x0]
bl    OS_RestoreIrq
mov   r0, r4
pop   {r4, lr}
bx    lr

```

i.e. predicated saturating-pre-increment: `if (*p < UINT_MAX) {
prev = *p; (*p)++; }`. The `mvn r1, #0` materialises the
0xffffffff cap; the if-body fits the C-1 ≤3-op predication
threshold so it lands as `addlo`/`movlo`/`strlo` — no branch.

**mwcc emits when miscoded** (extra `mov r4, #0` initialiser):

```

push  {r4, lr}
bl    OS_DisableIrq
ldr   r2, .L_data
mvn   r1, #0x0
ldr   r3, [r2]
mov   r4, #0                  ; ← spurious init, +4 bytes
cmp   r3, r1
addlo / movlo / strlo
...

```

mwcc inserts the `r4 = 0` even with `prev = 0` declared *after*
the pointer-load, because at -O4,p its dataflow pass treats
`prev` as having an unconditional initialiser before the
predicated body.

**C that coerces it (verified byte-identical against W-A):**

```c
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern unsigned int data_021a63bc;

unsigned int func_020916c8(void) {
    unsigned int prev;       /* leave UNINITIALISED */
    int saved = OS_DisableIrq();
    unsigned int v = data_021a63bc;
    if (v < 0xffffffffu) {
        prev = v;
        data_021a63bc = v + 1;
    }
    OS_RestoreIrq(saved);
    return prev;
}
```

**C that breaks it:** `unsigned int prev = 0;` — adds the
`mov r4, #0` (1 instruction, 4 bytes over).

**Why it works.** The "uninitialised local that's read on a
fall-through path" is C-undefined behaviour at runtime, but
mwcc's dataflow doesn't insert a defensive zero-init when the
reads are *all* on paths where the predicated body did write
the value — and the project's `-w off` flag suppresses the
warning. On overflow at runtime the function returns whatever
r4 was (caller-saved register stale), which the caller is
presumably designed to never observe (the cap is `UINT_MAX`
on a counter that only counts up).

**Use when:** target has a `mvn r1, #0` cap + 3 predicated
ops + bx-style return. Drop the `= 0` from the `prev` (or
similar) local declaration.

**Provenance:** brief 040 W-A (`func_020916c8`) — initially
flagged "permanent" in the PR body; brief 042 surfaced the
coercion + verified byte-identical. **How brief 040 missed
it:** decomper iterated on the C variant *body* (changing
the `<` to `!=`, etc.) without reconsidering the local
declaration's `= 0` initialiser.

### C-10. Late-return early-zero: invert the null-check

**Target asm:** the function has **two separate epilogue pops** —
one at the end of the main success-path, one at a late "return
0" basic block that the early-null-check branches into. mwcc
emits these as two distinct `pop {regs, pc}` sequences; nothing
shared.

**mwcc emits when miscoded** (sharing the epilogue with the
main return):

```c
/* breaks: mwcc shares the early-return pop with the main
   return because the success-path lands at the same merged
   epilogue block. */
int f(T *p) {
    if (p == 0) return 0;
    /* main work */
    return 1;
}
```

mwcc with this shape produces a single shared epilogue. Target
ROM has two separate pops.

**C that coerces it (verified byte-identical):**

```c
int f(T *p) {
    if (p != 0) {
        /* main work */
        return 1;
    }
    return 0;
}
```

The inverted test pulls the early-zero `return 0;` to the END
of the C source, after the main work. mwcc's epilogue layout
follows the source order: a return-at-the-end gets its own
`pop` block; a return-at-the-front-after-an-early-check shares
with the main return.

**Use when:** target has two separate `pop {regs, pc}` blocks
where one is the "null path" return-zero and the other is the
"success path" return-N. The conventional `if (p == 0) return
0; ...; return 1;` shape merges them; **inverting the test**
splits them.

**Provenance:** brief 046 wave 5 (PR #342) dropped
`func_0200b06c` because the conventional null-check shape
shared epilogues; brief 046 wave 6 (PR #345) re-attempted with
the inverted test and matched byte-identically. **How brief 046
missed it on first pass:** the "guard then work" mental model
maps naturally to `if (p == 0) return 0; ...` — the inverted
form reads as a slightly-awkward "do the work conditionally"
rephrase but produces the right epilogue shape.

### C-11. Return arg, not literal, for predicated `ldmeqia`

**Target asm:** the function has a predicated single-instruction
pop that uses the cmp's already-zero r0 directly:

```text
cmp r0, #0
ldmeqia sp!, {regs, pc}    ; predicated pop; r0 == 0 already, no mov needed
... main path ...
```

i.e. when the if-condition is true, mwcc emits NO explicit
`mov r0, #0` before the pop — because r0 is already 0 from the
test. The pop instruction itself carries the predicate.

**mwcc emits when miscoded** (extra `mov r0, #0`):

```c
int f(int x, ...) {
    if (x == 0) return 0;        /* breaks: extra mov r0, #0 */
    /* main work */
    return 1;
}
```

mwcc treats the literal `0` as a fresh value to materialise,
emitting `mov r0, #0; pop {...}` (2 instructions) where target
has the single predicated pop.

**C that coerces it (verified byte-identical):**

```c
int f(int x, ...) {
    if (x == 0) return x;        /* matches: predicated ldmeqia */
    /* main work */
    return 1;
}
```

Returning `x` exploits the fact that *x is provably 0 in this
branch* — mwcc's optimiser recognises the equivalence and
collapses the move. For pointer args, `return (int)p;` works
the same way (pointer-zero compares equal to integer-zero on
NDS ABI).

**Use when:** target has `cmp rN, #0; ldmXXia sp!, {..., pc}`
or any other predicated single-instruction return that depends
on the cmp's flags being preserved through the pop. The
convention `return 0;` adds a redundant move; `return x;`
removes it.

**Provenance:** brief 046 wave 6 (PR #345) — 4 matches via
this coercion: `func_02036298`, `func_0203c58c`,
`func_0203c620`, `func_0203c638`. Decomper noted the lesson
inline in the PR body.

### C-12. Push-r0 arg-preserving thunk via `asm void` + `nofralloc`

(W-E in brief 048's research note classification —
[`push-r0-wall-research`](../briefs/048-push-r0-wall-research.md).)

**Target asm.** Tiny call-then-restore wrappers that preserve
their first arg across one or more `bl` calls by using the push
instruction itself as the spill slot:

```text

push {r0, lr}                  ; spill arg + lr
bl helper                      ; helper clobbers r0
[bl another_helper]            ; optional 2nd clobber
pop {r0, lr}                   ; restore arg
bx lr                          ; tail-return preserving caller's r0

```

i.e. 4 instructions (single bl) or 5 instructions (two bls), no
callee-save register touched.

**mwcc emits when miscoded** (every C variation tried, every SP):

```text

push {r4, lr}                  ; mwcc spills via callee-save r4 instead
mov  r4, r0
bl   helper
mov  r0, r4
pop  {r4, [pc|lr]}
[bx lr]                        ; +bx if Style A epilogue

```

i.e. 6 instructions (24 bytes) — **+8 bytes over target's 16**.

**Method (brief 048).** Sweep tested:

- 5 C variations (return-arg, no-return-arg, volatile-saved,
  void-arg, function-pointer wrapper) — none flipped to push-r0.
- All 15 mwcc SPs (1.2/base, sp2, sp2p3, sp3, sp4 + 2.0/base,
  sp1, sp1p2, sp1p5, sp1p6, sp1p7, sp2, sp2p2, sp2p3, sp2p4) —
  every one emits the `push {r4, lr}; mov r4, r0; ...` form
  for the natural C source. **No mwcc revision exposed in the
  shipped toolchain produces the push-r0 form from C.**
- The original ROM almost certainly used **inline asm** for these
  wrappers (the project pattern set in brief 011 / `src/main/CpuSet.c`
  uses `asm void` + `nofralloc` for the BIOS SWI thunks).

**C that coerces it (verified byte-identical):**

```c
extern int func_020932a4(int);

asm void func_02093294(int x) {
    nofralloc
    stmdb sp!, {r0, lr}        /* mwcc inline-asm syntax for `push` */
    bl    func_020932a4
    ldmia sp!, {r0, lr}        /* mwcc inline-asm syntax for `pop` */
    bx    lr
}
```

Compiles via the **default `.c` rule (mwcc 2.0/sp1p5)** — no need
for `*.legacy.c` routing. The `nofralloc` directive disables
mwcc's prologue/epilogue generation; the body is emitted
verbatim. Verified byte-identical for both
`func_02093294` (16 bytes) and `func_02092f04` (20 bytes,
two-bl variant).

**Two non-obvious mwcc inline-asm rules:**

- **Use the multi-load mnemonics, not `push`/`pop`.** mwcc's
  inline-asm assembler treats `stmdb sp!, {r0, lr}` as the
  canonical form for ARM-mode push, and `ldmia sp!, {r0, lr}`
  for pop. Writing `push {r0, lr}` or `pop {r0, lr}` directly
  inside the `asm void` block fails to compile with `unknown
  assembler instruction mnemonic`. The disassembly displays the
  encoding as `push`/`pop` because both are the canonical
  mnemonics for the same encoding — but mwcc's inline-asm
  parser only accepts the `stmdb`/`ldmia` form.
- **`asm void` requires the default `.c` routing.** mwcc
  1.2/sp2p3 (the `.legacy.c` tier) **rejects** `stmdb sp!`
  syntax with the same "unknown assembler instruction
  mnemonic" error. The legacy compiler's inline-asm parser
  predates the multi-load mnemonics. Even though the target's
  epilogue is `pop {r0, lr}; bx lr` (Style A), the routing must
  stay on default `.c` (mwcc 2.0/sp1p5) for the inline asm to
  compile.

**Use when:** target has 4-5-instruction wrapper that pushes r0
alongside lr (no other regs), calls one or two helpers, pops r0
back, and returns. **brief 046 wave 7 mis-routed the two
candidates through `*.legacy.c` because the epilogue is Style
A.** The right routing is `.c` default, then use the inline-asm
recipe above.

**Provenance:** brief 046 wave 7 (PR #347) flagged
`func_02093294` and `func_02092f04` as a "provisional new wall";
brief 048 (this research) verified the inline-asm coercion
byte-identical for both targets.

**Cross-corpus survey (brief 048):** 2 candidates total in the
unmatched-gap-functions corpus — only `func_02093294` and
`func_02092f04`. No future-leverage from a 4th routing tier;
two one-off matches via the inline-asm recipe above are the
right scope.

### C-13. Predicated if-X order — source order controls emission

**Target asm (`func_ov002_021b41e8`, brief 047 wave 9):** both
branches of the conditional are predicated, sharing the same
epilogue. The two predicated instructions are emitted in a
specific order:

```text

stmdb sp!, {r3, lr}
ldrh   r0, [r0, #0xa]
bl     func_ov002_021b3c10
cmp    r0, #0x0
ldrneh r0, [r0, #0x4]      ; ne-path FIRST
mvneq  r0, #0x0             ; eq-path SECOND
ldmia  sp!, {r3, pc}

```

The `ldrneh` (non-zero return-`r[2]`) appears BEFORE the `mvneq`
(zero return-`-1`).

**mwcc emits when miscoded** (swapped order from natural C
phrasing):

```c
/* breaks: mwcc emits mvneq first, ldrneh second */
int f(unsigned short *p) {
    unsigned short *r = (unsigned short *)helper(p[5]);
    if (r == 0) return -1;       /* eq-path first in source */
    return r[2];                  /* ne-path second */
}
```

mwcc walks the if/return blocks in **source order** when both
branches collapse to a single predicated instruction. The
"natural" guard-then-fallthrough phrasing emits the predicated
ops in eq-then-ne order; target ROM has them in ne-then-eq.

**C that coerces it (verified byte-identical):**

```c
extern void *helper(unsigned short key);

int f(unsigned short *p) {
    unsigned short *r = (unsigned short *)helper(p[5]);
    if (r != 0) return r[2];      /* ne-path first → ldrneh first */
    return -1;                     /* eq-path second → mvneq second */
}
```

Inverting the if-condition pulls the ne-path into the source's
first position, which mwcc emits as the first predicated
instruction.

**Use when:** target has TWO predicated instructions sharing a
single epilogue (no separate `pop` blocks — distinct from
C-10), and the predicated-instruction order doesn't match the
natural C phrasing. Re-order the C source so the if-condition
matches the target's first predicated-op condition.

**How C-13 differs from C-10.** C-10 is about **two separate
`pop {regs, pc}` blocks** (the early-return branches off into
its own basic block before the main return); C-13 is about
**one shared epilogue** with two predicated instructions ahead
of it. Different structural problem — same "invert the test"
fix at the source level. When the target has two pops, look at
C-10; when the target has predicated ops sharing one pop, look
at C-13.

**Provenance:** brief 047 wave 9 (PR #357) — the worked
example is `func_ov002_021b41e8`. Decomper noted the lesson
inline:
> when both branches are predicated, source order of the
> if-blocks determines emitted instruction order.

Folded here in brief 050.

### C-14. 2-arg pass-through forces cmp-scratch off r1

**Target asm (W-F, brief 047 wave 9 — `func_ov002_021fbba8` /
`func_ov002_02243740`):** a tail-call-shaped function with a
predicated early-return where the cmp temp uses **r2**, not
the natural r1:

```text

stmdb  sp!, {r3, lr}
ldr    r2, [r0, #0x14]    ; ← target picks r2 for cmp scratch
cmp    r2, #0x0
movne  r0, #0x1
ldmneia sp!, {r3, pc}      ; predicated early-return-1
bl     func_ov002_021f4a84
ldmia  sp!, {r3, pc}

```

**mwcc emits when miscoded** (1-arg signature — natural shape):

```c
/* breaks: mwcc allocates r1 for the cmp scratch */
extern int helper(T *p);
int f(T *p) {
    if (p->field != 0) return 1;
    return helper(p);
}
```

mwcc reg-allocator picks the lowest free scratch (r1) for a
short-lived load-then-cmp temp when no other live value
occupies it. **Verified across all 15 SPs in the toolchain
(1.2/base..sp4 + 2.0/base..sp2p4) — every SP picks r1 for the
natural 1-arg shape.** Decomper's first-pass attempt of
adding an unused `int x` parameter also picks r1 because mwcc
dead-codes the unused param.

**C that coerces it (verified byte-identical, both targets):**

```c
extern int helper(T *p, int x);     /* declared 2-arg */

int f(T *p, int x) {
    if (p->field != 0) return 1;
    return helper(p, x);             /* x flows through r1 */
}
```

The trick is **using x at the helper call site**. mwcc must
keep `x` (in r1 at function entry) live across the cmp because
the bl needs r1 set; this excludes r1 from the scratch pool and
the allocator picks r2 next.

**If the helper is observably 1-arg** (asm shows it never reads
r1) — declare it 1-arg and cast at the call site so the source
doesn't carry an extern-declaration lie:

```c
extern int helper(T *p);             /* truthful 1-arg */

int f(T *p, int x) {
    if (p->field != 0) return 1;
    return ((int(*)(T*, int))helper)(p, x);
}
```

Both shapes emit the same caller bytes. Pick the one that
matches the helper's actual signature in the rest of the
codebase.

**Variations that DON'T flip** (verified):

- `int f(T *p, int unused) { ...return helper(p); }` — mwcc
  dead-codes the unused param.
- `int v = p->field; if (v != 0) ...` — explicit local doesn't
  reserve a register.
- `register int v asm("r2"); v = p->field; ...` — mwcc
  syntactically accepts the GCC-style register-asm hint but
  ignores it for ARM-mode codegen.
- ternary form, inverted condition, `unsigned int` field,
  `void *` field — all keep r1.

**Use when:** target has 1-arg-shape `push {r3, lr}; ldr rN,
[r0, #imm]; cmp rN, #0; mov?? r0, #imm; ldm??ia sp!, {r3, pc};
bl helper; ldmia sp!, {r3, pc}` AND the load destination `rN`
is r2 (not r1). The fix is **2-arg signature with int
pass-through** to a 2-arg-or-cast helper call.

**How brief 047 missed it.** Decomper's wave 9 PR explicitly
flagged: *"Tried 2-arg signature (reserve r1) — didn't flip."*
The miss was variant v12 above (unused `x`), not the
pass-through variant — mwcc dead-codes unused params, so the
2-arg signature alone doesn't reserve r1. Brief 050's sweep
isolated the pass-through call as the necessary trigger.

**Method (brief 050):** sweep tested 12 C variations against
`func_ov002_021fbba8` and 15 mwcc SPs (1.2/base..sp4 +
2.0/base..sp2p4) on the natural 1-arg shape. Every SP picked
r1; only the 2-arg pass-through variation flipped to r2.
Verified byte-identical for both targets at the asm-shape
level (size 0x1c each, instruction sequence + register
allocation match exactly, only the bl offset is
reloc-dependent).

**Provenance:** brief 047 wave 9 (PR #357) flagged the two
targets as W-F provisional reg-alloc wall; brief 050 (this
research) verified the 2-arg pass-through coercion.

**Cross-corpus survey (brief 050):** 2 candidates from wave 9
plus likely a small population of similar tail-call-thunk-with-
early-return shapes in the unmatched-gap corpus. Decomper
should grep for `ldr r2, [r0, #imm]; cmp r2, #0` in the
unmatched-arm gap functions when picking next hard-tier
targets — each surfacing of this asm shape is a C-14 unblock
candidate.

## Permanent (8 patterns)

mwcc keeps "winning" the codegen choice regardless of C source
variation. Budget **zero matches** for symbols hitting these
walls in yield predictions. Future pilots: skip-and-document
rather than iterating.

### P-1. Shift-pair vs mask collapse

**Target asm preserves shift form:**

```

lsl r0, r0, #24
lsr r0, r0, #24

```

or `lsl 30/lsr 30`, or `lsl 31/lsr 31`.

**mwcc collapses to:**

```

and r0, r0, #0xff       ; or #3, or #1

```

**Why:** `(x << K) >> K` is semantically `x & ((1<<(32-K))-1)`,
and mwcc folds the shift pair to the equivalent mask whenever
the mask fits in an immediate. No C variation tried suppresses
this — `volatile`, `unsigned int` widening, intermediate
temporary all lose to the optimiser.

**Caveat:** the *opposite* direction (mwcc emits the shift, target
uses mask) is the same wall in the other direction.

**Affected drops:** brief 022 `ov000_021ab6cc`/`021af5c0`, brief
028 `func_0203d6c4`/`func_0209aa48`/`func_0209d788`, brief 029
`func_0207d304`, brief 031 `func_ov002_022912c8`. **8 of 47
drops (17%)** — the largest single wall in this set.

### P-2. ldmia / ldmib / stmia fusion (bidirectional)

mwcc fuses any two-or-more consecutive struct-field accesses at
offsets 0+4 (or any consecutive pair) into a multi-load/store —
*sometimes when the target ROM does, sometimes when it doesn't*.
Both directions are the same wall.

**When target fuses, mwcc doesn't (drop direction A):** target
emits `stmia r3, {r0, r1}` or `ldmia r2, {r1, r2}`; mwcc with our
C emits two separate ops. Briefs 020/022 noted that consecutive
caller-arg writes to offsets 0+4 trigger the fusion in mwcc — but
not always. Hand-coercing the source register reuse + writing in
ascending order helps but doesn't always force fusion.

**When mwcc fuses, target doesn't (drop direction B):** brief 028
`func_0209bf18`'s two `ldr` couldn't be unfused — mwcc kept
fusing into `ldmia` regardless of local-temp ordering or
intervening volatile reads. Brief 031 `func_0207dee0` saw mwcc
emit `ldmib r2, {r0, r2}` (1 instruction, 2 loads) where target
had two separate `ldr`.

**Why permanent:** mwcc's load/store-multiple coalescer fires on
syntactic patterns, but target ROM may have been compiled at a
slightly different optimisation level / SP version where the
heuristic threshold differed. C source can't sit on either side
of the threshold reliably.

**Affected drops:** brief 028 `func_0209bf18`, brief 031
`func_0207dee0`. **2 of 47 drops (4%)** — but bidirectional
appearance means it surfaces in many partial-match shapes that
got dropped for other surface reasons.

### P-3. Constant materialisation: pool-load vs add-imm vs orr chain

For an immediate that doesn't fit a single `mov #imm`, mwcc and
target may pick different constructions:

- Pool word `ldr r0, =0x52008421` (mwcc default for any tricky
  literal).
- Three-`orr` chain: `mov r0, #0x52000000; orr r0, #0x8000;
  orr r0, #0x421` (target may prefer for some constants).
- Two-`add` chain: `mov r0, #0x7000000; add r0, #0x400`
  (target uses for `0x7000400`-style values that decompose
  cleanly into 2 8-bit-rotate immediates).

**Why permanent:** mwcc's literal-pool heuristic is fixed at
compile-time and doesn't expose a per-call pragma. The C source
constant `0x52008421` always lands in a pool word; the target
ROM's choice depends on whether `mwldarm` was run with different
literal-pool policy at build time, which we can't replicate.

**Affected drops:** brief 022 `func_02007f38`, brief 031
`func_0207f4f8`. **2 of 47 (4%)**, but commonly co-occurs with
other patterns in partial-match drops.

### P-4. r2-vs-r3 scratch register selection on swap-shape thunks

For a tail-call thunk that swaps two argument positions
(`return target(b, a)`), mwcc reliably picks **r2** as the spill
register; target ROM uses **r3**. Both choices are
semantically valid; only the byte-encoded register field
differs.

**What was tried in brief 031 (none worked):**

1. 2-arg signature with target also 2-arg → 66% partial (r2 vs r3)
2. 4-arg passthrough (`int func(int,int,int,int)`) → mwcc adds
   stack frame, breaks tail-call
3. 3-arg signature with one unused param → still r2
4. Target re-declared with real arity → adds `bl + ldmia` frame
5. `void *` first-arg cast → also breaks tail-call

**Why permanent (today):** brief 029 had noted that 4-arg
passthrough triggers r3 scratch; that hint applies to
straight-passthrough thunks but **not to swap-shape thunks**.
The reg-allocator's scoring of r2 vs r3 on swap shapes appears
to be mwcc-version specific.

**Affected drops:** brief 031 `func_02052ddc`, `_0207842c`,
`_02078444`, `_ov002_0229cd70` (all 66% partial; identical-asm
group of 3 cross-overlay siblings + 1 main). **4 of 47 (9%)**.

**Tooling angle (T-1):** see *Tooling-tractable* section below —
this could be unlocked by a `propagate_template --rename-regs`
flag.

### P-5. Halfword offset >0xff split via add

Not strictly a wall — more an idiom decomper should recognise.
When `ldrh`/`strh` offset exceeds the 8-bit immediate range
(>0xff), mwcc emits:

```

add r0, r0, #0x100
ldrh r1, [r0, #0xNN]

```

The high byte of the offset is added to the base register first.
**Target ROM does the same.** Listed here because partial-match
shapes may surface this idiom and the decomper should not iterate
on the C source — it's already correct.

**Affected drops:** zero (it's idiom-not-wall) but appears in 3+
matched shapes across briefs 027–029.

### P-6. Predication threshold (≥4-op if-body)

The boundary at the bottom of C-1: when an `if (cond) { ... }`
body expands to **4 or more ARM instructions** in mwcc's output,
the optimiser switches off the predicated-execution pass and
emits an early-`bxXX lr` branch instead. The split is binary —
3-op bodies predicate, 4-op bodies don't — and no source-shape
coercion tried so far has crossed the line. See C-1's *ARM-op
limit* subsection above for the matched-vs-dropped table and the
brief-033 iteration log.

**Why permanent:** mwcc's predication pass scores predicate-cost
against branch-cost using a fixed heuristic that's not exposed
via flags or pragmas. The threshold is set in the codegen
pipeline; the C source can only steer the *shape* of the
if-body, not the instruction count.

**Affected drops:** brief 028 `func_02067b8c`, `func_0207f8f8`,
`func_02087d10` (originally tagged C-1-coercible; brief 033
reattempted them in the residue cluster and confirmed they hit
this threshold). **3 of 47 drops (6%)** — third-largest single
wall in the set.

### P-7. Pool literal not deduplicated across uses

**Target asm (W-C, brief 040 — `func_02023fec`):** the function
references the same global twice (once as a value, once as a
pointer-typed argument). Target ROM materialises the address
into **two separate pool slots**:

```

push  {r4, lr}
ldr   r0, .L_data1            ; pool slot #1: &data
ldr   r4, .L_data2            ; pool slot #2: &data (same address)
ldr   r0, [r0, #0x0]
cmp   r0, #0
beq   .L_end
ldr   r0, [r4, #0x0]
bl    Task_InvokeLocked
mov   r0, #0
str   r0, [r4, #0x0]
.L_end:
mov   r0, #0x1
pop   {r4, pc}
.L_data1: .word data_0219a8e4
.L_data2: .word data_0219a8e4   ; ← duplicated

```

**mwcc emits when miscoded.** Every mwcc SP tested (1.2/sp2,
sp2p3, sp3, sp4 + 2.0/sp1p5) deduplicates the literal pool. Only
ONE `.word data_0219a8e4` is emitted; both load-address ops point
at the same pool slot. Same final r0/r4 values; different bytes.

**No coercion found.** Tried:

- `extern int data; ... v = data; ...; bl(...,(void*)data); data = 0;` (single extern; sp1p5 emits 1 pool word, single ldr — bytes differ from target).
- Two pointer locals (`int *p1 = &data; int *p2 = &data;`) — sp3 produces *better* shape (push {r4,lr}, ldr r4 once, reuses) but still 1 pool word.
- Aliasing externs (`extern int data; extern int data_alias;` linker-resolved to the same address) — speculation; not tested in this brief, would require config-level alias declaration.

**Why permanent (today):** mwcc's literal-pool deduplicator runs
post-codegen and is not exposed via any flag observed in
`-help all,deprecated,obsolete,ignored,meaningless`. Even
`-noconstpool` (per the help text "pool constants and disable
dead-stripping") doesn't toggle dedup directly. The pool form
in target ROM most likely came from a source-level pattern with
two distinct extern declarations that the linker collapsed —
something the project's `config/<ver>/**/symbols.txt` doesn't
currently model.

**Affected drops:** brief 040 `func_02023fec`. **1 of 51
(2%).** Future pilots that hit this idiom should drop and
document — the bit-level pool difference is the only divergence;
the function semantics are correct.

### P-8. Bit-chain reg-alloc: r0-only vs r0→r1→r0

**Target asm (W-D, brief 040 — `func_ov000_021ac85c`):** a
`Fill32` call followed by a 4-step bit-mask chain on a struct
field at `[r4, #0x98]`. Target spills the loaded value into r1
before the bic/orr chain:

```

ldr   r0, [r4, #0x98]
orr   r1, r0, #0x4000000        ; r0 → r1 (preserves r0)
bic   r0, r1, #0xf80000          ; r1 → r0
orr   r0, r0, #0x880000
orr   r0, r0, #0x8000000
str   r0, [r4, #0x98]

```

i.e. the OR-then-AND fans out through `r1`, then the rest of the
chain stays on `r0`. Total 5 ops, r0/r1 both live across them.

**mwcc emits when miscoded.** mwcc 2.0/sp1p5 (the right Style B
compiler — the brief 040 routing through 1.2/sp2p3 was a
miscategorisation; W-D's target uses Style B `pop {r4, pc}`)
collapses everything onto `r0`:

```

ldr   r0, [r4, #0x98]
orr   r0, r0, #0x4000000        ; stays on r0
bic   r0, r0, #0xf80000
orr   r0, r0, #0x880000
orr   r0, r0, #0x8000000
str   r0, [r4, #0x98]

```

Same final value; same `.text` size (target = 0x34, sp1p5 =
0x34). Only the byte-encoded register field of the first two
chain instructions differs (target = `e3801301` / `e3c1073e`,
mwcc = `e3800301` / `e3c0073e`).

**No coercion found.** Tried:

- intermediate temp `unsigned int u = v | M; v = u & ~N;` — mwcc still chains via r0
- single expression `v = ((v|M) & ~N) | ...` — same
- block-scoped temp — same
- mwcc 1.2/sp3 — uses r0+r1 BUT also adds a pool word for the second OR's constant (different shape, more bytes)

**Why permanent (today):** mwcc 2.0/sp1p5's reg-alloc collapses
chained dataflow onto a single register when the live-range
analysis says r0 is enough. Target ROM's compiler kept r0
live longer (probably for debugger inspection at -O3 or some
intermediate opt level) — but no flag or pragma in 2.0/sp1p5
tested forces the r1 split.

**Affected drops:** brief 040 `func_ov000_021ac85c`. **1 of 51
(2%).** Same shape as P-4 (r2-vs-r3 swap) — register-field
divergence with identical semantics; could be unlocked by a
T-1-style `--rename-regs` post-process if future briefs find
more instances.

## Codegen-inherent edge cases (3 patterns)

Drops that the C language genuinely can't express. Future pilots:
skip these and route to `.s` if necessary.

### E-1. Flags-only function (caller consumes Z/C/N flags)

Some 16-byte functions leave the Z flag set as the actual return
value, with `r0` left unmodified (or modified but ignored). The
caller reads the flag, not the register. C has no syntax to
express "return the Z flag" without inline asm.

**Affected drops:** brief 029 `func_02018b14`,
`func_ov002_022b3434`. **2 of 47 (4%)**.

**Resolution:** route to `.s` file with explicit flag-leaving
sequence; or skip if the calling convention is already known to
work without re-matching this function.

### E-2. Fall-through into adjacent function

Target ROM has `b .L_inside_other_func` jumping into the middle
of an adjacent function. Cannot express in C without inlining
tricks that produce different overall codegen.

**Affected drops:** brief 030 `func_020b3648`. **1 of 47 (2%)**.

**Resolution:** `.s` file (rare); usually safe to leave dropped
because fall-through implies the target wasn't a separately
compilable C unit anyway.

### E-3. Thumb-mode codegen pipeline

Functions marked `kind:function(thumb)` in symbols.txt go through
a different mwcc invocation pattern (`#pragma thumb on` +
alignment padding via `tools/patch_lcf_arm9_align.py`). Cluster
pilots are scoped ARM-only; Thumb siblings are deferred.

**Affected drops:** brief 020 `func_ov004_021dbf30`, brief 028
`func_0208b190`/`_0208b1ac`, brief 030 `func_ov004_021dc820`.
**4 of 47 (9%)**.

**Resolution:** out-of-cluster scope per AGENTS.md /
brief-template guidance. Document and skip.

## Tooling-tractable (3 patterns)

Patterns where a `propagate_template` or `find_shape_templates`
extension could unlock currently-dropped matches. Don't ship the
tool here — future cloud brief.

### T-1. r2-vs-r3 scratch register renaming variant

Patterns P-4 (swap-shape thunks) is the highest-impact
candidate: 4 partial-66% drops in brief 031 alone, all
identical-asm except for one register field. A
`propagate_template --rename-regs r2=r3` flag could clone the
template's `.c`, post-process the emitted `.o` (not the C — the
C compiles the same regardless), and swap the scratch register
in the binary directly.

**Risk:** post-processing the `.o` rather than re-compiling
breaks the "byte-identical from C source" invariant. Acceptable
for permanent-wall patterns where the C source is provably
unable to coerce mwcc; the `.o` patch records the divergence in
the build pipeline. **Brief candidate** if brain agrees.

**Estimated unlock:** 4 brief-031 drops + future swap-thunk
clusters. Roughly 5-10% yield improvement on thunk-heavy
clusters.

### T-2. Literal-substitution variant for pool-vs-add-imm

Pattern P-3 surfaced 2 drops; the underlying mismatch is a
constant-construction choice. A propagation tool that emits
multiple variants (pool-load, add-chain, orr-chain) and tries
each via `objdiff` would be a brute-force fix. Lower priority
than T-1 because the affected drop count is small.

**Brief candidate**: lower priority than T-1.

### T-3. Third mwcc routing tier (mwcc 1.2/sp3) — SHIPPED

**Status: shipped in PR #340 (brief 045)** — `*.legacy_sp3.c`
files now route through mwcc 1.2/sp3 alongside the existing
default (mwcc 2.0/sp1p5) and `*.legacy.c` (mwcc 1.2/sp2p3)
tiers. `tools/patch_objects_legacy.py` extended to rewrite
both `.legacy` and `.legacy_sp3` suffixes; `tools/configure.py`
gained a `mwcc_legacy_sp3` ninja rule. Brain ran the dual-tier
smoke test before merging — `objects.txt` and `arm9.lcf` agree
on `.legacy_sp3.o`. The 7 sp3-unique medium+easy candidates
that brief 044 (PR #337,
[`docs/research/sp3-routing-decision.md`](sp3-routing-decision.md))
identified are now eligible for routing; brief 046 (decomper)
is the first wave consuming them.

Brief 037 (PR #327) shipped two-tier per-TU routing — default
mwcc 2.0/sp1p5 + `*.legacy.c` → mwcc 1.2/sp2p3 — to unblock
Style A epilogue targets. Brief 040's W-B (`func_020467f4`)
surfaced a third codegen flavour: target uses **Style B
(`pop {pc}` 1-step return) WITH the `push {lr}; sub sp, #4`
prologue** that mwcc 1.2/sp2p3 emits but combined with the
single-step pop merge that mwcc 2.0 added in 1.2/sp3 onward.
Neither of the original two routing tiers emitted this
combination; **mwcc 1.2/sp3 does** (verified byte-identical
against W-B).

Per-compiler shape table for the same C source:

| Compiler            | Prologue                  | Epilogue              | Match for W-B |
|---------------------|---------------------------|-----------------------|---------------|
| mwcc 2.0/sp1p5      | `push {r3, lr}` (r3-spill)| `pop {r3, pc}`        | size mismatch (no sub-sp) |
| mwcc 1.2/sp2p3      | `push {lr}; sub sp, #4`   | `pop {lr}; bx lr`     | epilogue mismatch (Style A) |
| **mwcc 1.2/sp3**    | `push {lr}; sub sp, #4`   | `pop {pc}`            | **byte-identical** |

**Routing convention (as shipped):** files named `*.legacy_sp3.c`
under `src/` or `libs/` route through `mwcc_legacy_sp3` →
`tools/mwccarm/1.2/sp3/mwccarm.exe`. The
`LEGACY_SP3_MWCC_VERSION` / `LEGACY_SP3_C_SUFFIX` constants in
`tools/configure.py` are the source-of-truth; the
`is_legacy_sp3_c()` predicate handles classification.
`tools/patch_objects_legacy.py`'s `LEGACY_SUFFIXES` tuple holds
both `.legacy.c` and `.legacy_sp3.c` so the same dsd-lcf
filename-drop bug brief 039 fixed for the first tier doesn't
recur on the third.

**Confirmed unlock so far:** W-B
(`func_020467f4`, byte-identical via brief 042 verification).

**Pending unlock (brief 046's wave):** the remaining 6
sp3-unique medium+easy candidates from brief 044:

| Address     | Symbol            | Tier   | Insns |
|-------------|-------------------|--------|------:|
| `0x0203cff8`| `func_0203cff8`   | medium |    32 |
| `0x0203d078`| `func_0203d078`   | medium |    26 |
| `0x0207db8c`| `func_0207db8c`   | medium |    28 |
| `0x0208205c`| `func_0208205c`   | medium |    21 |
| `0x0204548c`| `func_0204548c`   | easy   |     8 |
| `0x020454ac`| `func_020454ac`   | easy   |     8 |

The static signature-detection only confirms the
prologue/epilogue match — body-byte match still requires the
right C source per-target. Real yield will come back via
brief 046's PR.

**Future leverage:** 416 hard-tier sp3-unique candidates remain
unclaimed — the routing tier is now in place for any future
hard-tier pivot.

**What sp3 routing does NOT unblock:**

- **W-C `func_02023fec`** — sp3 fixes the Style B half but
  the residual P-7 pool-not-deduped pattern remains. Permanent
  unless a source-level coercion surfaces.
- **W-D `func_ov000_021ac85c`** — bit-chain reg-alloc (P-8);
  prologue/epilogue is already sp1p5-or-sp3 ambiguous so sp3
  routing doesn't change the wall.
- **`func_0201904c`** (brief 041's provisional wall) — body
  shape (`orrhi/lslls/orrls` predicated 3-way merge vs sp3's
  2-way predicated stores). Separate C-source coercion
  problem under all three compilers.

## Per-PR drop cross-reference

For each dropped symbol, the wall it hit. Useful when reading the
PR body to confirm "this was a known wall" vs "this was a new
shape we should chase".

| Brief / PR | Sym                       | Wall   | Bucket     |
|-----------:|---------------------------|--------|------------|
| 020 / 297  | `func_0209b534`           | (busy-wait reg-alloc r12) | future-tooling? |
| 020 / 297  | `func_02099c38`           | (tst-vs-ands operand order) | permanent (variant of P-2) |
| 020 / 297  | `func_ov004_021dbf30`     | E-3    | edge case  |
| 022 / 301  | `func_0204548c`/`_9c`     | (no-arg dispatcher prologue) | permanent |
| 022 / 301  | `func_02007f38`           | P-3    | permanent  |
| 022 / 301  | `ov000_021ab6cc`          | P-1    | permanent  |
| 022 / 301  | `ov000_021af5c0`          | P-1    | permanent  |
| 022 / 301  | `func_0208904c`           | C-2 (missed) | coercible (today) |
| 022 / 301  | `func_02095bf8`           | (uchar pre-inc and-0xff) | permanent |
| 028 / 309  | `func_0203d6c4`           | P-1    | permanent  |
| 028 / 309  | `func_020944a4`           | (predicated halfword memcpy) | permanent  |
| 028 / 309  | `func_02094588`           | (memcpy unroll chunk size) | permanent  |
| 028 / 309  | `func_0209aa48`/`_d788`   | P-1    | permanent  |
| 028 / 309  | `func_0207f8f8`/`_87d10`/`_67b8c` | P-6 (4-op pred-threshold; reclass'd by brief 033) | permanent |
| 028 / 309  | `func_0209bf18`           | P-2    | permanent  |
| 028 / 309  | `func_ov006_021b6d00`     | (CSE add-imm hoisting) | permanent |
| 028 / 309  | `func_02078eec`           | (64-bit halfword pack) | permanent |
| 028 / 309  | `func_02098cdc`           | (predicated load chain) | permanent |
| 028 / 309  | `func_0208b190`/`_b1ac`   | E-3    | edge case  |
| 028 / 309  | `func_020928cc`/`_e8`/`_92940` | C-8 (missed) | coercible (.s) |
| 029 / 311  | `func_0207d304`           | P-1    | permanent  |
| 029 / 311  | `func_0200093c`/`_01ff8400` | (predicated stmia store loop) | permanent |
| 029 / 311  | `func_02078ed8`           | (64-bit halfword pack) | permanent |
| 029 / 311  | `func_02018b14`           | E-1    | edge case  |
| 029 / 311  | `func_ov002_022b3434`     | E-1    | edge case  |
| 029 / 311  | `func_ov004_021dbd08`     | C-7 (wrong variant) | coercible |
| 030 / 313  | `func_02078ec8`           | (64-bit halfword pack) | permanent |
| 030 / 313  | `func_0207d36c`           | (split-offset CSE on halfword swap) | permanent |
| 030 / 313  | `func_020b3648`           | E-2    | edge case  |
| 030 / 313  | `func_ov004_021dc820`     | E-3    | edge case  |
| 031 / 315  | `func_02052ddc`           | P-4    | permanent (T-1 candidate) |
| 031 / 315  | `func_0207842c`/`_78444`/`_ov002_0229cd70` | P-4 | permanent (T-1) |
| 031 / 315  | `func_0207f4f8`           | P-3    | permanent (T-2 candidate) |
| 031 / 315  | `func_0207dee0`           | P-2    | permanent  |
| 031 / 315  | `func_ov002_022912c8`     | P-1    | permanent  |
| 040 / 332  | `func_020916c8`           | C-9 (missed; uninitialised-prev coercion) | coercible |
| 040 / 332  | `func_020467f4`           | T-3 (mwcc 1.2/sp3 routing — SHIPPED PR #340; brief 046 consumes) | tooling-tractable |
| 040 / 332  | `func_02023fec`           | T-3 (Style B half — SHIPPED PR #340) + P-7 (pool dedup residual) | partial / permanent |
| 040 / 332  | `func_ov000_021ac85c`     | P-8 (bit-chain reg-alloc) | permanent |
| 047w9 / 357 | `func_ov002_02211808`    | P-1    | permanent  |
| 047w9 / 357 | `func_ov002_0223fd10`    | P-1    | permanent  |
| 047w9 / 357 | `func_ov002_021fbba8`    | C-14 (missed; 2-arg pass-through coercion — brief 050) | coercible |
| 047w9 / 357 | `func_ov002_02243740`    | C-14 (missed; 2-arg pass-through coercion — brief 050) | coercible |

## Quantification

```

By bucket (across 8 pilots: 020, 022, 028, 029, 030, 031, 040,
047-wave9):
  Permanent              :  36 drops (65%)
  Coercible-but-missed   :   9 drops (16%)  ← future "should have matched"
  Edge case              :   8 drops (15%)
  Tooling-tractable      :   2 drops ( 4%)

Top single wall:
  P-1 (shift-pair collapse)         : 10 drops (18%)
  P-4 (r2-vs-r3 swap)               :  4 drops ( 7%)
  E-3 (Thumb)                       :  4 drops ( 7%)
  P-6 (4-op predication threshold)  :  3 drops ( 5%)
  P-7 / P-8 / T-3 (W-A..D residue)  :  4 drops ( 7% — brief 040)
  C-14 (W-F r2-vs-r1 reg-alloc)     :  2 drops ( 4% — brief 047 wave 9)

```

**Read of the data:** roughly **16 % of dropped matches** in the
8-pilot window were *coercible-but-missed* — the right C variation
existed (or was discovered post-hoc by a follow-up cloud research
brief) and the decomper just didn't try it. (The
share moved from ~20% in the original brief-032 reading down to
~14% after brief 033 surfaced P-6's 4-op predication threshold
and reclassified 3 historic C-1 drops to permanent; brief 042
recovered W-A via C-9; brief 048 recovered W-E via C-12; and
brief 050 recovered W-F via C-14, bumping the share back to
~16%.) The bucket is still the highest-leverage section of this
doc: future pilots that spot a partial-match shape matching one
of C-1 through C-14 should lift the documented variation directly
— but check C-1's *ARM-op limit* subsection first.

The other ~84% of drops are permanent walls or edge cases that
the cluster-pilot yield band should already account for. Brief
023's calibration of MED 37% / HIGH 78% factored in the historic
permanent-wall loss; that's why the predictions have been roughly
right despite the over-delivery on heterogeneous clusters (where
the *shape heterogeneity* compensates for the per-shape wall
losses).

## Recommendation

1. **Future cluster-pilot briefs cite this doc** instead of
   inlining "Reg-alloc carryover" sections. Saves ~30 lines of
   PR body per pilot.
2. **Decomper greps `coercible-with-knowledge` first** when a
   partial-match drop looks familiar. Estimated ~16% of drops
   are wrongly classified as walls today (e.g. brief 040 W-A
   was tagged "permanent" until brief 042 found C-9; brief 047
   wave 9 W-F was tagged "provisional reg-alloc wall" until
   brief 050 found C-14). When stuck, also re-read the
   `prev = X` initialiser line — that's what missed C-9
   historically; for r2-vs-r1 cmp-scratch divergence, check
   whether a 2-arg pass-through C source flips the allocator
   (C-14).
3. **Decomper, when routing through a compiler tier:** sanity-
   check the target's prologue/epilogue first.
   - `pop {regs, lr}; bx lr` (Style A 2-step) → `*.legacy.c`
     (mwcc 1.2/sp2p3).
   - `pop {regs, pc}` with `push {regs, lr}; sub sp, #4`
     prologue and **no** `r3` in the push → `*.legacy_sp3.c`
     (mwcc 1.2/sp3, the T-3 third tier shipped in PR #340).
   - `pop {regs, pc}` with `push {r3, regs, lr}` (r3-spill) or
     2/4-reg push without sub-sp → default `.c`
     (mwcc 2.0/sp1p5).
   Mis-routing was the brief-040 mistake on W-B / W-C / W-D —
   they were Style B targets routed through `*.legacy.c`
   (which only emits Style A). `docs/research/sp3-routing-decision.md`'s
   per-compiler discriminator table is the long-form reference.
4. **Brain decides whether to queue T-1 (r2-vs-r3 swap-thunk
   tooling) as a follow-up cloud brief.** Highest single-pattern
   impact in the *tooling-tractable* bucket; brief-031's HIGH
   78% under-delivery was dominated by this wall.
5. **T-3 SHIPPED (PR #340).** mwcc 1.2/sp3 routing tier landed
   via brief 045; brief 046 is the first decomper wave consuming
   it. The 7 sp3-unique candidates from brief 044 are eligible
   for routing.
6. **Defer T-2** until another cluster surfaces ≥3 P-3 drops.
7. **No changes to existing tooling** ship in this research note.
8. **Append-only updates:** future cluster pilots that surface a
   genuinely new wall should add an entry to this doc rather than
   inlining in the PR body. Keep the per-bucket quantification
   refreshed.
