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

**Short answer:** **32 distinct mwcc-vs-baserom codegen
divergences** account for the **90+ dropped matches across the
sixteen pilot waves** (020 / 022 / 028 / 029 / 030 / 031 / 040 /
047-wave9 / 049-wave12 / 051-wave14 / 053-wave15 / 053-wave16 /
053-wave17 / 055-wave18 / 055-wave19 / 055-wave20; the per-PR cross-reference
table below covers these; brief 046 waves 5–7 added three new
C-N coercions documented in C-10 / C-11 / C-12; brief 047 wave
9 surfaced **C-13** (predicated if-X order) — fold-only, the
research already happened in the wave PR — and **W-F**
(r2-vs-r1 cmp-scratch reg-alloc) which brief 050's research
classified as **C-14** (2-arg pass-through coercion); brief
049 wave 12 surfaced the C-2 struct-copy refinement (folded
under C-2's existing entry as C-2a) and **W-G** (mvn-vs-sub
peephole on flat thunks) which brief 052's research
classified as **C-15** (legacy-tier routing — peephole is
mwcc 2.0-only); brief 051 wave 14 surfaced **W-H**
(`ldr r1; bx r1` vs `ldr ip; bx ip` flat-thunk scratch
choice) which brief 054's research classified as **C-16**
(`asm void` + `nofralloc` inline-asm recipe — same shape as
C-12), plus a **C-15-vs-P-1 taxonomy lesson** folded as a
*Wall family note* under both entries; brief 053 wave 16
surfaced a reverse-direction **C-1 corollary** (mwcc over-
predicates `if-or-or return-const + return-const` final
returns where target uses a branchy return) — brief 054's
SP sweep verified all 15 SPs collapse identically, classified
as **C-1r permanent**. Most fall into one
of three buckets: **coercible-with-knowledge**
(16 patterns — the right C variation or routing tier
matches; future briefs can grep here first), **permanent**
(8 patterns — mwcc keeps "winning" the codegen choice
regardless of C variation; budget zero matches in the yield
band), and **tooling-tractable**
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
| 049/wave12 | 366 | 73.3% | 11  |       4 |
| 051/wave14 | 372 | 47.4% |  9  |      10 |
| 053/wave15 | 374 | 83.3% |  5  |       1 |
| 053/wave16 | 378 | 50.0% |  7  |       7 |
| 053/wave17 | 380 | 70.0% |  7  |       3 |
| 055/wave18 | 383 | 80.0% |  8  |       2 |
| 055/wave19 | 385 | 60.0% |  6  |       4 |
| 055/wave20 | 387 | 66.7% |  8  |       4 |
| —     | —   |   —   | **183** |  **90** |

Each pattern gets: a name, the target asm shape, the mwcc-emitted
asm shape, the C source variation that *did* coerce it (when
known) or *didn't* (with a one-line reason), and a *use when*
hint. The bucket header indicates how to budget the pattern in a
yield prediction.

## Coercible-with-knowledge (20 patterns)

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

#### C-1r. Reverse direction: mwcc over-predicates `if-or-or return-const + return-const`

C-1 covers the case where target uses predication and mwcc emits
branches. **The reverse also happens:** target uses a branchy
final return (`bne L; mov rN, #X; bx lr; L: mov rN, #Y; bx lr` —
5 insns) and mwcc collapses both arms into a 3-insn predicated
return (`moveq rN, #X; movne rN, #Y; bx lr`). Net mwcc emit is
**8 bytes shorter** than target.

**Target asm (3 wave-16 drops):** an OR'd multi-key bool
predicate with a branchy final return:

```text

ldr r2, .L                   ; pool: K1
cmp r0, r2                   ; predicated cmp chain
addne r1, r2, #delta1
cmpne r0, r1
addne r1, r2, #delta2
cmpne r0, r1
bne .L_else                  ; branchy return
mov r0, #0x1
bx lr
.L_else:
mov r0, #0x0
bx lr

```

11 insns + .word = 0x30 bytes. Note the **hybrid shape** —
predicated cmp chain (3 `addne/cmpne` pairs) PLUS branchy final
return.

**mwcc emits when miscoded** (every C variation tried, every SP):

```text

ldr r2, .L
cmp r0, r2
addne r1, r2, #delta1
cmpne r0, r1
addne r1, r2, #delta2
cmpne r0, r1
moveq r0, #0x1               ; final return collapsed to predication
movne r0, #0x0
bx lr

```

9 insns + .word = 0x28 bytes. **8 bytes shorter than target.**

**No coercion found (verified all 15 SPs).** Brief 054
sweep tested the natural OR'd-condition C source
(`if (x == K1 || x == K2 || x == K3) return 1; return 0;`)
across all 15 mwcc SPs (1.2/base..sp4 + 2.0/base..sp2p4): every
SP collapses the final return into the 3-insn predicated form.
Also tested `-O3,p` / `-O2,p` (same collapse) and `-O1,p`
(produces a 13-insn shape with `beq L; ...; bne L; mov #1; bx
lr; L: mov #0; bx lr` — different prologue, larger size). The
3-separate-ifs form (`if (...) return 1; if (...) return 1; if
(...) return 1; return 0;`) emits a different 13-insn shape
(every cmp uses `bxeq` shortcut), also non-matching. **The
target's hybrid shape (predicated chain + branchy return) is
not reachable from C under the project's `-O4,p` standard
flags.**

**Use when (negative):** target has the hybrid shape
documented above. Skip and document — this is a permanent
corollary of C-1's predication pass. No SP / routing fix
exists; budget zero matches.

**Why this differs from C-15 (mvn-vs-sub peephole):** C-15 is
mwcc-2.0-only and `*.legacy.c` routing fixes it. C-1r fires
on ALL mwcc SPs (every legacy tier produces the same collapse).
Routing doesn't help.

**Affected drops:** brief 053 self-extend 1 / wave 16 (PR #378)
`func_0202ef08`, `func_0202f59c`, `func_02031764`.
**3 of 69 drops (4%).**

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
Re-attempted and matched in brief 049 self-extend 2 / wave 12
(PR #366) — see *Struct-copy refinement* below.

#### C-2a. Struct-copy refinement for multi-field load-then-store

Wave 12's re-attempt of `func_0208904c` (brief 022's historic
miss) surfaced a second-order constraint: **the local-pointer
cache (C-2 baseline) doesn't enforce load-load-store-store
ordering on multi-field copies.** mwcc may interleave the
loads and stores depending on temp-allocator choices. Target
ROM emits load-both-then-store-both:

```text

ldr r1, .L
ldr r1, [r1, #0x0]            ; p = *data
ldr r2, [r1, #0x7c]            ; load 1 (r2)
ldr r1, [r1, #0x80]            ; load 2 (r1)
str r2, [r0, #0x0]             ; store 1
str r1, [r0, #0x4]             ; store 2

```

**C that breaks the ordering** (interleaves load-store-load-store):

```c
/* C-2 baseline — works for single field; can interleave on pairs */
T *p = *data;
out->a = p->f_7c;     /* mwcc may emit ldr/str here, then ldr/str next */
out->b = p->f_80;
```

**C that coerces the load-load-store-store order (verified
byte-identical against `func_0208904c`):**

```c
typedef struct { int a; int b; } pair_t;
void f(pair_t *out) {
    *out = *(pair_t *)((char *)data + 0x7c);
}
```

The struct-copy expression `*out = *src;` forces mwcc to treat
the read as a single composite operation; the codegen pipeline
emits both loads before either store. Pure pointer-cast at the
call site keeps the source clean — no `T *p = src;` local
needed.

**Use when:** target has 2+ adjacent field reads from a single
base followed by 2+ adjacent field writes to a single
destination, AND the order is strict load-load-...-store-store
(no interleaving). The single-field C-2 recipe handles 1-pair
trivially; pairs/triples need the struct-copy form.

**Provenance:** brief 049 self-extend 2 / wave 12
(PR #366) — `func_0208904c` matched after brief 022 + brief
050 cluster-rescan both flagged it as a C-2-coercible miss.

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
targets as W-F provisional reg-alloc wall; brief 050
(PR #360) verified the 2-arg pass-through coercion at the
asm-shape level; **brief 049 self-extend 1 / wave 11
(PR #362) shipped both as byte-identical compiled-and-linked
matches first try — C-14 transfers cleanly to fresh
candidates.**

### C-15. mwcc-2.0 peephole avoidance via legacy-tier routing for flat-thunk arg setup

> **Wall family note — C-15 vs P-1.** Both walls superficially
> look like 2-instruction → 1-instruction collapses, but they
> target different mwcc optimisation passes and therefore have
> opposite resolutions. Always check the *trigger* column
> before applying a fix:
>
> | Wall | Pattern | Trigger | Fix |
> |---|---|---|---|
> | **C-15** (this entry) | `mvn r1, #0` (target) vs `sub r1, r0, #1` (mwcc) — *same insn count*, peephole on `(K, K±imm)` arg pair | **mwcc 2.0 only** (all 1.2/* SPs emit direct `mvn`) | Route through `*.legacy.c` (sp2p3) or `*.legacy_sp3.c` (sp3) |
> | **P-1** (below) | `lsl rN, rN, #K; lsr rN, rN, #K` (target, *2 insns*) vs `and rN, rN, #mask` (mwcc, *1 insn*) — *different insn count*, mask collapse on zero-extend | **All mwcc SPs** (1.2/base..sp4 + 2.0/base..sp2p4) | **Permanent.** No coercion. Route doesn't help. |
>
> **The trap (brief 051 wave 14 / PR #372):** decomper saw 7
> ov002 flat thunks with `lsl 16; lsr 16` halfword zero-extend
> as the body and routed all 7 through `*.legacy.c` expecting
> C-15's mwcc-2.0-only-peephole logic to apply. **All 7
> collapsed to `and #0xffff` even on mwcc 1.2/sp2p3** — because
> P-1 is shape-collapse, not peephole, and fires on every SP.
> The 7 candidates correctly belong in the P-1 cross-reference
> rows (permanent), not C-15.
>
> **Quick discriminator at the asm level:**
>
> - Target has **2 insns** that mwcc collapses to **1 insn**
>   on a halfword/byte zero-extend (`lsl K; lsr K` or
>   `(x << K) >> K` C source) → **P-1**, no fix.
> - Target has **1 insn** that mwcc emits as a different
>   **1 insn** (typical: `mvn` vs `sub` on `-1` from a
>   set-zero-then-derive context) → **C-15**, route through
>   1.2/* tier.

**Target asm (`func_02054c64` — wave 12 W-G observation):**

```text

ldr   ip, .L
mov   r0, #0
mvn   r1, #0                  ; r1 = -1 via direct mvn
bx    ip
.word func_02054ea8

```

i.e. a 4-instruction flat tail-call thunk that materialises
`(0, -1)` as args via `mov` + `mvn` directly.

**mwcc 2.0/sp1p5 emits when miscoded** (default `.c` routing
under `int f(void) { return helper(0, -1); }`):

```text

ldr ip, .L
mov r0, #0
sub r1, r0, #1                 ; r1 = -1 via peephole (r0 - 1)
bx  ip
.word helper

```

The mwcc 2.0 peephole optimiser observes that `r0` is being
set to a constant `K` immediately before `r1` needs to be set
to `K + small_imm` (in this case `K=0`, `imm=-1`), and emits
`sub r1, r0, #1` (or `add r1, r0, #imm`) to save the explicit
materialisation. The peephole is general:

| Args | mwcc 2.0 emit | Peephole fires? |
|---|---|---|
| `(0, -1)` | `mov r0, #0; sub r1, r0, #1` | yes |
| `(0, -2)` | `mov r0, #0; sub r1, r0, #2` | yes |
| `(0, +1)` | `mov r0, #0; mov r1, #1` | no (mov shorter) |
| `(5, -1)` | `mov r0, #5; sub r1, r0, #6` | yes (5 - 6 = -1) |
| `(-1, -1)` | `mvn r0, #0; mov r1, r0` | no (reg copy) |
| `(-1, 0)` | `mvn r0, #0; mov r1, #0` | no (-1 first) |

**No C-source coercion flips it.** Sweep tested 9 variations
(local-typed `-1`, `~0`, `(int)~0u`, `(int)(unsigned int)-1`,
`((int)(0u-1u))`, statement-expression, GCC `register`
storage, two-statement local declarations in either order, an
explicit `int x = 0 - 1`) — every variation that produced
byte-equivalent overall shape kept the `sub`. `volatile`
breaks the shape entirely (push/pop + stack roundtrip).

**mwcc-version sweep across all 15 SPs** isolates the
peephole to mwcc 2.0:

| Compiler family | -1 emission |
|---|---|
| **1.2/base, sp2, sp2p3, sp3, sp4** | `mvn r1, #0` (direct, matches target) |
| 2.0/base, sp1, sp1p2, sp1p5, sp1p6, sp1p7, sp2, sp2p2, sp2p3, sp2p4 | `sub r1, r0, #1` (peephole) |

**The fix is routing, not C source.** Route the file through
`*.legacy.c` (mwcc 1.2/sp2p3) or `*.legacy_sp3.c` (mwcc
1.2/sp3) and the body emits direct `mvn`. Verified
byte-identical against `func_02054c64` via both 1.2/sp2p3
and 1.2/sp3.

**Why routing is safe for flat thunks.** A flat tail-call
thunk has no prologue or epilogue (just `bx ip`) — there's
no Style A vs Style B epilogue concern. The SP version only
affects the body codegen. Routing through `*.legacy.c` or
`*.legacy_sp3.c` flips the peephole without touching
prologue/epilogue.

**For non-flat-thunk shapes:** if the target HAS a prologue +
epilogue AND hits the peephole, the routing tier must match
the epilogue style too (per the
*Recommendation #3 — routing decision tree* below). For a
pop-into-pc target with the peephole, route through
`*.legacy_sp3.c` (sp3 keeps the `pop {regs, pc}` style); for
a `pop {regs, lr}; bx lr` target, route through `*.legacy.c`
(sp2p3). Sample disassembly the target's epilogue first.

**Use when:** target asm shows direct `mvn` or `mov #imm` for
a negative or otherwise-immediate-derivable constant
**immediately after** another `mov #K` to a different
register, AND mwcc 2.0 emits the `sub`/`add` peephole form
on the natural C source. Solution: switch the file extension
to `*.legacy.c` (or `*.legacy_sp3.c` for sp3-epilogue
targets).

**Provenance:** brief 049 self-extend 2 / wave 12 (PR #366)
flagged `func_02054c64` as a "provisional minor wall"
(W-G); brief 052 (this research) verified the peephole is
mwcc 2.0-specific, all 5 1.2/* SPs emit `mvn` directly,
both `*.legacy.c` and `*.legacy_sp3.c` routing produce
byte-identical output for the target. Wall reclassified
from "provisional minor" to "C-15 routing-tractable
coercion".

**Cross-corpus survey (brief 052):** 1 confirmed candidate
(`func_02054c64`). The peephole-shape grep is `mov rN, #0;
mvn rM, #0` (or any `mov rN, #K; mov rM, #K±imm` shape) on
flat thunks — likely a small population in the unmatched-
gap corpus. Future cluster pilots that surface this asm
shape on a flat thunk should route through `*.legacy.c`
first try.

**Cross-corpus survey (brief 050):** 2 candidates from wave 9
plus likely a small population of similar tail-call-thunk-with-
early-return shapes in the unmatched-gap corpus. Decomper
should grep for `ldr r2, [r0, #imm]; cmp r2, #0` in the
unmatched-arm gap functions when picking next hard-tier
targets — each surfacing of this asm shape is a C-14 unblock
candidate. Wave 11's PR documented the canonical asm grep
recipe:

```text

ldr   r2, [r0, #imm]
cmp   r2, #0
mov?? r0, #imm
ldm??ia sp!, {r3, pc}
bl    helper

```

### C-16. ldr-rN-vs-ldr-ip flat-thunk scratch via `asm void` + `nofralloc`

(W-H in brief 054's research note classification — *this entry*.)

**Target asm (`func_0209085c` — wave 14 W-H observation):** a
3-instruction flat tail-call thunk that loads the helper
pointer into a non-`ip` scratch register:

```text

ldr   r1, .L
bx    r1
.word func_020909b0

```

i.e. 3 insns (12 bytes / 0x0c) — same shape as C-15 / brief 047
flat thunks, except the load destination is **r1**, not the
mwcc-default **r12 (ip)**.

**mwcc emits when miscoded** (every C variation tried, every SP):

```text

ldr   r12, .L              ; mwcc picks ip (r12) — intra-procedure scratch
bx    r12
.word func_020909b0

```

i.e. same 3 insns + .word, byte-equivalent EXCEPT the
register field on the `ldr` and `bx` differs (`r12` vs `r1`).
Single-byte divergence → byte-compare fails.

**Method (brief 054).** Sweep tested:

- 6 C variations (natural pass-through, void-arg, zero-arg
  passthrough, function-pointer cast, function-pointer-of-
  pointer, GCC-style `register int x asm("r1")`) — every shape
  on mwcc 2.0/sp1p5 picks `r12` for the load destination.
- All 15 mwcc SPs (1.2/base, sp2, sp2p3, sp3, sp4 + 2.0/base,
  sp1, sp1p2, sp1p5, sp1p6, sp1p7, sp2, sp2p2, sp2p3, sp2p4)
  on the natural pass-through C source — **every SP picks r12.**
  No SP coerces by default.
- The original ROM almost certainly used **inline asm** for
  these wrappers — same logic as C-12 (push-r0 thunks) where
  no C source can reach the asm shape.

**C that coerces it (verified byte-identical against
`func_0209085c`):**

```c
extern int func_helper(int);

asm void func_target(int x) {
    nofralloc
    ldr r1, =func_helper
    bx  r1
}
```

Compiles via the **default `.c` rule (mwcc 2.0/sp1p5)** — no
need for `*.legacy.c` routing (and `*.legacy.c` would actually
fail; see the inline-asm-rule note below). The `nofralloc`
directive disables mwcc's prologue/epilogue generation; the
body is emitted verbatim. Verified byte-identical for
`func_0209085c` (3 insns + .word = 12 bytes, register field
matches).

`asm int func_target(int x) { ... }` produces the exact same
bytes — the `void` vs `int` choice depends on how the
function's signature is declared elsewhere in the codebase.
For tail-call thunks `asm void` is the cleaner reading
(the function doesn't return in the C sense; it tail-jumps).

**Inline-asm parser caveat (same as C-12):**

- **`ldr r1, =label` requires DEFAULT `.c` routing
  (mwcc 2.0/sp1p5).** mwcc 1.2/sp2p3 (the `.legacy.c` tier)
  and mwcc 1.2/sp3 (the `.legacy_sp3.c` tier) **reject** the
  `ldr rN, =symbol` mnemonic with `unknown assembler
  instruction mnemonic`. The legacy compilers' inline-asm
  parsers predate the load-from-pool-via-equals syntax. Even
  though the target is a flat thunk with no prologue/epilogue
  (so any tier is technically equivalent at the body level),
  the routing must stay on default `.c` for the inline asm to
  compile.

**Use when:** target is a 3-insn flat tail-call thunk
(`ldr rN, .L; bx rN; .word target`) where `rN ≠ r12 (ip)`.
The mwcc default for any natural C source is r12; the inline-
asm recipe above coerces the chosen register. **For r3
variants** (3 ov004 candidates surveyed below) substitute
`ldr r3, =func_helper; bx r3` in the recipe.

**Cross-corpus survey (brief 054):** scanned all unmatched ARM
gap functions for the 3-insn `ldr rN, .L; bx rN; .word target`
shape with `rN != ip`:

| Register | Count | Locations |
|---|---:|---|
| r1 | 1 | `func_0209085c` (main, the wave 14 W-H target) |
| r3 | 3 | `func_ov004_021dbdbc`, `func_ov004_021dbdd0`, `func_ov004_021de280` (all in ov004) |

The 3 r3 candidates are in **overlay 4** — deferred per
[`ov004-bss-shift.md`](ov004-bss-shift.md) until the overlay-4
baseline checksum passes. Total ARM-tractable scope today: 1
target. Per brief 044's threshold scheme (≥10 ship-tier, 5-9
.s-only, <5 shelve), 1 candidate falls below all thresholds —
**but C-16 is just the C-12 recipe with a different register**,
so the marginal cost is near-zero. Decomper should pick up
`func_0209085c` next time they're working in main; defer the
ov004 trio.

**Provenance:** brief 051 self-extend (wave 14, PR #372)
flagged `func_0209085c` as a "single-byte register choice; no
coercion found" drop and named the wall W-H; brief 054 (this
research) verified the inline-asm coercion via the same recipe
as C-12. **W-H reclassified from "no coercion" to C-16.**

### C-17. Bitfield-write mask redundancy — omit the redundant `& mask` after shift-isolation

**Target asm (`func_ov011_021d1058` — brief 055 wave 18):**

```text

ldr   r3, .L
mov   r2, #0x28
mla   r3, r0, r2, r3         ; r3 = &row[idx]
ldr   r2, [r3, #0x8]
mov   r0, r1, lsl #0x18
bic   r1, r2, #0x3fc
orr   r0, r1, r0, lsr #0x16   ; ← shifted-operand fused into orr
str   r0, [r3, #0x8]
bx    lr

```

The key insn is `orr r0, r1, r0, lsr #0x16` — mwcc fuses the
`lsr` shift into the `orr`'s shifted-operand form, saving 2
instructions vs the un-fused chain.

**mwcc emits when miscoded** (with the redundant `& mask`):

```c
/* breaks: trailing `& 0x3fcu` prevents lsr+orr fusion */
*p = (*p & ~0x3fcu) | (((val << 24) >> 22) & 0x3fcu);
```

```text

lsl   r0, r1, #24
ldr   r1, [r2, #0x8]
lsr   r0, r0, #22             ; separate lsr
bic   r1, r1, #1020
and   r0, r0, #1020           ; spurious mask (3rd extra insn)
orr   r0, r1, r0              ; un-fused orr
str   r0, [r2, #0x8]

```

11 insns + .word = 0x2c (4 bytes / 1 insn over target).

**C that coerces it (verified byte-identical against
`func_ov011_021d1058`):**

```c
*p = (*p & ~0x3fcu) | ((val << 24) >> 22);
```

Just remove the trailing `& 0x3fcu`. The shifts have **already
isolated** the bits — `(val << 24) >> 22` keeps only bits 2..9
of `val`, exactly matching the `~0x3fcu` complement on the LHS.
The redundant mask blocks mwcc's shifted-operand fusion pass
that combines `lsr K` into the `orr`'s third operand
(`orr rD, rN, rM, lsr #K`).

**Use when:** target asm shows `orr rD, rN, rM, lsr #K` (or
similar shifted-operand fusion) on a `(field & ~mask) | (val
shifted)` bitfield-write idiom. Verify the shifts isolate the
correct bits — if `(val << K1) >> K2` masks to exactly the
bits cleared by `~mask` on the other side, the trailing `& mask`
is redundant.

**Practical rule:** for any bitfield-write of the form
`(field & ~mask) | ((val << K1) >> K2)`, if the resulting bits
of the shift-pair fit within `mask`, **omit any explicit
`& mask` on the shifted-val side**. The shifts already
isolate; the redundant mask blocks fusion.

**How brief 055 wave 18 missed it on first pass:** the
"defensive mask" intuition is strong — bitfield writes
commonly look like `(field & ~mask) | (val & mask)` in
defensive C, so adding `& mask` to the shifted form reads as
"matching the conventional shape". The lesson is that
shift-pair isolation is logically equivalent to AND-mask
isolation; mwcc only fuses when the AND is absent.

**Cross-corpus survey (brief 055):** brief 055's PR explicitly
flagged this as the iteration win on `func_ov011_021d1058`.
Future waves working on bitfield writes through `row[idx]` or
similar should grep target asm for `orr ..., lsr` /
`orr ..., lsl` fused shifts as a recognition cue. Likely a
small population (estimated ≤10 candidates given the bitfield-
write idiom's scope), but each is a clean 1-line source-shape
win.

**Provenance:** brief 055 wave 18 (PR #383) — decomper
documented the wave-time iteration ("REMOVING a redundant
mask fixed `func_ov011_021d1058`") and explicitly requested
the fold ("Possibly worth a codegen-walls C-2b-or-similar
entry"). Brief 055-related fold-in (this cloud autonomous
PR).

### C-18. Combined-AND form for two-paths-converging-on-same-return

**Target asm (`func_ov002_0226bad0` — brief 055 wave 19):**

```text

ldr   r2, .L
ldr   r2, [r2, #0xd94]
cmp   r0, r2
beq   .L_zero                  ; ← branch to shared return-0
cmp   r1, #0xb
moveq r0, #0x800
bxeq  lr
.L_zero:
mov   r0, #0x0
bx    lr

```

i.e. **one branch** that joins a shared `mov r0, #0; bx lr`
epilogue, with the success path's predicated return embedded
between.

**mwcc emits when miscoded** (separate-if form):

```c
/* breaks: two predicated early-returns, no shared epilogue */
int f(int a, int b) {
    if (a == K) return 0;
    if (b == M) return N;
    return 0;
}
```

```text

cmp   r0, K
moveq r0, #0                   ; predicated early-return-0
bxeq  lr
cmp   r1, #M
moveq r0, #N
movne r0, #0                   ; predicated final-return-0 (no branch)
bx    lr

```

Same instruction count (9 + .word = 0x28), but the bytes
differ: target uses one `beq` + shared `mov r0, #0; bx lr`;
mwcc with separate-if's uses `bxeq lr` + `movne r0, #0`.

**C that coerces it (verified byte-identical against
`func_ov002_0226bad0`):**

```c
int f(int a, int b) {
    if (a != K && b == M) return N;
    return 0;
}
```

Combine the two predicates with `&&`: the first failure
branches to the shared `return 0` site. mwcc emits `beq L`
to the trailing `mov r0, #0; bx lr` block.

**Use when:** target has a single `b{cond} .L` branch to a
trailing `mov r0, #<C>; bx lr` (shared zero-return epilogue),
AND a predicated mid-function return (`bx{cond} lr`) that uses
a different constant. Two "guard then maybe return N" paths
converging on a common "return C" — express as a single
combined-AND if-statement.

**How brief 055 wave 19 missed it on first pass:** the
"guard each precondition separately" mental model is the
natural way to read the asm. The combined-AND form requires
*inverting the first comparison's sense* (`a != K` instead of
`a == K`) — a small but easy-to-miss source-shape move.

**Provenance:** brief 055 wave 19 (PR #385) — decomper
documented the iteration ("`func_ov002_0226bad0` fixed via
combined-AND form") and flagged the pattern as worth noting.
Brief 055-related fold-in (this cloud autonomous PR).

### C-19. `int` local to flip `lo` (unsigned-less) → `lt` (signed-less)

**Target asm (`func_0203baa0` — brief 055 wave 19):**

```text

ldrb   r3, [r0, #0xae]
cmp    r3, #0xff
ldrlt  r1, .L
movlt  r2, #0x0
strltb r2, [r1, r3]
...

```

Target uses **`lt`** (signed-less-than) predication.

**mwcc emits when miscoded** (direct unsigned-byte compare):

```c
/* breaks: emits `lo` instead of `lt` */
void f(S *p) {
    if (p->f_byte < 0xff) arr[p->f_byte] = 0;
}
```

```text

ldrb   r3, [r0, #0xae]
cmp    r3, #0xff
ldrlo  r1, .L                   ← lo, not lt
movlo  r2, #0x0
strlob r2, [r1, r3]

```

Same instruction count and shape, but the predication
condition-codes differ. `lo` (encoded `0x3`) vs `lt`
(encoded `0xb`) — single-nibble divergence per predicated
insn.

**C that coerces it (verified byte-identical against
`func_0203baa0`):**

```c
void f(S *p) {
    int i = p->f_byte;                /* promote to int local */
    if (i < 0xff) arr[i] = 0;
}
```

The `int` local promotes the unsigned-byte to signed-int
*before* the comparison. mwcc reads the comparison's LHS as
signed and selects `lt`. Without the local, `p->f_byte`
keeps its `unsigned char` type all the way to the cmp,
which mwcc translates to `lo`.

**Use when:** target asm shows `{ldr,mov,str}lt` predication
on a small-immediate compare (typically `cmp rN, #0xff` or
similar), AND the source-of-truth value is loaded from a
`u8`/`u16` field via `ldrb`/`ldrh`. The natural direct-
compare form emits `lo`; promoting through `int i = p->f;`
emits `lt`.

**Quick discriminator at the asm level:** condition code
`0xb` in the predicated insn's high nibble = `lt`; `0x3` =
`lo`. Both encode "less-than" semantically but on different
flag bits. Targets compiled from `int`-promoted source emit
`lt`; targets compiled from `unsigned`-typed source emit
`lo`.

**Provenance:** brief 055 wave 19 (PR #385) — decomper
documented the iteration ("`func_0203baa0` fixed via `int`
local instead of direct unsigned-char compare") and flagged
the pattern as worth noting. Brief 055-related fold-in
(this cloud autonomous PR).

### C-20. Pack-halfwords-into-arg + tail-call via legacy-tier routing

**Target asm (`func_ov002_021ae60c` triplet — brief 055 wave 20):**

```text

mov   r2, r2, lsl #0x10       ; explicit zero-extend r2 to halfword
mov   r2, r2, lsr #0x10       ;   (lsl+lsr pair = & 0xffff)
mov   r3, r2, lsl #0x10       ; r3 = (c & 0xffff) << 16  (re-shift after mask)
mov   r1, r1, lsl #0x10       ; r1 = b << 16
mov   r2, r0                  ; r2 = a (overwrites masked c — dead after step 3)
orr   r3, r3, r1, lsr #0x10   ; r3 = (c<<16) | (b & 0xffff)
ldr   ip, .L                  ; tail-call setup
mov   r0, #0x31               ; r0 = constant
mov   r1, #0x6                ; r1 = constant
bx    ip
.word func_ov002_0229ade0

```

11 insns + .word = 0x30. Note the EXPLICIT `lsl K; lsr K` pair
on r2 — mwcc 2.0's optimiser sees the third shift (`mov r3, r2,
lsl #0x10`) and collapses the entire pre-shift mask away
because the upper bits get shifted out anyway.

**mwcc emits when miscoded** (natural C source on
mwcc 2.0/sp1p5):

```c
/* breaks: mwcc elides the mask — 9 insns vs target's 11 */
func_helper(0x31, 6, a, ((c & 0xffff) << 16) | (b & 0xffff));
```

```text

ldr  r12, .L
lsl  r3, r2, #16             ; mwcc elides the (c & 0xffff) prefix — knows lsl kills upper bits
lsl  r1, r1, #16
mov  r2, r0
orr  r3, r3, r1, lsr #16
mov  r0, #49
mov  r1, #6
bx   r12

```

8 insns + .word + bx = 9 insns total. **−8 bytes vs target.**
The `unsigned short` arg variant (`unsigned short b, unsigned
short c`) elides EVEN MORE because mwcc trusts the caller's
zero-extend.

**C that coerces it (verified byte-identical against the
3-target triplet `func_ov002_021ae60c` / `_638` / `_6a4`):**

```c
extern void func_helper(int, int, int, unsigned int);

void func_target(int a, unsigned int b, unsigned int c) {
    func_helper(0x31, 6, a,
        ((unsigned int)(unsigned short)c << 16) |
        (unsigned int)(unsigned short)b);
}
```

**Compile via `*.legacy.c` routing** (mwcc 1.2/sp2p3). The
double-cast `(unsigned int)(unsigned short)c` writes the mask
as an explicit type-conversion sequence that mwcc 1.2 preserves
faithfully — it emits the literal `lsl 16; lsr 16` shift-pair
to zero-extend the halfword. mwcc 2.0 sees through the cast
sequence and collapses (because subsequent `<< 16` makes the
mask redundant); mwcc 1.2 doesn't perform that collapse.

**Why routing-tractable, not C-coercible alone.** Sweep tested
12 C variations on mwcc 2.0/sp1p5 (natural, `unsigned short`
args, explicit-mask local, GCC register-asm hint, double-cast,
volatile, etc.) — every variation on 2.0/sp1p5 collapses to 9
insns or fewer. **All 5 mwcc 1.2 SPs** (1.2/base, sp2, sp2p3,
sp3, sp4) with the double-cast form preserve the explicit
11-insn shape. **All 10 mwcc 2.0 SPs** elide. The wall is
mwcc-2.0-specific shift-pair-after-mask collapse; routing
through `*.legacy.c` (or `*.legacy_sp3.c`) sidesteps it.

**Why routing is safe for flat tail-call thunks.** The target
has no prologue / epilogue (just `bx ip` for tail-call), so
Style A vs Style B epilogue style doesn't apply. The legacy
compilers' inline-asm parser caveat (per C-12 / C-16) doesn't
apply either — this recipe uses pure C source. Compatible with
both `*.legacy.c` and `*.legacy_sp3.c`.

**Use when:** target has an explicit `lsl K; lsr K` shift-pair
on a halfword/byte value that's then immediately re-shifted (or
OR'd with another shifted value), followed by a tail-call.
Recognition cue: 3+ consecutive `mov rN, rM, lsl #...` /
`mov rN, rM, lsr #...` insns where one of the shifts appears
"redundant" after a wider final shift. The redundant-looking
shift is the wall — mwcc 2.0 will elide it; routing through
`*.legacy.c` preserves it.

**Cross-corpus survey (brief 055 wave 20):** the explicit
triplet `func_ov002_021ae60c` / `_021ae638` / `_021ae6a4`
(all 0x30, all in ov002, all share callee `func_ov002_0229ade0`,
all share the pack-2-halfwords-into-r3 shape). Each differs
only in the last `mov r1, #imm` constant (6, 7, 9). **Family
extension:** `func_ov002_0226b00c` is the same wall on a
byte-pack variant (target masks `r3` / `r2` with `and #0xff`
instead of `lsl/lsr`); the recipe shape needs adjusted source
form but routing tier is the same (`*.legacy.c`). Decomper to
verify per-target.

**Provenance:** brief 055 wave 20 (PR #387) flagged the
triplet drops as "These look worth a cloud research brief —
the pack-multiple-halfwords-into-a-single-arg pattern surfaces
multiple times and mwcc's mask-elision varies with arg-type
subtleties. Possibly a C-18 or P-9 entry." Brief 056-territory
cloud autonomous PR (this one) — sweep verified routing fix on
the triplet; C-20 entry added.

## Permanent (8 patterns)

mwcc keeps "winning" the codegen choice regardless of C source
variation. Budget **zero matches** for symbols hitting these
walls in yield predictions. Future pilots: skip-and-document
rather than iterating.

### P-1. Shift-pair vs mask collapse

> **Wall family note — see also C-15.** P-1 superficially
> looks like C-15 (both are 2→1 or 1→1 collapses) but is
> permanent across **all** mwcc SPs (1.2 and 2.0). C-15's
> routing fix does not apply. See the [Wall family note](#c-15-mwcc-20-peephole-avoidance-via-legacy-tier-routing-for-flat-thunk-arg-setup)
> at the top of C-15's entry for the discriminator. **Brief
> 051 wave 14 (PR #372) misapplied C-15 routing to 7
> `lsl 16; lsr 16` halfword zero-extend candidates; all 7
> collapsed to `and #0xffff` on every routing tier.**

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
`func_0207d304`, brief 031 `func_ov002_022912c8`; brief 049
self-extend (wave 14, PR #372) added 7 ov002 misapplications
that decomper initially routed through `*.legacy.c` expecting
C-15-style fix to apply: `func_ov002_0226af78`,
`_0226afb4`, `_0226aff0`, `_0226b094`, `_0226b13c`, `_0226b158`,
`_0226b258` — all `lsl 16; lsr 16` halfword zero-extends that
collapse to `and #0xffff` even on mwcc 1.2/sp2p3. **17 of 69
drops (25%)** — by far the largest single wall in this set,
and the most-frequently-misapplied wall (see *Wall family
note* in C-15 entry above).

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
group of 3 cross-overlay siblings + 1 main); brief 053
self-extend 2 / wave 17 (PR #380) added `func_02084a9c` +
`_02084ac4` (r0-vs-r1 ldr-dest on fnptr-cache shape — a
different reg-allocator-pick variant in the same single-byte-
divergence family). **6 of 80 (8%)** across the canonical
swap-thunk and fnptr-cache shapes.

**Coercion fallback (brief 054 sweep on wave-17 targets):** the
`asm void` + `nofralloc` recipe from C-12 / C-16 also works
here — the wave-17 reg-alloc divergence emits byte-identical
when written verbatim in inline asm. But the cost per target
is high (~10 lines of inline asm with manual label
management vs ~3 lines of C source), and the cross-corpus
population is small (P-4 + wave 17 = 6 known instances). Per
brief 044's threshold scheme: this falls below the ≥10
ship-tier line. **Recommendation: skip and document** unless
a future wave surfaces enough instances to justify the
inline-asm-per-target cost.

**Tooling angle (T-1):** see *Tooling-tractable* section below —
the broader family (any single-byte register-field
divergence) could be unlocked by a `propagate_template
--rename-regs` flag at near-zero per-target cost.

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
| 047w9 / 357 | `func_ov002_021fbba8`    | C-14 (missed in w9; coerced + matched in w11/PR#362) | coercible (resolved) |
| 047w9 / 357 | `func_ov002_02243740`    | C-14 (missed in w9; coerced + matched in w11/PR#362) | coercible (resolved) |
| 049w12 / 366 | `func_02054c64`         | C-15 (mvn-vs-sub peephole; route through `*.legacy.c` per brief 052; matched in w14/PR#372) | coercible (routing, resolved) |
| 049w12 / 366 | `func_0209085c`         | C-16 (W-H r1-vs-ip flat-thunk scratch; coerced via `asm void` + `nofralloc` per brief 054) | coercible (asm-void) |
| 049w12 / 366 | `func_ov004_021cb278`   | (ov004 BSS layout shift — see `ov004-bss-shift.md`, brief 052 part 3) | tooling/infra |
| 049w12 / 366 | `func_ov004_021dbf30`   | (ov004 BSS layout shift — see `ov004-bss-shift.md`, brief 052 part 3) | tooling/infra |
| 051w14 / 372 | `func_ov002_0226af78`/`_afb4`/`_aff0`/`_b094`/`_b13c`/`_b158`/`_b258` | P-1 (`lsl 16; lsr 16` halfword zero-extend; misapplied C-15 routing — see *Wall family note*) | permanent (×7) |
| 051w14 / 372 | `func_020534b4`          | (mvnne-andne `& -1` collapse; mwcc emits `movne r0, r4` — semantic equivalence) | permanent |
| 051w14 / 372 | `func_0205da2c`          | (multi-return convention: `mov r0, r1` post-bl skip-before-write) | edge case |
| 051w14 / 372 | `func_0209085c` (retry)  | C-16 (`*.legacy.c` routing did NOT fix; `asm void` + `nofralloc` recipe per brief 054 — same target as w12 row above, retry confirmed C-15 doesn't apply) | coercible (asm-void, resolved) |
| 053w15 / 374 | `func_02034054`           | (branchy/predicated mismatch on 0x40 candidate — same family as C-1r below) | permanent |
| 053w16 / 378 | `func_0202ef08`/`_f59c`/`_31764` | C-1r (over-predication: target hybrid predicated-chain + branchy-return; all 15 SPs collapse final return — brief 054 sweep verified) | permanent (corollary of C-1) |
| 053w16 / 378 | `func_0202147c`           | (pool-load placement r1/r2 vs r2/r1 — variant of P-3) | permanent |
| 053w16 / 378 | `func_02046c60`/`_49634`  | (alias-reload form +4; 11 insns vs orig 10) | permanent |
| 053w16 / 378 | `func_0201f0f4`           | (predicated range-check form +4) | permanent |
| 053w17 / 380 | `func_02084a9c`/`_84ac4`  | (P-4 family: r0-vs-r1 ldr-dest divergence on fnptr-cache shape; brief 054 sweep verified asm-void recipe coerces but below shelve threshold) | permanent |
| 053w17 / 380 | `func_ov002_021b91d0`     | (address-taken stack-frame elision: mwcc `-O4,p` optimises non-`volatile` address-taken local back to register; `volatile` adds extra reload — exact spill-no-reload target shape not reachable) | permanent |
| 055w18 / 383 | `func_ov011_021d2d44`     | (mwcc CSE'd `idx*2` differently than orig's fused `idx*4` + `[reg, #2]` for second access) | permanent |
| 055w18 / 383 | `func_ov000_021ac834`     | (P-4 family: r0-vs-r2 ldr-dest divergence on sign-ext differ-test; inline-return form didn't flip allocator) | permanent |
| 055w19 / 385 | `func_ov011_021ca600`     | (mwcc 2 extra pointer-arith insns instead of `[base, #imm]` form; byte-pointer source would need struct typedef) | permanent |
| 055w19 / 385 | `func_ov000_021ac508`     | (mwcc CSE'd two RMW cycles into one; two-statement source still merged) | permanent |
| 055w19 / 385 | `func_0207d994`           | (mwcc `stmia` for two adjacent stores where orig had `mov r0, r3` interleaved) | permanent |
| 055w19 / 385 | `func_0207db44`           | (mwcc didn't introduce `add r2, r0, #0x24` intermediate base for two accesses at +0x28/+0x2c) | permanent |
| 055w20 / 387 | `func_ov002_021ae60c`/`_638`/`_6a4` | **C-20** (pack-halfwords-into-arg + tail-call; route via `*.legacy.c` with double-cast — brief 056 sweep verified byte-identical) | coercible (routing) |
| 055w20 / 387 | `func_ov002_0226b00c`     | C-20 family (byte-pack variant; routing tier same as triplet, source form needs per-target tuning — brief 056 sweep partial) | coercible (routing, family) |

## Quantification

```

By bucket (across 16 pilots: 020, 022, 028, 029, 030, 031, 040,
047-wave9, 049-wave12, 051-wave14, 053-wave15, 053-wave16,
053-wave17, 055-wave18, 055-wave19, 055-wave20):
  Permanent              :  61 drops (68%)  ← +6 brief 055 (mwcc CSE / reg-alloc / stmia fusion family)
  Coercible-but-missed   :  14 drops (16%)  ← +4 brief 055 wave 20 (C-20 routing-tractable triplet + family)
  Edge case              :   9 drops (10%)
  Tooling-tractable      :   2 drops ( 2%)
  Tooling/infra (ov004 BSS)   :   2 drops ( 2% — brief 049 wave 12)
  Provisional minor wall      :   0 drops ( — — W-H reclassified to C-16 by brief 054)

(Wave 14 retry of `func_0209085c` is counted as a drop in the
source-PR table — yielding 10 drops on that wave — but the
underlying wall is the same row as the wave 12 attempt in the
cross-reference. So the bucket sum is 67, vs the source-PR
table's cumulative 69 — the +2 difference is the wave-12 W-G
match in wave 14 + the wave-12 W-H retry. Bucket math
intentionally counts unique walls, not per-attempt.)

Top single wall:
  P-1 (shift-pair collapse)         : 17 drops (19%)  ← largest
  P-4 family (single-byte reg-alloc): 7 drops ( 8%  — incl. brief 055 wave 18 r0-vs-r2)
  E-3 (Thumb)                       :  4 drops ( 4%)
  C-20 (pack-args routing — new)    :  4 drops ( 4% — brief 055 wave 20 triplet + family)
  C-1r (over-predication branchy)   :  3 drops ( 3% — brief 053 wave 16)
  P-6 (4-op predication threshold)  :  3 drops ( 3%)
  P-7 / P-8 / T-3 (W-A..D residue)  :  4 drops ( 4% — brief 040)
  C-14 (W-F r2-vs-r1 reg-alloc)     :  2 drops ( 2% — brief 047 wave 9)
  C-15 (W-G mvn-vs-sub peephole)    :  1 drop  ( 1% — brief 049 wave 12)
  C-16 (W-H r1-vs-ip ldr scratch)   :  1 drop  ( 1% — brief 051 wave 14)

```

**Read of the data:** roughly **13 % of dropped matches** in the
13-pilot window are *coercible-but-missed* — the right C variation
or routing tier existed (or was discovered post-hoc by a follow-
up cloud research brief) and the decomper just didn't try it.
(The share moved from ~20% in the original brief-032 reading
down to ~14% after brief 033 surfaced P-6's 4-op predication
threshold and reclassified 3 historic C-1 drops to permanent;
brief 042 recovered W-A via C-9; brief 048 recovered W-E via
C-12; brief 050 recovered W-F via C-14; brief 052 recovered W-G
via C-15; brief 054 recovered W-H via C-16 and confirmed C-1r
permanent; brief 055 waves 18 + 19 isolated C-17 (bitfield-
mask redundancy), C-18 (combined-AND shared-epilogue), and
C-19 (`int` local for `lt`-vs-`lo`) as wave-time iteration
wins — already folded without affecting drop counts. The
recent share dipped from ~17% to ~13% as wave 14 + wave 16 +
wave 17 added permanent drops (7 P-1 misapplications + 3
C-1r over-predication + 3 P-4-family / addr-taken) — the
**misapplication patterns themselves were the high-leverage
lessons**, captured in C-15's *Wall family note* and C-1r's
subsection under C-1.) The coercible bucket is still the
highest-leverage section of this doc: future pilots that spot
a partial-match shape matching one of C-1 through C-19 should
lift the documented variation or routing-tier change directly
— but check C-1's *ARM-op limit* + *C-1r reverse direction*
subsections AND C-15's *Wall family note* (C-15 vs P-1
discriminator) first.

The other ~87% of drops are permanent walls, edge cases, or
infrastructure issues that the cluster-pilot yield band should
already account for. Brief 023's calibration of MED 37% / HIGH
78% factored in the historic permanent-wall loss; that's why
the predictions have been roughly right despite the over-
delivery on heterogeneous clusters (where the *shape
heterogeneity* compensates for the per-shape wall losses).

## Recommendation

1. **Future cluster-pilot briefs cite this doc** instead of
   inlining "Reg-alloc carryover" sections. Saves ~30 lines of
   PR body per pilot.
2. **Decomper greps `coercible-with-knowledge` first** when a
   partial-match drop looks familiar. Estimated ~14% of drops
   are wrongly classified as walls today (e.g. brief 040 W-A
   was tagged "permanent" until brief 042 found C-9; brief 047
   wave 9 W-F was tagged "provisional reg-alloc wall" until
   brief 050 found C-14; brief 051 wave 14 W-H was tagged
   "no coercion found" until brief 054 found C-16). When
   stuck, also re-read the `prev = X` initialiser line —
   that's what missed C-9 historically; for r2-vs-r1
   cmp-scratch divergence, check whether a 2-arg pass-through
   C source flips the allocator (C-14); for `ldr rN; bx rN`
   flat thunks where `rN ≠ ip`, use the `asm void` +
   `nofralloc` recipe (C-16). **Check the C-15 *Wall family
   note* (C-15 vs P-1 discriminator) before applying any
   routing fix to a 2-insn → 1-insn collapse** — wave 14's
   misapplication of C-15 routing to 7 P-1 candidates is the
   most-frequently-missed taxonomy distinction in this doc.
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

## Operational notes

Debugging guidance that doesn't fit a single wall entry but
affects how to read partial-match results across a wave.

### Cross-function reference shift on wall-induced size mismatches

When a function fails to match because mwcc emits **fewer
bytes** than the baserom (typical for a P-1 shift-collapse drop
or any wall that compresses the source), the size delta
**cascades through the linker layout**: every function placed
*after* the failing one gets shifted up by the delta. If a
later function references a tail-call target or pool address
within the shifted region, its **resolved relocation address
will be wrong** — the function appears to fail at objdiff
even though its own C source is byte-correct.

**Symptom (brief 051 wave 13 — PR #368):** the
`func_ov010_021b4750` ov002-sibling cluster shipped 8 candidates
that all tail-call `func_ov002_0229ade0`. Two of those 8 each
emitted 4 bytes short (P-1 wall on `lsl 16; lsr 16`
zero-extend). The combined 8-byte shift bumped
`func_ov002_0229ade0` from `0x0229ade0` (declared) down to
`0x0229add8` in the linker map, breaking the pool-resolved
target address for **every one of the 8 thunks**, not just
the 2 walls. Initial wave attempt: 0/8. Drop the 2 walls →
8/8 byte-identical first try.

**Debugging recipe:**

1. When a function fails to match and the per-function
   objdiff diff shows the **pool-word value** (not the asm)
   differs by a small offset (4-32 bytes), suspect a
   cross-function cascade.
2. Identify the closest **earlier** unmatched function in the
   same overlay — especially anything in the most recent
   wave. Read its asm to see if it would emit fewer bytes
   than the declared size (P-1 / P-3 chain / unsupported
   shape).
3. Drop the earlier candidate from the wave (revert its
   `src/.../*.c` and reset its `symbols.txt` rename) and
   re-run the build. If the later candidate suddenly
   matches, the cascade was the cause.
4. The earlier candidate stays as a permanent-wall drop;
   the later candidate is **not** a wall and ships
   normally.

**Why this matters:** cluster-pilot waves that pick adjacent
candidates from the same overlay are especially vulnerable —
a single P-1 drop can mask up to N other matches in the
downstream tail. The "drop and retry" workflow is cheap
(seconds per iteration) and catches the cascade before
classifying healthy candidates as walls.

**Cross-reference:** brief 051 wave 13 ([PR #368](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/368))
documented this for the first time at the cluster-pilot
level. The whole-binary version of the same shift is what
makes the **ov004 BSS layout shift** ([`ov004-bss-shift.md`](ov004-bss-shift.md))
so persistent — that's the same cascade scaled up to a
section-boundary mis-sizing.
