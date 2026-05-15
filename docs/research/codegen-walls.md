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

**Short answer:** **33 distinct mwcc-vs-baserom codegen
divergences** account for the **112+ dropped matches across the
twenty-two pilot waves** (020 / 022 / 028 / 029 / 030 / 031 /
040 / 047-wave9 / 049-wave12 / 051-wave14 / 053-wave15 /
053-wave16 / 053-wave17 / 055-wave18 / 055-wave19 / 055-wave20 /
057-wave21 / 057-wave22 / 057-wave23 / 060-wave24 / 060-wave25 /
060-wave26; the per-PR cross-reference
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
as **C-1r permanent**. Brief 081 wave 2 + wave 3 (PRs #467
/ #468) reported a "struct-pointer + `->` field access silent-
corruption wall" from 3 candidates; brief 084's C-variation
sweep showed those 3 candidates have **three distinct root
causes** — only `func_02001ef4`'s adjacent-bitfield pattern
is a new wall (**C-22**), the other two (`func_020070dc`
strlen-style, `func_0200a454` 4-iter copy) fold to existing
C-1 + C-2/C-15-family recipes (see C-22's Wall family note).
Brief 086 wave 1 + wave 2 (PRs #474 / #478) discovered that
mwcc 2.0 folds 4× MMIO base-address constants into 1 base +
offsets, AND co-fires an `ands rN, rN, #imm; bne` →
`tst rN, #imm; bne` peephole — the `.legacy.c` (mwcc 1.2/sp2p3)
recipe restores both behaviours. Brief 088 (PR #481) ran the
5-variant × 15-SP sweep per brief 084's "3-walls-not-1"
methodology and classified this as **new C-23**, distinct
peephole machinery from C-15 despite sharing the same SP
boundary + `*.legacy.c` fix. Brief 086 wave 3 (PR #480) added
two more candidates to the brief 081 chain plus one production
hit using brief 084's bitfield recipe; brief 091 (PR #?) swept
the two unrecovered datapoints and confirmed the *6-walls-not-1*
finding (extending brief 084's *3-walls-not-1* to 6) — neither
new datapoint is a C-22 instance, both classify as P-N /
P-4-family with no source-form coercion at any of the 15 mwcc
SPs tested.
Brief 097 (decomper hand-back) surveyed 31 medium-tier candidates
with 0 byte-identical recoveries; the dominant wall pattern was
indirect-call dispatch (~12 of 31). Brief 099 (PR #?) ran the
6-variant × 15-SP sweep on `func_02048c28` per brief 084's
methodology, surfaced the **single-global vs two-global**
source-form distinction (variants A-E with two synthetic globals
mismatched by 1 pool-offset byte; variant F with one global
achieved byte-identical at mwcc 1.2/sp3), and classified the
wall as **new C-24** — first wall to use the third routing tier
(`*.legacy_sp3.c`, mwcc 1.2/sp3) as the recipe. Cross-corpus
scan found 49 unmatched candidates matching the C-24 signature.
Most fall into one
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
| 057/wave21 | 390 | 70.0% |  7  |       3 |
| 057/wave22 | 392 | 70.0% |  7  |       3 |
| 057/wave23 | 402 | 25.0% |  2  |       6 |
| 060/wave24 | 405 | 75.0% |  9  |       3 |
| 060/wave25 | 408 | 84.6% | 11  |       2 |
| 060/wave26 | 412 | 64.3% |  9  |       5 |
| —     | —   |   —   | **228** |  **112** |

Each pattern gets: a name, the target asm shape, the mwcc-emitted
asm shape, the C source variation that *did* coerce it (when
known) or *didn't* (with a one-line reason), and a *use when*
hint. The bucket header indicates how to budget the pattern in a
yield prediction.

## Coercible-with-knowledge (24 patterns)

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
> - Target has **3+ `ldr rN, [pc, #imm]`** loads of nearby
>   (≤ ±0x40 byte spacing) MMIO addresses, OR a wait-loop
>   using `ands rN, rN, #imm; bne` → **C-23**, *also* route
>   through `*.legacy.c` (1.2/sp2p3) — same fix, distinct
>   peephole machinery. See [C-23](#c-23-mmio-base-folding--andstst-peepholes-on-volatile-pointer-local-block)
>   for the full table + cross-corpus survey of MMIO blocks.

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

#### C-20a. Inline-asm fallback for tail-call-detection failure

The routing recipe above unlocks the **halfword-pack triplet
shape** where pure C source produces the right asm given the
right routing tier. **Two family-extension shapes fail this
test** — wave 23 (PR #402) confirmed:

- `func_ov002_0226b00c` — **byte-pack variant**: target uses
  `and r3, #0xff; and r2, #0xff; orr r2, r3, r2, lsl #8`
  followed by halfword zero-extend (`lsl 16; lsr 16`) +
  `bx ip` tail-call.
- `func_ov002_022a8668` — **4-store + 4-mov-then-tail-call
  shape** with explicit `sub r1, r0, #0x32` constant-derive
  (target uses `sub` because mwcc-2.0 peephole; mwcc-1.2 would
  emit `mvn r1, #0` — see C-15).

Both fail pure-C coercion: every C source variation across all
15 SPs produces a stack-framed `bl helper; pop {regs, pc}`
form instead of `bx ip`. mwcc's tail-call detector trips on
the `q → r2` reg-shuffle (mwcc-1.2) or the constant-derive
chain (mwcc-2.0).

**The recipe (verified byte-identical against both targets):**

```c
extern void func_helper(int, int, int, unsigned short);

asm void func_target(int a, int b, int c, int d) {
    nofralloc
    and  r3, r3, #0xff
    and  r2, r2, #0xff
    orr  r2, r3, r2, lsl #0x8
    mov  r3, r2, lsl #0x10
    mov  r2, r1
    ldr  ip, =func_helper
    mov  r3, r3, lsr #0x10
    mov  r1, #0x9
    bx   ip
}
```

Same template as **C-12 (push-r0)** and **C-16 (ldr-r1-vs-ip)**:
`asm void` + `nofralloc` emits the body verbatim with no
prologue / epilogue / tail-call detection. Compile via the
**default `.c` rule (mwcc 2.0/sp1p5)** — same caveat as C-12
and C-16: mwcc 1.2/sp2p3 and mwcc 1.2/sp3 inline-asm parsers
reject `ldr ip, =label` syntax.

**Method (brief 060-territory cloud research):** sweep tested
6 C variations (natural 4-arg, explicit-locals, explicit-uint,
`uchar`→`ushort`, 4-arg int casts, 3-arg packed-first) on each
of the 15 mwcc SPs. Every C variation + SP combination emits a
stack-frame (`push {r3, lr}` or `stmdb sp!, {lr}; sub sp, #4`)
followed by `bl helper; pop`. No pure-C path produces the
target's flat `bx ip` shape. Inline-asm hypothesis verified
byte-identical against both targets.

**Cross-corpus survey (brief 060-territory):**

| Target | Wall family | Status |
|---|---|---|
| `func_ov002_0226b00c` | byte-pack + 4-arg shuffle | C-20a recipe ✓ verified byte-identical |
| `func_ov002_022a8668` | 4-store + 4-mov + tail-call (`sub r1, r0, #0x32` constant-derive) | C-20a recipe ✓ verified byte-identical |

Per brief 044's threshold scheme (≥10 ship-tier, 5-9 .s-only,
<5 shelve), 2 candidates falls below the ship-tier line. **The
recipe is mechanical and reusable** for any future
pack-args-or-stores + flat-`bx ip` target where mwcc's
tail-call detector fails. Decomper picks these up when working
in scope; documented as the inline-asm fallback under C-20's
umbrella rather than a fresh C-N number.

**Use when:** target is a flat tail-call thunk
(`...body...; bx ip; .word helper`) where the body involves
either (a) explicit `and rN, #0xff` byte masks (byte-pack
shape), or (b) constant-derive chains (e.g.
`sub r1, r0, #imm` reusing a prior `mov`), AND every routing
tier attempted produces a stack-frame `bl helper; pop`
instead. The asm-void recipe sidesteps mwcc's tail-call detection
entirely.

**Provenance:** brief 060-territory cloud autonomous PR (this
one) — option (1) from brain's post-#401 suggestions list.
Wave 23 (PR #402) flagged both targets after wave 19, 20, 23
had each hit the same wall on `func_ov002_0226b00c`. Sweep
verified the inline-asm recipe is the right cross-target
template; classification under C-20a (subfamily) preserves
the C-N count without adding a fresh number.

### C-21. Ternary-to-constants collapse — decompose role from value

**Target asm (`func_ov002_022b3720` — brief 057 wave 21):** a
conditional 8-bit-rotation that produces `0x100` or `0x80` from
a sign bit:

```text

cmp   r3, #0x0
movlt r3, #0x1             ; sign bit
movge r3, #0x0
mov   r3, r3, lsl #0x7     ; sign << 7
rsb   r3, r3, #0x100        ; r3 = 0x100 - (sign << 7)

```

4 instructions: `mov{lt,ge} #{1,0}; lsl #7; rsb #0x100`. The
final value is one of two constants (`0x100` or `0x80`)
produced via an explicit arithmetic chain (decision → bit-
shift → subtract).

**mwcc emits when miscoded** (natural ternary form):

```c
/* breaks: mwcc folds the ternary into 2 direct mov-immediates */
p->f_1c = (prev < 0) ? 0x80 : 0x100;
```

```text

cmp   r3, #0x0
movlt r3, #0x80             ; direct constant for true path
movge r3, #0x100            ; direct constant for false path

```

2 instructions: `mov{lt,ge} #{0x80,0x100}`. **mwcc's
optimiser recognises the ternary returns one of two
small-immediate constants and folds the entire decision
into two predicated mov-immediates.** Same end value; 2
fewer instructions; different bytes.

**C that coerces it (verified byte-identical against
`func_ov002_022b3720`):**

```c
int sign = (prev < 0) ? 1 : 0;             /* decision → 1 or 0 */
p->f_1c = 0x100 - (sign << 7);             /* arithmetic chain */
```

**The trick:** decompose the ternary's two roles — *what's the
decision?* (sign 1 or 0) from *what's the value?* (0x100 - 0x80,
expressed as `0x100 - (sign << 7)`). mwcc's fold-pass requires
both branches to be small-immediate constants on the same
expression; splitting `sign` and the arithmetic into separate
statements blocks the fold and emits the explicit `lsl/rsb`
chain.

**No SP variation flips it (verified all 15 SPs).** Sweep
tested the coerced source across mwcc 1.2/base..sp4 +
2.0/base..sp2p4 — every SP preserves the 4-insn chain
(`movlt/movge/lsl/rsb`). Pure C-source coercion; no routing
tier needed.

**Use when:** target asm shows a 4-insn chain
`mov{cond} rN, #{a}; mov{!cond} rN, #{b}; lsl rN, rN, #K;
rsb rN, rN, #C` (or `add`/`sub`/`orr` instead of `rsb`) —
where the two predicated mov constants are *small* (typically
`0` and `1`) and the final value is computed by a single
arithmetic op on the shifted form.

**The recognition cue:** target has `lsl rN, rN, #K` AND
`rsb rN, rN, #imm` (or similar) *immediately after* two
predicated mov-immediates, AND the two predicated movs
could plausibly be folded to "direct large constants" but
weren't. The natural C source `(cond) ? X : Y` produces the
folded form; the decomposed source `int sign = (cond) ? 1 :
0; result = LARGE - (sign << K);` produces the chain.

**Practical rule:** when the asm shape has BOTH a
`mov{cond} #small` AND a subsequent arithmetic chain (shift +
arith), the target was likely compiled from a "decompose role
from value" C source. Don't write the natural ternary; split
the role (decision producing 0/1) from the value (arithmetic
on the decision).

**How brief 057 wave 21 missed it on first pass:** the natural
ternary `(prev < 0) ? 0x80 : 0x100` reads as the most direct C
encoding — both constants are small enough to be mov-immediate
operands, so mwcc folds them. The lesson is that *target's
4-insn chain implies the original source did the arithmetic
explicitly*; mwcc's optimiser can't infer back from
two-constant ternary to single-arithmetic-chain.

**Provenance:** brief 057 wave 21 (PR #390) — decomper
documented the iteration ("`func_ov002_022b3720` fixed by
emitting the shift-and-rsb explicitly instead of the natural
ternary") and flagged it as "**possible C-20 codegen-walls
entry** (the 'ternary-to-constants' collapse pattern)" — but
C-20 was simultaneously taken by the pack-args wall (brief 056
PR #389), so this is **C-21**. Brief 057-related fold-in (this
cloud autonomous PR).

### C-22. Adjacent-bitfield write — `(v & ~mask) | (a<<8) | (b<<12)` vs bitfield syntax

> **Wall family note — brief 081's "struct-pointer wall" was
> six distinct walls (updated by brief 091).** Brief 081 wave 2 +
> wave 3 (PRs #467, #468) reported three candidates that
> compiled+linked clean but failed at byte-verify, grouping them
> under a hypothesised "typedef'd struct pointer + `->` field
> access silent-corruption" wall. Brief 086 wave 3 (PR #480)
> added two more datapoints + one production hit. Brief 084's
> C-variation sweep classified the original 3; brief 091's sweep
> classified the new 2 — every datapoint has a distinct root
> cause:
>
> | Datapoint | Surfaced | Actual wall | Coercion |
> |---|---|---|---|
> | `func_02001ef4` (bit-field pack) | brief 081 wave 2 | **C-22 — this entry** | bitfield struct decl |
> | `func_020070dc` (strlen-style) | brief 081 wave 2 | C-1 (predicated early-return) | explicit `goto` to force branch form |
> | `func_0200a454` (4-iter copy) | brief 081 wave 3 | C-2 + C-15-family (legacy-tier routing) | temp-local cache + `.legacy.c` (mwcc 1.2/sp2p3) routing |
> | `func_02001c98` (bit-field pack on 4-bit pair) | brief 086 wave 3 | **C-22 — production hit** | bitfield-via-union recipe (this entry) ✅ |
> | `func_02009758` (bit-array set + cache flag) | brief 086 wave 3 | mwcc-2.0 modulo-by-pow-2 peephole + reg-alloc | **none found** (P-N candidate; see Brief 091 sub-note below) |
> | `func_02000cc4` (counter increment + helper-call + struct-array init) | brief 086 wave 3 | P-4 family (register-allocation wall) | **none found** (size matches, bytes diverge in reg-alloc; see sub-note) |
>
> Brief 084 + brief 091 between them established that the
> shared symptom (typedef'd struct + `->` field access) was a
> syntactic coincidence rather than a common codegen mechanism —
> 6 candidates spread across 6 distinct codegen disagreements,
> only 2 of which were actual C-22 (the bitfield-pack pattern
> this entry codifies). The 6-walls-not-one finding is itself
> the more general lesson: wall hypotheses from N candidates
> should be confirmed by a codegen sweep, not by symptom
> similarity. Brief 088 (C-23 sweep) operationalised this same
> methodology for a different wall family.

**Target asm (`func_02001ef4` — brief 081 wave 2 / brief 084):**

```text

ldr   r3, [r0, #0x24]            ; load the struct member
mov   r1, r1, lsl #28             ; lsl/lsr to mask r1 to 4 bits
bic   r3, r3, #0xf00              ; clear bits 8-11   ← TWO masks
orr   ip, r3, r1, lsr #20         ; set bits 8-11
bic   r3, ip, #0xf000             ; clear bits 12-15  ← TWO masks
mov   r1, r2, lsl #28
orr   r1, r3, r1, lsr #16         ; set bits 12-15
str   r1, [r0, #0x24]
bx    lr

```

9 instructions. Two **separate** `bic` masks: one clearing bits
8-11, the second clearing bits 12-15. The orig emits this as
clear-then-set twice.

**mwcc emits when miscoded** (natural compound-mask form):

```c
/* breaks: mwcc folds the two clears into a single combined mask */
p->field_24 = (p->field_24 & ~0xff00)
            | ((a & 0xf) << 8)
            | ((b & 0xf) << 12);
```

```text

ldr   r3, [r0, #0x24]
mov   r1, r1, lsl #28
bic   r3, r3, #0xff00              ; SINGLE combined clear ← FOLD
mov   r2, r2, lsl #28
orr   r1, r3, r1, lsr #20
orr   r1, r1, r2, lsr #16
str   r1, [r0, #0x24]
bx    lr

```

8 instructions. mwcc's optimiser sees `& ~0xff00` as one mask
clearing two adjacent 4-bit ranges, and emits a single `bic`
covering both. Same semantic; different bytes.

**C that coerces it (verified byte-identical against
`func_02001ef4`, mwcc 2.0/sp1p5):**

```c
typedef struct foo_t {
    u8  padding[0x24];
    u32 lo_8     :  8;
    u32 bf_8_12  :  4;     /* first  4-bit field */
    u32 bf_12_16 :  4;     /* second 4-bit field */
    u32 hi_16    : 16;
} foo_t;

void f(foo_t *p, u32 a, u32 b) {
    p->bf_8_12  = a;
    p->bf_12_16 = b;
}
```

**The trick:** declare each 4-bit window as its own bitfield, then
write each field with a separate statement. mwcc treats each
bitfield write as a clear-then-set on its own bit range, emitting
two `bic`s — matching orig's two-step pattern. The compound-mask
form (`v & ~0xff00`) collapses to one `bic`.

**SP variation (verified all 3 routing tiers):**

| SP | mwcc | Result |
|---|---|---|
| default | 2.0/sp1p5 | ⭐ byte-identical |
| `.legacy.c` | 1.2/sp2p3 | size match, different bytes (legacy emits an extra `mov` for shift-mask isolation) |
| `.legacy_sp3.c` | 1.2/sp3 | size match, different bytes (same as 1.2/sp2p3) |

**Default-SP-only.** Don't route to `.legacy.c` for this pattern;
the bitfield syntax + default mwcc 2.0/sp1p5 is the win.

**Use when:** target asm shows **two adjacent `bic ...; orr ...`
pairs** writing different 4-bit (or other small-width) ranges to
the same struct member, AND the asm has TWO `bic` masks at
different bit positions (e.g. `bic #0xf00; ... bic #0xf000;`).
The natural compound-mask C source folds the two `bic`s into one;
the bitfield form preserves the two-step pattern.

**The recognition cue:** target has `ldr rN, [base, #imm]` →
`bic` → `orr` → `bic` → `orr` → `str rN, [base, #imm]`. Two
clears + two sets on the same loaded register. If you'd write
this naturally as `p->field = (p->field & ~MASK) | ((a & A) <<
S1) | ((b & B) << S2);`, mwcc folds the two clears. Use
bitfields.

**Practical rule:** when the asm shape has two adjacent `bic`s
on the same register at different positions, the target was
likely compiled from C with adjacent bitfield decls. Don't
write the compound-mask form; declare each field's window as
a C bitfield.

**Confirmed instances:**

- `func_02001ef4` (brief 081 wave 2, PR #467) — 9 insn, two
  4-bit bitfields at positions 8-12 and 12-16.
- `func_02001c98` (brief 086 wave 3, PR #480) — production
  hit using the recipe above; bitfield-via-union with two
  4-bit fields at positions 17-21 and 21-25.

#### Brief 091 sub-note — two co-grouped datapoints with no recipe

Brief 086 wave 3 (PR #480) added two more candidates to the
brief 081 chain. Brief 091's C-variation sweep (5+ source
shapes × 15 SPs each) showed neither is a C-22 instance and
neither has a coercion recipe at the project's default SP.
Documenting them here so future iterations can grep the
discriminator + skip rather than re-running the same sweep.

**`func_02009758` (bit-array set + cache flag side-effect, 0x4c).**
Asm pattern:

```text

stmdb sp!, {r3, lr}
mov   r1, r0, asr #4              ; idx / 16 (signed)
add   r1, r0, r1, lsr #27         ; idx + bias (for /32)
mov   r2, r0, lsr #31             ; sign bit
rsb   r0, r2, r0, lsl #27         ; (idx << 27) - sign
ldr   r3, .L_bitmap
mov   lr, r1, asr #5              ; word index
ldr   r1, [r3, lr, lsl #2]        ; bitmap[word]
add   r2, r2, r0, ror #27         ; bit_idx (signed-mod recovery)
mov   ip, #1
tst   r1, ip, lsl r2              ; test bit
ldmnefd sp!, {r3, pc}             ; predicated early-return
orr   r1, r1, ip, lsl r2          ; set bit
ldr   r0, .L_cache
str   r1, [r3, lr, lsl #2]
str   ip, [r0, #0xa88]            ; cache flag = 1
ldmia sp!, {r3, pc}

```

17 insns + 2 pool. The orig is mwcc-1.2-style code: it computes
`idx % 32` via the **full signed-modulo formula** — 3-insn
recovery using `mov r0, lsr #31` / `rsb r0, r2, r0, lsl #27` /
`add r2, r2, r0, ror #27` — as opposed to mwcc 2.0's
**single-insn `and rN, #0x1f`** peephole. mwcc 2.0 recognises
that `idx & 0x1f` is equivalent to `idx % 32` for non-negative
idx and emits the short form even when source-author wrote
`% 32`.

Brief 091 sweep (4 source variants × 15 SPs):

| Source | mwcc 2.0/sp1p5 | mwcc 1.2/sp2p3 | mwcc 1.2/sp3 |
|---|---|---|---|
| natural (`int idx; idx & 0x1f`) | 0x44 (-8) | 0x58 (+12) | 0x54 (+8) |
| signed_mod (`idx % 32`) | 0x50 (+4) | 0x58 (+12) | 0x54 (+8) |
| signed_int_array (s32 bitmap) | 0x50 (+4) | 0x58 (+12) | 0x54 (+8) |
| unsigned (`u32 idx; idx & 0x1f`) | 0x3c (-8) | 0x50 (+4) | 0x4c size-match — bytes diff |

Closest: `unsigned` at 1.2/sp3 — size-match but registers + epilogue diverge. None of the 60 (variant, SP) combinations produces byte-identical match.

**Classification: P-N permanent-style.** mwcc-2.0's modulo-by-power-of-2 peephole is mwcc-version-specific; routing to `.legacy.c` (1.2/sp2p3) doesn't help because mwcc 1.2 emits the longer formula but with different register allocation throughout. Neither SP boundary produces byte-identical against the orig. Decomper's selection rule should skip functions matching the asm pattern (`mov rN, lsr #31; rsb rM, rN, ...; add ..., ror #27` for signed-modulo recovery) until a future cap-raise / permuter run unlocks them.

**`func_02000cc4` (counter-increment + helper-call + struct-array entry init, 0x48).**
Asm pattern:

```text

stmdb sp!, {r4, r5, r6, lr}
ldr   r5, .L_ctx                  ; r5 = &ctx (loaded into r5!)
ldr   r4, [r5, #0x80]              ; r4 = ctx.counter (loaded into r4!)
add   r0, r4, #1                   ; r0 = idx + 1
str   r0, [r5, #0x80]              ; ctx.counter = idx + 1
add   r6, r5, r4, lsl #4           ; r6 = entry = &ctx + idx*16
bl    helper                       ; helper(idx + 1)
ldr   r1, .L_extra
str   r0, [r5, r4, lsl #4]         ; entry->f_0 = helper return (uses indexed addr)
ldr   r0, [r1, #0x3c]              ; load q->f_3c
ldr   r2, [r1, #0x40]              ; load q->f_40 (BATCHED loads)
str   r0, [r6, #0x4]               ; store entry->f_4
ldr   r0, [r1, #0x44]              ; load q->f_44
str   r2, [r6, #0x8]               ; store entry->f_8 (BATCHED stores)
str   r0, [r6, #0xc]               ; store entry->f_c
ldmia sp!, {r4, r5, r6, pc}

```

16 insns + 2 pool. Two simultaneous codegen disagreements:

1. **Reg-alloc swap.** Orig allocates `&ctx` to r5 (higher-numbered) and `idx` to r4 (lower-numbered) — opposite of mwcc 2.0's allocator preference. Every (variant, SP) tested allocates `&ctx` to r4 + `idx` to r5 instead. Source-form interventions (`local_ptrs`, `entry_ptr`, `idx_first` declaration ordering, `batched_loads` reordering) shift the size to match (0x48) at every `2.0/*` SP and `1.2/sp3` + `1.2/sp4`, but the register identity stays swapped. mwcc allocates by USAGE order (first-loaded value gets the lower-numbered register), and `&ctx` MUST be loaded first because `idx` requires `ctx.counter`. There is no source-form intervention that flips this.
2. **Load-store batching diverges.** Orig batches 2 loads then writes; mwcc emits load-store-load-store-load-store. The `batched_loads` variant (manual local temps for the 3 q-fields) doesn't propagate through mwcc 2.0's CSE.

**Classification: P-4 family — confirmed permanent (brief 093 permuter rule-out).**
Permanent for the project's default-tier source-form pipeline.
Brief 091 sweep tested 5 source variants × 15 SPs = 75
combinations; the closest hit is `entry_ptr` at any `2.0/*` SP
producing a 0x48-byte function with the wrong register
allocation in 6 positions. **Brief 093 (PR #?) ran permuter**
(brief 063, PR #473) against the `entry_ptr` variant for ~300
iterations × 3 threads (~900 thread-iterations total). **Best
score plateau: 80** (baseline 265, theoretical byte-identical =
0). Permuter found a closer-to-orig **load-ordering** by
reusing the loop counter as a temp for the last field load
(`idx = q->f_44; ... entry->f_c = idx;`) — same shape brief
091's `batched_loads` variant attempted — but **could not flip
the underlying r4 ↔ r5 register-allocation swap**. The 6 byte
positions identified by brief 091 as register-swap divergences
remained different at score 80; mwcc 2.0's usage-order
allocator is **downstream of any source-level mutation**
permuter can apply.

**Permuter rule-out confirmed.** Brief 093's outcome: P-4
register-allocation walls are not coercible via either
source-form sweeps (brief 091's 75 attempts) or permuter's
random-mutation search (brief 093's ~900 thread-iterations).
Treat the asm-grep discriminator
(`stmdb sp!, {r4-r6, lr}; ldr r5, .Lpool; ldr r4, [r5, #imm]`
where the *first-loaded* base is allocated to the
*higher-numbered* register) as a **hard skip-rule** for future
single-region cap-raises. Permuter recovery for this wall
family is not expected to land.

**Permuter setup gaps surfaced (brief 093, for follow-up
tooling brief).** Brief 063's `--run` mode hadn't been
exercised end-to-end on macOS Apple Silicon before brief 093.
Five vendor patches were needed to get permuter past the
import + first-iteration stages:

1. **`tools/_vendor/decomp-permuter/import.py`**: catch
   `FileNotFoundError` in `homebrew_gcc_cpp` (Apple Silicon
   has no `/usr/local/bin`, only `/opt/homebrew/bin`; the
   upstream raises only on `ValueError`).
2. **`import.py`**: accept lowercase `-i` as an include flag
   (mwccarm convention); upstream only scrapes `-I` from the
   ninja compile command.
3. **`import.py`**: default `DEFAULT_AS_CMDLINE` to
   `arm-none-eabi-as -mcpu=arm946e-s -mthumb-interwork`;
   upstream hardcodes MIPS (`mips-linux-gnu-as
   -march=vr4300 -mabi=32`).
4. **`tools/_vendor/decomp-permuter/prelude.inc`**: replace
   the MIPS `.set noat / .set noreorder / .set gp=64`
   directives with ARM-compatible macros; otherwise
   `arm-none-eabi-as` rejects the prelude.
5. **Per-work-dir `compile.sh`**: strip the
   `&& transform_dep.py …` suffix from the ninja-derived
   compile command; upstream import.py captures the chained
   command verbatim, and mwccarm rejects `&&` as a literal
   argument.

Plus one project-specific .s normalization: dsd-dis emits
`.global` (with `e`) + `arm_func_start`/`arm_func_end` /
`.include "macros/function.inc"` macros, all of which
upstream permuter chokes on. Brief 093 hand-edited the .s
into permuter-acceptable form (`.globl func_name` + strip
macros). A follow-up tooling brief should fold these patches
upstream OR mediate them via a wrapper layer in
`tools/permute.py` so the next cloud-autonomous permuter
run is a clean `--run` invocation.

**Provenance:** brief 081 wave 2 (PR #467) hypothesised a
generic "struct-pointer silent-corruption wall" from 3
candidates. Brief 084 (PR #471) ran the C-variation sweep,
discovered the 3-walls-not-1 reality, classified the single
new wall as **C-22**, and pinned the bitfield-syntax recipe
above. Brief 086 wave 3 (PR #480) added two more datapoints
+ confirmed the recipe via production hit on `func_02001c98`.
Brief 091 (PR #?) ran the C-variation sweep on the two new
unrecovered datapoints, classified them as P-N / P-4-family
respectively, and added the discriminator + sweep matrix
above so future iterations can skip them without re-running.
The other three brief 081 candidates fold to existing C-1 +
C-2/C-15-family recipes (see Wall family note above for the
full mapping).

### C-23. MMIO base-folding + ANDS→TST peepholes on volatile pointer-local block

> **Wall family note — C-23 vs C-15.** Both walls are
> mwcc-2.0-only peephole optimisations on constant-pool
> materialisation, both fixed by routing through `*.legacy.c`
> (mwcc 1.2/sp2p3). The peephole machinery is **distinct** —
> two separate optimisation passes that share an SP boundary,
> not one peephole with two surface shapes.
>
> | Wall | Peephole signature | Discriminator |
> |---|---|---|
> | **C-15** | constant-pair derivation: `mov rN, #K; mvn rM, #0` (1.2) vs `mov rN, #K; sub rM, rN, #1` (2.0) | **2 instructions** materialising `(K, ±1)` near each other |
> | **C-23** (this entry) | base-address dedup: 4× `ldr rN, .Lpool` of nearby MMIO addresses (1.2) vs 1× `ldr base; [base, #imm]` (2.0). Often co-fires with **ANDS→TST** in `&`-then-branch wait loops | **3+ separate `ldr rN, [pc, #imm]`** of nearby (within ±0x40 byte) constants |
>
> **Quick discriminator at the asm level:**
>
> - Target has 2 instructions materialising a constant pair where
>   one is derivable from the other (`#K, #-1`, `#K, #K-1`, etc.)
>   → **C-15**, route through `*.legacy.c`.
> - Target has **3+ `ldr rN, [pc, #imm]`** loads + the loaded
>   constants (in the trailing pool) are within a tight MMIO
>   block (e.g. `0x04000280`, `0x04000290`, `0x04000298`,
>   `0x040002a0`) → **C-23**, route through `*.legacy.c`.
>
> Both fixes happen to be the same routing flag; the
> discriminator matters when the target hits a third pattern
> that *isn't* legacy-tier-routable (e.g. P-1's mask-collapse
> which fires on every SP). See P-1's wall family note for
> that trap.

**Target asm (`func_0208bde0` quotient form, brief 086 wave 1
PR #474 — DS hardware divider):**

```text

stmfd sp!, {lr}
sub   sp, sp, #0x4              ; align/scratch
ldr   ip, .L_DIVCNT             ; ip = 0x04000280   ← FOUR
mov   lr, #0x0
ldr   r3, .L_NUMER              ; r3 = 0x04000290   ← separate
strh  lr, [ip]
ldr   r2, .L_DENOM              ; r2 = 0x04000298   ← pool
str   r0, [r3, #0x0]
str   r1, [r2, #0x0]
str   lr, [r2, #0x4]
.L_wait:
ldrh  r0, [ip]
ands  r0, r0, #0x8000           ; ANDS — sets flags AND writes back
bne   .L_wait
ldr   r0, .L_RESULT             ; r0 = 0x040002a0   ← loads
ldr   r0, [r0, #0x0]
add   sp, sp, #0x4
ldmfd sp!, {lr}
bx    lr
.L_DIVCNT:  .word 0x04000280
.L_NUMER:   .word 0x04000290
.L_DENOM:   .word 0x04000298
.L_RESULT:  .word 0x040002a0

```

18 insns + 4 pool words = 0x58. **Two distinct shapes** that
mwcc 2.0 collapses but mwcc 1.2 preserves:

1. **Four separate `ldr rN, .L*`** pool loads — one per MMIO
   register address.
2. **`ands r0, r0, #0x8000`** in the wait loop — writes the
   AND result back to r0 even though r0 is reloaded next
   iteration.

**mwcc 2.0/sp1p5 emits when miscoded** (natural pointer-local
form, default routing — both peepholes fire):

```c
/* breaks: mwcc folds 4 base loads → 1 + offsets, AND flips ands → tst */
int func_0208bde0(int numer, int denom) {
    vu16 *p_divcnt  = (vu16 *)0x04000280;
    vs32 *p_numer   = (vs32 *)0x04000290;
    vs32 *p_denom   = (vs32 *)0x04000298;
    vs32 *p_result  = (vs32 *)0x040002a0;
    *p_divcnt = 0;
    *p_numer  = numer;
    *p_denom  = denom;
    p_denom[1] = 0;
    while (*p_divcnt & 0x8000)
        ;
    return *p_result;
}
```

```text

ldr   r2, [pc, #0x28]           ; r2 = 0x04000280  ← SINGLE base
mov   r3, #0
strh  r3, [r2, #0x0]            ; DIVCNT (offset 0)
str   r0, [r2, #0x10]           ; NUMER  (offset +0x10)
str   r1, [r2, #0x18]           ; DENOM  (offset +0x18)
str   r3, [r2, #0x1c]           ; DENOM+4
ldrh  r0, [r2, #0x0]
tst   r0, #0x8000               ; TST — flag-only, no write-back
bne   .L_wait
ldr   r0, [pc, #0x8]
ldr   r0, [r0, #0x0]
bx    lr
.word 0x04000280                ; only 2 pool words
.word 0x040002a0

```

14 insns + 2 pool = 0x38. **−0x20 bytes** vs. target. Two
peepholes fire together: base-folding + ANDS→TST.

**C that coerces it (verified byte-identical against
`func_0208bde0`, `*.legacy.c` routing → mwcc 1.2/sp2p3):**

The same natural pointer-local source above. **No source change
required** — the fix is the routing tier:

```bash
mv src/main/func_0208bde0.c src/main/func_0208bde0.legacy.c
ninja
```

`*.legacy.c` routes through mwcc 1.2/sp2p3, which lacks both
peepholes — emits 4 separate pool loads + literal `ands` from
the C `&` operator. Verified byte-identical to orig.

**SP boundary (verified all 15 mwcc SPs, 5 source variations
× 75 compiles):**

| mwcc SP | A pointer-locals | B inline casts | C struct typedef | D `register` | E macros |
|---|---|---|---|---|---|
| 1.2/base | ⭐ 0x58 ANDS | 0x60 ANDS | 0x30 ANDS-folded | ⭐ 0x58 ANDS | 0x60 ANDS |
| 1.2/sp2 | ⭐ 0x58 ANDS | 0x60 ANDS | 0x30 ANDS-folded | ⭐ 0x58 ANDS | 0x60 ANDS |
| **1.2/sp2p3** | ⭐ **0x58 ANDS** | 0x60 ANDS | 0x30 ANDS-folded | ⭐ 0x58 ANDS | 0x60 ANDS |
| 1.2/sp3 | 0x54 ANDS | 0x5c ANDS | 0x30 ANDS-folded | 0x54 ANDS | 0x5c ANDS |
| 1.2/sp4 | 0x54 ANDS | 0x5c ANDS | 0x30 ANDS-folded | 0x54 ANDS | 0x5c ANDS |
| 2.0/base..sp2p4 (10 SPs) | 0x38 **TST** folded | 0x38 **TST** folded | 0x30 **TST** folded | 0x38 **TST** folded | 0x38 **TST** folded |

⭐ = byte-identical match against orig.

**Boundary semantics:**

- **`1.2/{base, sp2, sp2p3}`**: emits the unfolded 4-pool-load
  + literal-ANDS form. **`1.2/sp2p3` is the project's pinned
  `*.legacy.c` SP — the canonical recipe.**
- **`1.2/sp3` / `1.2/sp4`**: emits unfolded 4-pool-load + ANDS,
  but the function epilogue is 4 bytes shorter (single `ldmfd
  sp!, {pc}` return vs `ldmfd sp!, {lr}; bx lr`). Close, but
  not byte-identical to the target's `1.2/sp2p3`-style epilogue.
- **All `2.0/*` (10 SPs)**: emits the folded 1-base + offsets +
  TST form. The two peepholes are mwcc-2.0-only.

**The two peepholes can be observed independently** via
variant C (struct typedef):

| | Base-folding | ANDS→TST |
|---|---|---|
| `1.2/*` + variant C (struct) | ✓ source-driven | ✗ keeps ANDS |
| `2.0/*` + variant C (struct) | ✓ source-driven (redundant) | ✓ peephole-driven |
| `1.2/*` + variants A/B/D/E | ✗ keeps 4 loads | ✗ keeps ANDS |
| `2.0/*` + variants A/B/D/E | ✓ peephole-driven | ✓ peephole-driven |

mwcc 2.0 has the ANDS→TST peephole regardless of source form
(it's an `&`-then-branch dataflow optimisation). mwcc 2.0's
base-folding peephole only fires on pointer-local form;
variant C's struct typedef pre-folds at the source level so
it doesn't matter what mwcc would have done.

**Use when:** target asm has **3+ `ldr rN, [pc, #imm]`** loads
of nearby (≤ ±0x40 byte spacing) MMIO addresses, AND/OR a
wait-loop using `ands rN, rN, #imm; bne` (rN dead after the
branch). Either signal — and especially both together — points
to C-23. Route through `*.legacy.c`.

**Recognition cue:** target's pool literals (last 4-8 bytes of
the function) are 4+ MMIO addresses in the same `0x040002xx` /
`0x04000xxx` block — a register-block layout that mwcc 2.0
would naturally fold to a single base if it had the chance.

**Cross-corpus survey notes:** the DS has many adjacent MMIO
register blocks beyond the divider:

| Block | Range | Likely C-23 candidates |
|---|---|---|
| Display engine A | `0x04000000-0x0400006f` | DISPCNT, BG\*CNT, BG\*OFS, etc. |
| DMA channels | `0x040000b0-0x040000ef` | DMA\*SAD, DMA\*DAD, DMA\*CNT (12 regs × 4 chans) |
| Timers | `0x04000100-0x0400010f` | TM\*CNT_L, TM\*CNT_H × 4 |
| IPC | `0x04000180-0x0400018b` | IPCSYNC, IPCFIFOCNT, IPCFIFOSEND |
| Interrupt controller | `0x04000208-0x04000218` | IME, IE, IF, AUXIE |
| Math (this entry) | `0x04000280-0x040002b8` | DIVCNT, NUMER, DENOM, RESULT, SQRTCNT, SQRTRES, SQRT_PARAM |
| Display engine B | `0x04001000-0x0400106f` | mirror of A |
| GX matrix / vertex | `0x04000440-0x040004ff` | GXSTAT, MTX_PUSH/POP/COPY, MULT_*, VEC_/POS_/COLOR_/NORMAL_, VTX_*, etc. |

Decomper's brief 086 wave 2 (PR #478) confirmed C-23 working
on the GX block via `func_0208e61c` + `func_0208e664` (matrix-
copy via GXSTAT base + matrix-result base). Each subsequent
function touching 3+ adjacent MMIO addresses in any block above
is a C-23 candidate; pre-route through `*.legacy.c`.

**Confirmed instances:**

- `func_0208bd88` (brief 086 wave 1, PR #474) — DS HW divider,
  remainder form, 18 insns + 4 pool = 0x58.
- `func_0208bde0` (brief 086 wave 1, PR #474) — DS HW divider,
  quotient form, same shape as above.
- `func_0208e61c` (brief 086 wave 2, PR #478) — GX matrix-copy
  via GXSTAT + matrix-result block, 0x48.
- `func_0208e664` (brief 086 wave 2, PR #478) — GX matrix-copy
  clone of `func_0208e61c`, 0x48.

**Provenance:** brief 086 wave 1 (PR #474) discovered the
`.legacy.c` recipe by iteration on the divider pair. Brief 086
wave 2 (PR #478) confirmed the recipe transfers to the GX
block, hypothesising "C-23 should be a separate codegen-walls.md
entry, not just a C-15 sub-family". Brief 088 (PR #?) ran the
5-variant × 15-SP sweep above per brief 084's "3-walls-not-1"
methodology, confirming distinct peephole machinery from C-15
and pinning the recipe + cross-corpus survey notes.

### C-24. Indirect-call dispatch with pool-dedup — `.legacy_sp3.c` routing

> **Wall family note — C-24 vs C-23 vs C-15.** All three are
> mwcc-2.0-only codegen divergences fixed by routing to a 1.2-
> family SP. Distinct peephole/codegen machinery in each. Quick
> discriminator at the asm level:
>
> | Wall | Asm signature | Routing |
> |---|---|---|
> | **C-15** | constant-pair derivation: `mov rN, #K; mvn rM, #0` (1.2) vs `mov rN, #K; sub rM, rN, #1` (2.0) on flat thunks | `*.legacy.c` (mwcc 1.2/sp2p3) |
> | **C-23** | 3+ adjacent MMIO base loads + ANDS→TST in wait loops | `*.legacy.c` (mwcc 1.2/sp2p3) |
> | **C-24** (this entry) | indirect call (`blx rN`) + pool-dedup of two `ldr rN, [pc, #imm]` loads to the SAME pool slot + `push {lr}; sub sp, #4` prologue | `*.legacy_sp3.c` (mwcc 1.2/sp3) |
>
> C-24 is the **first wall classified as needing the third
> routing tier** (`*.legacy_sp3.c`, mwcc 1.2/sp3) for byte-
> identical recovery — C-15 and C-23 both land at
> `*.legacy.c` (1.2/sp2p3). Brief 044's `sp3-routing-decision.md`
> identified the third tier; C-24 is the wall that uses it as
> the coercion path.

**Target asm (`func_02048c28` — brief 099 worked example):**

```text

stmdb sp!, {lr}                  ; push {lr} only (e92d4000)
sub   sp, sp, #0x4               ; explicit 8-byte align (e24dd004)
ldr   r1, [pc, #0x2c]            ; r1 = &data_X (pool slot at +0x3c)
mov   r0, #0
ldr   r3, [r1]                   ; r3 = *data_X = &cb (the cb instance)
ldrb  r1, [r3, #0x1d]            ; r1 = cb->flag
ldr   r2, [r3, #0x30]            ; r2 = cb->arg
ldr   r3, [r3, #0x2c]            ; r3 = cb->fn
blx   r3                         ; call cb->fn(0, flag, arg)
ldr   r0, [pc, #0x10]            ; r0 = &data_X (SAME pool slot at +0x3c)
mov   r1, #0x2
ldr   r0, [r0]                   ; r0 = *data_X = &cb
str   r1, [r0]                   ; cb->first = 2
add   sp, sp, #0x4
ldmia sp!, {pc}
.word data_X                     ; ONE pool word, both LDRs target it

```

15 insns + 1 pool word = 0x40. **Two LDR-from-pool instructions
target the same pool slot** — mwcc 1.2/sp3 dedups the global
address into a single pool word. mwcc 2.0 emits a different
sequence entirely (no pool dedup, no sub-sp/add-sp pair, uses
`push {r3, lr}` + `pop {r3, pc}` for 8-byte alignment).

**mwcc 2.0/sp1p5 emits when miscoded** (default routing —
different shape entirely):

```c
/* breaks: mwcc 2.0 emits 14 insns + 2 pool words, register
   r3 used as alignment-stack-trick instead of sub sp #4 */
typedef struct cb_t {
    u32 first;
    u8  _pad0[0x19]; u8 flag;
    u8  _pad1[0xe];  u32 (*fn)(u32, u32, u32); u32 arg;
} cb_t;
extern cb_t *data_X;

void f(void) {
    cb_t *cb = data_X;
    cb->fn(0, cb->flag, cb->arg);
    data_X->first = 2;
}
```

```text

stmdb sp!, {r3, lr}              ; push {r3, lr} — 8-align via dummy r3
ldr   r1, [pc, #0x28]            ; r1 = &data_X
mov   r0, #0
ldr   r3, [r1]                   ; r3 = *data_X
ldrb  r1, [r3, #0x1d]
ldr   r2, [r3, #0x30]
ldr   r3, [r3, #0x2c]
blx   r3
ldr   r0, [pc, #0xc]             ; r0 = &data_X (DIFFERENT pool slot — no dedup)
mov   r1, #0x2
ldr   r0, [r0]
str   r1, [r0]
ldmia sp!, {r3, pc}              ; pop {r3, pc}
.word data_X                     ; pool slot 1
.word data_X                     ; pool slot 2 (duplicate)

```

13 insns + 2 pool words = 0x38. **−0x8 bytes** vs target. Two
peephole differences fire together: dummy-r3 stack-trick + no
pool-dedup.

**C that coerces it (verified byte-identical against
`func_02048c28`, `*.legacy_sp3.c` routing → mwcc 1.2/sp3):**

The same natural source above. **No source change required** —
the fix is the routing tier:

```bash
mv src/main/func_02048c28.c src/main/func_02048c28.legacy_sp3.c
ninja
```

**Critical source-form constraint**: the C **must use a single
global pointer** (e.g. `extern cb_t *data_X;` referenced twice
as `data_X` in the body), NOT two separate global
declarations for the same address. The pool-dedup peephole
in mwcc 1.2/sp3 only fires when the source-level identifier
is the same — separate `extern cb_t *foo; extern cb_t *bar;`
declarations at the same address still emit two pool words.
Brief 099's sweep iteration A-E used two synthetic globals
and missed the recipe by 1 pool-offset byte; variant F
(single global) achieved score 0.

**SP boundary (verified all 15 mwcc SPs, 6 source variations
× 90 compiles):**

| mwcc SP | A-E (two-global variants) | F (single-global variant) |
|---|---|---|
| 1.2/base, sp2, sp2p3 | 0x48 score 3 (extra epilogue) | 0x44 score 3 (extra epilogue) |
| 1.2/sp3, sp4 | 0x44 score 1 (pool-offset diff) | ⭐ **0x40 byte-identical** |
| 2.0/base..sp2p4 (10 SPs) | 0x3c score 42 (full divergence) | 0x38 score 46 (full divergence) |

⭐ = byte-identical match. Recipe: variant F (single-global)
+ `*.legacy_sp3.c` routing → mwcc 1.2/sp3.

**Boundary semantics:**

- **`1.2/sp3` / `1.2/sp4`**: emit the dedup'd-pool + `sub sp, #4`
  form. **`1.2/sp3` is the project's pinned `*.legacy_sp3.c` SP
  — the canonical recipe.**
- **`1.2/base` / `1.2/sp2` / `1.2/sp2p3`**: dedup'd-pool but
  emit a 2-instruction longer epilogue (separate `bx lr` after
  `pop {lr}`). Close, but not byte-identical at any other SP.
- **All `2.0/*` (10 SPs)**: emit the dummy-r3 stack-trick form
  AND skip pool dedup. Two simultaneous codegen differences
  fire together; both are mwcc-2.0-family-only.

**Use when:** target asm has BOTH:

1. **Indirect call** via `blx rN` where rN holds a struct-field
   load (`ldr rN, [base, #imm]; ...; blx rN`).
2. **Pool dedup** — at least 2 distinct `ldr rN, [pc, #imm]`
   instructions whose offsets compute to the **same pool
   slot**. Indicates the target was compiled with mwcc
   1.2/sp3-tier pool dedup.

The combination is the C-24 signature. Either signal alone is
not sufficient — many functions use indirect calls without pool
dedup, and pool dedup can occur in non-call functions.

**Recognition cue:** decode the function's `ldr rN, [pc, #imm]`
instructions; for each, compute `pool_target = insn_offset + 8 +
imm`. If two LDRs share the same `pool_target`, AND the function
has at least one `blx rN`, route through `*.legacy_sp3.c`.

**Cross-corpus survey notes:** brief 099's full-arm9 scan found
**49 unmatched functions** (size 0x20-0x100) matching the C-24
signature (blx + pool-dedup). Of these, 3 also match the strict
prologue+epilogue (`push {lr}; sub sp, #4` / `add sp, #4; pop
{pc}`):

| Function | Size | Notes |
|---|---|---|
| `func_020454cc` | 0x24 | smallest — 9-insn skeleton |
| `func_0205d5a0` | 0x28 | 10-insn variant |
| `func_02048c28` | 0x40 | brief 099 worked example (verified byte-identical) |

The other 46 candidates use varied prologue/epilogue shapes
(typically `push {r4, lr}` for callee-save register caching);
the C-24 recipe (single-global + `*.legacy_sp3.c`) should still
apply but the asm signature scan above is the conservative
filter. Future single-region waves can grep the 49 candidates
and apply the recipe.

**Confirmed instances:**

- `func_02048c28` (brief 099 worked example, this entry) —
  callback dispatch + post-call field write, 15 insns + 1 pool.

**Provenance:** brief 097 (decomper hand-back) surveyed 31
medium-tier candidates; the dominant wall pattern was
"indirect call (`blx rN`) + struct callbacks" (~12 of 31).
Brief 099 (PR #?) ran a 6-variant × 15-SP sweep on
`func_02048c28` per brief 084's "3-walls-not-1" methodology,
discovered the **single-global vs two-global** source-form
distinction (variants A-E with two synthetic globals
mismatched by 1 pool-offset byte; variant F with one global
achieved byte-identical), classified the wall as **C-24**,
and identified the **third routing tier** (`*.legacy_sp3.c`,
mwcc 1.2/sp3) as the coercion path. First wall in the
catalog to use the third routing tier as the recipe (C-15
and C-23 both land at `*.legacy.c`).

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

**Permuter rule-out (brief 093, PR #?):** the P-4 family was
a natural permuter target — its discriminator is "wall is in
the allocator, not source form." Brief 093 ran permuter against
`func_02000cc4` (the brief 086 wave 3 / brief 091 P-4 instance)
for ~900 thread-iterations. Best score plateau: 80 (baseline
265, theoretical zero = byte-identical). Permuter found a
**load-ordering improvement** by reusing `idx` as a temp for
the trailing field load (`idx = q->f_44; ... entry->f_c =
idx;`) but **could not flip the underlying r4 ↔ r5 register
swap**. The 6 byte positions divergent at the score-80
plateau are exactly the register-swap positions brief 091
documented. **Permuter rule-out confirmed**: mwcc 2.0's
usage-order register allocator is downstream of any source-
level mutation permuter applies. P-4 reg-alloc divergences
are not coercible without the T-1 post-processing variant
(register-renaming on the emitted .o, breaking the
"byte-identical from C source" invariant). See brief 091
sub-note under C-22 for the per-iteration score table and
the permuter-vendor setup gaps surfaced.

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

## Source-layout pitfalls (not codegen walls)

Hand-written-source mistakes that look like codegen walls in the
diff (mwcc emits "wrong" offsets) but are actually authoring
errors in the `.c` source. mwcc is doing the right thing —
the C declaration just doesn't describe the target's struct
layout faithfully. Promoted into this reference because they
cost the decomper a wave-iteration cycle each (initial match
attempt → off-by-K diff → "looks like codegen carryover" →
*it isn't, the struct decl is wrong* → fix → match).

**Distinction from C-N entries (subtle but important):**

- **C-N coercions** assume the C source is *valid* (it describes
  the target's behaviour correctly) but produces a *byte-different
  shape* than the target's compiler chose. The fix is a
  source-form tweak that nudges mwcc toward a different equally-
  valid emission.
- **S-N pitfalls** assume the C source is *invalid* (it doesn't
  accurately describe the target's struct layout / field types
  / field sizes). The fix is to correct the description; mwcc's
  emission was always right *for the source as written*.

**Diff-shape discriminator:** if the diff is **uniform** across
many or all fields (every offset shifts by the same K) and the
shift starts after a struct member, suspect S-class first. If
the diff is **local** to a single operation (one mov differs,
one branch direction differs, one condition-code flavour
differs), suspect C-N first.

### S-1. Padding off-by-one — sub-word `_pad` lands fields at wrong offsets

**Symptom:** ldr/str offsets in mwcc's emitted asm are off by
`+4` (or `+2`, or `+1`) versus the target across every field
after a `char _pad[K]` array. The diff *looks* like reg-alloc
or scratch-register noise because every memory access shifts
uniformly — but the offsets shift, not the registers.

**Pattern:** when a `char _pad[K]` array is followed by an
`int` field, the C compiler pads the array's tail up to the
next 4-byte boundary before laying down the `int`. If
`K mod 4 != 0`, the `int` lands at `offsetof(_pad) + K +
(4 - K%4)`, not `offsetof(_pad) + K`. Every subsequent field
in the struct is also shifted, so the entire downstream offset
chain is wrong by the same delta.

**Example (wave 22, `func_02012560`, brief 057):**

The struct began at offset +0x00 (no leading field before the
pad), so the pad fully owned the bytes up to the next field's
offset. The target had an `int` at +0x10, meaning the pad
needed to occupy exactly +0x00..+0x0f (16 bytes = `0x10`):

```c
/* Wrong: 17-byte pad ends at +0x11, mwcc aligns int up to +0x14. */
struct Thing {
    char  _pad[0x11];    /* +0x00..+0x10 (17 bytes), ends at +0x11 */
    int   value;         /* mwcc pads up to next 4-aligned → +0x14 ❌ */
    /* every subsequent field offset is +4 from where target has it */
};

/* Right: 16-byte pad ends at +0x10, mwcc places int at +0x10 directly. */
struct Thing {
    char  _pad[0x10];    /* +0x00..+0x0f (16 bytes), ends at +0x10 */
    int   value;         /* +0x10, already 4-aligned ✓ */
};
```

The general rule when the pad doesn't start at offset +0x00:
the right pad size is "whatever brings `_pad`'s end-offset to
the target int's offset, with no rounding-up". If a leading
`char` puts the pad's start at +0x01, an int at +0x10 needs a
`_pad[0xf]` (15 bytes, ending at +0x10) — not `_pad[0x10]`
(16 bytes, ending at +0x11 → int aligned to +0x14). The
miscount in PR #392 was the simpler "starts-at-zero" case where
the pad's size equals the next-int's offset directly; the
broader pitfall is forgetting that mwcc rounds up if the pad
doesn't end on a 4-byte boundary.

**How to spot it in the diff:** every `ldr` / `str` offset in
the mwcc emission is exactly `+K` (typically `+4`) larger than
the target, AND the offset shift starts after a `char _pad[]`
field. If the shift is across the whole struct (offsets `+0`
onward), the trap is somewhere earlier — likely a field-type
mismatch (e.g. you have an `int` where the target has a
`short`).

> **⚠️ Diagnostic-vs-resolution split with cascading
> misplacement.** The "uniform offset shift" symptom at the
> linked-binary level can come from **two different causes**
> that share an identical diagnostic but diverge on resolution:
>
> | Cause | Where the shift originates | Resolution |
> |---|---|---|
> | **S-1 (this entry)** | The C source's struct decl doesn't match the target's layout — mwcc honours the wrong decl and emits offsets per the wrong layout. | Correct the `_pad` size / field types in the C source. |
> | **Cross-function cascade** ([Operational notes](#cross-function-reference-shift-on-wall-induced-size-mismatches)) | An *upstream* TU in the same overlay/section emitted wrong-sized `.o` bytes, shifting every downstream TU's link-time address by the delta. The downstream `.o` bytes are *correct*; only their placement is wrong. | Drop the upstream TU (it's hitting a wall and emitting wrong size); downstream TUs land at correct addresses automatically. |
>
> **Discriminator (brief 060 waves 24 / 25 / 26 — PRs #405 /
> #408 / #412):** when a "uniform shift" diff appears, check
> the *struct decl* AND the *recent upstream TU additions* in
> the same overlay — AND for cross-`.o` references, in the
> target symbol's module too. Wave 24 hit the cascade
> within-overlay variant (`func_0201d5c0` misplaced 3
> downstream candidates). Wave 25 hit the cross-`.o` code
> variant (main TU shifts broke a BL into main from ov002).
> Wave 26 hit the cross-`.o` data variant
> (`func_ov002_0227aa50`'s `.word data_022cd300` resolved to
> `0x022cd320` due to main's data-layout shift, even though
> the `.o` and relocation entry were byte-perfect).
> **Decomper recipe:** if the struct decl looks correct,
> suspect cascade. Check upstream TUs in the same overlay
> first; if none, check the target's module — for code
> symbols look at `.text`, for data symbols look at
> `.data` / `.bss`. If no upstream candidate could be
> size-mismatched anywhere, suspect S-1.

**How to spot it before writing:** when you transcribe a
struct from disassembled offsets, compute `4-byte-aligned-up
(prev_end + pad_size)` after each pad and compare against the
next target offset. If they disagree, the pad is wrong.

**Affected matches:** brief 057 wave 22 `func_02012560`
(PR #392). Decomper's iteration note:

> Padding off-by-one trap on `func_02012560`. `char _pad[0x11]`
> (17 bytes) followed by `int` aligns to the next 4-byte
> boundary, landing the int at `+0x14` instead of `+0x10`. mwcc's
> emitted offsets are off by 4 across all subsequent fields.
> Easy fix once spotted: `0x11 → 0x10`. Pattern: when struct
> padding lands at a misaligned offset, every downstream `int`
> field shifts by 4. Watch the byte-count after pad arrays.

**Resolution:** correct the `_pad` size in the C source. No
routing change, no mwcc-flag change, no inline-asm escape. The
fix is in the struct declaration alone.

**Why this isn't C-N or P-N:** mwcc's emission is *correct* —
it's faithfully implementing the C language's alignment rules
on a struct whose declaration doesn't match the target's
layout. The miscompile is in the human's struct decl, not in
the compiler's response to it. A C-coercion entry would imply
"tweak the source form to coax mwcc into emitting the target";
here you tweak the source form to *describe the target
accurately* — the codegen difference is downstream of the
declaration error.

**Provenance:** brief 057 wave 22 (PR #392) — decomper
documented the iteration as a "worth flagging" calibration
note. This entry promotes the iteration win into the grep-able
reference so future targets that show a uniform offset-shift
diff get triaged here first instead of cycling through C-N
candidates that don't apply.

### Sweep result — only S-1 surfaced (waves 5+ through 22)

Cloud autonomous sweep covered 34 wave + brief PRs (briefs
020 / 022 / 028 / 029 / 030 / 031 / 033–366 — every
"iteration win" or "fixed by" note in the corpus through the
end of wave 22) looking for additional source-layout
authoring pitfalls. **S-1 (padding off-by-one) is the only
source-layout pitfall surfaced so far.**

Adjacent finds — *not* S-class, listed here for clarity:

- **`func_ov011_021ca600` drop (PR #385 wave 19)** —
  "byte-pointer source would need a struct typedef to coerce."
  This looks like S-class on first read but is a **C-source
  shape** choice: byte-pointer arithmetic
  (`*(int*)(buf + 0x10)`) and struct-member access
  (`p->field_10`) are both valid C, but they emit different
  asm (`add + ldr` vs single `ldr [base, #imm]`). The struct
  decl isn't wrong — the access shape is. Adjacent to C-2
  (local-pointer reuse). Decomper didn't pursue the coercion
  this wave; no entry-worthy pattern emerged.
- **All ten "iteration win" notes** in waves 13–22 (brief 051
  / 053 / 055 / 057) reduced to C-N coercions (now C-2a, C-9,
  C-11, C-13, C-14, C-15, C-16, C-17, C-18, C-19, C-20, C-21)
  or wave-time fixes that didn't generalise. Sweep classified
  each; none described a struct-decl authoring error.

The expectation going forward: S-class entries will accrue
when a wave-iteration note explicitly says "the struct decl
was wrong" / "miscounted padding" / "wrong field type" /
similar authoring-error framing. Cloud should keep sweeping
on the same pattern when new waves land. If the corpus
crosses ~5 S-N entries, the section header should expand
to mention common categories (padding / field-type /
field-size).

**Provenance:** brief 060-territory cloud autonomous sweep
(this section) — option (ii) from brain's post-#398
suggestions list. Sweep verdict: no additional S-class
entries through wave 22; preamble clarified with C-N-vs-S-N
discriminator. **Post-sweep:** S-2 (switch-case textual
ordering) surfaced in brief 086 wave 1 (PR #474), entry
below — the expectation that authoring pitfalls accrue
post-wave-22 has held.

### S-2. Switch-case textual ordering controls jump-table body layout

**Symptom:** a dense-switch function shows `b .L<target>` mismatches
on a subset of the case-body branches — typically 4-8 mismatched
target offsets in a function that otherwise byte-matches. The diff
is *not* a uniform shift (that'd be S-1) and *not* a single insn
flavour difference (that'd be a C-N coercion); it's a *swap* of
which case body sits at which memory address.

**Pattern:** mwcc preserves the **source-textual order** of `case
N:` labels when laying out the switch-body blocks, even when the
case values themselves are order-independent (e.g. a jump-table
dispatch where every case returns a constant). If the original
source had `case 1:` before `case 0:`, the original `.o`'s switch
body has case 1's code at the *lower* address — the dispatch table
points each case's value at the correct body, so semantics are
identical, but the byte layout is order-of-declaration.

When a decomper transcribes the function from disassembly and
writes the cases in natural numeric order (`case 0:` first), the
emitted `.o` lays out the bodies in numeric order — semantically
identical to the target, but `b .L<offset>` instructions in the
jump-table read different offsets and the function is no longer
byte-identical.

**Example (brief 086 wave 1, `func_0203dde8` — PR #474):**

The target's dense jump-table dispatches 4 cases. The disassembly
shows `mvn r0, #9` (i.e. `return -10`, encoding case 0's return)
sitting *after* `mvn r0, #8` (case 1's `return -9`) in memory.
That tells you the source emitted `case 1` before `case 0`:

```c
/* Wrong — natural numeric order. mwcc emits bodies in this
   order, but the target wanted case 1's body before case 0's.
   Result: 4 b-target mismatches in the jump-table. */
switch (n) {
    case 0: return -10;
    case 1: return -9;
    case 2: return -8;
    case 3: return -7;
    default: return 0;
}

/* Right — re-order the C labels so case 1's body comes first in
   source-text, matching the target's memory layout. */
switch (n) {
    case 1: return -9;      /* case 1 first — matches target layout */
    case 0: return -10;
    case 2: return -8;
    case 3: return -7;
    default: return 0;
}
```

The dispatch table (which is just `value → body offset`) is the
same either way; only the body's memory address per case-value
changes.

**How to spot it in the diff:** on a dense switch with a jump-
table dispatch, look at the disassembled case-body sequence in
memory order. If the case-value progression isn't monotonic
(e.g. you see returns or branches for case 1's value at a lower
address than case 0's value), the original source declared the
cases in non-natural order. The fix is to re-order your C source
to match.

**How to spot it before writing:** when transcribing a dense
switch, sort the case-bodies by *memory address* (lowest to
highest) and assign their `case N:` labels in that order, not in
numeric order. The C is uglier (case values appear out of
sequence), but it byte-matches.

**Affected matches:** brief 086 wave 1 `func_0203dde8` (PR #474).
Decomper's recognition cue verbatim:

> dense `switch` jump-table where case bodies appear in memory in
> a non-natural order (e.g. `mvn r0, #9` before `mvn r0, #8`,
> mapping to case 0 returning -10 before case 1 returning -9).
> Re-order the C `case N:` labels to match the memory layout.

**Resolution:** re-order the `case N:` labels in the C source to
match the case-body sequence in the target's memory. No routing
change, no mwcc-flag change, no inline-asm escape. The fix is in
the source declaration order alone.

**Why this isn't C-N or P-N:** mwcc's emission is *correct* — it
faithfully lays out the case bodies in the order the C source
declared them. The miscompile is in the human's case ordering,
not in the compiler's response to it. A C-coercion entry would
imply "tweak the source form to coax mwcc into emitting the
target"; here you tweak the source form to *describe the target's
intended layout accurately*. Same shape as S-1 (padding off-by-
one) — the codegen difference is downstream of a source-layout
authoring choice, not a compiler-vs-source disagreement.

**Sparseness note:** S-2 only matters when the switch is dense
enough that mwcc emits a *jump-table* dispatch. For sparse
switches that compile to a series of `cmp r0, #N; beq .L_caseN`
branches, the case order in source doesn't affect codegen at
all (each `case N:` becomes an independent compare against the
fall-through scrutinee). The discriminator: in the target's
disassembly, look for a `ldr pc, [pc, rN, lsl #2]` (or
equivalent jump-table dispatch) — if you see it, S-2 applies;
if you see a chain of `cmp; beq` instead, the C case order is
free.

**Provenance:** brief 086 wave 1 (PR #474) — decomper documented
the iteration as a "worth folding into walls" calibration note
under "S-2 — switch-case textual ordering controls body
layout". This entry promotes the recipe into the grep-able
reference. First S-N entry since S-1 (brief 057 wave 22, PR #392);
confirms the sweep section above's expectation that S-class
entries accrue when wave-iteration notes flag authoring-error
framing.

#### S-2a. Loop-counter signedness controls `cmp`/`branch` condition codes

A second source-form authoring decision in the same family
shape as S-2 — mwcc faithfully emits what the C declares; the
miscompile is in the human's type choice, not in the compiler's
response. Folded under S-2 because both are "source-author the
codegen surface, not C-coerce mwcc."

**Symptom:** loop-shape function (typically a `for` / `while`
counting up to a struct-field bound) byte-matches everything
**except** two cond-code positions — the loop-condition compare
and the early-return guard. Diff is **2 cond-code nibbles** out
of an otherwise-identical body. Looks like nothing else: not S-1
(no field-offset shift), not S-2 (no switch / jump-table
involvement), not C-1 (no predication-vs-branch flip), not C-N
in general (cond-code choice is type-driven, not coercible by
source rephrasing).

**Pattern:** mwcc picks the ARM cond-code by the **promoted-
arithmetic-type signedness** of the comparison operands. When
the loop counter is `int` (signed) and the bound is a `u8` /
`u16` field (which promotes to `int` per C11 §6.3.1.1), the
comparison is **signed** → `lt` / `le`. When the loop counter is
`u32` / `unsigned int`, the bound's `int` promotion converts to
`unsigned int` per "usual arithmetic conversions" (C11 §6.3.1.8),
and the comparison is **unsigned** → `cc` (a.k.a. `lo`) / `ls`.

**Worked example (brief 086 wave 2, `func_0208539c` + clone
`func_020853dc` — PR #478):**

The target's loop body emits unsigned conditions:

```text

ldmlsfd sp!, {r4-r6, pc}   ; early-return when arg0->f_18 == 0 (ls = unsigned ≤)
...
bcc     .L_loop             ; loop while i < f_18 (cc/lo = unsigned <)

```

Same loop body written with `int i`:

```c
/* breaks: int i forces signed comparison */
void f(state_t *p, int arg1) {
    int i;
    for (i = 0; i < p->f_18; i++) {
        helper(p, i, arg1);
    }
}
```

Emits:

```text

ldmlefd sp!, {r4-r6, pc}   ; signed-≤ early-return
...
blt     .L_loop             ; signed-< loop branch

```

Same loop body written with `u32 i`:

```c
/* coerces target: u32 i forces unsigned comparison */
void f(state_t *p, int arg1) {
    u32 i;
    for (i = 0; i < p->f_18; i++) {
        helper(p, i, arg1);
    }
}
```

Emits the target's `ldmlsfd` + `bcc`. Two cond-code nibbles flip
from `d`/`b` (signed `le`/`lt`) to `9`/`3` (unsigned `ls`/`cc`).
**Verified byte-identical** against `func_0208539c` /
`func_020853dc` per PR #478.

**The byte diff (uint.c vs sint.c, mwcc 2.0/sp1p5):**

| Offset | uint (target) | sint | Decoded |
|---|---|---|---|
| +0x18 | `98bd8070` | `d8bd8070` | `ldmls{fd}` ↔ `ldmle{fd}` |
| +0x38 | `3afffff7` | `bafffff7` | `bcc` (-0x24) ↔ `blt` (-0x24) |

Identical bytes everywhere else. Two cond-code positions = the
entire diff.

**Recognition cue:** target's loop body uses any of `cc` / `cs` /
`hi` / `ls` / `lo` / `hs` (unsigned cond codes) where you'd
naturally write the C with signed `int` indexing. The bound is
typically a `u8` / `u16` struct field (so the type-promotion
asymmetry surfaces). Fix is to declare the loop counter
explicitly as `u32` / `unsigned int` so the comparison stays
unsigned end-to-end.

**The opposite mode** also surfaces: when the target uses signed
cond codes (`lt` / `le` / `gt` / `ge`) and the natural C
transcription accidentally widens to unsigned (e.g. via a `size_t`
loop counter), the same fix applies in reverse — declare `int i`
to force signed comparison. Same family, same authoring-decision
mechanism.

**Why this isn't C-N or P-N:** mwcc's cond-code emission is
mechanically driven by the operand types per the C standard's
arithmetic conversion rules. There is no "tweak the source phrasing
to coax mwcc into the right cond-code" — the rules are
deterministic. The fix is to declare the loop counter with the
type signedness that produces the target's cond code. Same
authoring-error framing as S-1 / S-2.

**Why fold under S-2 (not a fresh S-3):** S-2's parent entry
covers "source-form authoring decisions mwcc faithfully
reproduces." Switch-case textual ordering and loop-counter
signedness are two instances of the same broader pattern — the
miscompile is in the C declaration (case order / variable type),
not the compiler's response. Future S-2b candidates (e.g. struct-
field declaration order controlling load batching, or `enum` vs
`int` choice controlling jump-table density) will accrete here
under S-2 rather than spawning new top-level entries.

**Affected matches:** brief 086 wave 2 `func_0208539c` +
`func_020853dc` (PR #478).

**Provenance:** brief 086 wave 2 (PR #478) — decomper documented
the iteration as a "candidate **S-2 extension**" calibration
note under "Iteration win worth folding". This entry promotes
the recipe into the grep-able reference and pins the C11
arithmetic-conversion mechanism that drives the cond-code
choice. Cloud-autonomous fold per the brain-flagged follow-up
on PR #478's review.

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
| 055w20 / 387 | `func_ov002_0226b00c`     | C-20a (byte-pack + 4-arg shuffle; brief 060-territory sweep verified inline-asm fallback recipe — same as wave 23 retry below) | coercible (asm-void, resolved) |
| 057w21 / 390 | `func_02022540`           | (mwcc separate `i` + `i*0x10` induction vars vs orig's combined `add r1, base, i, lsl #4`; array-indexing source made it worse) | permanent |
| 057w21 / 390 | `func_0202d9a0`           | (mwcc +1 extra insn on null + dual-counter inc; direct-struct-extern attempt didn't help) | permanent |
| 057w21 / 390 | `func_02055298`           | C-1r family (in-place string xform: target has `beq L; ...; L: ...; bx lr` shared epilogue, mwcc collapses to `bxeq lr` early-return) | permanent (C-1r family) |
| 057w22 / 392 | `func_0207c990`           | (mwcc's predicated-vs-early-return decision on singleton init + counter inc; `int ok` form attempted) | permanent |
| 057w22 / 392 | `func_0202142c`           | P-7 (pool dedup wall — orig has 2 pool loads for the same data symbol; mwcc dedups to 1) | permanent |
| 057w23 / 402 | `func_ov002_022a8668`     | **C-20a** (4-store + 4-mov-then-tail-call + `sub r1, r0, #imm` constant-derive; inline-asm fallback recipe — brief 060-territory cloud sweep verified byte-identical) | coercible (asm-void, resolved) |
| 057w23 / 402 | `func_02067a4c`           | (array init + descending loop: mwcc swapped counter/value registers r1↔r2; allocation differs by declaration order, both attempted) | permanent |
| 057w23 / 402 | `func_02000d4c`           | (stack-pop op: mwcc elided stack frame, used r12 instead of orig's lr-as-temp; can't force `lr` usage from C source) | permanent |
| 057w23 / 402 | `func_02021660`           | (predicated nested loop: mwcc emitted +12 bytes; different predication choice — variant of C-1/P-6 family) | permanent |
| 057w23 / 402 | `func_0205d4c0`           | (5-field null check: mwcc collapsed early-returns to `bxeq lr` +12 bytes; combined-AND (C-18) and goto-form variations attempted) | permanent |
| 060w24 / 405 | `func_02007f38`           | P-3 (pool-loaded composite constant `0x52008421` vs orig's `mov+orr+orr+orr` chain; `v \|= ...` chain didn't prevent fold) | permanent |
| 060w24 / 405 | `func_02070fe8`           | (alias-reload family: mwcc emitted `bxeq lr` early-return instead of fully-predicated body; same family as wave 19 drops) | permanent |
| 060w24 / 405 | `func_0201d5c0`           | (2-way switch: mwcc collapsed branch+predicate mix; **also triggered the cascading-misplacement variant (b) on 3 downstream candidates** — see Operational notes) | permanent (cascade trigger) |
| 060w25 / 408 | `func_02054c0c`           | (stack-local for output param: mwcc elided the stack frame; couldn't force stack allocation from natural C — same family as wave-17 `func_ov002_021b91d0` addr-taken elision) | permanent |
| 060w25 / 408 | `func_020342f0`           | (null-chain + 2-field OR-bool: mwcc emitted different predicate ordering; bool + if-chain attempts both off. **Together with `_02054c0c` triggered the cascading-misplacement variant (c) cross-`.o` BL pool literal shift** — see Operational notes) | permanent (cascade trigger) |
| 060w26 / 412 | `func_02095bc8`           | (indexed row write + byte counter return: mwcc emits `and r0, #0xff` instead of `ldrb` reload; `++*q; return *q` form attempted) | permanent |
| 060w26 / 412 | `func_02095c18`           | (8-row clear loop: mwcc swapped counter/array-base register allocation r1↔r2; declaration-order tweaks didn't flip — P-4 family member) | permanent (P-4 family) |
| 060w26 / 412 | `func_020a2f9c`           | (multi-field write with chained pointer-deref: mwcc emitted +4 extra insn) | permanent |
| 060w26 / 412 | `func_ov002_0227aa50`     | **Cascade variant (d)** (`.o` byte-perfect, `.word data_022cd300` pool literal resolved to `0x022cd320` — upstream data-layout shift in main's `.data`/`.bss`; see Operational notes) | (.o-correct, cascade-shifted) |
| 060w26 / 412 | _(1 iterated-then-removed candidate)_ | (counted in 14-attempt total per wave PR) | — |
| 086w1 / 474 | `func_0208bd88` / `func_0208bde0` | **C-23** (DS HW divider — 4× MMIO base loads + ANDS in wait loop; default mwcc 2.0/sp1p5 folds to 1 base + offsets + flips ANDS→TST; `*.legacy.c` mwcc 1.2/sp2p3 routing restores both — brief 088 sweep verified all 15 SPs) | coercible (routing, resolved) |
| 086w2 / 478 | `func_0208e61c` / `func_0208e664` | **C-23** (GX matrix-copy via GXSTAT base + matrix-result block; same dual-peephole shape as 086w1 — confirms recipe transfers across MMIO blocks) | coercible (routing, resolved) |
| 086w3 / 480 | `func_02001c98` | **C-22** (production hit using bitfield-via-union recipe from brief 084 — adjacent 4-bit fields at positions 17-21 + 21-25; recipe transfers from brief 081's `func_02001ef4` to a fresh datapoint) | coercible (bitfield-decl, resolved) |
| 086w3 / 480 | `func_02009758` | (mwcc-2.0 modulo-by-power-of-2 peephole + reg-alloc — orig emits 4-insn signed-modulo recovery via mwcc 1.2 codegen; mwcc 2.0 collapses to 1-insn `and rN, #0x1f`. Brief 091 sweep tested 4 source variants × 15 SPs = 60 combinations; no byte-identical match) | P-N candidate (brief 091 sub-note under C-22) |
| 086w3 / 480 | `func_02000cc4` | **P-4 family — confirmed permanent** (counter-increment + helper-call + struct-array entry init; orig allocates `&ctx`→r5, `idx`→r4, mwcc all SPs allocate the swap. Brief 091 sweep tested 5 source variants × 15 SPs = 75 combinations; size matches at most SPs but reg-alloc stays swapped. **Brief 093 (PR #?) ran permuter ~900 thread-iterations, best score 80 plateau — permuter rule-out confirmed**; treat as hard skip) | permanent (P-4, permuter rule-out) |
| 099 / sweep | `func_02048c28` | **C-24** (worked example) — indirect-call + pool-dedup + `push {lr}; sub sp, #4` prologue; mwcc 2.0 emits dummy-r3 stack-trick + no pool-dedup. Brief 099's 6-variant × 15-SP sweep verified `*.legacy_sp3.c` (mwcc 1.2/sp3) + single-global source form recovers byte-identical | coercible (routing, sp3-tier) |
| 099 / sweep | `func_020454cc` / `func_0205d5a0` | **C-24** (strict prologue/epilogue match, smallest 2 candidates); 49 broader matches across the unmatched residue per the C-24 cross-corpus survey | coercible (routing, sp3-tier) |

## Quantification

```

By bucket (across 22 pilots: 020, 022, 028, 029, 030, 031, 040,
047-wave9, 049-wave12, 051-wave14, 053-wave15, 053-wave16,
053-wave17, 055-wave18, 055-wave19, 055-wave20, 057-wave21,
057-wave22, 057-wave23, 060-wave24, 060-wave25, 060-wave26):
  Permanent              :  79 drops (71%)  ← +4 wave 26 (3 permanent + 1 cascade-variant-d)
  Coercible-but-missed   :  16 drops (14%)
  Edge case              :   9 drops ( 8%)
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
  P-1 (shift-pair collapse)         : 17 drops (17%)  ← largest
  P-4 family (single-byte reg-alloc): 7 drops ( 7%  — incl. brief 055 wave 18 r0-vs-r2)
  C-20 + C-20a (pack-args family)   :  6 drops ( 6%  — incl. brief 060-territory wave 23 byte-pack pair)
  E-3 (Thumb)                       :  4 drops ( 4%)
  C-1r (over-predication branchy)   :  4 drops ( 4% — brief 053 wave 16 + brief 057 wave 21)
  P-7 / P-8 / T-3 (W-A..D residue)  :  4 drops ( 4% — brief 040)
  P-6 (4-op predication threshold)  :  3 drops ( 3%)
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
wins; brief 056-territory cloud sweep recovered the wave-20
triplet via C-20 (pack-args routing); brief 057 wave 21
isolated C-21 (ternary-to-constants decomposition) as another
wave-time iteration win; brief 060-territory cloud sweep
recovered the byte-pack + 4-arg-shuffle subfamily
(`func_ov002_0226b00c` + `func_ov002_022a8668`) via **C-20a**
(inline-asm fallback for tail-call-detection failure — same
template as C-12/C-16). The
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
*after* the failing one gets shifted up by the delta. The
cascade surfaces three distinct visible effects — **three
symptoms with one root cause**:

| Effect | What objdiff/`dsd check modules` shows | First documented |
|---|---|---|
| **(a) Within-overlay pool-word values resolve wrong** | The later function's `.o` is byte-correct, but its pool-loaded relocations into the shifted region resolve to addresses 4-32 bytes off | brief 051 wave 13 (PR #368) |
| **(b) Downstream TUs land at wrong addresses** | The later function's `.o` bytes are correct *and* its pool-word values are correct, but the function itself is placed at an address shifted by the upstream delta — `dsd check modules` flags the linked binary as off | brief 060 wave 24 (PR #405) |
| **(c) Cross-`.o` BL pool literals resolve wrong** | The downstream `.o` is byte-correct *including* the pool-word relocation entry; only the link-time resolved value differs because the cross-module BL target (a code symbol) sits in a shifted upstream region | brief 060 wave 25 (PR #408) |
| **(d) Cross-`.o` data-symbol pool literals resolve wrong** | Same shape as (c) but the pool literal points to a **data symbol** (`data_*`) in `.data` / `.bss` rather than a function in `.text`. Cause: upstream TU(s) shifted the data/BSS layout, not the code layout | brief 060 wave 26 (PR #412) |

All four effects arise from the same upstream-TU size mismatch;
which one is more visible depends on what kind of reference the
downstream-affected function has into the shifted region:
- relocation pointing into a *same-overlay* shifted region → (a)
- no relocation into the shifted region; the function ITSELF is
  in the shifted zone → (b)
- relocation pointing *cross-`.o` / cross-module* to a CODE
  symbol (function / BL target) in a different `.o` → (c)
- relocation pointing *cross-`.o` / cross-module* to a DATA
  symbol (`data_*` in `.data` / `.bss`) in a different `.o` → (d)

Variants (c) and (d) are mechanically identical (both are
cross-`.o` pool-literal relocations resolving to shifted
addresses); the discriminator is purely whether the symbol
lives in `.text` (code) or `.data` / `.bss` (data). Diagnostic
implications: for (c) check the target function's module's
`.text` layout; for (d) check the target data symbol's
module's `.data` / `.bss` layout.

**Symptom variant (a) — brief 051 wave 13 / PR #368:** the
`func_ov010_021b4750` ov002-sibling cluster shipped 8
candidates that all tail-call `func_ov002_0229ade0`. Two of
those 8 each emitted 4 bytes short (P-1 wall on
`lsl 16; lsr 16` zero-extend). The combined 8-byte shift
bumped `func_ov002_0229ade0` from `0x0229ade0` (declared) down
to `0x0229add8` in the linker map, breaking the pool-resolved
target address for **every one of the 8 thunks**, not just
the 2 walls. Initial wave attempt: 0/8. Drop the 2 walls →
8/8 byte-identical first try.

**Symptom variant (b) — brief 060 wave 24 / PR #405:** when
the decomper added `func_0201d5c0` (which turned out to emit
−4 bytes vs the target's expected size), it cascaded into
misplacing **3 downstream candidates** (`func_0201d710` /
`_d738` / `_d6d4`) by 4 bytes — even though those 3 had
byte-correct `.o` output. Dropping `_d5c0` recovered all 3
downstream candidates instantly. **No cross-function
relocations were involved** (the 3 downstream candidates'
pool words all pointed to symbols *outside* the cascade
region); the diff signal was purely placement-shift, which
looks identical to S-1's "uniform offset shift" pattern.
**Discriminator with S-1**: if the struct decl looks correct
and there's a recent upstream TU in the same section, suspect
this cascade; if no upstream candidate could be size-shifted,
suspect S-1 (struct padding error). See S-1's *Diagnostic-vs-
resolution split* callout for the triage flow.

**Symptom variant (c) — brief 060 wave 25 / PR #408:** the
new C-20a candidate `func_ov002_022a8668` (ov002) shipped
byte-correct `.o`, including its pool word
`.word func_02037208` (a cross-module BL target in main).
Two unrelated drops in the same wave (`func_020342f0` at +8
and `func_02054c0c` at −8, both in main) shifted main's `.o`
layout. The +8 shift happened to bracket
`func_02037208`'s declared address, so the linker placed
`func_02037208` at `0x02037210` instead of `0x02037208` —
making the C-20a candidate's resolved pool word 8 bytes off,
even though its own `.o` was byte-perfect and the pool-word
relocation entry was correct. Dropping the two
size-mismatched main TUs → `func_ov002_022a8668`'s pool word
immediately resolved to the right value, byte-identical
first try. **Cross-`.o` variant of (a):** same mechanism,
but the BL points into a different `.o` than the source
function. The decomper's signal here was "asm body matches
`.o`-byte-perfect, but cross-function BL resolves to a 4-or-
8-byte-off target".

**Symptom variant (d) — brief 060 wave 26 / PR #412:** the
candidate `func_ov002_0227aa50` (ov002) shipped byte-correct
`.o` including its pool-word relocation entry
`.word data_022cd300` (a cross-module **data symbol** in
main's `.data` / `.bss`). Upstream size mismatches in main's
data layout shifted `data_022cd300`'s placement, so the
linker resolved the pool word to `0x022cd320` instead of
`0x022cd300` — 32 bytes off. **Cross-`.o` data-symbol variant
of (c):** identical mechanism, but the relocation target lives
in `.data` / `.bss` rather than `.text`. Diagnostic
distinction matters at the lookup step — when you check the
linker map for the cascade origin, look in the **target data
symbol's module's `.data` / `.bss` layout**, not its `.text`
layout. The wave 26 author flagged this as a "data-symbol
variant" specifically because the BL-relocation-shape check
(variant c) wouldn't surface the right upstream — the size-
mismatched upstream TU was a *data declaration*, not a code
function.

**Debugging recipe:**

1. When a function fails to match and the per-function
   objdiff diff shows any of (variant a) **pool-word value**
   differs by a small offset (4-32 bytes), (variant b) `.o`
   bytes are correct but `dsd check modules` shows the
   linked binary off, (variant c) `.o` bytes are correct
   *and* the pool-word relocation entry to a CODE symbol is
   correct but its link-time-resolved value is off, or
   (variant d) same as (c) but the pool-word relocation is
   to a DATA symbol (`data_*`), suspect a cross-function
   cascade.
2. Identify any **earlier** unmatched function in the same
   overlay OR — for variants (c) and (d) — any unmatched
   function or oversized data declaration in the **target
   symbol's module** that brackets the symbol's address.
   For variants (c), look in the target's `.text` layout;
   for variant (d), look in the target's `.data` / `.bss`
   layout. Read the offending TU's asm/data to see if it
   would emit fewer/more bytes than the declared size (P-1 /
   P-3 chain / unsupported shape / oversized data array).
3. Drop the earlier candidate from the wave (revert its
   `src/.../*.c` and reset its `symbols.txt` rename) and
   re-run the build. If the later candidate suddenly
   matches, the cascade was the cause.
4. The earlier candidate stays as a permanent-wall drop;
   the later candidate is **not** a wall and ships
   normally.

**Why this matters:** cluster-pilot waves that pick adjacent
candidates from the same overlay are especially vulnerable —
a single P-1 (or any size-shrinking-wall) drop can mask up to
N other matches in the downstream tail. Variant (c) is even
more insidious: a size-mismatch in one module can break a
candidate in a different module via cross-`.o` BL relocation,
so the "obvious upstream suspect" might not be in the same
overlay as the failing candidate. The "drop and retry"
workflow is cheap (seconds per iteration) and catches the
cascade before classifying healthy candidates as walls.

Wave 24 and wave 25 both caught variants mid-wave because the
decomper recognized the cascade signature (downstream `.o`
bytes correct but the link-level diff shows shift) and tried
the drop-upstream recipe rather than iterating on the affected
candidate's source. Variant (c) requires looking across module
boundaries to find the size-mismatched TU.

**Cross-reference:**

- Brief 051 wave 13 ([PR #368](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/368))
  documented variant (a) first (within-overlay pool-word).
- Brief 060 wave 24 ([PR #405](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/405))
  surfaced variant (b) (downstream placement-shift) and the
  explicit overlap with S-1's diagnostic surface.
- Brief 060 wave 25 ([PR #408](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/408))
  surfaced variant (c) (cross-`.o` BL pool literals) —
  size mismatch in main shifted `func_02037208`, breaking the
  C-20a candidate in ov002's resolved BL target.
- Brief 060 wave 26 ([PR #412](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/412))
  surfaced variant (d) (cross-`.o` data-symbol pool literals) —
  `func_ov002_0227aa50`'s `.word data_022cd300` pool entry
  resolved to `0x022cd320` due to upstream data-layout shift,
  even though the `.o` and relocation entry were byte-perfect.
- The **whole-binary version** of the same shift is what
  makes the **ov004 BSS layout shift**
  ([`ov004-bss-shift.md`](ov004-bss-shift.md)) so persistent
  — that's the same cascade scaled up to a section-boundary
  mis-sizing.
- See [S-1](#s-1-padding-off-by-one--sub-word-_pad-lands-fields-at-wrong-offsets)
  for the struct-decl-error sibling pattern that produces an
  identical-looking diff but needs a different fix.
