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
Brief 100 Part 1 (PR #?) codified brief 098's permuter recovery
(`func_ov000_021ac85c`) as **C-25** — pure source-form recipe
(split bitfield-chain expression into two statements), works at
all 10 mwcc 2.0/* SPs without routing. First W-class wall
promoted to C-class via permuter discovery + post-hoc
codification. Brief 100 Part 2 (PR #?) ran a 10-variant × 15-SP
sweep on the critical-section pattern from brief 097's residue
(~8 of 31); discovered the **helper-signature-mismatch** factor
(natural `func(state_t *p)` adds an extra `mov r0, r5` not
present in orig; helper-takes-no-args declaration matches orig
when helper ignores incoming r0 by overwriting it from a pool
literal). Classified as **C-26** — same routing family as C-23
+ C-24 but with a distinct source-form factor on top.
Brief 103 (PR #501) ran a 6-variant × 15-SP sweep on the
predicated-cascade pattern (~6 of 31 brief-097 residue);
discovered the mwcc-2.0-only **`mvnNE rN, #0` peephole gap**
(no source-form combination across 90 compiles produces the
direct conditional-mvn-write-of-`-1` shape orig uses).
Classified as **P-9** (permanent for source-form pipeline,
asm-void recipe is the future-attempt path). NEGATIVE finding
flagged: a 281-candidate broader scan + natural-form spot-check
showed brief 097's "predicated-cascade" classification was
over-broad — many candidates byte-match natural form. The
actually-walled population is the 36-candidate `mvnNE`-signature
subset. Brief 105 (PR #504) followed up with permuter sweep on
5 of 6 named P-9 candidates (300s × 4 threads each); 1 base
recovery (`func_02033488`, early-return form), 4 plateau
(mask form). Refined P-9 scope: the wall applies specifically
to the `cond ? -1 : 0` MASK form; the `if (cond) return -1;`
EARLY-RETURN form is unrelated codegen sharing the `mvn`
instruction. The 36-candidate pool sub-divides: ~⅓ early-return
(recoverable with natural source), ~⅔ mask form (true P-9
permanent including against permuter exploration).
Brief 107 (PR #506) **closed the brief 097 residue classification
phase** by sweeping the final two patterns: pool-word count
mismatch (~3 of 31) + cross-module BL (~3 of 31). Pool-word
classification: ran 8-variant × 15-SP sweep on `func_02023fec`
(brief 040's worked example, originally classified P-7);
discovered the dual-extern + `symbols.txt` alias recipe — variant
F (dual-stash with two distinct extern symbols + `void * volatile *`
local pointers + an alias line in `symbols.txt`) byte-matches at
all 10 mwcc `2.0/*` SPs. Classified as **C-27 — pool-word
DUPLICATION wall** (the inverse-direction sibling of C-24's
pool-dedup); P-7 promoted to "SUPERSEDED BY C-27." Cross-corpus
survey: 157 duplicate-pool-pair occurrences. Cross-module BL
classification: scanned all overlays' disasm for `bl #<imm>`
fallback patterns; found 102 occurrences at 23 distinct target
addresses (99 unknown to dsd, 3 misclassified as data). Pure
analysis-completeness issue — once the targets are named, mwcc
emits `bl <symbol>` and the link is byte-trivial. Classified as
**T-4 — overlay function symbol promotion** (tooling/analysis
gap, not a codegen wall). **Brief 097 residue classification
complete:** all 5 patterns (indirect-call → C-24, critical-
section → C-26, predicated-cascade → P-9 + early-return scope-
refinement, pool-word → C-27, cross-module BL → T-4) are now
classified or recipe-codified.
Brief 109 (PR #510) opened the **brief 106 residue classification
phase** with codegen sweeps on 5 candidates brief 106 surfaced
as wall candidates. One recovery (`func_020338f8` — recipe:
explicit ternary intermediate + `result = 1` set before
OS_DisableIrq + separate flag-check stage; byte-matches at all
10 mwcc 2.0/* SPs); classified as **C-28 — predicated-cascade
collapse**, sibling of C-25 + C-26 in the "split-statement
intermediate" family. One P-N classification (`func_02037b34`
— 6-variant × 15-SP sweep, all 75 compiles predicate the tail);
classified as **P-10 — over-predication of short tail vs
early-return**, distinct from P-9's mvnNE-write peephole.
Permuter is the next-attempt path. Two partial findings worth
flagging: `func_02079ddc` recovers 13/17 instructions at
`.legacy.c` routing but residue is P-4-family r1↔r2 reg-alloc
swap on the indexed halfword load; `func_020326d4` natural form
is +8 bytes over (mwcc CSE folds `base + 0x1fc` back into
`base + 0xe7c`, defeating source-level intermediate-pointer
coercion attempts at all 15 SPs). Both partials are P-N
candidates pending a permuter-vs-residue follow-up brief.
Brief 111 (PR #?) ran permuter against P-10 (longer timeout —
1200s × 4 threads, 4× brief 109's budget) AND did codegen
research on brief 108's 5 callee-save candidates. Permuter
discovered the P-10 recipe at iter ~50: **`if (!p) return X;`
(unary NOT)** triggers early-return where `if (p == 0) return X;`
(equality with 0) triggers predicated cascade. Both forms
semantically identical; mwcc 2.0 compiles them to DIFFERENT
control-flow shapes. Classified as **C-29** with P-10 promoted
to "SUPERSEDED BY C-29." This is the **3rd P-N → C-N permuter
promotion** (after P-8 → C-25 in brief 098; P-9 → ? in brief 105
remained permanent for mask form). Brief 108 callee-save research
on `func_020071c4` surfaced the dual-extern + symbols.txt-alias
recipe (C-27) PLUS a shift-based bit-extraction coercion;
classified as **C-30 — pool-DUP + shift-bit extension of C-27**.
End-to-end validated; src committed for both C-29 + C-30 worked
examples.
Most fall into one
of three buckets: **coercible-with-knowledge**
(30 patterns — the right C variation or routing tier
matches; future briefs can grep here first), **permanent**
(10 patterns — mwcc keeps "winning" the codegen choice
regardless of C variation; budget zero matches in the yield
band), and **tooling-tractable**
(4 patterns —
`propagate_template` could ship a register-renaming or
literal-substitution variant — T-1, T-2 still proposed; T-3
third compiler routing tier **shipped in PR #340** via brief
045; T-4 overlay function symbol promotion **research-only**
via brief 107 — application wave outstanding). Brief 031's HIGH 78% under-delivery (22%) was dominated
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

## Coercible-with-knowledge (35 patterns)

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

#### Brief 199 — expanded signal set + DTCM kernel block + pick #5 worked example

**Discriminator beyond the brief 086 MMIO-block signal.**
Brief 193 (PR #640) flagged pick #5 (`func_02096434`) as "StyleA
+ C-23 stacked" and skipped it. The function's pool words are
`0x021a8288` (BSS) and `0x027ffc00` (DTCM kernel block) — NOT
in the `0x04000xxx` block the brief 086 detector was tuned to.
But the function still has the C-23 wall: two separate `ldr r3`
of `0x027ffc00`, one per if/else branch, against the
mwcc-2.0-fold's natural shape of "load once before the cmp".

Brief 199 expands the C-23 detection signal set to also cover:

| Signal | Description | Picks it catches |
|---|---|---|
| **(a) main MMIO** | pool literal in `0x04000xxx` range | brief 086 originals (divider, GX matrix) |
| **(b) DTCM kernel block** | pool literal in `0x027ff[c-f]xx` range — IRQ state, OS handles, kernel work area at top of DTCM | brief 199 pick #5 (`func_02096434`) |
| **(c) duplicate pool ref** | same `@ 0xADDR` referenced by 2+ `ldr` (mwcc 2.0 would fold; 1.2/sp2p3 doesn't) | brief 199 pick #5; brief 086's `func_0208e664` |
| **(d) clustered pool** | 3+ distinct pool targets within ±0x20 of each other (mwcc 2.0 base-folds; 1.2/sp2p3 emits per-slot) | `OSi_PostIrqEvent` (3-field cluster of `0x021a635x`); `func_02021b38` |

Any one signal is sufficient — they all point to the same
recipe (`.legacy.c` routing). The classifier surfaces each cue
that fires so the decomper knows which discriminator triggered.

**Worked example — pick #5 (`func_02096434`):** ships in
[`src/main/func_02096434.legacy.c`](../../src/main/func_02096434.legacy.c).
Function semantics: write per-slot value into a BSS array AND
mirror its truthiness as a bit in an OS-IRQ-state word at
`0x027fff88` (= `0x027ffc00 + 0x388`), bracketed by
`OS_DisableIrq` / `OS_RestoreIrq`. The orig has 27 insns + 3
pool words = 0x6c. The two `ldr r3, =0x027ffc00` loads (one per
if/else branch) BOTH point at the same pool word — that's the
duplicate-pool-ref signal.

**Source-shape trap (brief 199 Part 1 reproduction).** The
naive C with constant-folded MMIO offset:

```c
*(int *)(0x027ffc00 + 0x388) |= (1U << slot);  /* mwcc 1.2/
                                                  sp2p3 folds
                                                  this CONSTANT
                                                  at compile time
                                                  into a single
                                                  0x027fff88 pool
                                                  word + `[r3]`
                                                  access */
```

…compiles to a SINGLE pool word `0x027fff88` and `ldr r2, [r3]`
(no offset). Orig has TWO pool words `0x027ffc00, 0x027ffc00`
and `ldr r2, [r3, #0x388]`. Constant-folding happens at the C
expression level, BEFORE mwcc's SP-tier-specific peephole pass —
so changing the routing tier doesn't unfold it. The source must
keep the base + offset SEPARATE for mwcc to materialise the
base into a register and emit `[r3, #imm]`.

**Source recipe.** Bind the base to a `volatile int *` local
and access via index:

```c
volatile int *block = (volatile int *)0x027ffc00;
if (value != 0) {
    block[226] = block[226] | (1U << slot);   /* 226 * 4 = 0x388 */
} else {
    block[226] = block[226] & ~(1U << slot);
}
```

`block[226]` compiles to `ldr/str [r3, #904]` with r3 holding
`0x027ffc00`. The pool word stays unfolded. Verified byte-
identical to orig.

(The `*(int *)(0x027ffc00 + 0x388)` trap also explains why
brief 086 used `vu16 *p_divcnt = (vu16 *)0x04000280` — separate
pointer locals per base. The recipe generalises: keep
volatile-typed base pointers separate from their offsets.)

**Confirmed instances (brief 199 expansion):**

- `func_02096434` (brief 199 pick #5, this entry) — DTCM kernel
  block + duplicate pool ref, OS-IRQ-state bit mirror, 0x6c.

**Brief 199 classifier survey (4 additional C-23 candidates
beyond the brief 086 originals):**

| Candidate | Module | Addr | Size | Signal | Status |
|---|---|---|---:|---|---|
| `OSi_PostIrqEvent` | main | `0x020904d4` | 0x9c | 5 pc loads + clustered pool (`0x021a6354/8/c`) | brief 200+ candidate |
| `func_02021b38` | main | `0x02021b38` | 0x74 | 5 pc loads + clustered pool | brief 200+ candidate |
| `func_02093dc8` | main | `0x02093dc8` | 0x70 | 3 pc loads + main MMIO + duplicate ref (DMA) | brief 200+ candidate |
| (extension TBD) | — | — | — | — | — |

Full diagnosis + recipe rationale at
[`first-wave-wall-mmio-base-folding.md`](first-wave-wall-mmio-base-folding.md).

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

### C-25. Bitfield-chain store-reload reg-alloc — split into two statements

> **Wall family note.** Pure source-form C-N coercion; works
> at all 10 mwcc 2.0/* SPs (default included). No routing
> needed. Distinct from the routing-tier walls (C-15 / C-23 /
> C-24): the recipe is a syntactic split of the bitfield-chain
> expression, not an SP change.

**Target asm (`func_ov000_021ac85c` — brief 098 worked example):**

```text

ldr   r0, [r4, #0x98]              ; r0 = p->f_98
orr   r1, r0, #0x4000000           ; r1 = r0 | 0x4000000   ← intermediate r1
bic   r0, r1, #0xf80000            ; r0 = r1 & ~0xf80000   ← back to r0
orr   r0, r0, #0x880000
orr   r0, r0, #0x8000000
str   r0, [r4, #0x98]              ; p->f_98 = r0

```

6 ops on `p->f_98`. The diagnostic feature is the **temp-register
dance**: `orr r1, r0, #...; bic r0, r1, #...` — uses r1 as
intermediate before returning the chain to r0.

**mwcc emits when miscoded** (single-statement chain expression):

```c
/* breaks: in-place chain on r0 throughout */
p->f_98 = (p->f_98 | 0x4000000) & ~0xf80000 | 0x880000 | 0x8000000;
```

```text

ldr   r0, [r4, #0x98]
orr   r0, r0, #0x4000000           ; in-place on r0
bic   r0, r0, #0xf80000            ; still in-place
orr   r0, r0, #0x880000
orr   r0, r0, #0x8000000
str   r0, [r4, #0x98]

```

Same instruction count; **2 byte-position differences** at the
`orr`/`bic` register-source nibbles (orig uses r1 → r0; mwcc
keeps r0 → r0).

**C that coerces it (verified byte-identical against
`func_ov000_021ac85c`, mwcc 2.0/sp1p5):**

```c
extern void Fill32(unsigned int v, void *dst, unsigned int n);
typedef struct {
    char         _pad0[0x98];
    unsigned int f_98;
} state_t;

void func_ov000_021ac85c(state_t *p) {
    Fill32(0, p, 0xa0);
    p->f_98 = p->f_98 | 0x4000000;                       /* SEPARATE write */
    p->f_98 = ((p->f_98 & ~0xf80000) | 0x880000) | 0x8000000;
}
```

**The trick:** splitting the bitfield-chain expression into TWO
statements forces mwcc to allocate r1 as an intermediate temp
for the first OR's result. The mwcc peephole then removes the
intermediate `str/ldr` to memory (since both statements target
the same struct field), but the **register-allocation choice
persists** — the chain sequence emits as `orr r1, r0, #...;
bic r0, r1, #...; …; str r0` (matching orig's reg dance) rather
than `orr r0, r0, #...; bic r0, r0, #...; …; str r0` (the
single-statement single-register chain).

**SP boundary (verified all 15 mwcc SPs, 2 source variations
× 30 compiles):**

| mwcc SP | single-statement (wall) | split (recipe) |
|---|---|---|
| 1.2/base, sp2, sp2p3 | 0x3c score 16 | 0x44 score 24 |
| 1.2/sp3, sp4 | 0x38 score 15 | 0x40 score 24 |
| **2.0/base..sp2p4** (10 SPs) | 0x34 score 2 | ⭐ **0x34 byte-identical** |

⭐ = byte-identical. Recipe: split-statement source at any
`2.0/*` SP. Project default (2.0/sp1p5) works directly.

**Use when:** target asm has a bitfield-chain pattern with the
**temp-register dance** — `orr rN_HIGH, rN_LOW, #imm;
bic rN_LOW, rN_HIGH, #imm2; ...; str rN_LOW, [base, #off]` where
the intermediate register is HIGHER-numbered than the final
register. The natural single-statement chain emits in-place on
`rN_LOW`; the recipe forces the temp.

**Recognition cue:** count consecutive `orr`/`bic` ops between
`ldr` and `str` on the same struct member. If the FIRST op
writes to a higher-numbered register and the SECOND op reads
from it, the source was split into two statements (or the
brief 098 / brief 100 W-N recipe is needed).

**Confirmed instances:**

- `func_ov000_021ac85c` (brief 098 PR #494, ov000) — bitfield
  pack on `state_021ac85c_t->f_98` after a Fill32 call;
  recovered by permuter via the split-statement form. Brief
  098 noted "this is a coercion recipe, not a permanent wall —
  belongs in codegen-walls.md as a new C-N entry."

**Provenance:** brief 098 (PR #494) ran the macOS permuter
pipeline (brief 096) against 8 byte-diff candidates; recovered
1 (`func_ov000_021ac85c`) via permuter's discovery of the
split-statement recipe. Brief 100 Part 1 (PR #?) codified the
recipe as **C-25** and ran the 15-SP confirmation sweep —
recipe works at all 10 mwcc `2.0/*` SPs, no routing needed.
First W-class wall in the catalog promoted to C-class via
permuter discovery + post-hoc codification (per the brief
098 hand-back recommendation). The `1.2/*` family doesn't
apply — both variants emit a different (longer) shape there.

### C-26. Critical-section + helper-signature mismatch — `.legacy.c` routing

> **Wall family note — C-26 vs C-23 vs C-24.** Like C-23 and
> C-24, this wall is a routing-tier coercion against mwcc-2.0
> stack-frame elision behaviour. The discriminator is **what
> kind of function body** the routing affects:
>
> | Wall | Body shape | Routing |
> |---|---|---|
> | **C-23** | 3+ adjacent MMIO base loads + ANDS→TST in wait loops | `*.legacy.c` (mwcc 1.2/sp2p3) |
> | **C-24** | indirect call (`blx rN`) + pool-dedup of two LDR-from-pool to same slot | `*.legacy_sp3.c` (mwcc 1.2/sp3) |
> | **C-26** (this entry) | OS_DisableIrq → field-write → bl helper (helper ignores r0) → OS_RestoreIrq | `*.legacy.c` (mwcc 1.2/sp2p3) |
>
> The C-26 recipe is **two-part**: the C source must (a) declare
> the helper signature without args when orig's helper ignores
> the incoming r0 (typically because the helper's first
> instruction is `ldr r0, [pc, #...]` overwriting the inbound
> r0), AND (b) route through `*.legacy.c`. Either part alone
> doesn't recover byte-identical.

**Target asm (`func_020919d8` — brief 100 worked example):**

```text

stmdb sp!, {r4, r5, lr}
sub   sp, sp, #0x4
mov   r5, r0                       ; cache p
bl    OS_DisableIrq                ; r0 = saved IRQ state
mov   r1, #0x1
mov   r4, r0                       ; r4 = saved
str   r1, [r5, #0x64]              ; p->f_64 = 1
bl    helper                       ; bl into helper (r0 = saved, ignored)
mov   r0, r4
bl    OS_RestoreIrq
add   sp, sp, #0x4
ldmia sp!, {r4, r5, lr}            ; pop without pc
bx    lr                           ; explicit bx lr (mwcc 1.2/sp2p3 epilogue)

```

13 insns = 0x34. Note the `bl helper` immediately after `str r1,
[r5, #0x64]` — no `mov r0, ...` between. orig's helper accepts
whatever r0 currently holds (= the saved IRQ state), which the
helper's first instruction discards by reloading r0 from a pool
literal.

**mwcc emits when miscoded** (helper signature takes `p` as arg,
default routing):

```c
/* breaks: declares helper as void func(state_t *) — adds extra
   mov r0, r5 before bl, AND mwcc 2.0 emits dummy-r3 stack-trick */
extern void func_02091f88(state_t *p);

void func_020919d8(state_t *p) {
    int saved = OS_DisableIrq();
    p->flag = 1;
    func_02091f88(p);
    OS_RestoreIrq(saved);
}
```

```text

stmdb sp!, {r4, r5, lr}            ; same so far
mov   r5, r0
bl    OS_DisableIrq
mov   r4, r0
mov   r1, #0x1
str   r1, [r5, #0x64]
mov   r0, r5                       ; ← EXTRA insn: load p into r0 before bl
bl    helper
mov   r0, r4
bl    OS_RestoreIrq
ldmia sp!, {r4, r5, pc}            ; pop with pc (mwcc 2.0 style)

```

11 insns = 0x2c (plus no `sub sp, #4` — uses dummy-r3 stack
trick). **−0x8 bytes** vs target. Two changes fire together:
(1) extra `mov r0, r5` to load arg, (2) sub-sp elision.

**C that coerces it (verified byte-identical against
`func_020919d8`, `*.legacy.c` routing → mwcc 1.2/sp2p3):**

```c
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02091f88(void);    /* NO ARGS — match orig */

typedef struct state {
    char _pad[0x64];
    int  flag;
} state_t;

void func_020919d8(state_t *p) {
    int saved = OS_DisableIrq();
    p->flag = 1;
    func_02091f88();
    OS_RestoreIrq(saved);
}
```

**The trick:** declare the helper signature WITHOUT args when
orig's helper ignores the incoming r0. mwcc 1.2/sp2p3 sees
no arg-loading need before the `bl helper` and skips the
`mov r0, ...` instruction. r0 stays as the saved-IRQ state
through the bl (since helper preserves it incidentally), then
the post-call work uses r0 = saved naturally.

**The detection challenge:** the C author needs to inspect the
helper's body to determine whether r0 is a real arg. The
diagnostic asm pattern for "helper ignores r0":

```text

helper:
    stmdb sp!, {r4, r5, ...}
    ldr   r0, [pc, #+...]          ; ← overwrites incoming r0 immediately
    ...

```

If the helper's first non-prologue instruction is
`ldr r0, [pc, #...]` (or any other write to r0 before reading
it), then r0 is NOT a real arg. The caller's C source should
declare the helper signature without args.

**SP boundary (verified all 15 mwcc SPs, 4 source variations
× 60 compiles):**

| mwcc SP | with-arg variants (G/H/I) | no-arg variant (J) |
|---|---|---|
| **1.2/base, sp2, sp2p3** | 0x38 score 26 | ⭐ **0x34 byte-identical** |
| 1.2/sp3, sp4 | 0x34 score 26 | 0x30 score 5 |
| 2.0/base..sp2p4 (10 SPs) | 0x2c score 23 | 0x28 score 36 |

⭐ = byte-identical. Recipe: variant J (no-arg helper signature)
+ `*.legacy.c` (mwcc 1.2/sp2p3 OR 1.2/base / 1.2/sp2 — all 3
emit identical bytes here).

**Use when:** target asm has BOTH:

1. Paired `bl OS_DisableIrq` / `bl OS_RestoreIrq` framing a
   small body (1-3 work instructions + 1 inner bl).
2. Inner-bl helper whose first non-prologue instruction
   overwrites r0 (typically `ldr r0, [pc, #...]`).
3. Prologue: `push {r4, ..., lr}; sub sp, #4` and epilogue
   `add sp, #4; pop {r4, ..., lr}; bx lr` (the mwcc 1.2/sp2p3
   stack-frame style).

**Cross-corpus survey notes:** 125 unmatched functions in main
have the paired OS_DisableIrq + OS_RestoreIrq signature. Of
those, the strict C-26 match (`bl helper` between the pair +
helper overwrites r0 first) covers a smaller subset — needs
per-function helper-body inspection to count exactly. The
worked example below is the conservative confirmed instance;
cross-application to the broader 125 candidates is per-function
work for future single-region waves.

**Confirmed instances:**

- `func_020919d8` (brief 100 worked example, this entry) —
  critical-section guarding a single field-write + bl into
  `func_02091f88` (which immediately overwrites r0 from a
  pool literal). Verified byte-identical via variant J +
  `*.legacy.c` routing.

**Provenance:** brief 097 (decomper hand-back) flagged
"critical-section nesting" as the second-most-represented
medium-tier wall pattern (~8 of 31, after indirect-call's
~12). Brief 100 Part 2 (PR #?) ran a 10-variant × 15-SP
sweep on `func_02034754` (smallest critsec exemplar, score
0 at default — **not actually walled**) and `func_020919d8`
(critsec + struct-field write + helper call). Discovered the
**helper-signature-mismatch** factor: the natural
`func(state_t *p)` declaration generates an extra `mov r0,
r5` instruction; orig's `func(void)` declaration matches the
asm. Combined with `*.legacy.c` routing, recovers byte-
identical. Classified as **C-26** — same family as C-23 +
C-24 (mwcc-2.0 stack-frame elision behaviour, fixed by
1.2-tier routing) but with a distinct source-form factor
(helper signature) on top.

### C-27. Pool-word DUPLICATION — two distinct externs + symbols.txt alias (SUPERSEDES P-7)

> **Promotion note — C-27 supersedes P-7.** P-7 (brief 040)
> classified the pool-not-deduped wall on `func_02023fec` as
> permanent for the source-form pipeline, with a parenthetical
> "would require config-level alias declaration" speculation
> that was untested at the time. Brief 107 (PR #?) confirmed the
> speculation: a `symbols.txt` alias entry + dual-extern source
> form recovers byte-identical at the project's default mwcc
> 2.0/sp1p5 — no routing tier change, no inline asm. P-7 is no
> longer permanent for this pattern — see this entry for the
> working recipe.

> **Wall family note — C-27 vs C-24 (inverse direction).** C-24
> requires *pool dedup* (force mwcc to emit one pool entry for
> two LDRs that load the same address). C-27 requires the
> *opposite* — force mwcc to emit TWO pool entries for two LDRs
> that load the same address, when the function caches the
> address in a callee-save register (r4) across a BL to survive
> the call.
>
> | Wall | What mwcc does | What orig does | Recipe |
> |---|---|---|---|
> | **C-24** | dedupes pool when source uses one identifier; 2-entry pool when source uses two identifiers | 1-entry pool | single-extern (C-24 variant F) + `.legacy_sp3.c` |
> | **C-27** (this entry) | 1-entry pool + reloads address after BL (defers callee-save spill) | 2-entry pool + caches address in r4 across BL (callee-save spill happens at function entry) | dual-extern + `symbols.txt` address alias + `void * volatile *` local pointer dance |
>
> Both walls live on the same axis (mwcc's pool-dedup peephole)
> but pull in opposite directions. C-24 wants the peephole TO
> fire; C-27 wants it to NOT fire.

**Target asm (`func_02023fec` — brief 107 worked example):**

```text

stmdb sp!, {r4, lr}
ldr   r0, .L_pool1                ; r0 = &data_X (test slot)
ldr   r4, .L_pool2                ; r4 = &data_X (callee-save, survives bl)
ldr   r0, [r0, #0x0]              ; r0 = *p
cmp   r0, #0x0
beq   .L_skip
ldr   r0, [r4, #0x0]              ; r0 = *p (via cached r4)
bl    Task_InvokeLocked
mov   r0, #0x0
str   r0, [r4, #0x0]              ; *p = NULL (via cached r4)
.L_skip:
mov   r0, #0x1
ldmia sp!, {r4, pc}
.L_pool1: .word data_X            ; ← two distinct pool entries
.L_pool2: .word data_X            ;   for the SAME address

```

14 insns × 4 bytes = 0x38. The diagnostic is the **pool layout**:
two adjacent `.word` slots holding the same address constant,
loaded into r0 (caller-save, for the test) and r4 (callee-save,
for the post-BL store). orig's compiler chose to pre-load both
before the cmp/beq decision tree, so r4 is already populated
when the BL returns.

**mwcc emits when miscoded** (single extern, natural form):

```c
extern void *data_X;
extern void Task_InvokeLocked(void *p);

int func_02023fec(void) {
    if (data_X != 0) {
        Task_InvokeLocked(data_X);
        data_X = 0;
    }
    return 1;
}
```

```text

stmdb sp!, {r3, lr}                ; push {r3, lr} (cheap stack-trick)
ldr   r0, [pc, #0x24]              ; r0 = &data_X (single pool slot)
ldr   r0, [r0]                     ; r0 = *p
cmp   r0, #0x0
beq   .L_skip
ldr   r0, [pc, #0x14]              ; reuses SAME pool slot
ldr   r0, [r0]
bl    Task_InvokeLocked
ldr   r0, [pc, #0x10]              ; reuses SAME pool slot
mov   r1, #0x0
str   r1, [r0]
.L_skip:
mov   r0, #0x1
ldmia sp!, {r3, pc}
.word data_X                       ; ← ONE pool slot, reused 3×

```

12 insns + 1 pool word = 0x30. **−0x8 bytes** vs target. Two
divergences: (1) single pool entry instead of two, (2)
`push {r3, lr}` cheap stack-trick instead of `push {r4, lr}`
callee-save. The two are linked — without r4 being live across
the BL, mwcc has no reason to pre-load the address; without two
distinct pool references, mwcc dedupes.

**C that coerces it (verified byte-identical against
`func_02023fec`, default mwcc 2.0/sp1p5 routing — no `.legacy`
suffix needed):**

```c
extern void *data_X;
extern void *data_X_alias;         /* SAME address (see symbols.txt) */
extern void Task_InvokeLocked(void *p);

int func_02023fec(void) {
    void * volatile *test_p  = (void * volatile *)&data_X;
    void * volatile *store_p = (void * volatile *)&data_X_alias;
    if (*test_p != 0) {
        Task_InvokeLocked(*store_p);
        *store_p = 0;
    }
    return 1;
}
```

The volatile-qualified local pointer dance forces mwcc to
materialize both addresses eagerly (no deferred reload after the
BL); the dual-extern with two distinct identifiers prevents
pool dedup at the `.o` level; the linker resolves both to the
same address via the alias entry.

**Required symbols.txt entry** (one-line addition next to the
original `data_X` line):

```text
data_0219a8e4       kind:bss addr:0x0219a8e4
data_0219a8e4_alias kind:bss addr:0x0219a8e4   ← brief 107 alias
data_0219a8ec       kind:bss addr:0x0219a8ec
```

Both names resolve to the same byte. mwldarm doesn't error on
duplicate addresses; `dsd check modules` is unaffected (the
alias is invisible at the binary level — only the compiler sees
it as a separate symbol for purposes of emitting two pool
entries).

**SP boundary (verified all 15 mwcc SPs, 8 source variants ×
120 compiles):**

| mwcc SP | A_natural | B_volatile | C_twoglobals | F_dualstash | I_castbreak | J_inlineasm |
|---|---|---|---|---|---|---|
| 1.2/base..sp2p3 | 0x3c | 0x40 | 0x48 | 0x3c | 0x40 | (asm syntax) |
| 1.2/sp3, sp4 | 0x38 | 0x3c | 0x44 | 0x38 | 0x3c | (asm syntax) |
| 2.0/base..sp2p4 (10 SPs) | 0x30 | 0x34 | 0x3c | **0x38 ✓** | 0x34 | 0x34 |

Variant F (dual-stash with two-globals) hits 0x38 at all 10
mwcc 2.0/* SPs — byte-identical at the project's default
2.0/sp1p5 (no routing required). A and B fall short by 8 bytes
(missing the second pool entry). C is too long (8 extra bytes
from double-loading both globals before the test). I and J both
dedup back to single pool entry (mwcc treats them as one symbol
despite the cast-break / inline-asm tricks).

**Cross-corpus survey:** scan of `config/eur/arm9/relocs.txt`
for `from:0xA kind:load to:0xT` pairs where two relocs at
addresses 4 bytes apart point to the same target — **157
duplicate-pool-pair occurrences** across the project. After
deduplicating to unique target functions: an estimated **~80
candidate functions** carry this pattern (sweep needed to
confirm strict P-9-style "function actually exhibits the
callee-save r4 trick across BL"). Per the brief 100 → 103 →
105 NEGATIVE-finding pattern, a future application wave should
sweep 5-10 candidates first and verify natural-form NEGATIVE
gate (some pool-pair instances may be in functions where the
two pool entries are NOT the cache-across-BL shape — e.g.
distinct globals at adjacent addresses).

**Provenance:** brief 097 (decomper hand-back) flagged
pool-word count mismatch as the 4th-most-represented residue
pattern (~3 of 31). Brief 107 (PR #?) ran a 5-variant × 15-SP
sweep on the smallest exemplar (`func_02023fec`), plus 3
extended variants F/G/H/I/J targeting the dual-pool problem
directly. Variant F (`F_dualstash`) hits byte-identical at all
10 mwcc 2.0/* SPs — confirmed end-to-end build with the alias
entry; `dsd check modules` returns the same 24/27 baseline (the
recipe doesn't disturb adjacent functions). Classified as
**C-27 — pool-word DUPLICATION wall** with the dual-extern +
symbols.txt-alias recipe.

### C-28. Predicated-cascade collapse — explicit ternary intermediate

> **Wall family note — C-28 vs C-25 vs C-26.** All three are
> "split-statement intermediate" coercions where mwcc's natural
> optimization combines multiple expressions into a single
> predicated cascade or chained-reg-allocation, and the orig's
> compiler kept them as separate steps with intermediate
> materialization.
>
> | Wall | What mwcc combines | Coercion | Routing |
> |---|---|---|---|
> | **C-25** | bitfield-chain reg-alloc (r0 lives across chain) | split chain into 2 statements + named temp | default 2.0/sp1p5 |
> | **C-26** | critical-section helper call (mwcc passes p in r0) | helper signature without args + `.legacy.c` | `*.legacy.c` (1.2/sp2p3) |
> | **C-28** (this entry) | predicated-cascade (mwcc fuses tst → movne/moveq → cmp → moveq into the predicated branch decision) | explicit ternary intermediate variable | default 2.0/sp1p5 |
>
> C-28 is the lightest-touch of the three — just one extra local
> variable `int flag = ... ? 1 : 0;` between the test and the
> decision. No routing change.

**Target asm (`func_020338f8` — brief 109 worked example):**

```text

stmdb sp!, {r3, r4, r5, lr}
mov   r4, r0                       ; r4 = p (caller's arg)
mov   r5, #0x1                     ; result = 1 (set BEFORE bl, survives)
bl    OS_DisableIrq
ldr   r1, [r4, #0xeb4]
mov   r4, r0                       ; r4 = saved IRQ state (clobbers p)
tst   r1, #0x2000
movne r0, r5                       ; flag = (bit set) ? 1 : 0
moveq r0, #0x0
cmp   r0, #0x0
moveq r5, #0x0                     ; if (flag == 0) result = 0
beq   .L_skip
bl    func_02046ae0
cmp   r0, #0x1
movle r5, #0x0                     ; if (helper() <= 1) result = 0
.L_skip:
mov   r0, r4
bl    OS_RestoreIrq
mov   r0, r5
ldmia sp!, {r3, r4, r5, pc}

```

19 insns = 0x4c. The diagnostic is the **two-stage decision**:
the ternary `tst → movne r0,r5 / moveq r0,#0` materializes a flag
in r0, then a separate `cmp r0,#0 → moveq r5,#0 → beq` consumes
the flag and updates result. mwcc's natural form combines these
into a single `tst → moveq r5,#0 → beq` (three insns shorter).

**mwcc emits when miscoded** (natural inline form):

```c
int func_020338f8(state_t *p) {
    int saved = OS_DisableIrq();
    int result = 1;
    if ((p->flag_eb4 & 0x2000) == 0) {
        result = 0;
    } else {
        if (func_02046ae0() <= 1) result = 0;
    }
    OS_RestoreIrq(saved);
    return result;
}
```

```text

stmdb sp!, {r3, r4, r5, lr}
mov   r4, r0
bl    OS_DisableIrq
ldr   r1, [r4, #0xeb4]
mov   r5, #1                       ; result = 1 (set AFTER bl)
tst   r1, #0x2000
mov   r4, r0
moveq r5, #0                       ; if eq: result = 0 (combine cmp+moveq)
beq   .L_skip                      ; branch
bl    func_02046ae0
cmp   r0, #1
movle r5, #0
.L_skip:
mov   r0, r4
bl    OS_RestoreIrq
mov   r0, r5
pop {r3, r4, r5, pc}

```

16 insns = 0x40. **−0x0c bytes** vs target. mwcc collapsed the
ternary + flag-check into a single `moveq r5, #0; beq` because
the flag is only consumed by one branch decision.

**C that coerces it (verified byte-identical against `func_020338f8`,
default mwcc 2.0/sp1p5 — no routing change):**

```c
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int  func_02046ae0(void);

struct s338f8 {
    char _pad[0xeb4];
    int  flag_eb4;
};

int func_020338f8(struct s338f8 *p) {
    int saved;
    int flag;
    int result = 1;
    saved = OS_DisableIrq();
    flag = (p->flag_eb4 & 0x2000) ? 1 : 0;   /* explicit intermediate */
    if (flag == 0) {
        result = 0;
    } else {
        if (func_02046ae0() <= 1) result = 0;
    }
    OS_RestoreIrq(saved);
    return result;
}
```

Three source-form factors fire together:
1. **`result = 1` declared at function top** (before `OS_DisableIrq`)
   → mwcc spills `r5 = 1` BEFORE the bl, surviving the call.
   Without this, mwcc defers the init until after the ldr, losing
   r5's pre-bl placement.
2. **Explicit `flag = (expr) ? 1 : 0` intermediate** → mwcc emits
   the materialization into r0 via `movne r0, r5; moveq r0, #0`,
   instead of folding the tst directly into the branch decision.
3. **Separate `if (flag == 0)` check** → mwcc emits `cmp r0, #0;
   moveq r5, #0; beq` as a distinct decision stage, instead of
   collapsing into a single `moveq r5, #0; beq` based on tst flags.

Removing ANY of the three regresses the size (one fewer insn each).

**SP boundary (verified 15 mwcc SPs, 6 source variants):**

| mwcc SP | A_natural | B_explicit_intermediate |
|---|---|---|
| 1.2/base..sp2p3 | 0x4c+ | 0x58 |
| 1.2/sp3, sp4 | 0x4c | 0x54 |
| 2.0/base..sp2p4 (10 SPs) | 0x40 | **0x4c ✓** |

Default mwcc 2.0/sp1p5 with variant B hits target's exact bytes.

**Cross-corpus survey:** the strict C-28 signature is "critical
section + ternary-driven flag-then-branch" with the
movne/moveq/cmp/moveq cascade. Brief 100's critical-section
cross-corpus survey found 125 unmatched candidates; how many
fit the C-28 signature (vs C-26's helper-signature form) needs
a per-candidate spot-check.

**Provenance:** brief 106 (decomper hand-back) listed
`func_020338f8` as a "predication shape (carryover from brief
104)" residue candidate. Brief 109 (PR #?) ran a codegen sweep
across 6 source variants + identified the explicit-ternary-
intermediate recipe; recipe byte-matches at default mwcc
2.0/sp1p5 (no routing). End-to-end validated: built
`src/main/func_020338f8.c`, .o byte-identical to target,
`dsd check modules` preserves 24/27 baseline. Classified as
**C-28 — predicated-cascade collapse**, sibling of C-25 + C-26
in the "split-statement intermediate" family.

### C-29. `if (!p)` idiom for short-tail early return (SUPERSEDES P-10)

> **Promotion note — C-29 supersedes P-10.** P-10 (brief 109)
> classified `func_02037b34`'s "over-predication of short tail"
> wall as permanent after a 6-variant × 15-SP sweep produced
> zero recoveries. Brief 111's permuter run (1200s × 4 threads
> per candidate, 4× brief 109's budget) found the recipe at
> iter ~50: the wall coerces by replacing `if (p == 0) return X;`
> with `if (!p) return X;` (unary NOT instead of equality with 0).
> Both forms are semantically identical; mwcc 2.0 compiles them
> to DIFFERENT control-flow shapes.

> **Wall family note — C-29 vs C-28.** Both fix predication-vs-
> control-flow mismatches but at different axes:
>
> | Wall | mwcc's default | Source-form coercion |
> |---|---|---|
> | **C-28** | combines `tst → moveq → beq` into single predicated cascade | introduce ternary intermediate flag + separate test stage |
> | **C-29** (this entry) | predicates the entire post-null-check tail | use `!p` instead of `p == 0` for the early-return test |

**Target asm (`func_02037b34` — brief 105/109/111 worked example):**

```text

stmdb sp!, {r3, lr}
bl    func_02037b04
cmp   r0, #0x0
mvneq r0, #0x0                     ; if (r0 == 0) r0 = -1
ldmeqia sp!, {r3, pc}              ; ← EARLY RETURN on eq
ldr   r0, [r0, #0x34]              ; (unpredicated tail begins)
mov   r0, r0, lsl #0x10
mov   r0, r0, lsr #0x10
ldmia sp!, {r3, pc}

```

9 insns = 0x24.

**mwcc emits with `if (p == 0)`** (any of `== 0`, `== NULL`,
`== (void*)0` — all coerce identically):

```c
if (p == 0) return -1;
return p->f_34 & 0xffff;
```

```text

push  {r3, lr}
bl    helper
cmp   r0, #0
mvneq r0, #0
ldrne r0, [r0, #0x34]              ; PREDICATED tail
lslne r0, r0, #16
lsrne r0, r0, #16
pop   {r3, pc}

```

8 insns = 0x20. **−0x04 bytes** vs target. mwcc predicates the
entire post-cmp tail (`ldrne + lslne + lsrne`) rather than
emitting an early-return.

**C that coerces it (verified byte-identical at default mwcc
2.0/sp1p5, no routing change):**

```c
extern void *func_02037b04(void);

struct s37b34 {
    char _pad[0x34];
    unsigned int f_34;
};

int func_02037b34(void) {
    struct s37b34 *p = func_02037b04();
    if (!p) return -1;        /* ← !p instead of p == 0 */
    return p->f_34 & 0xffff;
}
```

**Idiom matrix** (verified at default mwcc 2.0/sp1p5):

| Source idiom | Result |
|---|---|
| `if (p == 0) return -1;` | predicated tail (0x20) |
| `if (p == NULL) return -1;` | predicated tail (0x20) |
| `if (p == (void*)0) return -1;` | predicated tail (0x20) |
| `if (!p) return -1;` | **early return (0x24, target shape) ✓** |
| `if (p) { ... } return -1;` (inverted) | **early return (0x24) ✓** |
| `if (p != 0) { ... } return -1;` (inverted) | **early return (0x24) ✓** |
| `if (p != NULL) { ... } return -1;` (inverted) | **early return (0x24) ✓** |

The wall is mwcc's "equality with 0/NULL" semantic — three
distinct source idioms (`== 0`, `== NULL`, `== (void*)0`) all
trigger the predicated cascade. Switching to `!p` or any
not-equal / inverted form triggers the early-return shape.

**Scope:** the wall only fires when:
1. The early-return-on-null is followed by a multi-insn tail
   (typically ≥3 unpredicated insns).
2. The function has a single-cmp control flow shape (no
   intervening calls before the cmp).

With a 1-insn tail (e.g., `return p->f_X;` alone), mwcc keeps
predicating even with `!p`. With a 2-insn tail, mixed results.
For 3+ insns, the `!p` recipe reliably triggers early return.

**Cross-corpus survey:** brief 109 estimated ~36 strict P-10
candidates. The C-29 recipe applies to any candidate where the
tail is ≥3 insns; smaller tails are NOT walled (mwcc emits
predicated shape that orig also has). Decomper application
waves should attempt C-29 first; for short-tail residue, fall
through to permuter or accept skip.

**Provenance:** brief 105 (PR #504) first surfaced
`func_02037b34` as a permuter candidate (300s × 4 threads,
best score 210 — no recovery). Brief 109 (PR #510) ran a
codegen sweep, classified as P-10 permanent. Brief 111
(PR #?) re-ran permuter with 1200s budget; permuter discovered
the `if (!p)` recipe at iter ~50, score 0 — full byte-identical
recovery. End-to-end validated; src committed.

This is the **3rd P-N → C-N promotion via permuter discovery**:
brief 098 P-8 → C-25, brief 105 P-9 → C-N (NEGATIVE — confirmed
permanent for mask form), brief 111 P-10 → C-29. Adds a data
point for "permuter is useful for IR-lowering walls when budget
is enough" — 300s misses, 1200s finds it.

### C-30. Pool-DUP + shift-based bit extraction (extends C-27)

> **Wall family note — C-30 extends C-27.** C-27 covers the
> dual-pool-word recipe (extern alias + symbols.txt entry) for
> functions caching a global pointer in a callee-save register
> across a BL. C-30 adds a SECOND coercion layer for functions
> where the early-return condition also involves SHIFT-BASED
> bit extraction (lsl + lsrs) rather than mwcc's preferred
> `tst + popeq` peephole.
>
> | Wall | C-27 | C-30 |
> |---|---|---|
> | **Pool-dup** | dual-extern + symbols.txt alias | same |
> | **Bit-extraction** | (no bit test in C-27's example) | `((v << K) >> 31)` shift idiom |
> | **Required for recovery** | C-27 alone | C-27 + shift idiom |

**Target asm (`func_020071c4` — brief 111 worked example):**

```text

stmdb sp!, {r4, lr}
ldr   r0, .L_pool1                 ; r0 = &data_X (test slot)
ldr   r4, .L_pool2                 ; r4 = &data_X (callee-save)
ldr   r0, [r0, #0x10]              ; r0 = *p_X +0x10
mov   r0, r0, lsl #0x1e            ; shift to isolate bit 1
movs  r0, r0, lsr #0x1f            ; lsr 31 + S flag (cmp 0)
ldmeqia sp!, {r4, pc}              ; early return if bit clear
bl    func_02006918
bl    func_02006a38
ldr   r0, [r4, #0x14]              ; access via cached r4
cmp   r0, #0
beq   .L_done
bl    func_020057dc
.L_done:
ldr   r1, [r4, #0x10]
mov   r0, #0
bic   r1, r1, #2
str   r1, [r4, #0x10]
str   r0, [r4, #0x14]
ldmia sp!, {r4, pc}
.L_pool1: .word data_02104f1c
.L_pool2: .word data_02104f1c

```

21 insns = 0x54. Two diagnostic features:
1. Two distinct pool slots for the same `data_X` (C-27 wall).
2. The 1-bit test is done via `lsl 30 + lsrs 31` (3 insns) +
   `ldmeqia` (early-return) — instead of mwcc's natural
   `tst rN, #2 + popeq` (2 insns).

**mwcc emits when miscoded** (single extern, natural form, no
shift idiom):

```c
void func_020071c4(void) {
    struct s071c4 *p = (struct s071c4 *)&data_02104f1c;
    if ((p->f_10 & 2) == 0) return;
    ...
}
```

```text

push  {r4, lr}
ldr   r4, [pool]                   ; r4 = &data_X (SINGLE pool slot)
ldr   r0, [r4, #0x10]
tst   r0, #2                       ; 2-insn test+branch
popeq {r4, pc}
...

```

18 insns = 0x48. **−0x0c bytes** vs target. Two divergences
fire together: (1) single pool slot, (2) tst peephole.

**C that coerces it (verified byte-identical at default mwcc
2.0/sp1p5):**

```c
extern unsigned int data_02104f1c;
extern unsigned int data_02104f1c_alias;  /* via symbols.txt */
extern void func_02006918(void);
extern void func_02006a38(void);
extern void func_020057dc(void);

struct s071c4 {
    char _pad[0x10];
    unsigned int f_10;
    int f_14;
};

void func_020071c4(void) {
    struct s071c4 *p_test  = (struct s071c4 *)&data_02104f1c;
    struct s071c4 *p_store = (struct s071c4 *)&data_02104f1c_alias;
    unsigned int v = p_test->f_10;
    if (((v << 30) >> 31) == 0) return;    /* shift idiom */
    func_02006918();
    func_02006a38();
    if (p_store->f_14 != 0) func_020057dc();
    p_store->f_10 &= ~2u;
    p_store->f_14 = 0;
}
```

Plus `data_02104f1c_alias kind:bss addr:0x02104f1c` in
`config/eur/arm9/symbols.txt`.

The shift idiom `((v << 30) >> 31)` produces:
- `mov rN, rN, lsl #30` (isolate bit 1 to MSB)
- `movs rN, rN, lsr #31` (shift to LSB + set Z flag)

Instead of mwcc's preferred `tst rN, #2; popeq` (1 cmp + 1
predicated pop). The shift idiom is 3 insns (`mov` lsl, `movs`
lsr, `ldmeqia`) vs `tst` idiom's 2 insns (`tst`, `popeq`) — an
extra instruction that matches target's longer form.

**SP boundary (verified 15 mwcc SPs, 4 source variants):**

| mwcc SP | A_natural | C_simpledual | D_shiftbit | E_volstruct |
|---|---|---|---|---|
| 1.2/base..sp2p3 | 0x50 | 0x58 | 0x5c | 0x58 |
| 1.2/sp3, sp4 | 0x48 | 0x50 | 0x54 ✓ | 0x50 |
| 2.0/base..sp2p4 (10 SPs) | 0x48 | 0x50 | **0x54 ✓** | 0x50 |

Variant D (dual-stash + shift-bit) hits 0x54 at all 10 mwcc
2.0/* SPs AND at 1.2/sp3-sp4. Default 2.0/sp1p5 works without
routing.

**Cross-corpus survey:** brief 108 flagged 5 C-27 callee-save
candidates as wall-blocked. Brief 111's spot-check confirmed
`func_020071c4` recovers with C-30 recipe; the remaining 4
(`func_02024024`, `func_02024574`, `func_0202a1cc`,
`func_0202a27c`) all share similar structure with Fill32 loops
— need per-candidate inspection for the specific bit-test
idiom + helper-arg patterns. Application wave outstanding.

**Provenance:** brief 108 (PR #509) flagged 5 candidates as
"callee-save preservation mismatch" — couldn't recover via
C-27's recipe alone. Brief 111 (PR #?) sweeped 4 source
variants on `func_020071c4` (smallest single-wall exemplar);
variant D (shift-based bit extraction + dual-extern) hit
byte-identical at all 10 mwcc 2.0/* SPs. End-to-end validated;
src committed. Classified as **C-30 — pool-DUP + shift-bit
extension of C-27**.

### C-31. mwldarm interwork veneer — `.s` with explicit mode directive

> **Wall family note — C-31 vs C-24.** Both involve indirect-
> jump shapes (`ldr rN, [pool]; bx rN`). C-24 is about *source-
> level* indirect-call dispatch where the user's C code chooses
> the function-pointer table layout; routing through
> `.legacy_sp3.c` (mwcc 1.2/sp3) recovers the matching dispatch
> code. C-31 is about *linker-emitted* interwork shims —
> mwldarm 2.0/sp1p5 auto-generates these to bridge Thumb/ARM
> mode boundaries or long-distance branches, and they appear
> in `symbols.txt` as ordinary `func_<addr>` entries even
> though they're not source-authored. C-24 fires on functions
> with non-trivial bodies; C-31 fires on the 8-byte / 12-byte
> shim shape itself.
>
> | Wall | C-24 | C-31 |
> |---|---|---|
> | **Source origin** | user `.c` indirect call | mwldarm-emitted shim |
> | **Body size** | function body + dispatch | 8 B (Thumb) or 12 B (ARM) |
> | **Recipe** | `.legacy_sp3.c` routing | `.s` with `.thumb`/`.arm` directive |

**Recognition cue (asm-level):**

The function body is exactly 8 bytes (Thumb form) or 12 bytes
(ARM form), and matches one of:

```text
; Thumb 8 B — Thumb caller → ARM target interwork shim
4b 00       ldr   r3, [pc, #0]   ; pc = veneer + 4, so [pc+0] = veneer + 4 = .word slot
47 18       bx    r3
<4 bytes>   .word target_va

; ARM 12 B — long-distance branch trampoline (in-mode)
00 ?0 9f e5 ldr   rN, [pc]
?c ff 2f e1 bx    rN
<4 bytes>   .word target_va

; Thumb 12 B — Thumb shim with pre-store side effect
<2 bytes>   strb / strh / str rN, [rM]   ; one pre-store instruction
4b 00       ldr   r3, [pc, #0]
47 18       bx    r3
00 00       nop                          ; alignment padding
<4 bytes>   .word target_va
```

The `.word target_va` is in another module's `.text` (cross-
module veneer) OR exceeds the direct-branch range (~32 MB from
the veneer's own VA — long-distance trampoline).

**mwldarm's role:** at link time, mwldarm 2.0/sp1p5 scans
`relocs.txt`-equivalent ELF reloc entries for `thumb_call`
crossing into ARM mode (or vice versa) and for `arm_call` /
`thumb_call` where the target is too far. For each such reloc
it allocates a veneer at a stable address inside the calling
overlay's `.text`. The veneer becomes a named function in
`symbols.txt` post-extraction because dsd sees a callable
entry at that address.

**C that miscodes the wall:**

The natural tail-call wrapper looks innocent but explodes:

```c
extern void func_<target_va>(void);
void func_<veneer_va>(void) { func_<target_va>(); }
```

mwcc 2.0/sp1p5 emits this as 12+ bytes of ARM (`push {lr}; bl
target; pop {pc}`) regardless of source mode. For an 8-byte
Thumb veneer target the size + alignment mismatch cascades
the surrounding link layout (brief 191 Part 1 reproduction:
~159 KB byte-diff in `arm9_ov004.bin`, 19,693 divergence
runs, +5 byte `.rodata` shift exceeding the brief 180 patcher
cap).

**`.s` that coerces it (verified byte-identical against
`func_ov004_021dbdbc`):**

```text
        .text
        .global func_<veneer_va>
        .thumb                  ; or .arm for the 12-byte ARM form
func_<veneer_va>:
        ldr     r3, [pc, #0]
        bx      r3
        .word   <target_va>
```

Critical details:

- **`.thumb` directive** (not `.thumb_func` — mwasmarm
  rejects the GNU symbol-type marker). The encoding-mode
  switch is mandatory; without it mwasmarm assembles the
  `ldr; bx` as 32-bit ARM instructions and the size doubles.
- **`.global` only** — no `.thumb_func` / no interwork
  attributes / no `extern` reference for the target. mwldarm
  resolves the literal-pool VA at link time via the orig-VA
  reloc machinery dsd ships.
- **Literal pool inline** as `.word <target_va>` — not via
  named extern; mwasmarm doesn't need a `.pool` directive
  because the `.word` is already at the correct PC-relative
  offset.

Verified: 3-region `ninja sha1` PASS preserved when shipped
as `src/overlay004/func_ov004_021dbdbc.s` (the brief 191
worked example).

**Per-shape recipe table:**

| Shape | Mode directive | Scratch reg | Body |
|---|---|---|---|
| 8 B Thumb | `.thumb` | `r3` | `ldr r3, [pc, #0]; bx r3; .word target` |
| 12 B ARM | `.arm` | `ip` or `r1` | `ldr rN, [pc]; bx rN; .word target` |
| 12 B Thumb + prefix | `.thumb` | `r3` | `<pre-store>; ldr r3, [pc, #4]; bx r3; nop; .word target` |

**Use when:** target asm exactly matches one of the recognition
cues AND the `.word`-slot target VA is in another module's
`.text` (cross-module) or > 32 MB from the veneer's own VA
(long-distance). The `tools/predict_walls.py` `InterworkVeneer`
classifier (brief 191) auto-flags these picks.

**Cross-corpus survey notes:** the 5 affected picks from brief
188 PR #636 form the initial population:

| Pick | Module | Addr | Size | Mode | Target |
|---|---|---|---:|---|---|
| #3 | ov004 | `0x021dbdbc` | 8 | Thumb | `func_0206ecb4` (in main) |
| #4 | ov004 | `0x021dbdd0` | 8 | Thumb | `func_0206eecc` (in main) |
| #5 | ov004 | `0x021de280` | 8 | Thumb | `func_02091768` (in main) |
| #9 | main | `0x0209085c` | 12 | ARM | `func_020909b0` (in main, long-distance) |
| #12 | ov004 | `0x021dbdc4` | 12 | Thumb | `func_0206eea0` (in main, with pre-store) |

Picks #3, #4, #5 are byte-identical except for the literal-
pool target VA — brief 192+ drains them by copying the brief
191 worked example.

**Provenance:** decomper brief 188 (PR #636) surfaced the
cluster empirically and tagged it as "likely mwldarm interwork
veneers" without a recipe. Brief 191 (this entry) classified
the wall, reproduced the cascade with byte-level evidence,
shipped the `.s` + `.thumb` directive recipe as a worked
example on pick #3, and extended
[`tools/predict_walls.py`](../../tools/predict_walls.py) with
an `InterworkVeneer` detector so future trivial-bucket waves
pre-route affected picks. Full diagnosis +
recipe rationale at [`first-wave-wall-mwldarm-interwork.md`](first-wave-wall-mwldarm-interwork.md).

### C-32. Cross-overlay hardcoded BL — `.s` with hand-encoded `.word`

> **Wall family note — C-32 vs C-31.** Both ship as `.s` with
> raw `.word` directives. C-31 (mwldarm interwork veneer) is
> about a *whole function* whose body is an 8/12-byte shim that
> mwldarm auto-emits — the entire function lives in the .word
> literal pool. C-32 (this entry) is about a *regular function
> body* containing one or more `bl` instructions that target a
> cross-overlay address dsd can't resolve to a specific module —
> the function has normal ARM code interleaved with hand-encoded
> `.word`-BL escapes. C-31 fires on shim shapes; C-32 fires on
> ordinary functions that happen to BL into a multi-overlay
> shared-base address range.
>
> | Wall | C-31 | C-32 |
> |---|---|---|
> | **Source origin** | mwldarm-emitted shim | user-authored function |
> | **Body shape** | only the shim (`ldr; bx; .word`) | ordinary function w/ embedded hardcoded BL |
> | **Failure mode** | layout cascade (~KB byte-diff) | hard link error (`Undefined : "func_<addr>"`) |
> | **Recipe** | `.s` + `.thumb`/`.arm` directive | `.s` + `bl <symbol>` for resolvable + `.word <bl-encoding>` for hardcoded |

**Recognition cue (relocs-level):**

The function's `relocs.txt` contains one or more entries:

```text
from:0x<addr_inside_func> kind:arm_call to:0x<target> module:none
```

The `module:none` marker indicates dsd's reloc analysis could
not attribute the BL target to a single module because the
target VA falls inside a multi-overlay shared-base range. In
this game three such ranges exist (per
`extract/eur/arm9_overlays/overlays.yaml`):

| Shared base | Overlays | Max end |
|---|---|---:|
| `0x021aa4a0` | ov000, ov002, ov005, ov008, ov009, ov018, ov020, ov021, ov022 | `0x022cd300` |
| `0x021b2280` | ov006, ov007, ov010, ov014, ov015, ov016, ov017, ov019, ov023 | `0x021cf140` |
| `0x021c9d60` | ov001, ov003, ov004, ov011, ov012, ov013 | `0x0220b500` |

A BL into any of these ranges from a function in a different
overlay group is potentially `module:none`. The reloc kind
(`module:none` vs `module:<name>`) is the only reliable
disambiguator — the bare `bl <hex>` instruction shape alone
appears for both resolvable and unresolvable cross-overlay
BLs.

**C that miscodes the wall:**

```c
extern void func_021b5500(void);
void func_ov011_021d2c64(int *out) {
    /* ... */
    func_021b5500();   /* mwldarm cannot resolve */
    /* ... */
}
```

Build result:

```text
mwldarm.exe: Undefined : "func_021b5500"
mwldarm.exe: Referenced from "func_ov011_021d2c64" in ov011_021d2c64.o
mwldarm.exe: alert: Link failed.
```

The link aborts before any layout cascade can manifest — there
is no built `.bin` to diff. The brief 180 patcher never runs.

**`.s` that coerces it (verified byte-identical against
`func_ov011_021d2c64`):**

```text
        .text
        .extern Task_PostLocked
        .global func_ov011_021d2c64
        .arm
func_ov011_021d2c64:
        stmdb   sp!, {r3, r4, r5, lr}
        mov     r5, r0
        mov     r0, #0x44
        mov     r1, #0x4
        mov     r2, #0x0
        bl      Task_PostLocked
        mov     r4, r0
        .word   0xebff8a1e                      ; bl 0x021b5500 (cross-overlay, mod:none)
        str     r4, [r5]
        ldmia   sp!, {r3, r4, r5, pc}
```

Critical details:

- **Two BL classes, two recipes.** Resolvable BLs (those with
  `module:main` or `module:overlay(N)` in relocs.txt) use the
  mnemonic form `bl <symbol>` and let mwldarm compute the
  link-time displacement. Hardcoded BLs (`module:none`) use a
  raw `.word <encoded_bl>` directive.
- **BL encoding formula.** For `bl <target>` at PC `<addr>`:

  ```text
  offset    = (target - (addr + 8)) / 4         ; signed
  imm24     = offset & 0xffffff                 ; bottom 24 bits
  encoding  = 0xeb000000 | imm24                ; ARM bl-cond-AL opcode
  ```

  This must match the baserom bytes at `addr` verbatim — verify
  before shipping.
- **Host function pinned at orig VA.** The dsd/mwldarm overlay-
  layout LCF + brief 180 patcher keep the host function's
  `.o` section anchored at the original VA. The precomputed
  cross-overlay BL displacement stays correct after link.
- **Precedent.** [`src/main/func_020b3814.s`](../../src/main/func_020b3814.s)
  uses the same hand-encoded-`.word` pattern for inter-function
  branches into private `.L_*` labels of a sibling `.o` —
  different wall class (P-7-adjacent), same technique.

Verified: 3-region `ninja sha1` PASS preserved when shipped
as `src/overlay011/func_ov011_021d2c64.s` (the brief 192
worked example).

**Use when:** target function's `relocs.txt` has at least one
`kind:arm_call to:<addr> module:none` entry inside the
function's `[addr, addr+size)` range. The
`tools/predict_walls.py` `CrossOverlayBL` classifier (brief
192) auto-flags these picks.

**Cross-corpus survey notes:** the 6 affected picks from brief
190 PR #637 cluster A (one mis-tagged):

| Pick | Module | Addr | Size | Hardcoded BLs | Resolvable BLs | Status |
|---|---|---|---:|---:|---:|---|
| #1 | `ov013` | `0x021c9d60` | `0x14` | 2 (→ 0x021b0b44, 0x021b2420) | 1 | brief 192 recipe |
| #2 | `ov012` | `0x021c9d8c` | `0x14` | 2 (→ 0x021b0b44, 0x021b2420) | 1 | brief 192 recipe |
| #4 | `ov011` | `0x021ca0ac` | `0x18` | 2 (→ 0x021b0b44, 0x021b2420) | 2 | brief 192 recipe |
| #15 | `ov011` | `0x021d2c64` | `0x28` | 1 (→ 0x021b5500) | 1 | **shipped** as `.s` |
| #19 | `main` | `0x020323f4` | `0x58` | **0** | 4 | mis-tagged — NOT C-32 |
| #20 | `ov011` | `0x021ca03c` | `0x58` | 2 (→ 0x021b142c, 0x021b284c) | 2 | brief 192 recipe |

Picks #1, #2, #4 share the `(0x021b0b44, 0x021b2420)` target
pair — likely a common boot helper. Pick #20 has a different
pair `(0x021b142c, 0x021b284c)`. Brief 193+ drains them by
copying the brief 192 recipe.

**Provenance:** decomper brief 190 (PR #637) surfaced the
cluster empirically as "Cluster A — Cross-overlay hardcoded
BLs (6 picks)" with two proposed options: (1) extend dsd to
emit placeholder symbols for the unresolved targets, (2) ship
as `.s` with hand-encoded BL `.word`s. Brief 192 (this entry)
ruled out option (1) as out-of-scope (requires upstream dsd
changes), classified the wall, reproduced the link-failure
mode with byte-level evidence, shipped the `.s` + hand-encoded
`.word` recipe as a worked example on pick #15, corrected the
pick #19 mis-tag, and extended
[`tools/predict_walls.py`](../../tools/predict_walls.py) with
a `CrossOverlayBL` detector. Full diagnosis + recipe rationale
at [`first-wave-wall-cross-overlay-bl.md`](first-wave-wall-cross-overlay-bl.md).

### C-33. `.legacy.c` cascade — per-section modal-deviation cap

> **Wall family note — C-33 vs C-31 / C-32.** All three involve
> the patcher's `MAX_SHIFT_BYTES` mechanism, but for different
> structural reasons. C-31 (mwldarm interwork veneer) is about
> a function whose bytes literally ARE a `ldr/bx/.word` shim;
> the cascade is a byte-divergence in the surrounding `.text`
> when the shim's size shifts. C-32 (cross-overlay hardcoded
> BL) is about a function with `module:none` BL relocs that
> mwldarm can't symbolically resolve — the failure is a hard
> link error, not a cascade. **C-33 is a LCF-level cascade**:
> adding a `.legacy.c` (mwcc 1.2/sp2p3) to `src/main/` for a
> function past a size threshold makes ARM9 grow enough that
> mwldarm places ov004 ~64 B later in its virtual VA accounting.
> Every ov004 TU's linker-map shift jumps to +64 / +68, far
> exceeding the brief 180 `MAX_SHIFT_BYTES = 4` cap. Brief 194
> diagnoses this is a UNIFORM bodily shift (not structural
> regression) and refines the cap to measure against per-section
> MODAL shift, unblocking the route.
>
> | Wall | C-31 | C-32 | C-33 |
> |---|---|---|---|
> | **Failure** | byte cascade in linked overlay | hard link error | patcher MAX_SHIFT bail |
> | **Trigger** | source-claim of veneer shape | `module:none` arm_call | `.legacy.c` size > 0x50 in main |
> | **Mechanism** | shim re-emission size mismatch | unresolved-extern | LCF virtual padding from ARM9 growth |
> | **Recipe** | `.s` + `.thumb`/`.arm` directive | `.s` + hand-encoded `.word` BL | patcher per-section modal cap |
> | **Source change** | function body | function body | none — fix is patcher-only |

**Recognition cue (composite — module + size + existing wall):**

The C-33 risk fires when ALL three hold:

1. Function lives in `main` (ARM9). Same wall + size in an
   overlay does NOT reproduce the cascade — the LCF placement
   of ov004 depends on ARM9's end, not on overlay sizes.
2. Function size > `0x50` bytes (empirical threshold from
   PR #640: brief 190's smaller `.legacy.c` files at 0x28..0x34
   did NOT trigger; brief 193's 0x68+ candidates do).
3. At least one of `StyleA` (Style A epilogue → `.legacy.c`
   routing) or `C-15` (constant-pair via `mvn`/`mov-sub` →
   `.legacy.c` routing) is independently predicted. The
   cascade fires on the LEGACY ROUTING TIER specifically;
   `.c` (mwcc 2.0/sp1p5) or `.legacy_sp3.c` (mwcc 1.2/sp3)
   don't trigger it.

The classifier emits `C-33` as a composite alongside the
underlying StyleA/C-15 prediction.

**Cascade fingerprint (empirical, PR #640 + brief 194 Part 1):**

Inspect `arm9.o.xMAP` with the new `--dump-shifts` flag:

```bash
python tools/patch_ov004_veneers.py \
    --binary build/eur/build/arm9_ov004.bin \
    --relocs config/eur/arm9/overlays/ov004/relocs.txt \
    --delinks config/eur/arm9/overlays/ov004/delinks.txt \
    --map build/eur/arm9.o.xMAP \
    --dump-shifts
```

The Cluster F shape is unambiguous:

| Section | TUs | Modal shift | Spread |
|---|---:|---:|---|
| `.text` | 35 | +64 | all at +64 (consensus 100%) |
| `.rodata` | 28 | +68 | 22 at +68; 5 at +64..+67 (brief 180 cascade region) |
| `.init` | 1 | +68 | — |
| `.ctor` | 1 | +68 | — |
| `.data` | 56 | +64 | all at +64 (consensus 100%) |

Total: **120 TUs all shifted by +64 to +68 bytes**. Pre-brief-
194 the patcher bails on TU 41's +64 shift (FIFO order in the
parser). Brief 194's fix recognises the uniform bodily shift
and routes through `_layout_reconstruct` normally.

**C that miscodes the wall:**

A perfectly valid `.legacy.c` per the C-15 / StyleA recipe:

```c
/* func_0200b2f4 (0x68 bytes, C-15 mvn r4, #0 pattern) */
int func_0200b2f4(struct Out *out, ...) {
    int neg_one = ~0;        /* mwcc 1.2/sp2p3 emits mvn r4, #0 */
    int twelve = 12;
    /* ... loop body ... */
}
```

Build result (pre-brief-194 patcher):

```text
error: build/eur/build/arm9_ov004.bin: TU _dsd_gap@ov004_41.o
       (.text) has shift +64 bytes
       (|shift| > MAX_SHIFT_BYTES = 4);
       structural regression suspected — bail rather than
       relocate a TU section whose layout cause we have not
       characterised.
```

Brief 180's cap was set on the assumption that any shift > 4 B
indicates an uncharacterised layout regression. Brief 194's
investigation shows the +64 shift is structurally safe (uniform
bodily relocation; physical bytes still align to orig FOs once
the LCF virtual padding is subtracted).

**Patcher fix (verified byte-identical at baseline + with
deliberate cascade):**

The cap now measures deviation from the per-section MODAL
shift, not from zero. `MAX_SHIFT_BYTES = 4` still catches the
original target (a TU moving independently from its section's
bulk = genuine structural regression); the bulk shift goes
through `_layout_reconstruct` unchanged.

Physical FO formula:

```text
physical_byte_shift = tu.shift - text_modal_shift
built_fo = orig_fo + physical_byte_shift
```

Where `text_modal_shift` is the `.text` section's modal shift
(the LCF virtual padding baseline). For ov004's brief 194
profile, `text_modal_shift = +64`, so:

- `.text` TUs at shift +64: `physical_byte_shift = 0` →
  built_fo = orig_fo (the TU's bytes are already at orig FO).
- `.rodata` TUs at shift +68: `physical_byte_shift = +4` →
  built_fo = orig_fo + 4 (the brief 180 cascade vestige).
- A hypothetical outlier at shift +75 in `.text`: deviation
  from .text modal = +11 > MAX_SHIFT_BYTES → raise (genuine
  regression).

A modal-consensus threshold (`MODAL_CONSENSUS_FRACTION = 0.5`)
also fires if no clear majority emerges — guards against
ambiguous modal picks in synthetic / pathological inputs.

**Diagnostic: `--dump-shifts`.**
[`tools/patch_ov004_veneers.py`](../../tools/patch_ov004_veneers.py)
gains a CLI flag that parses `--map` and prints each TU's
section / shift / built+orig VA range, sorted by |shift|
descending, with a `*` marker on TUs that would trip the cap.
Use this when investigating future MAX_SHIFT-related failures.

Verified: 3-region `ninja sha1` PASS preserved at baseline (no
new claim), AND ov004's binary is byte-identical to orig (`sha1
54014c93…`) — the patcher's load/BL re-encoding passes still
run unchanged on the reconstruction output.

**Use when:** the `tools/predict_walls.py` `C-33` classifier
flags a pick. Brief 194's patcher fix unblocks the BUILD
pipeline; byte-matching the function itself may still need
permuter work because the source-level pattern that triggered
the StyleA/C-15 wall is independent of the cascade. Plan the
permuter wave (brief 195+ scaffolder) for any unmatched picks.

**Cross-corpus survey notes:** the 3 affected picks from brief
193 PR #640 Cluster F:

| Pick | Module | Addr | Size | Underlying wall | Notes |
|---|---|---|---:|---|---|
| #2 | `main` | `0x0200b2f4` | `0x68` | C-15 | mwcc 2.0 epilogue actually matches; `.c` route is correct |
| #5 | `main` | `0x02096434` | `0x6c` | StyleA + MMIO fold | StyleA + C-23 routing both needed |
| #7 | `main` | `0x02023f7c` | `0x70` | (none / Cluster E) | mwcc reg-alloc drift — permuter case |

All three trip the patcher cap pre-brief-194. With the fix, all
three BUILD through (the `_layout_reconstruct` algorithm copies
TUs to orig FOs cleanly). The byte-match of the function body
itself is a separate decomp problem; permuter handles those.

**Provenance:** decomper brief 193 (PR #640) surfaced Cluster F
empirically and documented the cascade fingerprint
(`MAX_SHIFT_BYTES` trip on TU 41 at +32 to +64 B). Brief 194
(this entry) instrumented the patcher with `--dump-shifts`,
reproduced + diagnosed the cascade as a UNIFORM LCF-virtual
shift (not structural regression), refined `MAX_SHIFT_BYTES` to
measure per-section modal deviation, and extended
[`tools/predict_walls.py`](../../tools/predict_walls.py) with a
`C-33` composite-risk detector. Full diagnosis + fix mechanism
at [`first-wave-wall-legacy-c-cascade.md`](first-wave-wall-legacy-c-cascade.md).

### C-34. Address-CSE — `.s` with explicit dual pool words

> **Wall family note — C-34 vs C-23 vs C-27.** All three are
> pool-word-related but distinct.
>
> | Wall | Pattern | Recipe |
> |---|---|---|
> | **C-23** | Multiple `ldr [pc, ...]` of NEARBY constants (e.g. 4 MMIO regs at `0x04000280/90/98/a0`) — mwcc 2.0 base-folds to 1 base + offsets. | `.legacy.c` routing (mwcc 1.2/sp2p3 lacks the base-fold peephole). |
> | **C-27** | Two C externs naming the SAME address via `symbols.txt` alias trick — produces 2 pool entries for what mwcc thinks are 2 distinct symbols. | C source declares two `extern T sym_a;` + `extern T sym_b;` and `symbols.txt` aliases one to the other. |
> | **C-34** (this entry) | Two `ldr [pc, ...]` of the SAME symbol — orig has 2 distinct pool slots; mwcc 2.0 address-CSE collapses to 1 slot + `mov rN, rM` reuse. Routing tier doesn't help (`.legacy.c` produces a totally different shape). C-27's alias trick would work in principle but requires polluting `symbols.txt`. | `.s` with explicit `.word` pool directives — bypasses BOTH mwcc's IR-CSE AND mwasmarm's literal-pool dedup. |
>
> **Quick discriminator:** read the orig pool block at the tail
> of the function. If two adjacent `.word` slots hold the SAME
> value (e.g. `.word data_X; .word data_X`), and the function
> body has two `ldr rN, [pc, #...]` pointing to those two slots
> separately → C-34.

**Target asm (`func_02023f7c`, 0x70 = 26 insns + 2 pool words):**

```text

push  {r3, r4, r5, lr}
ldr   r4, .L_POOL_A         ; r4 = &data_0219a8e4 (slot A)
mov   r5, r0
mov   r1, r4
mov   r0, #0
mov   r2, #8
bl    Fill32                ; Fill32(0, &data, 8)
ldr   r0, .L_POOL_B         ; r0 = &data_0219a8e4 (slot B)  ←
str   r5, [r0, #4]
ldr   r0, [r0]              ; r0 = data.handle
cmp   r0, #0
bne   .L_done
ldr   r1, [r4, #4]          ; r1 = data.saved_arg
mov   r0, #0x88
mul   r5, r1, r0
mov   r0, r5
mov   r1, #4
mov   r2, #0
bl    Task_PostLocked
mov   r1, r0
mov   r2, r5
mov   r0, #0
str   r1, [r4]
bl    Fill32
.L_done:
mov   r0, #1
ldmia sp!, {r3, r4, r5, pc}
.L_POOL_A: .word data_0219a8e4
.L_POOL_B: .word data_0219a8e4   ← SAME value, distinct slot

```

**mwcc 2.0/sp1p5 emits when miscoded (default `.c` routing):**

```text

push  {r3, r4, r5, lr}
ldr   r4, [pc, #92]          ; one pool word
mov   r5, r0
...
bl    Fill32
mov   r0, r4                ; ← address-CSE: r0 = r4 (no reload)
str   r5, [r0, #4]
...

```

1-instruction diff: orig emits `ldr r0, [pc, #...]` at offset
0x1c; mwcc 2.0 emits `mov r0, r4`. The function size shrinks
by 4 bytes (1 fewer pool word).

**Source coercion attempts (all failed — see brief 201):**

| Attempt | Result |
|---|---|
| Bare `extern T sym;` | mwcc IR-CSE collapses |
| `volatile T sym;` | volatile affects loads/stores, not address computation |
| Pointer alias `T *q = &sym;` after first use | mwcc CSEs across call boundaries |
| `.legacy.c` routing (mwcc 1.2/sp2p3) | Completely different shape (StyleA epilogue + sub-sp + reg swap) |
| `.legacy_sp3.c` routing (mwcc 1.2/sp3) | Same divergence as `.legacy.c` |
| `asm void` + `nofralloc` (brief 202 attempt) | Bypasses mwcc IR-CSE but mwasmarm STILL dedupes literal pool when `ldr rN, =sym` is used. Two `ldr` instructions, but both point to a SINGLE pool slot. |

**`.s` that coerces it (verified byte-identical against
`func_02023f7c`, default `.s` routing):**

```text
        .text
        .extern data_0219a8e4
        .extern Fill32
        .extern Task_PostLocked
        .global func_02023f7c
        .arm
func_02023f7c:
        stmdb   sp!, {r3, r4, r5, lr}
        ldr     r4, .L_POOL_A           ; r4 = &data (slot A)
        ...
        ldr     r0, .L_POOL_B           ; r0 = &data (slot B)
        ...
        ldmia   sp!, {r3, r4, r5, pc}
.L_POOL_A:
        .word   data_0219a8e4
.L_POOL_B:
        .word   data_0219a8e4
```

Critical details:

- **Label-based `ldr rN, label` syntax** (not `ldr rN, =sym`). The
  `=sym` macro asks mwasmarm to allocate a literal-pool slot;
  mwasmarm dedupes by VALUE. Explicit labels pointing at
  separate `.word` directives bypass dedup.
- **Two distinct labels** (`.L_POOL_A`, `.L_POOL_B`) each followed
  by their own `.word data_0219a8e4`. mwasmarm doesn't merge
  identical `.word` directives — they're treated as opaque
  data.
- **`.extern data_0219a8e4`** declares the symbol so the linker
  resolves the `.word` references.
- **No `.thumb`/`.arm_func` markers needed** — function shape is
  pure ARM with standard ABI; the `.global` + `.arm` directives
  suffice.

Verified: 3-region `ninja sha1` PASS when shipped as
`src/main/func_02023f7c.s` (brief 202 worked example).

**Use when:** orig pool block has two or more `.word` slots
holding the SAME data symbol value at distinct addresses, AND
the function body has multiple `ldr [pc, #...]` instructions
pointing to those slots separately. The
`tools/predict_walls.py` `C-34` detector flags affected picks.

**Cross-corpus survey notes:** brief 198's permuter wave
identified the wall on two clones (E-07 / E-08); both ship via
the brief 202 `.s` recipe.

| Pick | Module | Addr | Size | Symbol | Notes |
|---|---|---|---:|---|---|
| E-07 `func_02023f7c` | main | `0x02023f7c` | 0x70 | data_0219a8e4 | brief 202 worked example (this entry) |
| E-08 `func_02026fd8` | main | `0x02026fd8` | 0x70 | data_0219a8c8 | Clone of E-07 (different state symbol + multiplier). Same recipe applies; decomper brief 203+ ships. |

**Provenance:** brief 198 (PR #648) ran permuter against the
9-pick Cluster B + E worklist; E-07 / E-08 bottomed at 1-insn
diffs. Brief 201 (PR #651) confirmed the residual is mwcc 2.0
address-CSE and ruled out `volatile` + pointer alias + all
three routing tiers. Brief 202 (this entry) ruled out `asm
void` (mwasmarm's literal-pool dedup still fires), found the
`.s` + explicit-label recipe, shipped E-07 as the worked
example, and added the `tools/predict_walls.py` `C-34`
detector. Full diagnosis + recipe rationale at
[`first-wave-wall-address-cse.md`](first-wave-wall-address-cse.md).

### C-35. Routing trilemma — combined codegen walls + `.s` + patcher trim-protect

> **Wall family note — C-35 vs C-34 vs P-11.** C-35 is a
> COMPOSITE recipe wall, not a new codegen mechanism. It fires
> when a function combines multiple individually-classified
> walls (e.g. C-34 address-CSE + P-11-class reg-allocator
> divergence + strength-reduction-vs-keep-multiplication) in a
> way that no single mwcc routing tier matches:
>
> | Tier | Pool ref | Push list | Loop shape |
> |---|---|---|---|
> | `.c` (mwcc 2.0/sp1p5) | CSE → 1 slot | `{r4, lr}` | strength-reduced |
> | `.legacy.c` (1.2/sp2p3) | CSE → 1 slot | `{r4, lr}` | strength-reduced |
> | `.legacy_sp3.c` (1.2/sp3) | CSE → 1 slot | `{r4, lr}` | strength-reduced |
> | **Orig** | **2 slots** | **{r3, r4, r5, lr}** | **lsl in addressing mode** |
>
> Brief 204 swept all 15 available mwccarm variants (1.2/{base,
> sp2, sp2p3, sp3, sp4}, 2.0/{base, sp1, sp1p2, sp1p5, sp1p6,
> sp1p7, sp2, sp2p2, sp2p3, sp2p4}). None reproduce the orig's
> 4-reg push + duplicate pool + non-strength-reduced loop combo.
> The recipe is the same as C-34: pure `.s` with explicit
> `.word` pool slots — bypasses both mwcc IR-CSE AND mwasmarm
> literal-pool dedup AND, by writing assembly directly, sets
> the exact push list + loop addressing mode.

**Target asm — `func_02021b38` (brief 204 worked example):**

```text

stmdb sp!, {r3, r4, r5, lr}     ; ← 4-reg push (mwcc emits {r4, lr})
ldr   r4, .L_DATA_A             ; pool slot A
ldr   r2, .L_SIZE
mov   r5, r0
mov   r1, r4
mov   r0, #0x0
bl    Fill32
ldr   r0, .L_CFG_TABLE
ldr   r2, .L_DATA_B
ldr   r0, [r0, #0x38]
str   r5, [r2, #0xb0]
mov   r0, r0, lsl #0x10
ldr   r1, .L_DATA_A2            ; ← duplicate ref (C-34)
mov   r0, r0, lsr #0x10
str   r0, [r1, #0x4]
mov   r2, #0x0
mvn   r1, #0x0
.L_loop:
  add r0, r4, r2, lsl #0x4      ; ← non-strength-reduced (mwcc emits add #16)
  add r2, r2, #0x1
  str r1, [r0, #0x48]
  cmp r2, #0x100
  blt .L_loop
mov   r0, #0x1
ldmia sp!, {r3, r4, r5, pc}
.L_DATA_A:    .word data_02197434
.L_SIZE:      .word 0x000034a8
.L_CFG_TABLE: .word data_021040ac
.L_DATA_B:    .word data_02198434
.L_DATA_A2:   .word data_02197434

```

**`.s` recipe + patcher trim-protect.** Brief 204 also found
that `tools/patch_section_align.py`'s `trim_text_section_padding`
heuristic falsely trims `.s` files ending in reloc-placeholder
pool words. The pre-fix logic was "trim 2 bytes when `sh_size %
4 == 0` AND last 2 bytes are `0x00 0x00`" — but a trailing
`.word data_sym` reloc placeholder is `0x00 0x00 0x00 0x00`
(filled by the linker), satisfying the trigger while NOT being
mwasm padding. The fix: also check that no relocation patches
the last 4 bytes of the section. If `.rel.text` (or `.rela.text`)
has an `r_offset` in `[sh_size - 4, sh_size)`, skip the trim.

Brief 202's E-07 worked example also exhibited this trim
false-positive, but the next TU in its delinks chain
(`func_02023fec.c`, a named .c file with a specific address)
let mwldarm re-align the boundary at link time. func_02021b38's
next TU is a `_dsd_gap@main_NN.o` gap-fill (no specific address),
so mwldarm placed it contiguously after the 0x72-byte trimmed
.o → cascade-shifted the next function by 2 bytes. Brief 204's
patcher fix makes the trim safe for both cases.

**C that miscodes the wall.** Brief 203's natural-form
`.legacy.c` got 4 of 7 visible divergences right:
correct callee-saved reg choice (r4), correct mvn-for-(-1),
correct `lsl/lsr 16` halfword zero-extend, correct `bl Fill32`
position. But missed:

  - 2-reg push `{r4, lr}` vs orig's 4-reg `{r3, r4, r5, lr}`
  - Single pool slot for `data_02197434` vs orig's 2 slots
  - Strength-reduced loop `add ip, #16` vs orig's `add r0, r4,
    r2, lsl #4` in addressing mode

`.c` / `.legacy.c` / `.legacy_sp3.c` all produce variants of
"compact push + CSE pool + strength-reduced loop." Brief 204
swept all 15 mwccarm variants with the same negative result.

**Use when:** the classifier flags BOTH C-34 (duplicate pool
load) AND C-23 (≥ 3 pc-loads / clustered pool) — that's the
"this function has 5+ pool references + duplicate-target slot"
signal characteristic of combined codegen walls. Pre-routing
the function as `.s` skips brief 203's per-tier iteration
cycle.

**Cross-corpus survey notes:** brief 204's empirical scope was
`func_02021b38` only. A `predict_walls.py --version eur
--module main` full-scan against the brief-203 candidate
queue would identify other C-23+C-34 composite picks the
classifier already flags.

**Provenance:** brief 203 (PR #654) shipped 2 of 3 C-23 picks
cleanly via the brief 199 `.legacy.c` recipe + extensions. The
3rd pick (`func_02021b38`) didn't close — combined codegen
walls. Brief 204 (this entry) swept all 15 mwccarm variants
(found no single-tier match), tried the brief 202 C-34 `.s`
recipe (worked at the function level), surfaced a patcher
trim false-positive that broke the cascade-fill case, fixed the
patcher's `trim_text_section_padding` heuristic with reloc-
protection, shipped the worked example, and adds composite
classification. Full diagnosis at
[`first-wave-wall-routing-trilemma.md`](first-wave-wall-routing-trilemma.md).

## Permanent (11 patterns)

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

**SUPERSEDED BY C-27 (brief 107):** the parenthetical
"aliasing externs" speculation in this entry was tested by
brief 107 and works end-to-end. The recipe (dual-extern +
`symbols.txt` alias entry + `void * volatile *` local pointer
dance) recovers byte-identical at the project's default mwcc
2.0/sp1p5. P-7 is no longer permanent for this pattern — see
C-27 for the codified recipe + cross-corpus survey (157
duplicate-pool-pair occurrences, ~80 candidate functions).

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

**SUPERSEDED BY C-25 (brief 100):** brief 098's permuter recovery
of `func_ov000_021ac85c` discovered a source-form recipe (split
the bitfield-chain expression into two statements). Brief 100
Part 1 codified the recipe as **C-25**. P-8 is no longer
permanent for this pattern — see C-25 for the working
two-statement-source recipe.

### P-9. Conditional mvn-write `-1`: `mvnNE rN, #0` peephole absent

**Target asm (`func_020534b4` — brief 103 worked example):**

```text

stmdb sp!, {r4, lr}
mov   r4, r0
bl    helper                      ; helper(arg) → r0
cmp   r0, #0
mvnNE r0, #0                      ; r0 = -1 (NE) — direct mvn-write
andNE r0, r4, r0                  ; r0 = arg & -1 = arg (NE, masked path)
movEQ r0, #0                      ; r0 = 0 (EQ)
ldmia sp!, {r4, pc}

```

8 instructions = 0x20 bytes. The diagnostic feature is the
**`mvnNE rN, #0`** instruction — orig writes `-1` directly via
a predicated `mvn` rather than computing it through
`mov + rsb`. The subsequent `andNE r0, r4, r0` does
`arg & -1 = arg` — a no-op mask that the source's `mask`
variable provoked mwcc to emit (rather than the shorter `mov r0,
r4` that the simpler natural form produces).

**mwcc emits when miscoded** (all 90 source × SP combinations
tested — none produce `mvnNE rN, #0`):

| Source variant | Default mwcc 2.0/sp1p5 emit |
|---|---|
| natural `return helper(arg) ? arg : 0;` | `moveq r4, #0; mov r0, r4` (7 insns, byte-diff 14) |
| explicit `int mask = helper(arg) ? -1 : 0;` then `arg & mask` | `movne r0, #1; moveq r0, #0; rsb r0, r0, #0; and r0, r4, r0` (8 insns, byte-diff 10) |
| `~0` instead of `-1` | same as `-1` variant (mwcc treats them identically) |
| `if`/`else` chain | same as explicit-mask variant |
| split into 2 statements (`int r = helper(...); int mask = r ? -1 : 0;`) | same |
| inline ternary `helper(arg) ? (arg & -1) : 0` | same as natural |

**The wall mechanism:** mwcc 2.0 lowers `cond ? -1 : 0` as
"produce a {0, 1} via `movXX`, then negate via `rsb r0, r0, #0`."
mwcc never emits a direct `mvnXX rN, #0` (which would produce
`-1` predicated in one instruction). orig was likely compiled
with a different optimisation level OR a hand-written asm
fragment that produced the `mvnNE`-form directly.

**SP boundary (verified all 15 mwcc SPs, 6 source variations
× 90 compiles):**

| mwcc SP | natural | explicit-mask | recipe-equivalent |
|---|---|---|---|
| 1.2/base..sp2p3 | 0x20 score 14 | 0x28 score 10 | none |
| 1.2/sp3, sp4 | 0x1c score 14 | 0x24 score 10 | none |
| 2.0/base..sp2p4 (10 SPs) | 0x1c score 14 | 0x24 score 10 | none |

No (source, SP) combination produces `mvnNE rN, #0`. The
peephole appears absent across all 15 SPs in our toolchain.

**Resolution:** P-N **permanent for source-form pipeline**.
Future-attempt paths:

1. **`asm void` + `nofralloc`** recipe (C-12 / C-16 style) —
   write the conditional `mvn` directly in inline asm. High
   per-target cost (~10 lines of inline asm) but produces
   byte-identical output. Worth the cost when the candidate is
   ≥ 0x40 bytes / has multiple `mvnNE`-pattern instances.
2. **Permuter (brief 096 wrapper)** — let permuter discover an
   unexpected source-form. P-N classification doesn't preclude
   permuter recovery; brief 098 promoted P-8 → C-25 via
   exactly this path.

**Cross-corpus survey:** 36 unmatched functions (size 0x18-0x80)
contain a predicated `mvn rN, #0` instruction. These are the
P-9 candidate population. Worked example: `func_020534b4`
(0x20). Other notable candidates from the residue:

- `func_02037b34` (0x24)
- `func_02033488` (0x2c)
- `func_02054c0c` (0x24)
- `func_02000d4c` (0x50)
- `func_02022540` (0x40)

**NEGATIVE finding (worth flagging for future-wave selection):**
brief 097 classified ~6 of 31 medium-tier residue candidates as
"predicated-cascade walled." Brief 103's cross-corpus scan
found **281 unmatched functions** in main with the broader
predicated-cascade asm signature (≥3 sequenced conditional ops,
no intervening branch). A natural-form spot-check on
`func_02092644` (0x24 doubly-linked-list node-unlink with two
`if (cond) ... else ...` stores) produced **byte-identical
output at ALL 15 mwcc SPs**. Many of the 281 candidates are
likely not actually walled — brief 097's "predicated cascade"
classification was over-broad. Decomper's selection rule for
future waves should attempt natural form FIRST. The actually-
walled subset is identified by the **`mvnNE rN, #0`** signature
above (36 candidates).

**Brief 105 follow-up (permuter sweep on 5 of 6 named
candidates):** ran `tools/permute.py --max-seconds 300 --threads 4`
against each. Per-candidate plateau + cycle-cost:

| Candidate | Size | Baseline | Best | Iters / 300s | Outcome |
|---|---|---|---|---|---|
| `func_020534b4` | 0x20 | 305 | 305 | 2208 | **plateau** (worked example — mask form) |
| `func_02037b34` | 0x24 | 500 | 210 | 2011 | partial (volatile-temp trick) |
| `func_02033488` | 0x2c |   0 |   0 |    1 | **BASE RECOVERY** (early-return form) |
| `func_02054c0c` | 0x24 | 660 | 360 | 2021 | partial (post sig-fix) |
| `func_02022540` | 0x40 | 1255 | 565 | 1908 | partial |

**Key finding — P-9 scope refinement:** the wall applies
specifically to the **`cond ? -1 : 0` MASK pattern** that
provokes `mvnNE + andNE + movEQ`. The
**`if (cond) return -1; ... return val;` EARLY-RETURN pattern**
(used by `func_02033488`, and by inspection also
`func_02037b34`, `func_02054c0c`) compiles natively to
`mvnEQ rN, #0; popEQ {...}` at all 10 mwcc 2.0/* SPs — these
are **not** walled, they're an unrelated codegen shape that
happens to share the diagnostic `mvn rN, #0` instruction.

The 36-candidate cross-corpus pool conflated the two patterns.
For future-wave selection, the **strict P-9 subset** is
candidates where the `mvnNE` lands at the **end** of a
predicated sequence (`mvnNE; andNE; movEQ`-style mask
composition), not at the **start** (`mvnEQ` early-return → pop).
Decomper's brief 097 candidate selection rule should be
re-narrowed accordingly. `func_02033488` is the recovered
exemplar of the early-return form.

The 4 plateau / partial-recovery candidates confirm that for
the MASK form, the wall remains permanent even with permuter
exploration — the source-form transformation space does not
contain a path to `mvnNE; andNE; movEQ`. asm-void + nofralloc
(C-12 / C-16 style) is the only remaining path for those.

**Provenance:** brief 097 (decomper hand-back) flagged
predicated cascade as the 3rd-most-represented wall pattern
(~6 of 31). Brief 103 (PR #501) ran a 6-variant × 15-SP sweep
on the smallest predicated-cascade exemplar (`func_020534b4`),
discovered the mwcc-2.0-only `mvnNE rN, #0` peephole gap,
classified as **P-9** with a 36-candidate cross-corpus pool.
Negative-finding gate (per brief 100's lesson): spot-checked
`func_02092644` (also from the 281-candidate predicated-cascade
signature set) → byte-identical natural form at all 15 SPs.
Brief 097's broad classification was over-inclusive; the
actually-walled population is the 36-candidate `mvnNE`-signature
subset. Brief 105 (PR #?) ran permuter against 5 of the 6 named
strict-signature candidates (300s × 4 threads each) — 1 base
recovery (`func_02033488`, early-return form), 4 plateau
(mask form). Refines P-9 scope: the wall is specifically the
mask form; the early-return form is unrelated codegen sharing
the diagnostic `mvn` instruction. ~12 of the 36-candidate pool
are estimated early-return form (recoverable with natural
source), ~24 are mask form (true P-9 permanent).

### P-10. Over-predication of short tail vs early-return

**Target asm (`func_02037b34` — brief 109 worked example):**

```text

stmdb sp!, {r3, lr}
bl    helper                       ; helper() → r0
cmp   r0, #0x0
mvneq r0, #0x0                     ; if (r0 == 0) r0 = -1
ldmeqia sp!, {r3, pc}              ; ← EARLY RETURN on eq
ldr   r0, [r0, #0x34]              ; (unpredicated tail)
mov   r0, r0, lsl #0x10            ; zero-extend u16 via lsl 16
mov   r0, r0, lsr #0x10            ;                + lsr 16
ldmia sp!, {r3, pc}

```

9 insns = 0x24. The diagnostic is the **early-return**
(`ldmeqia` between the mvneq and the load) followed by an
UNPREDICATED tail. orig's compiler split the cmp-based decision
into "return-now-or-fall-through-linearly."

**mwcc emits when miscoded** (every variant tested at every SP —
all 75 compiles, including with `unsigned int`+`& 0xffff`,
`unsigned int`+`(short)`, `(v << 16) >> 16`, `unsigned int
volatile`, and `union {int; short}`):

```c
extern void *func_02037b04(void);
struct s { char _pad[0x34]; unsigned short f_34; };  /* OR unsigned int + mask */

int func_02037b34(void) {
    struct s *p = func_02037b04();
    if (p == 0) return -1;
    return (unsigned short)p->f_34;   /* OR p->f_34 & 0xffff */
}
```

```text

stmdb sp!, {r3, lr}
bl    func_02037b04
cmp   r0, #0
mvneq r0, #0                       ; if eq: r0 = -1
ldrne r0, [r0, #0x34]              ; ← PREDICATED tail (else continues)
lslne r0, r0, #16                  ; (or: ldrhne r0, [r0, #0x34] in u16 form,
lsrne r0, r0, #16                  ;  which collapses the lsl+lsr too)
pop {r3, pc}                       ; unconditional final pop

```

7-8 insns = 0x1c-0x20. **−0x04 to −0x08 bytes** vs target. mwcc
2.0 chose to predicate the entire tail (ldrne / lslne / lsrne)
rather than emit an early-return. The compiler's cost model
prefers predication when the predicated branch is short
(typically ≤4 insns).

**No coercion found.** Tried (6 source variants × 15 mwcc SPs =
75 compiles):

| Variant | Field type | Tail extension |
|---|---|---|
| A_natural | `unsigned short` | `(unsigned short)v` → `ldrhne` (single insn) |
| B_intmask | `unsigned int` | `v & 0xffff` → `ldrne + lslne + lsrne` |
| C_intcast | `unsigned int` | `(unsigned short)v` → `ldrne + lslne + lsrne` |
| D_lslshift | `unsigned int` | `(v << 16) >> 16` → `ldrne + lslne + lsrne` |
| E_union | `union {int; short}` | `.as_short` → `ldrhne` (single insn) |
| F_volatile | `volatile unsigned int` | `v & 0xffff` → `ldrne + lslne + lsrne` |

**Every SP predicates the tail.** None emit `mvneq + ldmeqia +
ldr + lsl + lsr` (target's early-return shape). The wall sits
in mwcc's "when to predicate vs early-return" cost decision —
inaccessible from source.

**Why permanent (today):** mwcc 2.0's predication peephole runs
post-codegen and is not exposed via any `-help` flag.
Predication-vs-early-return is a compiler-internal decision
based on instruction count + register live-range analysis. No
source-form trick observed coerces the early-return shape
when the tail body is ≤4 insns.

**Affected drops:** brief 105 / 106 `func_02037b34`. The strict
signature is "function with `mvneq r0, #0` followed by an
`ldmeqia` early-return," distinct from P-9's mask-form. Brief
105 spot-checked the `mvnEQ; popEQ` early-return form and found
it NATURAL-FORM-RECOVERABLE (the `if (cond) return -1` shape
compiles cleanly). The new wall here is when the early-return
is followed by a **multi-insn unpredicated tail** that mwcc
chooses to predicate instead of leaving as a fall-through.

**Future-attempt paths:**

1. **Permuter (brief 096 wrapper)** — brief 098's P-8 → C-25
   precedent and brief 105's P-9 sweep both showed permuter can
   sometimes find unexpected source-forms. Brief 105 already
   tried permuter on `func_02037b34` (best score 210 in 300s, 4
   threads, ~2000 iters). Worth a longer run (e.g. 1200s × 4
   threads) before final classification.
2. **`asm void` + `nofralloc`** recipe (C-12 / C-16 style) —
   write the predicated cascade replacement directly in inline
   asm. Heavy per-target cost but unblocks individual recoveries.
3. **Scope-refinement gate** — like P-9, the broader signature
   pool may include false-positives where natural form happens
   to work. Decomper's selection rule should attempt natural
   form FIRST before invoking this wall's hard skip.

**Provenance:** brief 106 (decomper hand-back) listed
`func_02037b34` as a "predicated vs early-return form mismatch"
residue candidate. Brief 109 (PR #510) ran a 6-variant × 15-SP
codegen sweep (75 compiles); no variant produces the target's
early-return shape at any SP. Classified as **P-10 — over-
predication of short tail** (sibling of P-9 mvnNE wall, but at
the predication-vs-early-return axis rather than the
mvnNE-write peephole). Permuter is the next-attempt path.

**SUPERSEDED BY C-29 (brief 111):** brief 111's permuter run
(1200s × 4 threads, 4× brief 109's budget) found the recipe at
iter ~50 — the wall coerces with `if (!p) return -1;` (unary
NOT) instead of `if (p == 0) return -1;` (equality with 0).
Both forms are semantically identical; mwcc 2.0 compiles them
to DIFFERENT control-flow shapes. P-10 is no longer permanent
for this pattern — see C-29 for the codified recipe.

### P-11. mwcc 2.0 reg-allocator plateau on mid-size helper-call functions

> **Wall family note — see also P-4, P-8, brief 198.** P-11 is
> the umbrella for mwcc 2.0/sp1p5 register-allocator
> divergences that **resist both permuter and source-shape
> iteration** at the 0x5c-0x74 size range. P-4 (r2-vs-r3 swap
> on thunks) and P-8 (r0-only vs r0→r1→r0 bit-chain) are
> narrower instances of the same family on smaller / specific
> shapes; P-11 covers the larger mid-size cohort surfaced by
> brief 198's permuter wave.
>
> **Discriminator vs C-23 / C-32 / C-33:** P-11 picks have
> NORMAL pool-load shape (1 pc-load OR 2 distinct targets, NOT
> the duplicate-pool-ref clustering C-23 fires on). They have
> NORMAL BL relocations (no `module:none` cross-overlay
> hardcodes C-32 fires on). They DON'T trigger the brief 194
> patcher cascade (their `.legacy.c` routing isn't required —
> they emit Style B `pop {pc}` epilogues natively). The wall is
> purely "mwcc 2.0 picked different callee-saved registers /
> different addressing-mode strategy than orig" — downstream
> of source-shape decisions.

**Target asm (E-12 `func_02024574`, 0x74 = 29 insns):**

```text

push  {r4, r5, r6, lr}
ldr   r1, [pc, #96]            ; r1 = &data_0219a8ec (pool word A)
mov   r4, r0                    ; r4 = arg
ldr   r5, [r1, #4]              ; r5 = data.count
ldr   r1, [pc, #88]             ; r1 = &data_0219a8ec (pool word B, SAME VALUE)
cmp   r5, #0
mov   r3, #0
ble   .L_skip
ldr   r2, [r1]                  ; r2 = data.array
.Lloop:
  ldr   r0, [r2]
  cmp   r0, #0
  beq   .L_skip
  add   r3, r3, #1
  cmp   r3, r5
  add   r2, r2, #364
  blt   .Lloop
.L_skip:
  cmp   r3, r5
  mov   r0, #0
  popge {r4, r5, r6, pc}
  mov   r2, #364
  mul   r5, r3, r2
  ldr   r6, [r1]                ; r6 = data.array (3rd r1-deref)
  add   r1, r6, r5              ; r1 = base + offset
  bl    Fill32
  str   r4, [r6, r5]
  add   r0, r6, r5
  pop   {r4, r5, r6, pc}
.word data_0219a8ec
.word data_0219a8ec             ; SAME pool value — distinct word

```

**mwcc 2.0/sp1p5 emits when miscoded (default `.c` routing):**

```text

push  {r4, r5, r6, lr}
ldr   r1, [pc, #96]            ; r1 = &data_0219a8ec
mov   r4, r0
ldr   r2, [r1, #4]              ; r2 (NOT r5) = count
mov   r3, #0
cmp   r2, #0
ble   .L_skip
ldr   r1, [r1]                  ; r1 = data.array (deref in place)
.Lloop:
  ldr   r0, [r1]
  cmp   r0, #0
  beq   .L_skip
  add   r3, r3, #1
  cmp   r3, r2
  add   r1, r1, #364
  blt   .Lloop
.L_skip:
  cmp   r3, r2
  mov   r0, #0
  popge {r4, r5, r6, pc}
  mov   r2, #364
  mul   r5, r3, r2
  ldr   r1, [pc, #20]            ; reload base (SINGLE pool word)
  ldr   r6, [r1]
  ...

```

Visible divergences:

1. **Pool count**: orig has 2 pool words (same value); built has
   1. mwcc 2.0 deduped the pool.
2. **Count register**: orig uses r5 (callee-saved), built uses
   r2 (caller-saved). mwcc 2.0 chose the cheaper register but
   would need to spill across the Fill32 call later.
3. **Cursor register**: orig uses r2 walking with `add r2, #364`;
   built uses r1 walking the same way. Choice flows from #2.

**Permuter outcome (brief 198):** 3 source variants explored
over 120 s × 4 threads, plateau at score 480. Source-level
mutations (variable renames, type juggles, reorderings) don't
reach the reg-allocator's choice. Brief 200 attempted
`volatile`-qualified field reads to defeat CSE; shifted the
shape (added a 2nd pool ref) but didn't byte-match.

**Affected picks (brief 200 survey, 5 of 9 brief 198 picks):**

| Pick | Module | Addr | Size | Best score (brief 198) | Sub-shape |
|---|---|---|---:|---:|---|
| E-12 `func_02024574` | main | `0x02024574` | 0x74 | 480 | find-empty-slot (stride 0x16c) |
| E-13 `func_020270d0` | main | `0x020270d0` | 0x74 | 485 | clone of E-12 (stride 0xe0) |
| E-14 `func_02028790` | main | `0x02028790` | 0x74 | 485 | clone of E-12 (stride 0x19c) |
| B-22 `func_0200b0c8` | main | `0x0200b0c8` | 0x5c | 500 | array destructor with in-loop bl |
| B-24 `func_ov011_021d2ca8` | ov011 | `0x021d2ca8` | 0x5c | 490 | struct field setter w/ useless-spill stack scratch |

**Recipe status: NONE** (Permanent — no source-shape iteration
yet found that reaches mwcc 2.0's reg-alloc choice). Picks in
this cohort: defer or escalate to scaffolder reg-alloc-hint
research (separate brief candidate). Future briefs may discover
a coercion that promotes this to C-N — precedent:
[C-29 supersedes P-10](#c-29-if-p-idiom-for-short-tail-early-return-supersedes-p-10),
and C-27 supersedes P-7 (see C-27's entry above).

**Recognition cue.** Detected by
[`tools/predict_walls.py`](../../tools/predict_walls.py)'s
`P-11` rule. Fires on functions with size 0x5c-0x74 + EITHER:

  - 3+ callee-saved registers in push + ≥1 `bl` + ≥2 cond
    branches (E-12/13/14, B-22 shape), OR
  - `sub sp, #N` stack-scratch prologue (N ∈ {8, 16, 20, 24, 32}) +
    ≥1 `bl` + ≥1 cond branch (B-24 shape — fewer cond branches
    because the stack-scratch pattern is the primary signal).

False-positive rate: low — the size-range + multi-callee +
helper-call combo is fairly specific. The classifier emits a
"no recipe yet" cue so downstream consumers don't waste
iterations on these picks.

**Provenance:** brief 198 (PR #648) ran permuter against 9
Cluster B + E picks; 5 plateaued at scores 480-500. Brief 200
(this entry) characterised the shared mechanism (mwcc 2.0
reg-allocator divergence at the 0x5c-0x74 size range with
helper-call-in-body), confirmed it's distinct from the
existing wall taxonomy via byte-level disasm comparison, added
the `P-11` classifier rule, and shipped the detection so
brief 201+ can pre-flag affected picks rather than burn
permuter cycles on them. Full diagnosis at
[`first-wave-wall-reg-alloc-plateau.md`](first-wave-wall-reg-alloc-plateau.md).

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

## Tooling-tractable (4 patterns)

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
  unless a source-level coercion surfaces. **(UPDATE — brief 107
  surfaced the source-level coercion: dual-extern + symbols.txt
  alias. See C-27. W-C is now coercible, not permanent.)**
- **W-D `func_ov000_021ac85c`** — bit-chain reg-alloc (P-8);
  prologue/epilogue is already sp1p5-or-sp3 ambiguous so sp3
  routing doesn't change the wall.
- **`func_0201904c`** (brief 041's provisional wall) — body
  shape (`orrhi/lslls/orrls` predicated 3-way merge vs sp3's
  2-way predicated stores). Separate C-source coercion
  problem under all three compilers.

### T-4. Overlay function symbol promotion — cross-module BL to unnamed addresses

dsd-analysis-completeness gap rather than a codegen wall.
Functions in the overlay-shared 0x021b____ region are sometimes
not identified by dsd's static analysis — the address has no
entry in any overlay's `symbols.txt`, OR is misclassified as
`kind:data(any)`. When code in a sibling overlay calls into
that address via `bl`, dsd-dis can't emit `bl <symbol>` and
falls back to `bl #<offset>` (raw relative offset, no symbol).

**Diagnostic signature** in `build/<ver>/disasm/_dsd_gap@*.s`:

```text
bl #-0x185dc
bl #+0x12a48
```

(any `bl` with a `#`-prefixed numeric operand instead of a
symbol name).

**Brief 107 cross-corpus scan:** 102 occurrences across
ov011/12/13 (90) and main (12). Aggregated to **23 distinct
target addresses**, all in 0x021b____:

| Target | Call count | Classification |
|---|---|---|
| `0x021b1434` | 17× | UNKNOWN to dsd analysis |
| `0x021b1e48` | 16× | UNKNOWN to dsd analysis |
| `0x021b13c0` | 12× | UNKNOWN to dsd analysis |
| `0x021b3138` | 8× | UNKNOWN to dsd analysis |
| `0x021b12ac` | 6× | UNKNOWN to dsd analysis |
| `0x021b375c` | 6× | UNKNOWN to dsd analysis |
| `0x021b1918` | 5× | UNKNOWN to dsd analysis |
| `0x021b1abc` | 3× | MISCLASSIFIED as data(any) in ov005 |
| ... 15 more | 1-3× each | UNKNOWN or misclassified |

**Classification:** 99 of 102 (**97%**) target an address that
isn't in any `symbols.txt`. 3 of 102 (**3%**) target an address
classified as data in one of the ranged-overlay siblings.
**Zero of 102** target a known function — so once the target
is named, mwcc will emit `bl <symbol>` and the linker patches
it. The mechanism is byte-trivial; the gap is purely the
analysis layer not finding the function symbol.

**Resolution (per-target, manual):**

1. For each of the 23 distinct addresses, identify which
   overlay's binary actually contains the code at that address
   (the address range overlaps multiple sibling overlays;
   determine by inspecting the bytes in each candidate
   overlay's extracted binary).
2. Add `func_ov<N>_<addr> kind:function(arm,size=0x<N>) addr:0x<addr>`
   to that overlay's `symbols.txt`.
3. For the 3 data-misclassified entries, change the kind from
   `data(any)` to `function(arm, size=...)`.
4. Re-run `ninja rom`. The caller's `bl #-0xN` becomes
   `bl <symbol_name>` at next dsd-dis; the link resolves
   correctly.

**Estimated unlock:** the 8 main functions containing these
unresolved BLs (`func_0201bf80`, `func_0201bfb4`, `func_0201bf8c`,
`func_0201c1bc`, `func_0201c1e0`, `func_0201c224`,
`func_0201c2a8` [5 BLs], `func_0201c6a0`, `func_0201b82c`)
should become recoverable to at least byte-trivial after the
target symbols are named. The corresponding ov011/12/13
functions (90 BLs across an estimated 15-25 caller functions)
likewise.

**Why this is a T-N, not a C-N or P-N:** the wall isn't in
mwcc's codegen — mwcc never sees these symbols, since dsd-dis
never emits source for them. The wall is in the analysis layer
that decides "what is a function?" and "what is a data
constant?" Naming the targets reveals the codegen as already-
matching (the byte at the call site is `eb<N>` either way; only
the link-resolved offset differs).

**Brief candidate** (rolled out of brief 107 — research only):
a "T-4 application" wave that enumerates the 23 addresses,
inspects bytes per candidate overlay, and adds the function
symbols. Brief 107's pre-work + the per-target classification
table above scope the task; a decomper wave of ~1 hour of
per-target lookups should clear most or all 23.

**Provenance:** brief 097 (decomper hand-back) flagged
cross-module BL as the 5th-most-represented residue pattern
(~3 of 31). Brief 107 (PR #?) scanned all overlays' disasm
for unresolved `bl #<imm>` instructions; found 102 occurrences
at 23 distinct target addresses, all classifiable as either
unknown-symbol (99) or misclassified-as-data (3). Classified
as T-4 — tooling/analysis-completeness gap, not a codegen wall.

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
| 098 / 494 | `func_ov000_021ac85c` | **C-25** (worked example) — bitfield-chain reg-alloc temp-register dance. Brief 098 recovered via permuter discovery of split-statement source form; brief 100 Part 1 codified as default-SP-only C-class recipe. | coercible (source-form, default SP) |
| 100p2 / sweep | `func_020919d8` | **C-26** (worked example) — critical-section + helper-signature mismatch; orig's helper ignores incoming r0 (overwrites from pool first instruction). Recipe: declare helper signature without args + route via `*.legacy.c`. Cross-corpus survey: 125 unmatched functions have the OS_DisableIrq/Restore pair; strict C-26 sub-population needs per-function helper-body inspection | coercible (routing + source-form, legacy.c) |
| 100p2 / sweep | `func_02034754` / `func_02095484` / `func_0208a684` / `func_02032e8c` (4 of the 125 critsec candidates) | **NEGATIVE finding** — natural-form C source byte-matches at default mwcc 2.0/sp1p5 (NOT walled). Brief 097's broad "critical-section wall" framing was over-inclusive; not all OS_DisableIrq/Restore pairs hit a coercion problem. Future single-region waves should attempt natural form first before invoking C-26's routing fix | natural-form / already-coercible |
| 103 / sweep | `func_020534b4` | **P-9** (worked example) — `mvnNE rN, #0` peephole gap; mwcc 2.0 emits `mov + rsb` for `cond ? -1 : 0` instead of direct conditional-mvn. 6-variant × 15-SP sweep (90 compiles): no source-form combination produces the orig's shape. asm-void recipe (C-12/C-16 family) is the future-attempt path | permanent (P-9, source-form pipeline; asm-void candidate) |
| 103 / sweep | `func_02092644` | **NEGATIVE finding** — doubly-linked-list node unlink with two if/else predicated-store branches; natural C byte-matches orig at ALL 15 mwcc SPs. Brief 097's "predicated-cascade" classification was over-inclusive (281 candidates have the broader signature; only the 36-candidate `mvnNE`-signature subset is actually walled) | natural-form / already-coercible |
| 103 / scan | `func_02037b34` / `func_02033488` / `func_02054c0c` / `func_02000d4c` / `func_02022540` | **P-9** (cross-corpus matches) — 36 unmatched functions contain a predicated `mvn rN, #0` instruction. These are the actually-walled subset of the 281-candidate broader predicated-cascade signature | permanent (P-9, deferred to asm-void or permuter) |
| 105 / perm | `func_02033488` | **BASE RECOVERY** — natural-form `if (!(p->f_eb4 & 1)) return -1; ... return 0;` early-return source matches byte-identical at default mwcc 2.0/sp1p5. Permuter reported `base score = 0` at iter 1, exited cleanly via `--stop-on-zero`. **P-9 scope refinement**: the wall applies to `cond ? -1 : 0` MASK form (provokes `mvnNE; andNE; movEQ`), NOT the `if (cond) return -1` EARLY-RETURN form (compiles natively to `mvnEQ; popEQ`). The two patterns share the diagnostic `mvn rN, #0` instruction but are distinct codegen shapes | natural-form recovery (early-return sub-form) |
| 105 / perm | `func_020534b4` (worked example), `func_02022540`, `func_02037b34`, `func_02054c0c` | **P-9 plateau confirmed** — 4 mask-form candidates ran 300s × 4 threads each (~2000 iters / 4 threads). Best scores: 305 (no improvement, worked example), 565, 210 (volatile-temp partial), 360 (post sig-fix partial). None reached score 0 — confirms mask-form P-9 is permanent in source-form pipeline including permuter exploration | permanent (P-9, mask form; asm-void or accept skip) |
| 107 / sweep | `func_02023fec` | **C-27** (worked example, supersedes P-7) — pool-word DUPLICATION wall; mwcc 2.0/sp1p5 dedupes pool entries, orig emits two separate `.word data_X` slots with the address cached in r4 across the BL. 8-variant × 15-SP sweep (120 compiles): variant F (dual-stash with two distinct extern symbols + `void * volatile *` local pointers + `symbols.txt` alias) byte-matches at all 10 mwcc 2.0/* SPs. End-to-end validated with build + `dsd check modules` (24/27 baseline preserved) | coercible (source-form + symbols.txt alias, default SP) |
| 107 / scan | (8 main functions + 15-25 overlay functions cross-corpus) | **T-4** (worked sample) — overlay function symbol promotion; 102 unresolved `bl #<imm>` instructions across overlays target 23 distinct addresses, 99 unknown to dsd analysis + 3 misclassified as data(any). NOT a codegen wall — pure analysis-completeness gap. Recipe: name each target in the correct overlay's symbols.txt; mwcc emits `bl <symbol>` and link resolves byte-trivially | tooling-tractable (T-4, application wave outstanding) |
| 107 / spot | `func_02021158` (cross-corpus C-27 spot-check) | NEGATIVE — natural form at mwcc 2.0/sp1p5 produces 0x30 (single pool, range-check compiled as `sub+cmp+bhi`), target is 0x38 (dual pool + literal `cmp+cmpne` chain). Confirms C-27 wall extends beyond `func_02023fec` AND identifies a SECOND wall in same function (range-check idiom). 157 cross-corpus pool-pair occurrences need a sweep wave to determine how many are C-27-recoverable vs how many carry secondary walls | C-27 (plus secondary wall on range-check) |
| 109 / sweep | `func_020338f8` | **C-28** (worked example) — predicated-cascade collapse; mwcc 2.0 combines `tst → moveq → beq` whereas orig splits via ternary intermediate. 6-variant × 15-SP sweep: variant B (explicit ternary intermediate + `result = 1` set before bl) byte-matches at all 10 mwcc 2.0/* SPs. End-to-end validated; src committed. | coercible (source-form, default SP) |
| 109 / sweep | `func_02037b34` | **P-10** (worked example) — over-predication of short tail vs early-return; 6-variant × 15-SP sweep (75 compiles) all predicate the tail (`mvneq + ldrne + lslne + lsrne`); target uses `mvneq + ldmeqia + ldr + lsl + lsr` (early return + unpredicated linear tail). Permuter is next-attempt path | permanent (P-10, source-form pipeline) |
| 109 / partial | `func_02079ddc` | **C-N partial** — `.legacy.c` (1.2/sp2p3) routing recovers prologue/epilogue + `ands` shape; 13/17 instructions match. Residue is P-4-family **r1↔r2 reg-alloc swap** on the indexed halfword load. Permuter-tractable or P-4-class permanent | partial (.legacy.c + P-4 residue) |
| 109 / partial | `func_020326d4` | **P-N candidate** — natural form at default 2.0/sp1p5 is 0x58 (target 0x50, +8 bytes over). mwcc CSE folds `base + 0x1fc` back into `[base, #0xe7c]` direct access, defeating intermediate-pointer coercion attempts (variants B/C/D/E with sub-struct casts, volatile-pointer, char* arithmetic). Permanent for source-form pipeline; static-inline helper recovers shape but adds a real bl insn | provisional P-N (CSE-of-base-pointer-arithmetic, pending permuter) |
| 109 / NEG | `func_020aac30` | Natural form is 0x50 (target 0x54, just 1 insn short). Semantics-difference wall: target stashes arg0 to STACK at [sp, #0x4] then passes `&arg0_stackslot` (i.e. `signed char **`) to the helper, while natural form caches arg0 in r4 and passes the value. Needs helper signature change to take `signed char **`. Likely C-N if helper sig refactor lands; pending separate investigation | partial (sig-change needed, brief candidate for follow-up) |
| 111 / perm | `func_02037b34` | **C-29** (worked example, supersedes P-10) — permuter @ 1200s × 4 threads found recipe at iter ~50: `if (!p) return -1;` triggers early-return shape where `if (p == 0) return -1;` (and `== NULL`, `== (void*)0`) trigger predicated cascade. Both semantically identical; mwcc 2.0 compiles them to DIFFERENT control flows. End-to-end validated; src committed. 3rd P-N → C-N permuter promotion (after P-8 → C-25 brief 098; P-9 mask form stayed permanent brief 105) | coercible (source-form idiom, default SP) |
| 111 / sweep | `func_020071c4` | **C-30** (worked example, extends C-27) — pool-DUP + shift-based bit extraction. 4-variant × 15-SP sweep: variant D (dual-extern + symbols.txt alias + `((v << 30) >> 31)` shift idiom) byte-matches at all 10 mwcc 2.0/* SPs. End-to-end validated; src committed | coercible (source-form + symbols.txt alias, default SP) |
| 111 / partial | `func_020335d4`, `func_020326d4` | 020335d4 close-but-1-insn-off (mwcc emits extra `mov r0, #0` for helper call where target leaves r0 from previous bl — C-26-style helper-sig wall). Permuter run 5964 iters / ~7 min, best plateau 225 — confirms permuter can't bridge the secondary wall. 020326d4 still hits brief 109's CSE wall (mwcc folds `base + 0x1fc` → `[base, #0xe7c]`). `!p` recipe didn't help either; both need additional source-form factors beyond C-29 | partial (C-29 + secondary wall) |
| 111 / methodology | (P-N → C-N permuter promotion rate) | After brief 111: 2 of 3 P-N permuter sweeps promoted (P-8 → C-25 brief 098; P-10 → C-29 brief 111; P-9 mask remained permanent brief 105). Recovery rate 67%. Calibration: longer budget (1200s vs brief 105's 300s) was decisive for P-10. Permuter is a valid tool for IR-lowering walls when budget is enough | (methodology data point) |

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
