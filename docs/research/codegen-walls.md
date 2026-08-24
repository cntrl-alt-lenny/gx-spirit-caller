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

## Coercible-with-knowledge (44 patterns, 4 sub-classifications)

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
> At the time, the 7 candidates were filed in the P-1
> cross-reference rows as permanent.
>
> **Update (brief 596): that "permanent" verdict was itself the
> trap — for this specific sub-shape.** All 7 addresses are
> `complete` (matched) in the current tree — they shipped in a
> later C-match wave via the natural recipe (`(u16)x` cast or
> `x & 0xffffu` mask, forwarding the truncated value as a
> *different* function's call argument), not via C-15 legacy
> routing. Brief 596 re-derived the mechanism on
> `func_ov002_0226af78` with a direct-mwcc dual-tier probe
> (2.0/sp1p5 **and** 1.2/sp2p3): compiling `(u16)arg1` or
> `arg1 & 0xffffu` as a tail-call argument produces the identical
> 28 B `.text` (sha1 `2164ac87…`) on **both** tiers, matching the
> committed/matched object exactly; compiling the shift-pair
> *literally* (`(unsigned)(arg1 << 16) >> 16`) produces a
> *different*, non-matching, 36 B `.text` (sha1 `6e1fa595…`) on
> both tiers — worse than either working idiom, not a fix. See
> the P-1 entry's own "Argument-marshalling exception" note below
> for the mechanism. **The C-15-vs-P-1 discriminator table above
> still holds** — P-1 remains permanent for Family 7's
> return-value/same-register case, re-confirmed independently by
> brief 250's own 5-idiom matrix. What was wrong was filing *every*
> `lsl K; lsr K`-bodied function under one verdict regardless of
> whether the truncated value stays in its source register (return)
> or must move to a different one (argument setup) — those are
> mechanistically different mwcc lowerings, and only the former is
> actually a wall.
>
> **Quick discriminator at the asm level:**
>
> - Target has **2 insns** that mwcc collapses to **1 insn**
>   on a halfword/byte zero-extend **and the truncated value is
>   consumed from the same register it started in** (typically a
>   return value) → **P-1**, no fix — confirmed permanent on both
>   mwcc tiers (brief 250).
> - Target has the same **2-insn** shift-pair but the truncated
>   value is being moved into a **different register** to become
>   another call's argument → **not a wall**: `(u16)x` or
>   `x & 0xffffu` both reproduce it byte-for-byte on both mwcc
>   tiers (brief 596). Do **not** route these through `*.legacy.c`
>   — the plain default-tier `.c` file already matches on every SP.
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
> | **C-34** (this entry) | Two `ldr [pc, ...]` of the SAME symbol — orig has 2 distinct pool slots; mwcc 2.0 address-CSE collapses to 1 slot + `mov rN, rM` reuse. Routing tier doesn't help (`.legacy.c` produces a totally different shape). **UPDATE (cm-parked-reaudit-1, 2026-07-25): C-27's alias trick is CONFIRMED, not just "in principle"** — see the "Distinct-symbol lever" subsection below. A plain typed-struct-member or bitfield rewrite of the SAME symbol does NOT work (mwasmarm dedupes the literal pool by symbol+addend after codegen, independent of C source form) — only genuinely giving the two access sites distinct symbol identities does. | Try the distinct-symbol lever FIRST (below); fall back to `.s` with explicit `.word` pool directives only if that fails. |
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
| Typed-struct-member access (`base->field`) instead of pointer-cast (`*(int*)(base+N)`) | **Tried and failed, cm-parked-reaudit-1 (2026-07-25).** Fixes a DIFFERENT, related wall (general CSE mismatch from `char[]+cast` styling — see cm-overlay-small-sweep, PR #1334) but does NOT split a genuine duplicate pool slot. Confirmed via a forced-register-reload diagnostic: even when mwcc is forced to emit two separate `ldr rN,[pc,#imm]` instructions (via intervening calls), both still resolve to the SAME pool slot — mwasmarm's dedup operates on symbol+addend identity, not on how many times or where the compiler loads it. |

**Distinct-symbol lever (CONFIRMED, cm-parked-reaudit-1, 2026-07-25 —
13/29 attempted candidates shipped this way, see brief doc for full
list).** The `asm`/typed-struct failures above share one root cause:
every failed attempt still asks mwasmarm to resolve the SAME symbol
name twice, and mwasmarm dedupes pool words by symbol+addend
regardless of C source form or instruction count. The fix is to make
the two access sites reference two DIFFERENT symbols that happen to
alias the same address — mwasmarm has no reason to dedup those. Two
concrete techniques, chosen by field offset:

- **Literal-address-cast, when BOTH access sites are at offset 0**
  (e.g. `((SomeType *)0x022cacc0)->field`, using the symbol's actual
  runtime address as a raw integer literal — NOT a `volatile`
  qualifier, an actual numeric-literal cast). mwcc pool-materializes a
  literal integer differently than a symbol reference, so the two
  loads land in distinct pool slots with zero linker/`symbols.txt`
  wiring. **Only works at offset 0** — cast-then-offset lets mwcc fold
  the offset into the literal itself, losing the effect. Shipped
  examples: `func_0202111c.c`, `func_02021158.c`, `func_0202142c.c`,
  `func_02023fec.c`, `func_02006950.c`, `func_ov002_022476e8.c`,
  `func_ov002_02247ad8.c` (the last two additionally needed real
  bitfield types instead of plain `&mask` expressions — a hoisted
  shared mask register otherwise defeats the pool split).
- **Registered alias, for non-zero or mixed offsets** — the general
  case, this is C-27's alias trick properly applied to a C-34 target.
  Add a second symbol name for the same address (e.g.
  `data_X_alias`) to the module's `symbols.txt` **AND** a matching
  zero-size split entry in its BSS `.s` file — **`symbols.txt` alone
  is metadata only and will link-fail**; the BSS split is what
  actually makes it a second linker-visible symbol. Mirror the
  pre-existing `data_0219a8e4_alias` / `data_0219a934_alias` pattern
  in `src/main/bss/data_main_bss.s` + `config/eur/arm9/symbols.txt`.
  Shipped examples: `func_020071c4.c` (the pre-existing C-30 worked
  example, done properly), `func_02026fd8.c` (E-08, previously this
  doc's own canonical "proven-uncrackable-by-C" exemplar — see E-07/
  E-08 note below), `func_ov001_021ca144.c`, `func_ov008_021aa94c.c`,
  `func_ov008_021adaa8.c`.

**Not a universal fix**: ~55% of the 2026-07-25 re-audit sample still
parked even with the correct lever applied, but in every one of those
cases the pool-duplicate mechanic itself was confirmed fixed — the
residual was always a separate, orthogonal register-allocation or
instruction-scheduling divergence in an unusually large/intricate
function body (one candidate, `func_ov004_021cab44`, reached 98.7% —
a single 2-word scheduling swap short). Two prior "confirmed reversal"
citations this lever's discovery was originally motivated by
(`func_ov002_02273b1c`, `func_ov011_021ca600` from cm-overlay-small-
sweep) turned out on inspection to have only ONE pool word in their
originals — they were never true C-34 cases, just misfiled. The 5
largest C-34 corpus entries (1380–3172 instructions each, e.g.
`func_ov002_021aba60/021c4c9c/021d9828/021e4ba8/0220eb00`) were
triaged as out-of-scope full-decompilation projects, not lever
applications, and weren't attempted. `func_ov002_022b595c`'s two
references are 6088 bytes apart — beyond ARM's ±4095B `ldr [pc,#imm]`
range — so its dual pool islands may be size-forced rather than
discretionary; also not attempted, flagged for a dedicated session.

Full per-candidate breakdown:
`docs/research/cm-parked-reaudit-1-2026-07-25.md`.

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
**Try the distinct-symbol lever above FIRST** (literal-address-cast
if both sites are offset-0, else a registered alias) — reach for this
raw-`.s` recipe only if that fails or the picked function is too
large/unanalyzed to safely reshape (see the 5 largest-corpus-entries
note above).

**UPDATE (cm-parked-reaudit-2, 2026-07-25):** batch 2 of the re-audit
(8/39 shipped, 20.5% — see `docs/research/cm-parked-reaudit-2-2026-07-25.md`)
confirmed the distinct-symbol lever generalizes correctly (verified via
`objdump -r` on 6+ independent candidates: literal-address-cast always
produces two genuinely distinct pool words). Every non-ship in that
batch was a SEPARATE, downstream wall the lever itself doesn't touch —
2 new ones worth trying alongside the pool-fold on future C-34 picks:

- **Persistent-base-pointer caching**: when the original visibly keeps
  a base pointer live in one register across several calls, caching it
  into an explicit named local (rather than re-deriving it inline at
  each use) can fix a register-allocation divergence downstream of a
  correctly-applied pool-fold.
- **`goto`-based branch forcing**: when mwcc predicates a small
  `if`/`else` into branchless code but the original keeps a real
  branch, restructuring via `goto` (rather than trying to coax the
  `if`/`else` form into staying unpredicated) can force the branch
  back.

Also confirmed 2 more mistagged citations (only one real pool word,
not a duplicate): `func_ov002_022a1870` (zero pool words) and
`func_ov002_021f2ca8` (one pool word). Headers corrected in both
`.s` files directly.

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

### C-36. Literal-tail trim trap — delinks-aware patcher guard

**The wall.** A function ends with a pool entry that's a small
literal (`.word 0x7fff`, `.word 0x618`, `.word 0xffff`, etc.)
whose top 2 bytes are `0x00 0x00`. There is NO relocation on
those last 4 bytes — the value IS the literal, not a symbol
ref the linker fills in. Without brief 208's fix, the patcher's
`trim_text_section_padding` (brief 204) shaves 2 bytes off the
emitted `.text` section because:

  - `sh_size % 4 == 0` ✓ (literal pool words are 4-byte aligned)
  - Last 2 bytes are `0x00 0x00` ✓ (the literal's high half)
  - No relocation in last 4 bytes ✓ (it's a literal, not a sym)

Brief 204's reloc-protection check passes (no protecting reloc
exists) so the trim still fires — corrupting the literal pool
slot and cascade-shifting every downstream byte. Brief 207
PR #660 surfaced six picks deferred for exactly this reason:

| Module | Address | Last `.word` | Trailing bytes |
|---|---|---|---|
| main | `func_02023478` | `0x7fff` | `ff 7f 00 00` |
| main | `func_020212cc` | `0x618` | `18 06 00 00` |
| ov002 | `0x021aba60` | `0xffff` | `ff ff 00 00` |
| ov002 | `0x021d9828` | `0x868` | `68 08 00 00` |
| ov002 | `0x0220eb00` | `0x868` | `68 08 00 00` |
| ov018 | `0x021ab1c4` | `0x1ff` | `ff 01 00 00` |

**The fix.** `tools/patch_section_align.py` gains a
`--delinks <path>` (repeatable) + `--source-path <path>` CLI
pair. The patcher cross-references the TU's intended `.text`
slot size from delinks.txt (`end - start`) and suppresses the
trim when `sh_size` matches. mwasm padding ALWAYS makes
`sh_size > intended_slot_size`; if they match, the trailing
zeros are literal content, not padding.

**Recipe.** Vanilla brief 202 `.s` — explicit `.word`
directives per pool slot. No workaround needed beyond shipping
under the brief 208 build (configure.py wires `--delinks` and
`--source-path` into the mwasm ninja rule automatically). Brief
207's literal-promotion workaround attempt (force the high
byte non-zero by adding bytes) overflows the next slot; it
doesn't work for cases where the literal value is needed
intact (`0x7fff` IS a 16-bit mask the function uses).

**Recognition cue.** `tools/predict_walls.py`'s
`detect_literal_tail_trim_trap` consults orig bytes + relocs:
fires when (a) function's last 4 bytes encode a value <
`0x01000000` (trailing 2 bytes == `0x00 0x00`) AND (b) no
relocation lands in the last 4 bytes. The cue spells out the
exact literal value for the decomper.

**Use when:** the classifier flags C-36 — ship as `.s` per
brief 202 recipe. Brief 208 patcher guard handles the trim
case automatically; no source-side workaround needed.

**Provenance:** brief 205 (PR #657) deferred `func_02023478`
when the literal-tail pattern broke its first ship attempt.
Brief 207 (PR #660) re-attempted post brief 204's reloc-
protect and found the literal-tail case still fails. Brief
208 (this entry) ships the patcher fix + classifier + worked
example. Full diagnosis at
[`first-wave-wall-literal-tail-trim.md`](first-wave-wall-literal-tail-trim.md).

### C-37. Bit-test / byte-zero check normalised to 0/1 via redundant-tail idiom

**The wall.** mwcc 2.0/sp1p5 collapses `(x & 1) ? 1 : 0` to
`tst r0, #1; movne #1; moveq #0; bx lr` (5 instructions). The
orig has the longer 6-instruction `lsl/lsr/movne/moveq/bx`
shape:

```asm

ldr   r0, [r0, #0x4]
mov   r0, r0, lsl #31      ; bit-0 -> bit-31
movs  r0, r0, lsr #31      ; back to bit-0, set flags
movne r0, #1               ; redundant — value already 0/1
moveq r0, #0               ; ditto
bx    lr

```

The `movne #1; moveq #0` tail is functionally redundant after
the `movs lsr #31` (which already leaves 0 or 1 in r0). mwcc
1.2 lacks the bit-test peephole, so it emits the explicit
shift-test sequence; mwcc 2.0's peephole spots `(x << N) >> N`
as a mask and collapses to `tst rN, #(1<<N)`.

Two sub-variants exist in the corpus:

  - **N=31 (bit-0 extract)** — `lsl/lsr #31`. Returns the value
    of bit 0 as 0 or 1. Only the legacy tier reaches the orig
    shape; mwcc 2.0 always collapses. Pick: `func_020a584c`
    (brief 213 wave 1).
  - **N=24 (byte-low zero check)** — `lsl/lsr #24`. Returns 1
    if the low byte is zero, else 0 (note inverted polarity:
    `moveq #1; movne #0`). mwcc 2.0 reaches the orig shape
    from the `(unsigned)(x << 24) >> 24` idiom directly — the
    bit-test peephole only fires on `N==1` (single-bit) tests,
    not 8-bit. Picks: `func_ov000_021ab6cc`,
    `func_ov000_021af5c0` (brief 213 wave 2).

**The fix.** Source idiom that defeats the bit-test peephole
under mwcc 2.0 (or works directly on either tier when N=24):

```c

int f(int *p) {
    unsigned t = (unsigned)(p[1] << 31) >> 31;
    if (t != 0u) return 1;
    return 0;
}

```

Two structural choices matter:

  1. **Shift-extract via temp** (`unsigned t = (unsigned)(x <<
     N) >> N`) — NOT `(x & mask)` or `(x & 1) ? ...`. The shift
     form leaves the compiler's analysis less able to recognise
     "this is a bit test" and skip the explicit shift emission.
  2. **`if (t != 0u) return 1; return 0;`** — NOT `return t !=
     0u;` or `return t ? 1 : 0;`. The explicit if/return forces
     mwcc to materialise the literal 0/1 with mov{cond}
     instructions rather than reusing the register value (which
     it knows is already 0 or 1).

Together these defeat both peepholes and reach the orig shape
byte-for-byte. Verified empirically across 23 source variants ×
8 mwcc revisions in brief 214's matrix (see
[`bit-test-0-or-1-idiom.md`](bit-test-0-or-1-idiom.md)).

**Recipe.**

  - **N=31** — `.legacy.c` (mwcc 1.2/sp2p3). Worked example:
    `src/main/func_020a584c.legacy.c`.
  - **N=24** — `.c` (mwcc 2.0/sp1p5) with the shift-extract
    idiom adapted for byte width:

    ```c

    int g(void) {
        int x = global_struct.field;  /* byte at offset 0x58 */
        unsigned t = ((unsigned)x << 24) >> 24;
        if (t == 0u) return 1;
        return 0;
    }

    ```

    No worked example shipped — needs the extern symbol
    structure that varies per pick; recipe documented for
    decomper to apply (brief 215+ candidate territory).

**Recognition cue.** `tools/predict_walls.py`'s `detect_walls`
matches on the function's TAIL — exact 5-word hex sequence
anchored on `bx lr` (0xe12fff1e). The detector covers all
four polarity × shift-width combinations:

| lsl word    | lsr word    | mov #1     | mov #0     | Variant                  |
|-------------|-------------|------------|------------|--------------------------|
| `e1a00f80`  | `e1b00fa0`  | `13a00001` | `03a00000` | bit-0, 1 if set          |
| `e1a00f80`  | `e1b00fa0`  | `03a00001` | `13a00000` | bit-0, 1 if zero         |
| `e1a00c00`  | `e1b00c20`  | `13a00001` | `03a00000` | byte-low, 1 if set       |
| `e1a00c00`  | `e1b00c20`  | `03a00001` | `13a00000` | byte-low, 1 if zero      |

Scope: r0 destination only (all brief 213/214 picks use r0).
Future widening to other Rd registers when surfaced.

**Use when:** the classifier flags C-37 — route to `.legacy.c`
if N=31, plain `.c` (with shift-extract idiom) if N=24.

**Provenance:** brief 213 (PR #669) shipped 3 picks as `.s`
when plain C didn't reach. Brief 214 (this entry) ran a 23
× 8 source × tier matrix on a Windows scaffolder host with
mwccarm directly invokable, found the exact source idiom under
legacy + 2.0 tiers, shipped `func_020a584c.legacy.c` as a
worked example, added the detector + tests. Full matrix at
[`bit-test-0-or-1-idiom.md`](bit-test-0-or-1-idiom.md).

### C-38. Leaf-no-pool reg-alloc + CSE divergence

**The wall.** Small leaf functions (size ≤ 0x20, no callsite,
no pool reference) doing struct-field load/store where mwcc
2.0's reg-alloc and CSE diverge from orig in two consistent
ways:

  1. **CSE collapses repeated outer-pointer deref**. When the
     source has `*w->inner` twice (e.g. once before a guard
     check, once inside), mwcc 2.0 caches into a single load
     and reuses. The orig has two explicit `ldr` instructions
     against the same `[r0, #0]` slot.
  2. **Early-return instead of predicated execution**. mwcc 2.0
     prefers `cmp + bxeq lr + <body>` (early-return); the orig
     uses `cmp + movne/strneh/ldrne` (predicated execution
     across the whole body). The two shapes differ in
     instruction count AND opcode.

Brief 215 (PR #671) attempted 8 picks (`func_0207d36c`,
`_0207db74`, `_02087d10`, `_02078ec8`, `_0207d304`, `_0207dee0`,
`_02078ed8`, `_02078eec`) as plain `.c` under mwcc 2.0 — all
failed at 0-60% fuzzy. The shapes are tiny (10-28 bytes) and
should be trivially expressible in C, but mwcc 2.0's
peepholes consistently produce a different shape than orig.

**The fix.** Brief 216's variant matrix (4 canaries × ~5
source variants × 8 mwccarm tiers) found the orig shape
reaches under `mwcc 1.2/sp2p3` (legacy tier) from these
recipe ingredients:

  1. **`void *` outer field** (NOT a typed struct pointer) +
     char-arithmetic for field access. Forces explicit
     `add rN, r0, #imm` for the substruct base instead of
     mwcc 2.0's folded offset.
  2. **Re-deref the outer pointer in the second store** rather
     than caching to a local. mwcc 1.2 doesn't apply CSE
     across the explicit re-deref; mwcc 2.0 does.
  3. **Substruct pointer cached in a named local** — keeps the
     `add rN, r0, #0x24` intermediate the orig has for
     multi-field substruct access. Use a `struct Sub`
     declaration so the field access is natural.
  4. **`volatile` annotation for side-effect-only reads** —
     defeats DCE on dummy loads. The volatile sub-variant
     ALSO reaches under mwcc 2.0 — no legacy needed.

Routes:

  - **`.legacy.c`** for picks needing predicated execution or
    CSE divergence (the common case — `func_02087d10`,
    `_0207d36c`, `_0207db74` all need this tier).
  - **`.c`** with `volatile` for the side-effect-load
    sub-pattern (`func_02078ec8` — mwcc 2.0 reaches).

**Recognition cue.** `tools/predict_walls.py`'s `detect_walls`
flags C-38 when ALL of:

  - No pool reference (no `ldr rN, [pc, #imm]`).
  - No callsite (no `bl` / `blx`).
  - ≥ 1 word load OR halfword load/store anywhere in the
    function.
  - Ends in `bx lr` (0xe12fff1e).

C-37 takes priority — if the bit-test tail is present, the
detector recommends the C-37 recipe instead. The cue text
includes the load/store count so decomper sees how
"struct-accessor-shaped" the pick is.

**Use when:** the classifier flags C-38 — try `.legacy.c`
with the substruct-ptr + char-cast + re-deref recipe (see
`docs/research/wall-2-leaf-no-pool-reg-alloc.md` for the full
variant matrix and worked examples).

**Provenance:** brief 215 (PR #671) flagged Wall 2 as the
major drain blocker on the trivial bucket (39 of 79
remaining easy-tier picks share the shape). Brief 216 (this
entry) ran the variant matrix on 4 canaries, found the
recipe reaches under mwcc 1.2/sp2p3 byte-for-byte, shipped
`func_02087d10.legacy.c` + `func_0207d36c.legacy.c` as
worked examples, added the detector + tests. Full matrix at
[`wall-2-leaf-no-pool-reg-alloc.md`](wall-2-leaf-no-pool-reg-alloc.md).

### C-39. Non-leaf C-37 — bit-0 extract wrapped in helper call

> **Status — CLOSED (brief 262).** The ov002 ≤0x80 C-39 cohort is
> ~70% drained (waves 1-4) and its hard tail is classified: NO new
> permanent wall. Sub-shapes: a/b/d/e + **C-39f** (bit0-table-index,
> gotcha 14) + **C-39g** (global-ptr-chase, gotcha 15). Brief 262
> triaged the ~28-pick hard tail and found 4 of 6 shapes coercible
> with existing levers + the new **gotcha 16** (u8-cast forces a
> redundant `& 0xff`): stride-reuse (`0220b420`/`0228abd8`,
> byte-identical — the bound derives from the live stride via mwcc's
> `add rN, stride, #K` peephole), multi-helper-`pre()` chains
> (`02294b64`, shift-form + invert-polarity), arg-bit-packing
> (`02231f4c`, gotcha 16, byte-identical), and global 3-way switches
> (`0222b2e0`, `switch`+shared-epilogue `break`, byte-identical). The
> 2 that resist (`02205c4c` weird range/mask, `0220000c` composite)
> reduce to the already-classified **P-11 CSE field-temp** (the `@2`
> field CSE'd for a range test + bit0 lands in a low reg vs orig's
> high reg) — not new walls. Remaining C-39 picks are opportunistic
> decomper cleanup, not a dedicated wave. Full triage:
> [`brief-262-c39-hard-tail-classify-and-close.md`](brief-262-c39-hard-tail-classify-and-close.md).

**The wall.** Brief 220's hard-tier survey identified 455 picks
in the unclassified slice containing the `lsl rX, rY, #31; lsr
rX, rZ, #31` bit-extract pattern (the same shape as C-37 Shape
A) but in a **non-leaf** function body — i.e. the function has
a stack frame (`push {…, lr}` entry) and at least one `bl`
helper call. C-37's tail-pattern detector only recognises the
LEAF form (lsl/lsr right before `bx lr`), so this family was
falling through to "unclassified". 20.6% of unclassified
hard-tier picks share this shape — the single biggest
recognisable slice in that bucket.

The codegen issue is the same as C-37: mwcc 2.0/sp1p5 has a
peephole that collapses `(unsigned)(x << 31) >> 31` and
`(x & 1)` to `ands #1` (or `tst #1`), but the orig has the
explicit `lsl/lsr #31` shift pair. The natural C source forms
hit the peephole; only specific source idioms bypass it.

**The fix.** Brief 218's **bitfield-struct recipe** (originally
for C-37 Shape B byte-zero check) generalises: declare the
loaded storage container as a struct with a 1-bit bitfield
covering the extracted bit position, and access via the
bitfield. mwcc 2.0/sp1p5's bitfield-extract code path emits
the canonical `lsl #N; lsr #N` shift pair instead of the
mask peephole — independently of whether the function is
leaf or non-leaf.

Canonical recipe for bit-0 of a halfword at struct offset 2:

```c

struct Self {
    unsigned short pad0;          /* offset 0 */
    unsigned short bit0  : 1;     /* offset 2, bit 0 */
    unsigned short rest  : 15;
};

extern void helper(struct Self *self, unsigned int bit);

int func_X(struct Self *self) {
    helper(self, self->bit0);
    return 1;
}

```

mwcc 2.0/sp1p5 emits:

```

push  {r3, lr}
ldrh  r1, [r0, #2]                ; halfword load (matches orig)
lsl   r1, r1, #31                 ; bit-extract (canonical shift pair)
lsr   r1, r1, #31
bl    helper
mov   r0, #1
pop   {r3, pc}

```

Three shipped worked examples (brief 222 pilot):

  - `src/overlay002/func_ov002_0223fd10.c` — canonical 5-insn
    shape (helper + return 1).
  - `src/overlay002/func_ov002_02231f2c.c` — same shape +
    literal-31 helper arg loaded before the lsl/lsr.
  - `src/overlay002/func_ov002_021f609c.c` — multi-bitfield
    variant with three different field widths (1-bit, 6-bit,
    9-bit) extracted across the function body, plus a tag
    check that emits `beq` (skip body) via natural
    `if (cond) { ... }` form.

**Sub-patterns recipe extends to:**

- Bit-extract from u32 word field (use `unsigned int bit0 : 1`
  with the right pad width — caveat: this changes the load
  from `ldrh` to `ldr`, may not match orig if orig has `ldrh`).
- Multi-bitfield extracts in the same function (declare a
  struct per halfword/word storage container, each with the
  appropriate bitfield layout — see worked example
  `func_ov002_021f609c.c`).
- Predicated execution vs explicit branch: natural
  `if (cond) { body; }` C form yields `beq + body` (matches
  orig); `if (cond) goto end; ... end:` may also work but
  isn't needed.

**Recognition cue.** `tools/predict_walls.py`'s `detect_walls`
flags C-39 when ALL of:

  - Function entry is `push {…, lr}` (non-leaf marker — lr in
    push reg list).
  - Body contains `lsl rX, rY, #31` (encoding `e1a0_?f8_?`).
  - Body contains `lsr rX, rZ, #31` (encoding `e1a0_?fa_?`).
  - Body contains a `bl` instruction.
  - C-37 has NOT already fired (the leaf tail-pattern takes
    priority — C-37 picks ship under that recipe).

**Routes:** ship as **plain `.c`** (default mwcc 2.0/sp1p5
tier) — unlike C-37 Shape A which needed `.legacy.c`, the
non-leaf bitfield recipe works under the default tier
because the bitfield code path bypasses the peephole at the
2.0/sp1p5 stage.

**Use when:** the classifier flags C-39 — declare a bitfield
struct matching the orig's load shape (halfword bitfield for
`ldrh`-loaded fields, word bitfield for `ldr`-loaded fields),
access via the bitfield, ship `.c`. Iterate on field widths
if the orig has multiple bitfields — orig's `lsl #N; lsr #M`
sequence encodes the bit position + width
(width = 32 - max(L, R), offset from L+R-32).

**Near-misses observed in pilot:**

- **Complex scheduling**: Pick 4 (`func_ov010_021b238c`, 104 B)
  matched the bit-extract shape but mwcc didn't replicate
  orig's pre-branch instruction ordering (orig schedules
  ldrsh+ldrsh+sub before the lsl/lsr; mwcc reorders).
  Probably a scheduling-not-source wall. Defer to brief 224+
  scaffolder follow-on if pattern recurs.
- **Multi-bl dispatch**: Pick 5 (`func_ov002_0222bc1c`, 396 B)
  was a switch-table with 10 helper calls. Beyond pilot scope;
  recipe would need per-case bitfield work + match the
  table-dispatch shape. Brief 224+ candidate.

**Provenance:** brief 220 (PR #681) identified the candidate
slice (455 picks). Brief 222 (this entry) ran the pilot — 3
of 5 picks shipped byte-identical under the bitfield recipe;
2 near-misses documented. Added the detector + 5 tests.
Full matrix at
[`brief-222-c39-non-leaf-bitfield.md`](brief-222-c39-non-leaf-bitfield.md).

### C-39a. Sign-check via dead-arg helper-reuse (sub-shape of C-39)

**The wall.** Within the C-39 population, a second-order shape
variation defeats the brief 222 base recipe: orig emits
`movs rX, r0; bmi .end` after a helper `bl` — semantically a
sign-test on the helper return — but mwcc 2.0/sp1p5 with the
natural source `int n = helper(...); if (n >= 0) helper2(arg);`
emits `cmp r0, #0; blt .end` instead. Same byte count, different
bytes. Brief 224's drain wave attempted the natural recipe
on this sub-shape and 24 of 25 picks reached only 84% fuzzy.

The peephole that produces `movs rX, r0; bmi` from `mov rX, r0;
cmp rX, #0; blt` requires two source preconditions:

1. **n must be live in a non-r0 register at the test site.**
   Otherwise mwcc skips the `mov` and emits `cmp r0, #0` directly.
2. **The condition must be a pure sign test (`n < 0` / `n >= 0`).**
   `n > 0` needs both Z and N flags; mwcc keeps the explicit
   `cmp` for that case (which is sub-shape C-39b).

**The fix.** Force precondition 1 by declaring helper2 to take
`n` as a second argument and call it as `helper2(arg, n)`. Even
if helper2 effectively ignores the second arg, mwcc allocates n
to r1 (the next free arg register) and peepholes
`mov r1, r0; cmp r1, #0; blt` into `movs r1, r0; bmi`.

Canonical recipe (sign-check sub-shape, single helper):

```c

struct Self {
    unsigned short bit0  : 1;
    unsigned short rest  : 15;
};
struct Outer { unsigned short pad0; struct Self f2; struct Self f4; };

extern int helper1(unsigned int bit, unsigned int other);
extern void helper2(unsigned int bit, int n);   /* note: takes n */

int func_X(struct Outer *p) {
    int n = helper1(p->f2.bit0, p->f4.bit0);
    if (n >= 0) {
        helper2(p->f2.bit0, n);     /* pass n — forces live-in-r1 */
    }
    return 1;
}

```

mwcc 2.0/sp1p5 emits (matches orig):

```

...
bl    helper1
movs  r1, r0                  ; r1 = n, set flags
bmi   .end                    ; branch if N (n < 0)
...
bl    helper2                 ; helper2(bit, n)  with r1 = n
.end:
mov   r0, #1
pop   {r4, pc}

```

**Variant — return 0 + literal-1 arg + `rsb` bit-invert.**
The same recipe extends to a `1 - p->f2.bit0` bit-invert
(produces `rsb r0, rX, #1`) and a `mov r2, #1` literal arg,
with `return 0;`. See `func_ov002_022237a0.c`.

**Three shipped worked examples (brief 226 pilot, 3/3 ship):**

- `src/overlay002/func_ov002_021f4cd4.c` — canonical 17-insn
  shape (bit0 + field9 helper1; bit0 + n helper2).
- `src/overlay002/func_ov002_021f84ec.c` — same shape, different
  helper2 symbol. This was brief 224's canary that reached 84%
  before the dead-arg trick was understood.
- `src/overlay002/func_ov002_022237a0.c` — `1 - bit0` (rsb)
  variant + u32 bitfield for the second arg + return 0.

**Recognition cue.** `tools/predict_walls.py`'s `detect_walls`
flags C-39a (in addition to base C-39) when:

- A `movs rD, r0` instruction (`e1b0_D000`, D = 1..f) appears
  AFTER the first `bl`.
- A `bmi` instruction (`4a__`) appears within 1-2 instructions
  after the `movs`.

**Routes:** ship as **plain `.c`** (default mwcc 2.0/sp1p5).
Both C-39 and C-39a fire; the C-39a hint surfaces the
dead-arg trick the decomper needs.

**Use when:** classifier flags C-39 + C-39a. Apply the base
C-39 bitfield recipe AND extend helper2's signature to take
`n` as an additional argument. The extra arg is harmless
(orig's helper2 may or may not use it; what matters is that
mwcc keeps n live in r1 for the peephole).

**Provenance:** brief 224 (PR #687) identified the sub-shape as
the major near-miss family. Brief 226 (this entry) ran the
variant matrix — 10 candidate idioms tested, only the
helper-takes-n trick locks. 3/3 picks ship byte-identical.
Detector + 5 tests added. Full matrix at
[`brief-226-c39-subclass-sign-check-helper-reuse.md`](brief-226-c39-subclass-sign-check-helper-reuse.md).

### C-39b. Helper-return reuse (sub-shape of C-39)

**The wall.** Within the C-39 population, a third sub-shape:
orig emits `mov rX, r0` (no S-suffix) after a `bl`, with rX
either (i) compared via a subsequent `cmp rX, #0; ble .end`,
(ii) passed as an argument to a subsequent helper, or (iii)
preserved across another `bl` and used in a comparison
afterwards. mwcc 2.0/sp1p5 with the natural source
`int n = helper(...); if (n > 0) helper2(arg);` emits
`cmp r0, #0; ble .end` instead (n dies in r0 because mwcc
optimises away the unnecessary copy).

This is the **non-peepholed** sibling of C-39a: `n > 0`
needs both Z and N flags (so the `mov + cmp` can't collapse
to `movs`), and helper-return-reuse keeps n live across a
second call (so it goes into a callee-saved register like
r4).

**The fix.** Same fundamental trick as C-39a: keep `n` live
in a non-r0 register by USING IT later. Three common idioms:

1. **Helper2 takes n as 2nd arg + sign-check via `n > 0`:**
   `if (n > 0) helper2(arg, n, 0, 0);` — emits
   `mov r1, r0; cmp r1, #0; ble`.
2. **Cross-call comparison (`n >= helper2(self)`):**
   `int n = helper1(...); return n >= helper2(self);` — n
   is saved in r4 (callee-saved) across helper2 because it's
   needed AFTER helper2 returns. Emits the
   `mov r4, r0; ... bl helper2; cmp r4, r0; movge/movlt`
   pattern.
3. **Helper2 takes n + no sign-check at all:**
   `int n = helper1(...); helper2(arg, n);` — emits
   `mov r1, r0` after first bl, then helper2 setup.

**Three shipped worked examples (brief 226 pilot, 3/3 ship):**

- `src/overlay002/func_ov002_021f8490.c` — classic
  `if (n > 0)` form (idiom 1). Brief 222/224 recipe shape
  (`func_ov002_021f4a00.c` is the same pattern with a
  preceding tag-check).
- `src/overlay002/func_ov002_02206454.c` — cross-call
  comparison (idiom 2). n in r4 across helper2, then
  `cmp r4, r0; movge/movlt; pop`.
- `src/overlay002/func_ov002_021f49d0.c` — no sign-check
  (idiom 3). n stored in r1 across bitfield extracts,
  passed to helper2 as 2nd arg.

**Caveat — XOR operand ordering.** Idiom 3's worked example
(`021f49d0`) extracts two bitfield bits and XORs them in the
helper2 arg. mwcc schedules bit-extracts in source-expression
order; for the orig's `lsl r0, r2, #17; lsl r2, r2, #31; ...
eor r0, r0, r2 lsr #31` sequence to match, the source must be
`p->f2.bit0 ^ p->f2.bit14` (bit0 first lexically) — the
reversed form `bit14 ^ bit0` emits the bit-extracts in the
opposite order, producing the same XOR semantically but
byte-different instructions.

**Recognition cue.** `tools/predict_walls.py`'s `detect_walls`
flags C-39b (in addition to base C-39) when:

- A `mov rD, r0` instruction (`e1a0_D000`, D = 1..4 — typical
  helper-arg / callee-saved targets) appears AFTER the first
  `bl`.

The detector intentionally restricts D to r1-r4 (the common
helper-reuse targets); broader matches would over-fire on
generic reg-to-reg copies unrelated to helper-reuse.

**Routes:** ship as **plain `.c`** (default mwcc 2.0/sp1p5).
Both C-39 and C-39b fire when applicable; the C-39b hint
surfaces the named-local + later-use trick.

**Use when:** classifier flags C-39 + C-39b. Identify which
idiom from the three above matches the orig's post-helper
pattern, and apply the corresponding source recipe.

**Provenance:** brief 224 (PR #687) locked idiom 1 in
`func_ov002_021f4a00.c`. Brief 226 (this entry) confirmed
the recipe generalises across all three idioms — 3/3 picks
ship byte-identical. Detector + tests added. Full matrix at
[`brief-226-c39-subclass-sign-check-helper-reuse.md`](brief-226-c39-subclass-sign-check-helper-reuse.md).

### C-39d. Multi-call re-read (sub-shape of C-39)

**The wall.** Brief 224 catalogued a "multi-call sequences with
no CSE on volatile fields" sub-shape: orig emits the SAME
`ldrh rX, [rY, #N]` halfword load TWICE — once before a helper
`bl` and once after — when the same struct field is referenced
on both sides of the call. Brief 224 hypothesised mwcc would
CSE the read and a special source idiom (volatile pointer,
asm clobber, function-call barrier) would be needed to defeat
the CSE.

Brief 229's variant matrix found the hypothesis was wrong:
**mwcc 2.0/sp1p5 already preserves the re-read** for narrow
struct field loads across helper calls. The compiler can't
prove the helper doesn't alias `self` (TBAA conservatism for
narrow integral loads), so it conservatively re-emits the load.

The "natural source" recipe — write the field reference twice
in the source code, no volatile, no asm — produces the orig
pattern directly.

Canonical recipe:

```c

struct Self {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct Outer {
    unsigned short pad0;
    struct Self f2;
};

extern int helper(unsigned int bit);

int func_X(struct Outer *self) {
    int a = helper(self->f2.bit0);            /* 1st read */
    int b = helper(1 - self->f2.bit0);        /* 2nd read — emits re-read */
    return (a + b) >= 4;
}

```

mwcc 2.0/sp1p5 emits (matches orig):

```

ldrh r0, [r4, #2]               ; first read
lsl/lsr #31                      ; bit0
bl   helper
ldrh r1, [r4, #2]               ; RE-READ (no CSE)
lsl/lsr #31                      ; bit0 again
bl   helper

```

**Why no CSE?** mwcc's intermediate representation treats
narrow halfword loads through pointer parameters as
potentially-aliased by intervening function calls. A pointer
escape analysis pass could prove `helper` doesn't see `self`,
but mwcc 2.0/sp1p5 doesn't run that pass. So the re-read is
emitted "by default."

This is the OPPOSITE of how brief 224 catalogued it: the
re-read is mwcc's NATURAL behaviour, not a special pattern
that needs defeating.

**Three shipped worked examples (brief 229 pilot, 3/3 ship):**

- `src/overlay002/func_ov002_02204f28.c` — two calls to the
  SAME helper with `!bit0` and `bit0` args.
- `src/overlay002/func_ov002_02200378.c` — two DIFFERENT
  helpers (helper1 then helper2) with a pool-loaded literal
  arg (`0x14f8`).
- `src/overlay002/func_ov002_02200650.c` — same helper twice
  with `bit0` and `!bit0`, plus ternary `m >= 1 ? 2 : 0` tail.

**Recognition cue.** `tools/predict_walls.py`'s `detect_walls`
flags C-39d (in addition to base C-39) when:

- Two `ldrh rX, [rY, #N]` instructions reference the SAME
  `(rY, N)` pair, with at least one `bl` between them.

The detector parses the disasm text for the `(base, offset)`
pair because ARM's halfword-load encoding splits the offset
across the instruction's nibbles, making a pure regex match
on the raw hex unreliable.

**Routes:** ship as **plain `.c`** (default mwcc 2.0/sp1p5).
No special idiom needed.

**Use when:** classifier flags C-39 + C-39d. Write the field
reference twice in source code (or use the same expression
naturally — `helper(self->f.bit0)` followed by
`helper(self->f.bit0)` works). The re-read emerges
automatically.

**Provenance:** brief 224 (PR #687) catalogued the
"multi-call no CSE" sub-shape as one of 4 second-order
variations. Brief 229 (this entry) ran the variant matrix —
the natural recipe ships byte-identical 3/3. Detector + 3
unit tests added. Full matrix at
[`brief-229-c39c-d-pilots-and-c38-nonleaf.md`](brief-229-c39c-d-pilots-and-c38-nonleaf.md).

### C-39e. Null+helper-at-top (sub-shape of C-39)

**The wall.** A late-discovered sub-shape from brief 232's drain
wave 5: orig emits `movs rN, r1; moveq r0, #0; popeq {regs, pc}`
at function start when the C tests `arg1 == 0` immediately, AND
arg1 is preserved past an intermediate helper call for use at
the function tail (typically `return helper2(self, arg1)`).

```asm

push  {r3, r4, r5, lr}
movs  r4, r1                    ; r4 = arg1, set flags from arg1
mov   r5, r0                    ; save self in callee-saved
moveq r0, #0                    ; if arg1 == 0: return 0
popeq {r3, r4, r5, pc}
... ldrh + bit-extract + bl helper1 + early-return-on-zero ...
mov   r0, r5
mov   r1, r4                    ; r1 = arg1 (restored from r4)
bl    helper2                   ; helper2(self, arg1)
pop   {r3, r4, r5, pc}

```

The `movs r4, r1` is mwcc's peepholed combo of `mov r4, r1`
(spill arg1 to callee-saved for later use) + `cmp r1, #0`
(early-test for null). Both operations fold into one
flag-setting `movs`.

**The fix.** Natural source recipe:

```c

int func(struct Self *self, int arg1) {
    if (arg1 == 0) return 0;
    if (helper1(self, ...) == 0) return 0;
    return helper2(self, arg1);
}

```

Three structural conditions:

1. `arg1 == 0` test at function top (forces early `movs r4, r1`).
2. arg1 is used past an intermediate call (forces spill to
   callee-saved r4).
3. `if (helper1(...) == 0) return 0` intermediate (matches the
   middle of the orig structure).

**Three shipped worked examples (brief 235 pilot, 3/3 ship):**

- `src/overlay002/func_ov002_0228b810.c` (64 B) — canonical
  with helper1 taking `(self, bit0)`.
- `src/overlay002/func_ov002_0228b850.c` (68 B) — variant with
  `1 - bit0` (rsb).
- `src/overlay002/func_ov002_0228b894.c` (52 B) — simplest;
  helper1 takes only `(self)`, no bit-extract.

**Recognition cue.** `tools/predict_walls.py` flags C-39e (in
addition to base C-39) when:

- `movs rD, r1` (`e1b0_D001`, D=1..f) appears in the first 6
  instructions.
- Followed in same window by `moveq r0, #0` (`03a00000`) and
  `popeq` (`08bd_8xxx` — ldmeqia sp! with PC in reg list).

**Routes:** ship as **plain `.c`** (default mwcc 2.0/sp1p5).

**Use when:** classifier flags C-39 + C-39e. Apply the natural
recipe: early-null-check + intermediate helper + final
helper-with-arg1. mwcc emits the `movs/moveq/popeq` pattern
automatically.

**Cohort size.** Brief 232 found 2 known picks (0228b810,
0228b850); brief 235 scan found 6 additional candidates of
similar shape in ov002 (021e27c0, 02206608, 0220c010, 0228ab68,
0228aba0, 0228b894). Estimated cohort: 10-20 picks across all
overlays.

**Provenance:** brief 232 (PR #699) surfaced 2 unshipped picks
with this shape during the C-39b drain wave. Brief 235 (this
entry) piloted both + 1 simpler variant — 3/3 ship byte-identical
on first attempt. Detector + 2 unit tests added. Full matrix at
[`brief-235-c39e-c40-broader-and-232-deferred.md`](brief-235-c39e-c40-broader-and-232-deferred.md).

### C-39f. Bit-0-indexed strided table lookup (sub-shape of C-39)

**The wall.** A C-39 bit-0 extract used as the index into a strided
table: `table[self->bit0]` over a byte-strided base, then a
null-guard + tail helper. Brief 255 (drain wave 1) reported it as a
resister at 43.75% with a two-part divergence — a register-allocation
miss (orig field→ip, pools→r2/r3; mine field→r2, pools→r0/r1) **plus**
a redundant `and rN, rN, #1` index mask the natural build omitted.
Brief 256 found both halves are coercible.

**Target asm (`func_ov002_02205508`, 0x40):**

```text

push  {r3, lr}
ldrh  ip, [r0, #2]            ; field → ip (NOT r2)
ldr   r2, [pc, #40]          ; stride 0x868 → r2
ldr   r3, [pc, #40]          ; base → r3
lsl   ip, ip, #31
lsr   ip, ip, #31            ; bit0 extract
and   ip, ip, #1             ; REDUNDANT (ip already 0/1) — but present
mul   r2, ip, r2            ; r2 = bit0 * 0x868
ldr   r2, [r3, r2]          ; r2 = table[bit0]  (= helper arg2)
cmp   r2, #0
moveq r0, #0
popeq {r3, pc}
bl    func_ov002_021ff3bc    ; helper(self, arg1, r2)
pop   {r3, pc}

```

**The fix (two independent levers — verified byte-identical):**

```c

struct S { unsigned short f0; unsigned short bit0:1; unsigned short rest:15; };
extern char base[];                                   /* the strided table */
extern int helper(struct S *self, int arg1, int v);   /* 3-arg: keeps r0/r1 live */

int f(struct S *self, int arg1) {
    int v = *(int *)(base + (self->bit0 & 1) * 0x868); /* `& 1` => redundant `and #1` */
    if (v == 0) return 0;
    return helper(self, arg1, v);                      /* forces index → ip, pools → r2/r3 */
}

```

1. **Reg-alloc lever — 3-arg helper `helper(self, arg1, v)`.** Keeping
   `self` (r0) and `arg1` (r1) live as the helper's first two args
   forces mwcc to spill the whole index computation into ip + r2/r3
   and land the table value in r2 (= arg2). This is the gotcha-7
   mechanism (live args push the temp). A 2-arg helper reverts to the
   brief-255 `field→r2, pools→r0/r1` miss.
2. **Redundant-mask lever — explicit `& 1` on the bitfield index.**
   mwcc faithfully emits the otherwise-redundant `and rN, rN, #1`
   after the bitfield extract. Without it, a 1-instruction gap remains.

**Falsification (brief 256):** `v0` (3-arg helper, no `& 1`) reproduces
the reg-alloc exactly but leaves the `and #1` gap; `v1` (3-arg helper +
`& 1`) is byte-identical (16/16 words). A 2-arg helper would revert the
reg-alloc — disproof would be a single source form needing neither
lever, which does not exist.

**Cohort size (~17 picks, ov002).** Brief 256 scoped 11; brief 257's
wave-2 scan found 6 more with the identical `and ip,#1; mul stride;
ldr [base, idx]` core (`0222a648`, `0220b6dc`, `0220bbd0`, `02238820`,
`02234894`, `0220e2f0`), so the census is **~17, not 11**. Original 11:
family `db973` (`02205508` / `0220c940` / `0220e108`) + relatives
`8446c` (`02206490` / `02208720`), `f030a` (`02204a68` / `0220b208`),
`46a3d` (`022958a8` / `02296f54`), `e9e9e` (`022056f0` / `0220aa64`).
All share the identical `ldrh ip; lsl;lsr; and ip,#1; mul r2,ip,r2;
ldr r2,[r3,r2]` core (confirmed on `0220c940` / `0220e108` /
`02206490`); per-pick variation is the guard polarity (`cmp #0`/`#1`) +
trailing wrappers, handled by the standard catalog. The per-pick helper
is per-overlay — confirm each `.word` / `bl` target before cloning
(brief 251 caveat).

**Routes:** plain `.c` (mwcc 2.0/sp1p5). No legacy needed.

**Provenance:** brief 255 (PR #736) filed it as a resister with diff
evidence; brief 256 (this entry) ran the variant matrix, found both
levers, and shipped the byte-identical recipe. See
[`brief-256-c39-table-index-and-overfire-scope.md`](brief-256-c39-table-index-and-overfire-scope.md)
and [recipe-gotchas.md gotcha 14](recipe-gotchas.md).

### C-39g. Global-ptr-chase reg-alloc (sub-shape of C-39)

**Coercible** (unlike the CSE field-temp residue below). A C-39 pick
that chases `global -> ptr -> field` (one or more pool/pointer
indirections) before the bit-extract, where the chase temps land in
the wrong registers. Brief 259 deferred two as resisters
(`0223ba28` 43%, `02273b54` 69%); brief 260 recovered both
byte-identical. The lever is **arg-liveness matching** (gotcha 7's
mechanism): the chase temps occupy whatever registers are NOT held by
live incoming args, so reconstruct the function's exact incoming-arg
signature and the chase lands in orig's registers.

**`0223ba28` (chase temps wanted r3/ip, mwcc gave r1/r2):**

```text

push  {r3, lr}
ldr   r3, [pc, #..]          ; &global
ldr   r3, [r3, #0x48c]       ; global->ptr   (chase, r3)
ldrh  ip, [r3, #2]           ; ptr->f2       (field, ip)
lsl r3,ip,#17; lsl ip,ip,#31; lsr r3,r3,#31; eor r3,r3,ip,lsr#31  ; bit14 ^ bit0
cmp   r0, r3                 ; r0 = arg0 (live!)
movne r0, #0; popne
bl    func_ov002_0223b864    ; helper(arg0, arg1, arg2) — args forwarded
pop   {r3, pc}

```

Recipe: the function takes `(arg0, arg1, arg2)` and tail-forwards them;
**forwarding `arg1`/`arg2` keeps r1/r2 live**, pushing the chase to
r3/ip. Without the forwarded args (`helper(arg0, 0, 0)`) the chase
lands in r1/r2 — the 43% miss. (Also gotcha 4: source `bit0 ^ bit14`
gives orig's bit14-first extract order.)

**`02273b54` (global wanted r0, mwcc gave r1):** the function takes
**no args**; the global is loaded into r0 and reused (`ldr r0, &g; ldrh
r1, [r0, #22]; ...; ldr r0, [r0]`). Declaring it `int f(void)` frees r0,
so the global lands in r0 (lowest-free) and is reused — byte-identical.
A stray live arg pushes the global to r1 (the 69% miss).

**Falsification (brief 260):** `0223ba28` v0 (forward args) byte-
identical / v2 (no forward) → r1/r2 miss; `02273b54` `void` form byte-
identical. A form that matched WITHOUT matching the orig's arg-liveness
would disprove the lever — none found; the v0-vs-v2 contrast confirms
it. Distinct from the CSE field-temp residue (P-11): there the helper's
args are all self-derived, leaving r1/r2 unavoidably free (no lever);
here the function's arg-liveness IS the lever.

**Cohort:** the two named picks (ov002); more global-chase C-39 picks
are expected in the wrapper residue. Routes plain `.c`. See
[recipe-gotchas.md gotcha 15](recipe-gotchas.md) and
[`brief-260-global-chase-class-and-predict-walls-refine.md`](brief-260-global-chase-class-and-predict-walls-refine.md).

### C-39 residue: CSE field-temp reg-alloc plateau (P-11-class)

**Not a coercible sub-shape** — a C-39 reg-alloc RESIDUE that brief 258
classified as a **P-11**-family plateau (added to the P-11 census).
Mechanism: the `@2` bitfield container is read once at function entry
and CSE'd for a range/branch test **plus** ≥2 bitfield helper-args of a
≥3-arg helper. orig holds the container in a HIGH register (r3 or r2);
mwcc 2.0/sp1p5 takes the LOWEST-FREE register (r1) at the entry `ldrh`
(only r0=self is live). Otherwise byte-identical.

**Target asm (`func_ov002_02200084`, 0x3c — field in r3):**

```text

push  {r3, lr}
ldrh  r3, [r0, #2]           ; field → r3 (orig) / r1 (mwcc)
lsl r2,r3,#20; lsr r2,r2,#26 ; b11_6 range test (scratch r2)
cmp r2,#2; bne .else
ldrh  r2, [r0]               ; self->f0 (arg2)
lsl r0,r3,#31; lsl r1,r3,#26 ; bit0 (arg0), b5_1 (arg1) — both from the field reg
lsr r0,r0,#31; lsr r1,r1,#27
bl    func_ov002_021b4098    ; helper(bit0, b5_1, f0)  — 3 args
pop   {r3, pc}

```

**Falsifiable claim:** *some source form makes mwcc keep the field in
r2/r3 with no other divergence.* **Falsified — 9 source forms (brief
258):**

| Form | Field reg | Other divergence |
|---|---|---|
| member bitfields (natural) | **r1** | none — else byte-identical |
| named `unsigned` + `>>/&` masks | r3 | extraction becomes `lsr/and` (wrong) |
| named `unsigned` + `(x<<K)>>K` | r3 | bit0 collapses to `and #1` (P-1) |
| `signed int` local | r3 | `asr` (sign-extend) |
| local bitfield-struct copy | r3 | adds `strh r3,[sp]` spill + scratch r1 |
| union word + bitfield view | r1 | (word local dead) == natural |

The two requirements conflict: **bit0-as-`lsl/lsr` needs a bitfield
(which CSEs the container to r1); field-in-r3 needs a named local
(which collapses bit0 to `and` or spills a struct copy).** No form
yields field-in-r3 cleanly. gotcha-7-resistant: the field is loaded
before any helper-arg register commits, and adding args to push the
temp higher would change the function shape (orig takes only `self`).
The permuter is the untested fall-through (cite P-11 / brief-198
precedent, not a run this session).

> **UPDATE (cm-sm64ds-lever-apply, 2026-07-25):** a 10th form —
> imported from a sibling decomp project's "fake-dependency virtual-
> call-argument coloring" lever, tested here as "declare the bitfield
> container as an eagerly-evaluated `unsigned short` local at the very
> top of the function, derive every subfield from that same local via
> `(unsigned)(x<<K)>>J` shifts, no deferred/conditional assignment" —
> **partially refutes the "no form yields field-in-r3 cleanly" claim**:
> tried on both `02200084` and `022319f4`, both land the container in
> r3 AND keep bit0 as the correct `lsl/lsr` pair (not the `and`-collapse
> the 9 prior forms hit). A NEW, different 3-word residual appears
> instead in both (a `lsl/lsr/cmp` pre-branch range-test scratch using
> r1 where target uses r2 — isolated, dead before the branch, doesn't
> touch the container/bit0/argument-computation which are now
> byte-identical). Confirmed load-bearing by controlled A/B against a
> deferred-assignment control (container reverts to r1) on BOTH
> candidates independently — not a lucky draft. Neither candidate
> shipped (`02200084`: DIFF 15v15; `022319f4`: DIFF 18v18) but the
> falsification claim above needs its "No form yields field-in-r3
> cleanly" line read as "no PREVIOUSLY-TRIED form," not exhaustive.

**Affected picks (3, ov002):** `02200084` (field→r3, deep-verified),
`02292020` (field→r2, shipped separately since this entry was
written), `022319f4` (field→r3). See the
[P-11 census](#p-11-mwcc-20-reg-allocator-plateau-on-mid-size-helper-call-functions)
and
[`brief-258-c39-cse-field-temp-and-taxonomy.md`](brief-258-c39-cse-field-temp-and-taxonomy.md).

### C-40. MMIO bit-extract -> VRAM/base address

**The wall.** Leaf functions that read a u16 from a `0x04001xxx`
MMIO register, mask a bit-field, scale via `asr+lsl` shifts,
then add a base address (typically `0x06200000` VRAM) and
return. Brief 219 deferred 4 picks (`func_0208deec`,
`_0208df40`, `_0208e1ac`, `_0208e200`) as `.s` because no C
recipe was known.

```asm

ldr   r0, .L_pool                ; pool load
ldrh  r0, [r0, #0]               ; u16 read
and   r0, r0, #MASK              ; bit-field mask
mov   r0, r0, asr #SHIFT1        ; normalise (signed shift)
mov   r0, r0, lsl #SHIFT2        ; scale to page size
add   r0, r0, #BASE              ; add result base
bx    lr
.word 0x0400100a OR 0x04001008   ; pool word — DS NDS9 register addr

```

**The fix.** Brief 233's variant matrix found the orig shape
reaches under EVERY mwccarm tier from this idiom:

```c

#define REG (*(volatile unsigned short *)0xADDR)
void *f(void) {
    return (void *)((((REG & MASK) >> SHIFT1) << SHIFT2)
                    + BASE);
}

```

Three structural elements jointly required:

  1. **Macro-wrap of the MMIO cast** (or equivalent inline
     `*(volatile unsigned short *)0xADDR`) — keeps the cast
     embedded in-expression. A named-temp form
     (`volatile unsigned short *reg = ...; v = *reg;`) flips
     mwcc's shift type from `asr` to `lsr`.
  2. **Single-expression nested shifts**: `((REG & MASK) >>
     SHIFT1) << SHIFT2`. Splitting via temps collapses the
     two shifts to one combined shift of the fused offset.
  3. **`+ BASE` direct on the shift result + cast to `void *`**
     — preserves the `add r0, r0, #0x6200000` instruction.

mwcc emits `asr` because the masked value treats the
`unsigned short` MMIO read as a signed `int` after C's
integer-promotion rules — `>> SHIFT1` on a signed int is
implementation-defined-as-arithmetic on mwccarm.

Routes through plain `.c` (mwcc 2.0/sp1p5 — no legacy needed).

**Recognition cue.** `tools/predict_walls.py`'s `detect_walls`
flags C-40 when ALL of:

  - Pool word in 0x04001xxx range (NDS9 MMIO).
  - 7-instruction body matching: `ldr [pc] + ldrh [r0,#0]
    + and + mov asr + mov lsl + add imm + bx lr`.

The cue text includes the extracted mask, asr amount, lsl
amount, and pool addr for decomper visibility.

**Use when:** the classifier flags C-40 — ship as plain `.c`
with the macro recipe above. The mask, shift amounts, and
pool address vary per pick; the recipe template is mechanical
to adapt.

**Provenance:** brief 219 (PR #682) shipped 4 picks as `.s`
("MMIO field-extract — likely closable from C but needs its
own recipe"). Brief 233 (this entry) ran the variant matrix
across 9 source variants × 8 mwccarm tiers, found the orig
shape reaches under all 8 tiers from the macro idiom, shipped
`func_0208deec.c` as the worked example, added the C-40
detector + 6 unit tests, classified the family. Full matrix
at [`mmio-bit-extract.md`](mmio-bit-extract.md).

### C-41. MMIO bit-clear + tail-call

**The wall.** Leaf functions that read an MMIO register
(typically `0x04001000` DISPCNT), clear a single bit
(`0x80000000` BG3 enable or `0x40000000` BG2 enable), write
back, then tail-call a helper with a data-symbol address.
Brief 235's broader-C-40 corpus pilot identified 4 picks
sharing this exact shape.

```asm

ldr  r2, .L_mmio          ; r2 = 0x04001000
ldr  ip, .L_helper        ; ip = &helper (reloc)
ldr  r1, [r2]             ; r1 = *MMIO
ldr  r0, .L_data          ; r0 = data ptr (reloc)
bic  r1, r1, #IMM         ; clear bit (0x80000000 or 0x40000000)
str  r1, [r2]             ; write back
bx   ip                   ; tail-call helper(data)
.word 0x04001000
.word helper
.word data

```

**The fix.** Natural source recipe:

```c

#define MMIO (*(volatile unsigned int *)0x04001000)
extern int helper(void *arg);
extern char data_symbol[];

int func(void) {
    MMIO &= ~MASK;
    return helper(data_symbol);
}

```

Three structural elements:

1. **MMIO read-modify-write through `volatile`** — produces the
   `ldr/bic/str` triple.
2. **`return helper(data_symbol)` tail call** — mwcc emits
   `bx ip` (tail-call via register loaded from pool), NOT
   `bl + pop`.
3. **External helper + external data symbol** — both go in the
   function's pool with relocations.

mwcc 2.0/sp1p5 emits the orig shape directly on first attempt.

**Four shipped worked examples (brief 235 pilot, 4/4 ship):**

- `src/main/func_0208cc18.c` (40 B) — mask 0x80000000, helper
  func_0208cd64, data 021a631c.
- `src/main/func_0208cc40.c` (40 B) — mask 0x40000000, helper
  func_0208cd64, data 021a631a.
- `src/main/func_0208ce48.c` (40 B) — mask 0x80000000, helper
  func_0208cf6c, data 021a631c.
- `src/main/func_0208ce70.c` (40 B) — mask 0x40000000, helper
  func_0208cf6c, data 021a631a.

All 4 share the recipe; only the bit-mask, helper symbol, and
data symbol vary. Mechanical to copy-adapt.

**Recognition cue.** `tools/predict_walls.py` flags C-41 when
all of:

- 7-instruction body: `ldr r2,[pc]; ldr ip,[pc]; ldr r1,[r2];
  ldr r0,[pc]; bic r1,r1,#imm; str r1,[r2]; bx ip`.
- One of the pool words is `0x04001xxx` (NDS9 MMIO range).

**Routes:** ship as **plain `.c`** (default mwcc 2.0/sp1p5).

**Use when:** classifier flags C-41 — copy the recipe template,
fill in mask + helper + data symbol from the orig disasm.
External symbols need to be declared `extern` to get pool-slot
relocations.

**Cohort size.** 4 known picks in main module. Broader
0x04001xxx pool corpus is heterogeneous (different shapes per
pick — MMIO conditional dispatch, switch tables, multi-step
read/write); each non-C-41 broader shape needs its own
per-pick recipe.

**Provenance:** brief 235 (this entry) piloted the broader
0x04001xxx pool corpus to test if C-40 recipe extends. Found
C-41 as a coherent sibling family (4/4 ship), with the
remaining broader picks being heterogeneous one-off shapes.
Detector + 2 unit tests added. Full matrix at
[`brief-235-c39e-c40-broader-and-232-deferred.md`](brief-235-c39e-c40-broader-and-232-deferred.md).

### C-42. Multi-call thunk (no special idiom; natural recipe)

**Not a wall in the traditional sense** — this is a coherent
unclassified cluster that ships under natural C with no special
idiom. Brief 237 surfaced it as the **dominant unclassified
hard-tier cluster**: 861 picks out of 1725 unclassified (50%
of unclassified, 11% of all hard-tier).

**The shape.** Small (typically 32-64 B) thunk-like functions
that call 1-3 helpers with literal arguments, struct-field
loads, or pool-loaded function/data pointers. No bitfield
extracts, no MMIO writes, no chained casts — just a sequence
of helper calls with light data shuffling.

Sub-shapes within C-42:

1. **Conditional helper2 + literal args** — `if (helper1() == 0)
   return r; return helper2(LIT1, LIT2);` (e.g.,
   `func_ov002_021b0c34`).
2. **Helper1 + field load + helper2 + field write** — `helper1(self);
   helper2(self->field); self->field = 0;` (e.g.,
   `func_ov000_021aaec4`).
3. **Two helpers with pool-loaded args** — `helper1(GLOBAL1);
   helper2(GLOBAL2);` where GLOBALs are external data symbols
   pool-loaded as abs32 relocations (e.g.,
   `func_ov010_021b2bf8`).
4. **Helper1 + helper2 + return helper1's value** — `int n =
   helper1(args); helper2(); return n;` — mwcc spills n to r4
   (callee-saved) (e.g., `func_ov000_021aae34`).
5. **Single helper + fn-pointer arg + bool-from-cmp tail** —
   `return helper(x, &fn) > 0;` — pool-loads function pointer,
   emits standard bool-from-comparison tail (e.g.,
   `func_ov002_0220868c`).

**The recipe.** Natural source code. Match the orig disasm's
call sequence + arg setup. Use:

- `extern int helper(...)` for each helper symbol
- `extern char data_xxx[]` for pool-loaded data symbols
  (relocation form)
- `extern int func_xxx(...)` for pool-loaded function pointers
- Literal integer constants for pool-loaded literal args (not
  pointers)

The pool-slot kind (data relocation vs literal constant) is
determined by inspecting the `.word` directive in the orig
disasm: relocations have `R_ARM_ABS32` annotations, literals
don't.

**Recipe-mismatch failure modes observed during pilot:**

- v1 of pick `021b0c34` used `return 0;` after the early-exit
  branch, which emitted `moveq r0, #0` (1 extra instruction).
  Fix: use `return r;` where r is the named local holding
  helper1's return value — mwcc treats r as already 0 and
  emits just `popeq`. (See file comment in
  `func_ov002_021b0c34.c`.)
- v1 of pick `021b2bf8` used `extern int g_arg1` (pointer to
  int, with implicit indirect load). Orig has the pool slot
  itself as an address, not a pointer to an address. Fix: use
  `extern char data_symbol[]` (array form) which references
  the address directly.

**Five shipped worked examples (brief 237 pilot, 5/5 ship):**

- `src/overlay002/func_ov002_021b0c34.c` (32 B) — conditional
  helper2 + literals (sub-shape 1).
- `src/overlay000/func_ov000_021aaec4.c` (32 B) — struct field
  read/write (sub-shape 2).
- `src/overlay010/func_ov010_021b2bf8.c` (32 B) — two helpers
  with pool-loaded data symbols (sub-shape 3).
- `src/overlay000/func_ov000_021aae34.c` (32 B) — helper1
  saved across void helper2 (sub-shape 4).
- `src/overlay002/func_ov002_0220868c.c` (32 B) — single
  helper + fn-pointer arg + bool tail (sub-shape 5).

**Recognition cue.** `tools/predict_walls.py` flags C-42 (as a
hint, NOT a wall warning) when:

- Function size ≤ 64 B
- ≥1 `bl` instruction (non-leaf)
- No bit-extract pattern (`lsl/lsr #31`, no C-39 family fire)
- No MMIO pool word (no C-40/C-41 family fire)
- No predicated chain (no C-1 fire)

The detector emits "natural recipe candidate — see brief 237"
as the cue, signalling to decomper that this pick is
drain-ready without special research.

**Routes:** plain `.c` (mwcc 2.0/sp1p5). No legacy needed.

**Use when:** classifier flags C-42 (as a hint). Read orig
disasm; transcribe the call sequence as natural C. Pool slots
are externs (data symbols, function pointers, or literals).
Most picks ship on first attempt.

**Cohort size.** ~861 picks in the unclassified slice match
this shape. Estimated drain rate: high (most ship first-attempt
under natural recipe), with the per-pick effort dominated by
"identify the helper signatures from disasm" rather than recipe
research.

**Provenance:** brief 220 (PR #681) surveyed the hard-tier
unclassified slice but classified it as "no known recipe."
Brief 237 (this entry) drilled into the slice, found the
dominant sub-cluster is recipe-shippable under natural source,
shipped 5 worked examples (5/5 byte-identical first-attempt),
added the C-42 detector hint. Full survey at
[`brief-237-hard-tier-landscape-survey.md`](brief-237-hard-tier-landscape-survey.md).

**Drain progress + escape classification (waves 1–6, briefs
238–250).** Cumulative C-42 drain across 6 waves: **154 picks** of
the original ~860 cohort; remaining ≈362 picks / ≈330 distinct
signatures (long-tail singletons dominate past wave ~8). The
sibling-family-first strategy (brief 247 hypothesis, brief 249
confirmation) sustains 93–94% C-yield by exhausting one disasm
signature at a time vs ~73% for random picks. As the cohort thins,
escapes are no longer "new recipes" — they are sub-shapes that carve
off C-42 into their own wall entry:

- **Wave 5 (brief 248)** surfaced 4 reg-alloc escapes; 3 locked to
  existing gotchas (12 / switch-shape / 7), 1 (**N3**) deferred.
- **Wave 6 (brief 249)** shipped 27 picks across 6 families at 93%
  yield; 2 single-pick families deferred (**Family 5**, **Family 7**).
- **Brief 250** classified all three deferrals:
  - **Family 5** (`func_ov016_021b3560` + 3 ov016/17/19 siblings) →
    carved off to **[C-43](#c-43-packed-stack-local-struct-builder)**
    (coercible; the `add r3, sp, #0` materialization reproduces
    naturally — the 69% miss was an arg-WIDTH typing trap). These 4
    picks are **C-43, not C-42**.
  - **N3** (`func_02032724`) → **[P-14](#p-14-sub-struct-base-offset-fold-in-range)**
    (permanent; mwcc folds the sub-struct offset into the access
    immediate whenever it fits the 12-bit range).
  - **Family 7** (`func_0201b690` + `func_02018dcc` + `func_02019184`)
    → the existing **[P-1](#p-1-shift-pair-vs-mask-collapse)** (byte
    zero-extend `lsl;lsr` → `and #mask`). Not a new wall.

  Full diagnosis at
  [`brief-250-c42-escape-classify-family5-n3-family7.md`](brief-250-c42-escape-classify-family5-n3-family7.md).

### C-43. Packed stack-local struct builder

> **Wall family note — C-43 vs C-42.** C-43 is a C-42 sub-shape that
> the generic C-42 hint mis-classifies: a small `sub sp, #N` (N ≤ 16)
> thunk passes the C-42 stack-frame filter, so without C-43 the
> classifier emits the bare "natural recipe" hint and the decomper
> hits the arg-width trap below. The `predict_walls.py` C-43 detector
> fires first (on `add rD, sp, #0` + `strh [sp, …]` + `bl`) and
> points at the specific recipe.

**Target asm (`func_ov016_021b3560`, 0x34 = 13 insns):**

```text

push  {r3, r4, lr}
sub   sp, sp, #12
ldr   r4, [sp, #24]        ; stack value arg A — WORD load
ldr   lr, [sp, #28]        ; stack value arg B
ldr   ip, [sp, #32]        ; stack value arg C
strh  r3, [sp]             ; local@0 = a3
add   r3, sp, #0           ; materialize &local (reuse freed r3)
strh  r4, [sp, #2]         ; local@2 = A  (truncate to u16 on store)
strh  lr, [sp, #6]         ; local@6 = B  (GAP at offset 4)
strh  ip, [sp, #8]         ; local@8 = C
bl    func_ov016_021b3498  ; helper(r0, r1, r2, &local)  (GAP at 10)
add   sp, sp, #12
pop   {r3, r4, pc}

```

A wrapper that builds a packed struct in a stack-local from its
arguments, materializes `&local`, and passes it as a helper pointer
arg. Halfword fields at offsets 0/2/6/8 with gaps at 4 and 10.

**mwcc miscoded (stack value args typed `u16`):** identical except
the three stack-arg loads become `ldrh` (halfword) instead of `ldr`
(word) — a 3-of-13-instruction delta (~69% fuzzy). The `add r3,
sp, #0` materialization is **already correct**; it was never the
blocker.

**C that coerces it (verified byte-identical against
`func_ov016_021b3560`):**

```c

typedef unsigned short u16;
struct P { u16 f0; u16 f2; u16 gap4; u16 f6; u16 f8; u16 gap10; };
extern void helper(int a0, int a1, int a2, void *p);

void f(int a0, int a1, int a2, u16 a3, int A, int B, int C) {
    struct P local;
    local.f0 = a3;            /* r3 reg arg -> strh */
    local.f2 = A;             /* int stack arg -> ldr, narrowed on strh */
    local.f6 = B;
    local.f8 = C;
    helper(a0, a1, a2, &local);
}

```

Critical detail: **the stack-passed value args are `int` (word), not
their narrow `u16` field type.** mwcc loads an incoming arg with its
declared width; declaring them `int` emits `ldr` (matching orig), and
the narrowing to `u16` happens on the `strh` store. The struct gaps
are explicit `u16` pad fields so the four writes land at 0/2/6/8.
See [recipe-gotchas.md gotcha 13](recipe-gotchas.md).

**Routes:** plain `.c` (mwcc 2.0/sp1p5). No legacy needed.

**Cross-corpus survey:** 4 picks, byte-identical 13-insn body (differ
only by the helper symbol each calls). One recipe drains all 4.

| Pick | Module | Helper |
|---|---|---|
| `func_ov016_021b3560` | ov016 | `func_ov016_021b3498` |
| `func_ov016_021b5154` | ov016 | `func_ov016_021b509c` |
| `func_ov017_021b405c` | ov017 | `func_ov017_021b3fa4` |
| `func_ov019_021b3f00` | ov019 | `func_ov019_021b3e38` |

**Provenance:** brief 249 (PR #725) piloted `func_ov016_021b3560` at
69% fuzzy with explicit gap fields and deferred Family 5; brief 250
(this entry) ran the variant matrix, found the arg-width coercion,
shipped the classifier + gotcha 13.

### C-44. Switch/dispatcher body order must mirror source (address) order

> **Wall family note — orthogonal to C-24/P-16.** Those are about
> *which* pool word or addressing mode mwcc picks. C-44 is about
> *where in `.text` mwcc places each case body* for a multi-case
> `switch` lowered to a jump table (`addls pc, pc, rN, lsl #2`). It
> hits any dispatcher-shaped function with 3+ non-trivial case
> bodies, regardless of what the bodies themselves do — a pure
> control-flow-layout issue, not a data/addressing one.

**Discovered:** brief 593, both fresh targets
(`func_ov002_022461d8`, 1020 B, 34-way event-notify dispatcher;
`func_ov002_021b4684`, 1248 B, kind-gated card-id membership
predicate) hit this independently and identically.

**The wall.** mwcc lays out a jump-table switch's case **bodies** in
**source (case-label) order** — not ascending case-value order, and
not any other automatic sort. The jump **table** itself is always
correctly indexed by case value (that part is automatic and never
wrong), but every `b` entry in it points at wherever the
corresponding body actually landed in `.text`, so if the bodies are
ordered differently than the original, every jump-table target
offset past the first body comes out wrong — even though the logic
inside each body is byte-identical. Because one switch's case order
is wrong, this cascades: register allocation and even the function's
own prologue (which callee-saved registers get pushed) can shift
too, since the compiler's whole-function analysis sees a differently
laid-out control-flow graph.

**Symptom:** writing case labels in the natural/obvious order (case
value ascending, e.g. `case 1: ... case 2: ... case 3:`) when the
original's *disassembly* lays the bodies out in some other order
(reconstructible from each body's label **address**, e.g.
`.L_c4` @ 0xc4, `.L_d0` @ 0xd0, `.L_e8` @ 0xe8 — read the address,
not the case value it handles) produces a diff where:

- The **prologue** may already differ (`DIFF_REPLACE` on `stmdb`) —
  a register-pressure symptom of the wrong body order, not its own
  separate wall; don't chase routing tier (`.legacy.c` /
  `.legacy_sp3.c`) on this diff alone, see below.
- Every `b`/branch target inside the jump table shows
  `DIFF_ARG_MISMATCH` (same mnemonic, wrong offset) from roughly the
  second case body onward.
- Match percentage lands in the 10-25% range even though the C is
  semantically 100% correct — this is a pure layout bug, not a
  comprehension bug, and no amount of lever-hunting on individual
  case bodies fixes it.

**The fix.** Walk the `.s` file's body labels (`.L_XXXX:`) in the
order their **addresses** increase, note which case value each one
handles (from the outer jump table's `b .L_XXXX` list — remember the
`addls pc, pc, rN, lsl #2` pipeline offset: the entry for value 0 is
the **second** `b` after the `addls`, not the first; the first `b`
is the out-of-range/`hi` fallback), then write the C `switch`'s case
labels in **that** order instead of ascending case value. Nested
nested/nested switches (a sub-dispatch reached via `default:` or a
grouped case list) need the same treatment recursively — their own
inner case order must match their own body's address order too.

**Effect (this brief, before -> after, same C logic, only case order
changed):**

| Target | Before (ascending case value) | After (body-address order) |
|---|---|---|
| `func_ov002_022461d8` (34-way) | 14.9% | 58.4% (default tier) / 69.0% (`.legacy.c`) |
| `func_ov002_021b4684` (6-way kind dispatch) | 24.1% | 74.7% (default tier) |

Routing tier (`.legacy.c` / `.legacy_sp3.c`) is a **secondary** lever
to try only *after* body order is fixed, not before — trying it on
the wrong-order diff produced noise (a few points either way) that
looked like signal but wasn't; the real jump was always the
reordering. On `func_ov002_022461d8` `.legacy.c` gave a further
+10.6 points on top of the reordering fix; on `func_ov002_021b4684`
`.legacy.c` made things dramatically *worse* (74.7% -> 23.0%),
confirming tier choice is genuinely per-function and must be
re-checked after every structural fix, not assumed to transfer.

**Not fully resolved by this lever alone:** neither target reached
100% in brief 593 — both plateaued with correct structure (body
order, control flow, all case values, all literal constants
verified) but a residual register-allocation-level gap (same
instruction, different register; a handful of literal-pool ordering
differences). `suggest_coercion.py`'s C-1 (predicated-execution)
rule fired on `func_ov002_021b4684` at LOW confidence; applying it
(replacing scattered `return` statements with a single flag +
one final `return`) made the match **worse** (74.7% -> 44.6%), not
better — reverted. Whether the remaining gap is a genuine wall or a
still-undiscovered lever is open; see
[`brief-593-ceiling-r3.md`](brief-593-ceiling-r3.md) for the full
diff evidence on both targets.

**Provenance:** brief 593 (this entry). Both targets independently
selected from a 69-candidate jump-table-shaped census in the 900-1500
B band (`main` + `ov002`); see the brief doc for the full candidate
list — the census itself is reusable for future waves once this
lever is applied from the start.

> **Scope broadened (cm-ov002-unknown-sweep-13):** this also applies
> to plain `cmp`/`beq`-chain switches with **no jump table at all**,
> not just jump-table-lowered ones — 2 independent batches hit the
> identical source-order-not-value-order body placement on non-jump-
> table dispatchers in the same round. Don't assume this lever is
> jump-table-specific just because the discovery brief was.

### C-45. `switch` over a small contiguous case range can avoid mwcc's range-fold

> **Corrects a bulk mis-stamp, not a specific prior citation.**
> `func_ov002_022abf88` carried only the generic "GLOBAL_ASM endgame"
> mechanical bulk stamp (brief 294/302 — "reg-alloc-walled, no C match
> attempted"), never an individually-reasoned wall entry. This C-N
> documents the lever that disproves the bulk stamp's implicit
> "unfixable" claim for this shape, so future sweeps try it before
> accepting the bulk stamp at face value (see the queue header's brief
> 651 rework note on why the bulk stamp is not per-function proof).

**Target (`func_ov002_022abf88`, cm-ov002-unknown-sweep batch 3):**
original disassembly checks a value against 3 contiguous constants
(`0x4b`/`0x4c`/`0x4d`) with an explicit compare chain:

```text

cmp   r2, #0x4b
cmpne r2, #0x4c
cmpne r2, #0x4d
bne   .L_bcc

```

**The apparent wall:** a small contiguous-value dispatch looks like
exactly the shape mwcc's optimizer would normalize into a
range-check (`sub`+`cmp #2`+`bhi`) instead of a literal compare chain —
worth checking before assuming a plain C `switch` can ever reproduce
this, since a folded range-check would never byte-match a compare
chain.

**The fix:** a plain C `switch` over the 3 contiguous case values
(falling through to a shared `return`) reproduced the compare chain
byte-for-byte under the default 2.0/sp1p5 tier — mwcc did **not** fold
it. No range-check was emitted; try `switch` first rather than
assuming the range-fold is automatic.

```c

switch (-self->f4) {
case 0x4b:
case 0x4c:
case 0x4d:
    return self->f70[idx];
}
return func_ov002_021afbd4(self->f68[idx]);

```

This is at least the 8th confirmed instance (2 here + 6 from
`cm-overlay-small-sweep`, PR #1334) of the GLOBAL_ASM bulk stamp
masking a real, simple C match — see C-44's sibling note above and
[`cm-overlay-small-sweep-2026-07-24.md`](cm-overlay-small-sweep-2026-07-24.md).

**Provenance:** cm-ov002-unknown-sweep (PR #1363), batch 3.

### C-46. Explicit `(unsigned)` cast preserves a logical shift when mirroring a global bitfield read

> Same "corrects a bulk mis-stamp" caveat as C-45 — `func_ov002_021e2cd4`
> also carried only the generic GLOBAL_ASM bulk stamp, not a specific
> prior wall citation.

**Target (`func_ov002_021e2cd4`, cm-ov002-unknown-sweep batch 3):**
original reads one bit out of a global 32-bit field at a
register-supplied bit index with a **logical** shift:

```text

ldr r2, [pc, #...]     ; &data_ov002_022d016c
ldr r2, [r2, #0xd0]
mov r2, r2, lsr r5      ; LOGICAL shift — lsr, not asr
and r2, r2, #0x1

```

**The apparent wall:** natural C for "shift then mask one bit"
(`(field >> bit) & 1`) on an `int`-typed field emits an **arithmetic**
shift (`asr`) once mwcc can't prove the value non-negative — silently
wrong for the top bit, and the resulting diff (right instruction
family, wrong variant) reads like a deep register-allocation issue
rather than a one-cast fix, encouraging bulk classification as
permanent.

**The fix:** cast to `unsigned` before shifting:

```c

if (val == (((unsigned)D016C->f_d0 >> bit) & 1)) return;

```

forces mwcc to emit `lsr`, matching the original exactly. Same family
as C-30 (pool-dup + shift-based bit extraction) but the trigger here
is shift-family choice (`lsr` vs `asr`) from field signedness, not
pool deduplication — check this first on any single-bit-out-of-a-
global-field read that mismatches only in the shift instruction.

**Provenance:** cm-ov002-unknown-sweep (PR #1363), batch 3.

**Extension (cm-ov002-unknown-sweep-4, 2026-07-27): applies to `u16`
fields too, not just `int`.** C promotes `unsigned short` to signed
`int` before a shift, so a plain `u16_field >> N` can still emit `asr`
even though the field's full 0-65535 range is non-negative — the same
`(unsigned)` cast fix applies. Found independently while shipping
`func_ov002_02242ea8` (cm-ov002-unknown-sweep-4 batch 1).

**Extension 2 (cm-ov002-unknown-sweep-4): the underlying shift-pair
lever generalizes past 13-bit widths.** The 13-bit-id-via-bitfield
finding from the prior sweep (mwcc folds a manual `(x<<19)>>19` into a
pool-constant AND unless read through a real C bitfield) is not
specific to 13 bits — batch 1 confirmed the same collapse-unless-
bitfield-or-shift-pair behavior at 6-bit, 8-bit, and 9-bit widths.
When the original shows two plain shift instructions (no `and`), write
the extraction as `((unsigned)(x << L)) >> R` with the original's exact
shift amounts, not `(x >> N) & MASK` — the mask form gets folded
regardless of field width.

### C-47. ARM jump-table dispatch reads `pc` as own-address+8 — index 0 is the table's SECOND row

**The trap:** an `addls pc,pc,idx,lsl#2`-style computed-branch reads
`pc` as its own address **plus 8** (ARM's pipeline-fetch convention),
not the address immediately after the instruction. The jump table's
physical first row — sitting right after the dispatch instruction in
memory — is therefore a dead pad the dispatch instruction itself
occupies the slot for; `idx == 0` actually targets the table's
**second** row.

**The failure mode:** hand-deriving a `switch`'s case values from such
a table without accounting for this produces an off-by-one in every
single case value — not a crash, just silently wrong dispatch targets,
which reads as a deep structural mismatch (very low match%) rather than
the one-line indexing error it actually is.

**The fix:** when reverse-engineering a jump table feeding
`addls pc,pc,...`, read the table starting one row past the dispatch
instruction's own address, or equivalently subtract 1 from every
hand-derived case value before writing the `switch`.

**Evidence:** `func_ov002_02256150` (cm-ov002-unknown-sweep-5, batch 2)
went from 8.6% to 83.3% match on this single fix, with the residual
after the fix being an unrelated register swap. Check any low-match
`switch`/jump-table candidate for this specific pattern before assuming
the mismatch is deep structural or register-allocation-related.

**Provenance:** cm-ov002-unknown-sweep-5 (2026-07-29), batch 2.

### C-48. Return a call's result directly, not a fresh literal, to elide a redundant `mov r0,#0`

**The pattern:** when a function calls another function, compares the
result to a constant (commonly `0`), and returns that same constant on
an early-exit path, mwcc can tell the register already holds the right
value and skips re-materializing it — but only if the C source returns
the **variable holding the call's result**, not a fresh literal.

```c

int r = some_call(...);
if (r == 0) return r;      /* mwcc sees r0 already == 0, elides the mov */
/* NOT: if (r == 0) return 0; -- forces a redundant mov r0,#0 */

```

**Why it matters:** the literal form isn't wrong, it's just byte-
different — an extra `mov r0,#0` before the conditional `pop` that the
original doesn't have, which shows up as a clean single-instruction
diff and can look like a deeper register-allocation issue if the cause
isn't obvious.

**Evidence:** independently found and applied by 3 of 5
cm-ov002-unknown-sweep-5 batches on unrelated functions —
`022521ac` (10%→67.6%, batch 4), and corroborating fixes in batch 3
(`02251bb0`, `02253304`) and batch 2. Independent triple-confirmation in
one sweep is unusually strong evidence for a lever this specific.

**Provenance:** cm-ov002-unknown-sweep-5 (2026-07-29), batches 2/3/4.
Reconfirmed cm-ov002-unknown-sweep-6 (2026-07-30), batches 1/2 (applied
twice on `021d9144` alone).

### C-49. Bitfield storage type must match the value's real in-memory width

**The trap:** a `struct { unsigned int val:9; ... }` bitfield backing a
value that's actually stored as a 16-bit halfword in memory compiles to
a 4-byte `ldr`, not the correct 2-byte `ldrh` — purely a function of the
bitfield's **declared storage type** (`unsigned int` vs `unsigned
short`), independent of the field widths used inside it. The narrower
field width alone doesn't force the narrower load.

**The fix:** declare the backing type as `unsigned short` (or the
correct real width) when the underlying storage genuinely is that
width, even if every individual bitfield inside it is narrower.

**Evidence:** took 2 functions straight to 100.0% —
`func_ov002_022099cc`, `func_ov002_0221dd08`
(cm-ov002-unknown-sweep-6, batch 1).

**Provenance:** cm-ov002-unknown-sweep-6 (2026-07-30), batch 1.

### C-50. A callee's declared return type can hide a truncation the original performs

**The trap:** if a called function's prototype declares a narrow return
type (e.g. `u16`), mwcc can prove the returned value's range and elide
a truncation instruction the original binary actually performs on the
wider raw result — even though the callee's real ABI-level behavior
(what ends up in r0) is identical either way.

**The fix:** widen the callee's declared return type to `int` (matching
what the register actually holds, not the narrowest type that's
semantically sufficient) to force mwcc to emit the same truncation
instructions as the original.

**Evidence:** `func_ov002_02220340` (cm-ov002-unknown-sweep-6, batch 2)
— widening a core.h-declared sink's return type from `u16` to `int`
reproduced a truncation instruction the narrower prototype had elided.

**Provenance:** cm-ov002-unknown-sweep-6 (2026-07-30), batch 2.

### C-51. Duplicate a shared load per-branch; don't manually pre-hoist it

**The trap:** when both arms of an `if`/`else` need the same value,
manually hoisting it into one shared local declared before the branch
can produce a *worse*-matching register allocation than writing the
load out twice, once per branch, and letting mwcc's own common-
subexpression optimizer do the hoisting itself.

**The fix:** try the "naively duplicated" source form first for
per-branch shared loads; only pre-hoist if the duplicated form doesn't
match.

**Evidence:** `func_ov002_0222c48c` (cm-ov002-unknown-sweep-6, batch 2)
— manual hoisting into a shared local produced a worse allocation than
per-branch duplication in this specific case.

**Provenance:** cm-ov002-unknown-sweep-6 (2026-07-30), batch 2.

### C-52. `unsigned char` cast, not `&0xff` mask, selects AND+ORR-shift over a double-shift for byte-packing

**The trap:** for packing/unpacking a byte into a larger word, an
explicit `unsigned char` cast and a literal `&0xff` mask are NOT
interchangeable despite being semantically identical — one selects an
`and`+`orr`-with-shift instruction sequence, the other a double-shift
sequence. Picking the wrong one for a given target shows up as a
byte-identical-looking-logic diff that reads as a deeper issue.

**The fix:** if the original uses `and`+`orr`(shift) for a byte-pack,
use an explicit `(unsigned char)` cast on the value rather than a
manual `& 0xff` mask expression, or vice versa if the original shows a
double-shift.

**Evidence:** `func_ov002_022018cc`, `func_ov002_02243d28`,
`func_ov002_022088ec` (cm-ov002-unknown-sweep-6, batch 5) — all three
required the cast form specifically, the mask form byte-differed.

**Provenance:** cm-ov002-unknown-sweep-6 (2026-07-30), batch 5.

### C-53. Literal C `%` operator, not hand-expanded subtraction, matches mwcc's magic-number modulo codegen

**The trap:** mwcc lowers a constant-divisor `%` into a specific
magic-number-multiply sequence (frequently a double `smull`). Manually
expanding the same arithmetic as `x - (x / N) * N` does NOT reliably
reproduce that exact instruction sequence, even though it's
mathematically identical and even when the hand-expanded division uses
the same magic-number technique.

**The fix:** write `x % N` directly and let mwcc's own lowering run,
rather than hand-transcribing the divide-multiply-subtract expansion
from the disassembly.

**Evidence:** `func_ov008_021afa34` (cm-ov002-unknown-sweep-7, batch 2)
— literal `%` matched mwcc's literal double-`smull` codegen exactly;
the hand-expanded form the worker tried first did not.

**Provenance:** cm-ov002-unknown-sweep-7 (2026-07-30), batch 2.

### C-54. Explicit XOR-then-compare-zero can select `teq` over `cmp`

**The trap:** for an equality test between two values, a plain `==`
comparison compiles to `cmp`; if the original uses `teq` (test
equivalence — computes the same true/false result via XOR internally
without materializing a destination register), a natural `==` won't
reproduce it.

**The fix:** write the comparison as an explicit XOR against zero
(`(a ^ b) == 0` rather than `a == b`) to nudge mwcc toward emitting
`teq` instead of `cmp`.

**Evidence:** `func_0200a704` (cm-ov002-unknown-sweep-7, batch 2).

**Provenance:** cm-ov002-unknown-sweep-7 (2026-07-30), batch 2.

### C-55. Branch-to-block polarity: `goto`/inverted-condition, not natural if/else-if, when the target branches to a case rather than predicating it

**The trap:** mwcc's ordinary `if`/`else if` chain compiles with a
consistent "positive strategy" — the first condition's true-branch gets
inlined/predicated in place, not branched to as a separate block. Many
targets don't do this: the original genuinely branches away to a shared
or later block for one arm. Transcribing the natural-looking if/else-if
shape reproduces the *logic* correctly but not the *layout* — wrong
branch-vs-predicate choice, sometimes cascading into a wrong prologue
(different callee-saved registers pushed) since mwcc's whole-function
analysis sees a different control-flow graph.

**The fix:** restructure the C using `goto` (or an inverted condition
wrapping the rest of the function as a fallthrough) so the emitted
branch target matches which block the original physically branches to,
not just which block executes. Concretely: `if (cond) goto X; goto Y;`
laid out so the branch instruction's target matches the original's,
rather than `if (cond) { ...X... } else { ...Y... }`. The same shape
covers a trivial multi-source `return CONST` that needs to become one
physically-shared block reached by `goto`, instead of the same constant
predicated inline at each call site.

**Evidence — four independent same-round confirmations, no shared
authorship:**
- `func_02000d9c`, `func_ov002_022335d8`, `func_ov002_022360ac`
  (cm-ov002-unknown-sweep-8, batch 1) — trivial multi-source
  `return CONST` needed a `goto` to one shared exit block.
- `func_ov002_022272a0`, `func_ov017_021b3ca8` (cm-ov002-unknown-sweep-8,
  batch 3) — guard-clause early `return CONST` rewritten as a
  fallthrough (inverted condition wrapping the rest of the function),
  3 confirmations total in that batch alone.
- `func_020181d0`, `func_ov002_021b0930` (cm-ov002-unknown-sweep-8,
  batch 4) — same shape, described as "goto-based branch-to-block
  dispatch."
- `func_ov002_02223244` (cm-ov002-unknown-sweep-8, batch 5) — same
  shape on a 9-way jump-table dispatch, paired with the polarity-
  inversion phrasing `if (cond) goto X; goto Y;` →
  `if (!cond) goto Y; goto X;`.

**Provenance:** cm-ov002-unknown-sweep-8 (2026-07-31), batches 1/3/4/5
independently.

> **Caveat (cm-ov002-unknown-sweep-13):** this lever is NOT safe to
> apply blindly once the general "shared tail" shape is recognized —
> in the same round it was independently rediscovered and correctly
> applied 5 times, applying the identical goto-to-shared-tail
> restructuring to 2 *other*, superficially-identical-looking fusion
> patterns made the match measurably worse, not better. Check the
> result with `fastmatch.py` after applying it every time; don't treat
> "looks like the C-55 shape" as sufficient on its own.

> **Extension (cm-ov002-unknown-sweep-14): `goto` doesn't reliably
> suppress if-conversion when both arms rejoin at a shared
> LOOP-CONTINUATION point instead of a function exit.** All of C-55's
> original evidence involves a `return` (a real function exit) as one
> arm's target — `goto` reliably forces a branch there. A distinct
> shape: an if/else whose two arms both flow back into the *same loop*
> (not out of the function) kept getting if-converted back to
> predicated instructions regardless of `goto` phrasing. Converting the
> identical logic to a `switch` statement — even with only 2-3 case
> values and no jump table needed — suppressed the if-conversion where
> `goto` alone could not, closing one target from 10.5%→90.7%→100%.
> Precise rule: `goto` is the right tool when one arm is a genuine
> function exit; `switch` is the stronger tool when both arms rejoin
> inside a shared loop body. Also placement-sensitive: the `goto`
> target label must sit at its **exact original address position**
> inline in the function (mwcc lays out goto-target blocks in source
> textual order) — floating it to the end, or giving it its own
> separate `fail: return X;` block, produces a *duplicate* epilogue
> instead of sharing the real one.

> **OBSERVED, NOT CONFIRMED (cmatch/ov002-sweep-16 canary attempts,
> 2026-08-04): a guard clause testing a value that just came back from
> a function call may resist the goto fix even where an otherwise
> identical guard testing a pre-call value converts cleanly.** Two
> guard clauses in the same function (`func_ov002_02299c9c`): the
> first (`if (fn == 0) goto X;`, testing an array-indexed pointer
> computed with no intervening call) converted to a branch on the
> documented goto fix, first try. The second (`if (fn() == 0) goto Y;`,
> testing the return value of the call `fn()` made one line above) kept
> if-converting back to predicated `mov`+`popeq` regardless of 4 source
> variations tried against it: plain goto, swapped label order (to
> rule out address-position sensitivity per the sweep-14 note above),
> a named intermediate (`int r = fn(); if (r == 0) goto Y;`), and the
> fully-explicit both-arms-goto form C-55's own fix text uses
> (`if (cond) goto X; goto Y;`). None moved it. A second, unrelated
> function (`func_ov002_021d1158`) hit a similarly call-adjacent
> single-instruction scheduling residual (a `mov rN, #imm` landing one
> position after a branch instead of before it, same block, same
> registers) that also resisted restructuring — weaker evidence since
> it isn't the C-55 shape itself, but the same "right after a call,
> scheduling stops responding to source order" flavor. Two data points
> in one round is not enough to state a mechanism or a fix — flagged so
> the next lane to hit this recognizes it rather than re-discovering it
> from zero. If it recurs, record the instance here; a third or fourth
> confirmation would make this promotable to its own numbered entry.

> **Refinement — applies per early-return, not per-function
> (cm-ov002-unknown-sweep-17, 2026-08-06, batches 2 and 5
> independently).** A single function can need goto for ONE guard and
> plain predication for ANOTHER, with no way to tell which in advance
> short of checking each with `fastmatch.py`. Batch 2's
> `func_ov002_0221454c` needed goto on one guard while a sibling guard
> in the same function correctly stayed predicated; batch 5's
> `func_ov002_0222054c` showed the identical pattern explicitly (one
> check predicates inline, the sibling check needs goto) and states it
> plainly: treat the whole function uniformly (all-goto or
> all-predicate) and it fails either way. The determining factor
> remains "is this specific block's target reached from ≥2 places,"
> checked per-guard, not "how much code follows this specific check."

> **Counter-example — goto is not universally the fix; sometimes plain
> if/else beats it for the identical control-flow graph
> (cm-ov002-unknown-sweep-17, 2026-08-06, batch 4).**
> `func_ov002_02296814`'s third guard: `if (cond==0) goto ret0; return
> X; ret0: return 0;` compiled byte-identical to the WRONG predicated
> first attempt — mwcc simply undid the goto. Rewriting with no goto at
> all, `if (cond!=0) { return X; } return 0;` (same control flow, goto
> removed), fixed it immediately. When goto doesn't move a shared-tail
> residual, try the equivalent plain if/else before concluding the
> function is walled — it may just need the other tool.

> **Scope broadening — applies to a single plain equality guard, not
> just if/else-if or a shared multi-source tail
> (cm-ov002-unknown-sweep-17, 2026-08-06, batch 1).**
> `func_ov002_021f40f4` needed the branch-polarity flip on FOUR
> separate, independent single-equality `if (v==C) goto SUCCESS; goto
> FAIL;` blocks — no if/else-if chain, no shared tail, just a lone
> guard each time. mwcc chose `bne FAIL; b SUCCESS` (branch on the
> FAILURE condition) rather than the naive `beq SUCCESS` for every one
> of them; rewriting each as `if (v!=C) goto FAIL; goto SUCCESS;`
> fixed all four. Same underlying polarity-matching principle as the
> documented shape, just with no multi-arm structure required to
> trigger it — treat any single equality-guarded goto pair as a
> candidate, not only if/else-if chains or shared-tail returns.

### C-56. Local-variable declaration order, not just usage order, affects register allocation

**The trap:** two source forms that use the same locals in the same
order of *first read/write* can still get different physical register
assignments from mwcc if the `<type> name;` declarations themselves
appear in a different order. Matching the usage sequence isn't enough
when the declarations are reordered relative to it.

**The fix:** when a register-letter mismatch resists every reordering
of the executable statements, try reordering the *declarations* to
match the target's apparent register-allocation sequence, independent
of where each variable is first used.

**Evidence — two independent same-round confirmations:**
- `func_0201c498` (cm-ov002-unknown-sweep-8, batch 2) — pre-declaring
  `byte` before `p` flipped a register mismatch to a match.
- `func_0203953c` (cm-ov002-unknown-sweep-8, batch 3) — same effect,
  found independently.

> **Reconfirmed, cm-ov002-unknown-sweep-17 (2026-08-06), batch 3.**
> `func_ov002_02257888` needed the fix TWICE in one function:
> `int count; int player;` → declaring `count` first fixed an r4↔r5
> swap in the outer loop, and separately swapping `row`/`idx`
> declaration order fixed an r6↔r7 swap in the inner loop. Worth
> trying FIRST on any pure register-swap residual (cheaper than most
> other restructuring) — but not universal: the same batch tried it on
> the round's MLA-pool-order and commutative-add walls (see P-28/P-29)
> without effect.

**Provenance:** cm-ov002-unknown-sweep-8 (2026-07-31), batches 2 and 3
independently.

### C-57. C addition operand order controls which addend fuses into an ARM shifted-register form

**The trap:** ARM's `add rd, rn, rm, <shift>` fuses a shift into one of
its two operands. Which C-level addend ends up as the fused `rm, shift`
register (versus the plain `rn`) is controlled by which side of `+` it
appears on in the source — not implied by the arithmetic alone, since
addition is commutative and both orderings are mathematically identical.

**The fix:** when a shift-fused add mismatches only in which operand
carries the shift, swap the order of the two addends in the C
expression — the *second* (right-hand) operand is the one mwcc fuses
into the shift slot.

**Evidence:** 2+ confirmations within `func_ov002_022446d8` and a
sibling case in the same batch (cm-ov002-unknown-sweep-8, batch 3).

**Provenance:** cm-ov002-unknown-sweep-8 (2026-07-31), batch 3.

### C-58. Unsigned vs. signed comparison type selects `CC`/`HI` over `LT`/`GT` condition codes

**The trap:** a comparison written with a signed operand type compiles
to signed condition codes (`LT`/`GT`/`LE`/`GE`); the same logical
comparison over an unsigned-typed operand compiles to unsigned codes
(`CC`/`HI`/`LS`/`CS`). For values that are always non-negative in
practice, it's easy to declare or cast to a signed type and still get
correct *behavior* while mismatching the target's condition code.

**The fix:** when a comparison's branch condition code doesn't match
the target (signed where the target is unsigned or vice versa), check
the operand's true type/range and adjust the C declaration/cast to
match — don't rely on "the values happen to always be positive" as a
reason to leave a signed type in place.

**Evidence:** `func_02052218` (cm-ov002-unknown-sweep-8, batch 4) — one
instance so far; flagging for reconfirmation on a second, independent
function before treating it as systemic.

> **Reconfirmed (cm-ov002-unknown-sweep-9, 2026-07-31, batch 2):**
> `func_0209f514` needed the same lever (an unsigned cast selecting a
> logical rather than arithmetic shift, same underlying signed-vs-
> unsigned mechanism). Now believed systemic.

**Provenance:** cm-ov002-unknown-sweep-8 (2026-07-31), batch 4.

### C-59. A branch target shared with a switch's default case still gets predicated, not branched — force it with an explicit `switch`

**The trap:** C-55 already covers when natural `if`/`else if` predicates
a block the target actually branches to. This is a related but distinct
trap: a *trivial* guard whose taken-branch target happens to be the same
block a nearby `switch`'s default case also falls into can still get
predicated even when written with a `goto` — because mwcc's if-conversion
doesn't look at where a `switch`'s dispatch already lands to decide
whether a plain `if` should become a branch or a predicate.

**The fix:** when a `goto`-restructured `if` still predicates instead of
branching, and its target is a block also reached by a nearby `switch`'s
default/fallthrough case, rewrite the guard itself as a 2-outcome
`switch` (not an `if`) so mwcc treats it as part of the same dispatch
decision instead of a separate scalar branch.

**Evidence:** `func_02007e8c` (cm-ov002-unknown-sweep-9, batch 4) — one
instance so far; flagging for reconfirmation on a second, independent
function before treating it as systemic.

**Provenance:** cm-ov002-unknown-sweep-9 (2026-07-31), batch 4.

### C-60. A two-dimensional table lookup's *expression structure* — not register pressure — selects double-`mla`-chain vs. separate-`mul`-plus-indexed-load

**Background:** sweep-9 flagged 4 parked candidates (`func_ov002_021ed1f8`,
`func_ov002_0220d974` ×2, `func_ov002_0222ad54`, all indexing
`data_ov002_022cf16c` — a `[2][N]`-shaped table with a `0x868`-byte row
stride, `0x14`(20)-byte column stride, and a `0x30`-byte fixed offset)
as a recurring, unresolved register/instruction-selection wall, framed
as likely register-pressure noise. It isn't — it's directly controlled
by how the address arithmetic is *written*, confirmed by standalone
compilation (not just correlation across shipped attempts): the same
logical address computation, compiled with the project's real
`mwccarm 2.0/sp1p5` flags, produces two distinct, reproducible
instruction families depending purely on C source structure.

**Family A — single compound expression** (raw pointer arithmetic in
one statement, or direct chained field access with no intermediate
pointer variable for the column step) compiles to a **double-`mla`
chain ending in one immediate-offset load**:

```c

return *(int *)((char *)table + (row & 1) * 0x868 + col * 20 + 0x30);

```

```asm

mla  r2, r0, r_rowstride, r_base   ; row*0x868 + &table
mla  r0, r1, r_colstride, r2       ; col*20 + that
ldr  r0, [r0, #0x30]               ; single immediate-offset load

```

This is what `func_ov002_021ed1f8`'s first occurrence shows, and what
every plain-pointer-arithmetic or single-chained-field-access phrasing
tested produced — including a version using a natural nested
`struct Row { char header[0x868]; }` array for the row step,
combined with raw pointer math for column/offset.

**Family B — an intermediate pointer variable, incremented
separately** (the column step is NOT part of the same expression as
the row/base computation — a pointer is materialized first, then
advanced by `col`) compiles to a **single `mla` for the row term, a
SEPARATE `mul` for the column term, an explicit `add` for the fixed
offset, and a register-indexed final load**:

```c

struct Elem *e = row_base->elems;   /* intermediate pointer, NOT combined
                                        with the row computation above */
e += col;                            /* separate increment */
return e->field;

```

```asm

mla  r1, r0, r_rowstride, r_base   ; row*0x868 + &table  (unchanged)
mul  r0, r_col, r_colstride        ; col*20 -- SEPARATE, not fused
add  r1, r1, #0x30                 ; fixed offset -- explicit, not folded
ldr  r0, [r1, r0]                  ; register-indexed load, not immediate

```

This exactly reproduces `func_ov002_021ed1f8`'s second occurrence and
both occurrences in `func_ov002_0220d974` (the `mul`/`add` instruction
*order* between the two real occurrences differs — mwcc's scheduler
choice, not a further source-level lever — but the instruction
*selection* is identical).

**The fix:** write the address computation to match which family the
target's own disassembly shows for that specific occurrence. Don't
assume a single phrasing reproduces every occurrence of what looks
like the same logical table access within one function — the *same*
table can appear in both families in the *same* function, and the
distinguishing factor is whether the source computes the column offset
as a separate pointer-increment step (Family B) or folds it into one
expression with the row/base term (Family A).

**Open, not yet reproduced:** `func_ov002_0222ad54`'s occurrence uses
neither family cleanly — a separate `mul`+`add` for the ROW term too
(no `mla` at all), on top of Family B's column/offset shape. This one
also extracts row/col from packed bitfields rather than plain
parameters, which may be a contributing factor; not isolated this
round.

**Evidence:** confirmed via standalone `mwccarm 2.0/sp1p5` compilation
of multiple candidate phrasings against a synthetic table matching the
real stride/offset constants, cross-checked instruction-for-instruction
against 3 of the 4 real parked occurrences (`func_ov002_021ed1f8` both
occurrences, `func_ov002_0220d974` both occurrences). Not yet applied
to a real ship — flagged as a priority target for
cm-ov002-unknown-sweep-10.

**Provenance:** cm-ov002-unknown-sweep-10 (2026-07-31), investigated
directly rather than delegated, per the coordinating process's request
to treat this cohort (4 recurrences across cm-ov002-unknown-sweep-9) as
a dedicated mini-item.

### C-61. Declaring a loop's index and walking pointer *before* the guard-clause locals, in use order, steers a 3-way register triangle — confirmed on the P-4/11/12/15 family's own signature shape

**Background — direct investigation, per explicit request.** After 3
consecutive rounds accumulating evidence that the register-allocation-
plateau family (P-4/P-11/P-12/P-15, plus the P-17 cohort) is the
campaign's dominant open problem, this was investigated head-on via
standalone `mwccarm 2.0/sp1p5` compilation against real parked
residuals — the same method C-60 used — rather than delegated blind.
Prior falsification history for this family is extensive and mostly
still stands (see below); this entry documents a genuine, real,
*positive* result found within it, not a wholesale reversal.

**The shape.** A loop over a per-row array (base address shared
between two roles: computing a walking cursor, and re-loading a
per-iteration bound from a fixed offset) with three "slots" needing
correct register assignment simultaneously: the loop index, the
walking cursor pointer, and the shared row-base pointer. This is
structurally the *same* `data_ov002_022cf16c` table C-60 investigates,
but in a loop-scan access pattern rather than a single lookup — the
pattern sweep-10 batch 4 flagged at high volume (9 of 14 parks in one
batch alone).

**Target (`func_ov002_02250540`, do-while over `data_ov002_022cf16c`
rows, 3 guard-check calls per element):**

```text

ldr   r0, [pc, #...]        ; &data_ov002_022cf16c
mov   r8, #0xd
add   r6, r0, r1            ; base = r6
add   r5, r6, #0x260        ; cursor = r5
.Lloop:
  ldr   r0, [r5]
  ...                       ; 3 guard calls on the extracted id
  mov   r2, r4              ; index (arg to the handler call)
  bl    func_ov002_02253458
.Lskip:
  ldr   r0, [r6, #0x10]     ; base reused to reload the bound
  add   r4, r4, #1          ; index++
  cmp   r4, r0
  add   r5, r5, #4          ; cursor++
  bcc   .Lloop

```

**What did NOT move it (matching this family's own extensive prior
history):** natural declaration order matching statement/use order
(the obvious first attempt) reproduces the *wrong* triangle every
time — the register **set** {r4,r5,r6} is always right, but the
**assignment** (which role gets which number) comes out scrambled, in
a way pure use-order declaration never fixes. This matches every
already-documented falsification in this family (P-4's 12 variants,
P-11's 5+9-variant matrices, P-12's 9 variants, P-13's 5 cross-tier
attempts) in spirit: naive source-shape iteration plateaus.

**What DID work.** Declare the index and the walking-cursor pointer
**before** the guard-clause locals (`row`, `count`, the early-return
check) — even though they aren't *assigned* until after the guard
clause — and declare them **in their eventual-use relative order**
(index, then cursor):

```c

void func_ov002_02250540(int player) {
    unsigned int row = (player & 1) * 0x868;
    unsigned int i = 0;              /* declared+init BEFORE the guard */
    int *cursor;                     /* declared BEFORE the guard, after i */
    unsigned int count = *(unsigned int *)(data_ov002_022cf17c + row);
    if (count <= 0) {
        return;
    }
    cursor = (int *)(data_ov002_022cf16c + row + 0x260);   /* assigned after */
    {
        int type = 13;
        do {
            unsigned int id = *(unsigned int *)cursor;
            id = (unsigned int)(id << 19) >> 19;      /* NOT sign-extension —
                a plain 13-bit unsigned mask; the shift-pair uses `lsr`
                not `asr` in the target, confirmed by direct disassembly
                of the delinked gap object, not by re-reading the .s
                text — see the process note below. */
            if (func_0202e234(id) != 0) {
                if (func_0202ef38(id) != 0) {
                    if (func_0202b8a8(id) <= 4) {
                        func_ov002_02253458(player, type, i);
                    }
                }
            }
            i++;
            cursor++;
        } while (i < *(unsigned int *)(data_ov002_022cf16c + row + 0x10));
    }
}

```

This reproduces the target's **entire loop body instruction-for-
instruction**, including all three triangle registers (index=r4,
cursor=r5, base=r6) and the self/const/id registers (r7/r8/r9) —
verified via `fastmatch.py` against the real delinked gap object, and
**independently reconfirmed on a second, structurally distinct real
function** (`func_ov002_0224b0b0`, a 4-guard-check variant of the same
loop shape) with the identical recipe, identical result.

> **Correction (cm-ov002-unknown-sweep-12):** re-checking this claim
> directly against the project's real `fastmatch.py` found it does not
> hold up — `func_ov002_02250540` re-compiled from this exact recipe
> currently lands at 60.5%, not 100%, blocked by a register-preference
> mismatch (`r3` vs `r10`/`sl`) unrelated to the loop-triangle lever
> itself. The loop-body triangle and the guard-condition-code shape
> documented above are still correct and still real (see C-64 for the
> guard mechanism specifically), but this entry's "verified 100%,
> instruction-for-instruction" language was an overclaim for this
> specific target — left uncorrected in the paragraph above for an
> honest record of the error; treat `func_ov002_0224b0b0`'s claimed
> confirmation with the same caveat pending its own re-check.

**Ablation (what the mechanism actually is):** swapping the relative
order of the index and cursor declarations (cursor-before-index instead
of index-before-cursor, both still ahead of the guard clause) flips
which of them lands in r4 vs r5, while the shared base still correctly
lands in r6 — confirming both "ahead of the guard clause" and "in
use-order relative to each other" are independently load-bearing, not
one incidental side effect of the other.

**Honest scope — this is a real, partial win, not a full crack.**
Neither target reaches 100% with this lever alone. A **second,
separate residual remains** in both: the early `(player&1)*0x868`
scratch computation (`and`+`mul`, 2 instructions) lands its
intermediate AND-result and final MUL-result in swapped registers
(r1/r2) relative to target, and **this residual did not move under
any tested variant** (explicit named intermediate, operand-order swap,
declaration-order changes) — behavior indistinguishable from the
already-documented, already-exhaustively-falsified P-11 "brief 254"
MLA/commutative-operand pattern (5 source forms tried there, zero
movement, "no clean lever" — see P-11's entry above). **Do not treat
this as evidence that pattern is now solvable too** — it looks like the
same wall, independently re-confirmed here, not a new lever for it.

**What this answers, precisely, for the campaign's dominant open
question:**
1. **The wall family is not one mechanism — it's several wearing the
   same "register-letter mismatch, otherwise byte-identical" signature,
   even within a single function.** This target has one sub-piece that
   is genuinely steerable from C (the loop-body triangle) sitting
   directly next to one sub-piece that is not (the early AND/MUL
   scratch swap, matching P-11's own documented-resistant shape).
2. **Yes, declaration order is sometimes the lever — but only a
   specific form of it** (loop-scope locals hoisted ahead of and in
   relative-use-order to guard-clause locals), not naive reordering,
   which this family has already been shown many times not to respond
   to.
3. **No construct tested moves the early-scratch commutative-operand
   class** — consistent with, not a reversal of, prior findings.

**Process note — a real, catchable error.** The first attempt at this
recipe was eyeball-verified against the `.s` file's own text (a hand
transcription) and appeared to match completely. It didn't:
`fastmatch.py` against the real delinked gap object caught two real
divergences the eyeball comparison missed (the `ldmlsia`/unsigned-LS
condition code on the early guard, misread as an unconditional-looking
match against `pople`/signed-LE from a differently-typed comparison;
and the `lsr`-vs-`asr` shift-pair, invisible unless the exact opcode
nibble is checked rather than the shift *amount*). **Always verify
against the tool's own resolved comparison, not a hand read of the
`.s` text, even when a match looks obviously complete** — this is the
same discipline [[feedback_read-the-metric-source-before-measuring]]-
style memory already asks for, re-confirmed here at the instruction
level rather than the metric level.

**Affected/testable cohort:** the remaining ~7 members of sweep-10
batch 4's `data_ov002_022cf16c` loop-scan cohort are the natural next
test — same table, same general shape, unconfirmed whether all of them
carry the *same* early-scratch residual or whether some close fully
with this lever alone (both targets tested here happen to share the
exact same `(player&1)*0x868` prefix; a cohort member with a
differently-shaped guard clause might not carry that specific
resistant sub-piece).

**Provenance:** cm-ov002-unknown-sweep-11 (2026-07-31), investigated
directly per the coordinating process's explicit request to give this
wall family "one round of direct attention."

> **Massive additional confirmation, same round (cm-ov002-unknown-
> sweep-11 dispatch).** The recipe was handed to 8 real priority-cohort
> candidates plus applied opportunistically wherever the shape
> recurred. Result: **the wall is real and systemic at high volume,
> the recipe applies correctly, and the early-scratch residual above
> is confirmed as the dominant remaining blocker** — not an isolated
> case. One more candidate shipped clean with the recipe alone
> (`func_ov002_0224de94`, 3rd independent application). Six more of
> the 8 priority-cohort candidates reached high partial matches
> (69.8%–94.1%) applying the same recipe, every one blocked by the
> already-documented and/mul residual or an equally-resistant fresh
> permutation — consistent with, not a contradiction of, the honest
> scope above. **Independently, without being told which functions
> were cohort members, a different batch working ordinary plain-
> selection candidates recognized and flagged 3 more instances of the
> identical and/mul residual** (`func_ov002_02249cec`,
> `func_ov002_0224c440`, `func_ov002_02251ec0`) — real evidence this
> isn't specific to the 2 originally-tested targets.
>
> **New sub-finding, independently hit by 2 separate workers on 3
> functions:** the early guard's condition code (`LS` vs `EQ` for an
> `unsigned x <= 0`-shaped check) depends on whether the guard is
> written as a `goto`-based branch or a predicated inline return — the
> predicated form reliably reproduces `LS`, a `goto`-restructured form
> reliably produces `EQ` instead. Not yet resolved (2 phrasing variants
> tried per instance, no movement) — flagged as a distinct, real,
> unsolved piece of this same shape's puzzle, not yet folded into the
> main recipe above since it needs its own dedicated pass.
>
> **A related-but-distinct addressing residual, 3 instances, not yet
> investigated directly:** `func_ov002_02221348`, `func_ov002_0224f4a0`,
> `func_ov002_02236bbc` all show a `rowBase+0x120+idx*4` computation
> resisting both C-60's Family-A and Family-B phrasings identically —
> same general "shared-base loop/array addressing" territory as C-60/
> C-61, different specific constants (`0x120`, not `0x30`/`0x868`/
> `0x14`), unconfirmed whether it's the same table at a different
> sub-offset or a genuinely different structure. Worth the same
> standalone-compilation treatment as a future dedicated item.

### C-62. Signed `%` (modulo) and `/` (division) by the same power-of-2 constant compile to visually-similar but genuinely different `lsr`/`rsb`/`ror`-family instruction sequences — don't misidentify one for the other from disassembly alone

**The trap:** mwcc's signed-division-by-power-of-2 and signed-modulo-
by-power-of-2 lowerings both use a `lsr`/`rsb`/`ror`-shift family of
instructions (the standard trick for rounding a signed value toward
zero without a real divide), and at a glance — especially skimmed
quickly against a size/shape-matching target — the two forms look
alike enough to transcribe as the wrong operator. Writing `x / N`
where the target actually computes `x % N` (or vice versa) is
logically wrong but can still produce a plausible-looking, mostly-
correct instruction count, making the error easy to miss until a
`fastmatch.py` diff shows the real divergence.

**The fix:** confirm which operator the target actually needs by
checking the *use* of the result, not just pattern-matching the
instruction shape — a modulo result feeds further arithmetic combining
it with the original dividend (e.g. `x - (x/N)*N`-shaped follow-on
use, or a direct remainder use like an array-wraparound index); a
division result stands alone as a scaled quantity. When in doubt,
compile both `x % N` and `x / N` standalone via `mwccarm` directly and
diff against the target's actual instruction sequence rather than
guessing from the shift/rotate shape alone.

**Evidence:** `func_ov004_021cb940` (cm-ov002-unknown-sweep-11) — the
worker's own first attempt used `/`, produced a byte-close-but-wrong
result, and confirmed via standalone `mwccarm` compilation that `%`
was the correct operator, with the two forms' instruction sequences
distinct enough to fully resolve once compared side by side.

**Provenance:** cm-ov002-unknown-sweep-11 (2026-07-31), batch 5.

### C-63. A row-table sub-field indexed by a genuine runtime variable (not a small fixed column) is a THIRD addressing family, distinct from C-60's Family A/B — materialize the row pointer, add the constant sub-offset as a separate step, then use plain array-subscript syntax

**Background — direct investigation of sweep-11's flagged `rowBase+0x120+idx*4`
residual** (`func_ov002_02221348`, `func_ov002_0224f4a0`, `func_ov002_02236bbc`
— all resisted both of C-60's Family-A/B phrasings identically). The reason
they resisted both: they aren't a C-60 Family-A/B case at all. C-60's
families are about a **fixed, small column selector** (a struct field or
narrow enum) multiplied by a column stride. These three instead index a
sub-array within the row by a **genuine runtime variable** — an actual loop
index or forwarded argument — for which mwcc's natural array-subscript
addressing mode is simpler than either of C-60's families and was never
tried because everyone was pattern-matching to the wrong family.

**The shape, confirmed via standalone `mwccarm 2.0/sp1p5` compilation
against a synthetic reproduction of `data_ov002_022cf16c`'s row stride
(`0x868`) and this sub-table's fixed offset (`0x120`):**

```c

int *p = (int *)(data_ov002_022cf16c + (player & 1) * 0x868);
p = (int *)((char *)p + 0x120);
return p[idx];   /* idx: a genuine runtime value, not a fixed column */

```

```asm

mla  r1, r0, r1, r3        ; r1 = row*0x868 + &table            (unchanged from C-60 Family A)
add  r0, r1, #0x120          ; r0 = r1 + 0x120                    -- SEPARATE add, constant only
ldr  r0, [r0, r2, lsl #0x2]    ; r0 = *(r0 + idx*4)                   -- register-indexed load,
                                                                          shift embedded in the LDR

```

This is instruction-for-instruction what `func_ov002_0224f4a0` needs. The
load-bearing detail: **the intermediate pointer must already be `int`-typed
(not `char *`) before the `+0x120` adjustment is applied**, and that
adjustment must be a separate reassignment, not folded into the same
expression as the initial row computation:

```c

int *p = (int *)(data_ov002_022cf16c + (player & 1) * 0x868);  /* int* from the start */
p = (int *)((char *)p + 0x120);                                 /* separate reassignment */
return p[idx];

```

A version that stays `char *` through the `+0x120` step and only casts to
`int *` at the point of indexing (`((int *)p)[idx]`) compiles to a
DIFFERENT, non-matching instruction order (idx folded into an `add` before
the row computation's constant, with `#0x120` ending up as the LDR's
immediate instead of the register-shifted index) — confirmed as a real,
reproducible negative result via the same standalone method, not assumed.

**Shipped, 100%:** `func_ov002_0224f4a0` (168B) — the full function,
including its two-field packed-bitfield row entry (a 13-bit `id` at bits
0–12, matching the existing `Ov002Slot.id:13` convention, plus an
8-bit/1-bit pair combined by the *caller* as `category*2 + flag` for a
second callee argument) and a redundant same-address memory reload for a
stored-pointer field (`data_ov002_022ce288+0x48c`) that must be re-read via
two independent dereference expressions rather than cached in a local, or
the compiler keeps the cached register live and drops the reload
instruction the target actually has.

**Confirmed present but not fully closed:** `func_ov002_02221348` (the
same `+0x120` access recurs verbatim inside a 5-way branch, alongside a
SECOND, unrelated table access and a complex multi-argument packed-halfword
call whose exact semantics weren't reverse-engineered this round) and
`func_ov002_02236bbc` (a related `+0x5d0` access on the same table, reached
through a computed-goto 5-case switch; the row pointer here is built via a
plain `mul`+separate base-load rather than `mla`, because the row byte
offset is a shared subexpression reused for a second, unrelated 1D table
lookup first — a CSE side effect, not a new addressing family). Both
recurrences confirm the SAME `mla`-or-`mul` → separate-const-`add` →
shifted-register-`ldr` shape; both remain parked because of unrelated
surrounding complexity (multi-way switch bodies, unresolved call-argument
packing), not because the addressing lever failed.

**Provenance:** cm-ov002-unknown-sweep-12, investigated directly per the
coordinating process's explicit request to take sweep-11's two isolated,
still-open mechanisms head-on.

> **Extension — non-4-byte idx stride needs a real sizeof-matched
> struct array, not `int*` indexing (cm-ov002-unknown-sweep-17,
> 2026-08-06, mini-item A).** The original recipe above covers a
> `p[idx]` stride of 4 bytes (a plain `int*`), where mwcc's native
> array-subscript addressing embeds `idx<<2` directly into the `LDR`'s
> shift field. When the real per-entry stride is a non-power-of-2 value
> like `0x14` (20 bytes) — i.e. `mul idx_offset, idx, #0x14` followed by
> a register-offset `LDR` with no embedded shift — plain `int*`
> indexing can't reproduce it (the compiler will always emit a `<<2`
> shift for `int*`, wrong stride entirely). Declaring the row-entry
> type as a real `struct` whose `sizeof` equals the true stride, and
> indexing an array of THAT type, reproduces the explicit `mul`
> correctly: `struct Entry *arr = (struct Entry *)(rowBase + 0x30);
> entry = &arr[idx];` (constant sub-offset folded into the base
> pointer here, small enough to also work as the final access's `LDR`
> immediate if applied at the point of use instead). Took
> `func_ov002_021f058c` from a 39.5% park to **97.4%** combined with a
> C-55 shared-tail `goto` fix for an unrelated early-return; the last
> word (a commutative operand-order choice in a plain `add`, not an
> `mla`) resisted 4 further variations and was left parked — see the
> resolution note under C-66 below for the full breakdown.

> **Second extension — the idx-stride multiply needs its OWN early
> statement, separately from the struct-typed array index above
> (cm-ov002-unknown-sweep-17, 2026-08-06, batch 3).** Even after
> switching to a correctly-sized struct array per the extension above,
> two functions (`func_ov002_02214aa0`, `func_ov002_0223965c`, both
> 0x14-byte-stride row tables) still diverged until the row-offset
> multiply was pulled out as its own statement BEFORE the pointer
> expression: `int row_off = row * 0x14;` on its own line, not inlined
> into `&arr[row]` or folded into a combined pointer expression. The
> struct-typed indexing fixes the addressing *shape*; this separate
> statement is what controls *scheduling* — a self-field read and the
> stride constant's pool load were landing at the wrong point in the
> instruction sequence without it. Treat both extensions as required
> together for non-4-byte-stride row tables, not alternatives.

> **Third extension — when a row base combines with a constant
> sub-offset AND a variable-scaled index, the constant must be added
> BEFORE the multiply term in source order
> (cm-ov002-unknown-sweep-17, 2026-08-06, batch 5).** For a lookup
> shaped like `row + SUBOFFSET + idx*STRIDE`, writing the terms in
> that literal order — sub-offset first, multiply term second — is
> what reproduces target's single `add`'s operand order. Writing the
> semantically-identical `row + idx*STRIDE + SUBOFFSET` (multiply
> first) produces a byte-different `add` operand order despite being
> mathematically the same value. Found on `func_ov002_02209d04`: a
> 97.7%→100% fix was purely swapping these two terms' source order.

> **Extension — caching a twice-referenced FIELD VALUE, not just a base
> pointer (cm-main-tier-sweep-2, 2026-08-08, batch 4).** The
> materialize-explicitly technique also applies to a plain struct field
> read twice, not just a row/table base address. `func_0208b070`:
> without an explicit named local for a twice-referenced field
> (`self->f0`), mwcc instead cached the whole `self` struct pointer into
> a callee-saved register (the wrong shape). Adding `int f0 = self->f0;`
> and using the local for both reads reverted mwcc to the target's
> preferred style — re-dereferencing `self` directly (still in its
> original register) at each use site, with no cached base at all. The
> fix is the mirror image of what it looks like: caching a VALUE
> stopped mwcc from wrongly caching a POINTER.

### C-64. LS-vs-EQ condition code for an `unsigned x <= 0` guard is controlled by whether the check is mwcc's OWN synthesized for-loop trip-count pre-check or a hand-written guard — not by goto-vs-predicated source syntax

**Background.** Sweep-11 flagged 3 instances (`func_ov002_0223cfec`,
`func_ov002_02286c9c`, plus the investigator's own hit during the C-61
work) where an `unsigned int count <= 0` guard needed the real target's
`LS` condition code, and attributed the mismatch to goto-branch vs
predicated-inline-return source structure. That attribution doesn't
survive direct testing — it was a correlation from too few data points,
not the real mechanism.

**Falsified directly, via standalone `mwccarm 2.0/sp1p5` compilation:**
a hand-written `if (count <= 0) { return; }` and a hand-written
`if (count <= 0) { goto skip; }` (skip: elsewhere) compile
**identically** — both fold the unsigned `<=0` test to `EQ`
(`moveq`/`popeq`), regardless of predicated-return-vs-goto source syntax,
regardless of how much code the guard skips (tested with a trivial
early-return and with a real loop behind it), and regardless of register
pressure (tested with 3 and with 10 callee-saved registers live). None of
these move the needle — goto-vs-predicate was never the lever.

**What actually produces `LS`:** the check must be mwcc's OWN
synthesized entry pre-check for a genuine `for` loop, not any hand-written
`if`. A bare `for (i = 0; i < count; i++) { ... }` — no manual guard
at all — produces `cmp count, #0; popls {...}` (a predicated `LS` skip)
for the trip-count-zero case, confirmed on the first try:

```c

for (i = 0; i < count; i++) {
    func_a(player, i, count);
}

```

```asm

cmp  r5, #0
popls  {r4, r5, r6, pc}         ; LS -- the for-loop's OWN pre-check, never
                                    hand-written, never algebraically folded
                                    to EQ the way an explicit if(...) is

```

**Whether the pre-check if-converts to a predicated skip (`popls`) or
compiles to a genuine branch (`bls <label>`) depends on how much
if-conversion has already happened earlier in the same function** — not
on anything source-local to the guard itself. A bare for-loop as the
*first* thing in a function if-converts to `popls`. The exact same
for-loop, appended after 3 other early-return guards that already
if-converted (matching `func_ov002_0223cfec`'s real shape: 3 prior
`movne`/`moveq`-predicated guards, each behind a real call, before this
one), compiles to a genuine `cmp r7, #0; bls <label>` instead — confirmed
by faithfully reproducing that function's full preceding call sequence
in a standalone TU and observing the branch form appear only once that
context was present. This is consistent with an if-conversion pass that
has a per-function budget or diminishing eligibility, not a per-guard
source-level choice — **not yet pinned down further, flagged as its own
open question**, but the practical lever (write a real `for` loop, don't
hand-write the guard) is established regardless of which form it lands as.

**Trip-count source can differ from the loop-continuation source** — this
is what makes the C-61 family's specific shape possible at all. Write the
loop bound as a plain `for` condition, then **reassign that same variable
at the end of the loop body** to a value reloaded from a different
location for the *next* iteration's test:

```c

unsigned int count = *(unsigned int *)(table_a + row);   /* entry check reads table_a */
for (i = 0; i < count; i++) {
    ...
    count = *(unsigned int *)(table_b + row + 0x10);       /* re-test reads table_b, every iteration */
}

```

This reproduces the exact two-table shape `func_ov002_02250540` and
`func_ov002_0223cfec` both have (an entry-only `data_ov002_022cf17c`
count check, a per-iteration `data_ov002_022cf16c+0x10` re-test) —
confirmed via standalone compilation; the `LS`/branch-vs-predicate
question above was verified specifically using this two-table form.

**Honest scope — mechanism confirmed, not a full ship this round.**
Reapplying this corrected for-loop shape to `func_ov002_02250540`
(the original C-61 investigation vehicle, still parked — its documented
"verified 100%" claim from cm-ov002-unknown-sweep-11 does not hold up on
re-check with the project's real fastmatch.py: the guard/loop shape
above closes correctly, but a SEPARATE, so-far-unmoved register-preference
mismatch remains — `r3` vs `r10`/`sl` as the seventh callee-saved
register, present regardless of do-while-vs-for-loop structure) — treat
that entry's "instruction-for-instruction" language as an overclaim,
corrected here. `func_ov002_0223cfec` and `func_ov002_02286c9c` were not
attempted end-to-end this round (both have substantial additional loop-
body complexity — packed-bitfield address computation, a second
early-exit condition — well beyond the guard clause); the guard/pre-check
mechanism above is verified via faithful standalone reproduction of each
function's preceding call sequence, not via a real ship on either.

**Provenance:** cm-ov002-unknown-sweep-12, investigated directly per the
coordinating process's explicit request; supersedes the goto-vs-predicated
attribution in C-61's confirmation addendum, which this entry corrects.

> **Independent confirmation, same round, from a worker who arrived at
> it separately.** Working ordinary plain-selection candidates with no
> knowledge of this entry, a batch hit the identical `EQ`-not-`LS`
> pattern 3 times (`func_ov002_0224bbd8`, `func_02089418`, partially on
> a third) and independently converged on the same conclusion this
> entry does — their own words: "the same register-set-correct,
> letter/condition-assignment-scrambled family... just manifesting as a
> condition-code bit rather than a register letter." Their fix
> (do-while with the counter declared/initialized before the guard)
> reliably improved match percentage (63.6%→77.3% and 17.3%→90.0%) but,
> consistent with the mechanism above, **never flipped `EQ` back to
> `LS` on its own** — a hand-restructured do-while is still a
> hand-written guard, not the compiler's own synthesized `for`-loop
> pre-check, so this is confirmation of the mechanism's boundary, not a
> contradiction of it.

> **Third-round confirmation (cm-ov002-unknown-sweep-13), again
> completely blind.** A different batch, with no knowledge of this
> entry or the prior round's confirmation, hit the identical
> `bls`-in-target/`beq`-in-every-hand-written-attempt pattern on 2 more
> functions (`func_ov002_021ff170`; `func_ov002_0220ad78`, reached
> 98.4% — one instruction short) and explicitly proposed it as a new,
> uncatalogued wall worth writing up. The phrasings they tried —
> `<=0`, `<1`, reversed operands, natural `>0` wrapping, with and
> without `goto`, signed and unsigned — are exactly the class of
> hand-written guard this entry already predicts will fail; they did
> not try a bare compiler-synthesized `for` loop, the one form that
> works. `func_ov002_0220ad78`'s 98.4% is a good, low-effort candidate
> to close with the known fix in a future round, rather than a new
> investigation.

> **Refinement — the recipe holds even when the loop bound is
> reassigned from a different symbol mid-loop
> (cm-ov002-unknown-sweep-17, 2026-08-06, batch 2).** A genuine
> `for (i=0; i<count; i++)` with `count` as a simple local variable
> reliably produces the LS/`bls` synthesized-precheck form, EVEN WHEN
> that same local gets reassigned from a completely different
> array/symbol partway through the loop body (`func_ov002_022013d4`,
> `func_ov002_0224a28c`: `count` starts from one symbol, gets
> reassigned from a different-but-adjacent symbol inside the loop, and
> the LS precheck still fires on the first assignment). The key
> condition is that `count`/`i` stay literal C variables compared with
> `<` — not that the bound expression is textually static throughout
> the loop.

### C-65. Loop-body strength reduction (a raw index computation collapsing to pointer-increment form) is source-sensitive, but not the same way for a load and a store

**The trap.** A loop that reads or writes through `base + i * CONST`
each iteration can compile two different ways: mwcc either keeps the
per-iteration multiply/add (an "indexed" form) or strength-reduces it
into a separately-incremented pointer that advances by `CONST` each
pass (an "induction-variable" form). Which one the target uses is not
guessable from the arithmetic alone, and this round produced two
results that look contradictory until read carefully.

**On a load / return path:** array-indexed struct-field access
(`arr[j].field`) reproduced the target's non-strength-reduced,
recomputed-index form, where the mathematically identical raw pointer
arithmetic (`*(T *)(base + j * sizeof(T))`-style) got strength-reduced
by mwcc into an induction variable the target doesn't have — confirmed
concretely in `func_ov006_021b66c4` (cm-ov002-unknown-sweep-13).

**On a store path:** a small fixed-trip-count loop computing
`base + i * CONST` to store *through* got strength-reduced by mwcc
**regardless of source form** — combined-expression, split-pointer
intermediate, `do`-`while`, and array-indexing all four produced the
same (wrong, induction-variable) shape, none reproducing the target's
literal recomputed-index form (`func_ov004_021cc63c`,
cm-ov002-unknown-sweep-13). Also seen as a first ov002-module instance
of a strength-reduction wall previously only documented for ov004
(`func_ov002_0224958c`, same round, same batch that later shipped the
C-65-adjacent array-indexed fix — not yet reconciled with it).

**Honest scope — apparent load-vs-store asymmetry, not yet explained.**
Whether the direction (read vs. write) through the computed address is
itself the controlling factor, or whether these are two unrelated
instances of the general "mwcc's strength-reduction heuristic doesn't
always match the source's own literal structure" wall, is unresolved —
flagged as a real open question rather than forced into a single
unified rule. The practical guidance for now: **try array-indexed
struct-field access first for a load that resists strength-reduction
matching; expect it to make no difference for a store**, and confirm
either way via `fastmatch.py` rather than assuming the load-side result
transfers.

**Provenance:** cm-ov002-unknown-sweep-13, three independent batches
(load-side fix, store-side negative result, first ov002 instance) in
the same round.

> **Refinement — two concrete counter-recipes now on file instead of
> one, plus evidence the outcome can differ within a single function
> (cm-ov002-unknown-sweep-17, 2026-08-06, batch 2).** The practical
> guidance above ("try array-indexing for a load") is not universal
> even within the load case: `func_ov002_022013d4` confirmed
> array-indexed struct access reproduces a NON-strength-reduced load
> as before, but `func_ov002_0224a28c`/`func_ov002_0224f024` (exact
> twins) showed the OPPOSITE — target uses a genuinely strength-reduced
> incrementing pointer, and what reproduces it is **typed pointer
> arithmetic computed once then incremented** (`(struct Ov002Slot*)
> (base) + i`, letting the pointer's own stride do the scaling), NOT
> array-indexing or raw byte arithmetic. So there are now two concrete
> recipes on file: array-indexing/byte-math for the non-reduced case,
> typed-pointer-then-`ptr++` for the reduced case — matching "isn't
> guessable from the arithmetic alone," but no longer a single
> undifferentiated guess. Separately, `func_ov002_021ba38c` needed
> array-indexing for one index computation while its sibling `slot`
> pointer in the SAME function legitimately strength-reduced — C-65's
> outcome can differ between two related index computations inside one
> function, not just between functions.

### C-66. A redundant `and rN, rN, #1` before a `mul`/`mla` — the compiler drops the mask when it can prove the value is already 0/1; force it back with an explicit intermediate

**The trap.** A bit0-extracted or single-bit-bitfield value that mwcc
can already prove is range-limited to 0/1 (via a `lsl`/`lsr` shift-pair
extraction, or a genuine 1-bit bitfield member) does NOT get a
redundant `and rN, rN, #1` before being multiplied — the mask is
provably a no-op, and mwcc's optimizer drops it. Many real targets
still show this exact redundant `and` immediately before the `mul`/
`mla`, and a source draft using the "obvious" extraction (direct
bitfield access, or a value passed straight from one expression into
the multiply) reliably comes out one instruction short — flagged in
`func_ov002_0220ad78` (cm-ov002-unknown-sweep-14) as a new, unexplained
residual after C-64's fix otherwise transferred cleanly.

**The fix — two working variants, same underlying idea.** Force the
compiler to treat the value as needing re-verification rather than a
provably-clean bitfield read, either by:
1. **An explicit `& 1` mask written directly in the source**, on a
   value that's already 0/1-ranged — e.g. `(self->bit0 & 1) * STRIDE`
   instead of `self->bit0 * STRIDE`. Confirmed reproducing the exact
   redundant `and` on at least 4 separate functions.
2. **An explicit intermediate variable, as its own statement**, e.g.
   `int parity = self->bit0 & 1;` declared and assigned before the
   value is used in the multiply, rather than inlining the same
   expression directly into the multiply's operand. Confirmed on at
   least 2 more functions, independently of variant 1.

Either form works; which one applies may depend on whether the target
also has other uses of the same value nearby (an inline mask fits a
single-use site, an intermediate variable fits a value reused across
multiple statements) — not yet fully distinguished, but both are real,
reproducible, and byte-exact where tried.

**Source-shape requirement — the value must come from a genuine
bitfield member, not a computed shift-pair (round 2026-08-03b
refinement).** Neither fix variant above works if the 0/1 value is a
*manually-computed* local — e.g.
`int bit0 = (unsigned int)(x << 31) >> 31;`
— instead of a real C bitfield member access
(`unsigned short field2 : 1;` on the struct, then `self->field2`). mwcc's optimizer
tracks the computed local's value-chain at the SSA level and proves
`((x << 31) >> 31) & 1` fully redundant regardless of which fix
variant is layered on top — inline mask, intermediate variable, or
both stacked together all collapse to a single plain `and rN, rN, #1`
(or, when the value also feeds a comparison instead of a multiply,
to a plain `and` where ground truth uses a fused
`cmp rX, rY, lsr #31`). The redundant `and` — and the shift-pair extraction it
depends on — only survive when the SAME logical value is sourced
through an actual bitfield member expression. Confirmed on two
functions, both round-tripped from a from-scratch draft with no
other source difference except this one substitution:
`func_ov002_02201614` (bit0 feeds both a `cmp` and a later `mla`;
switching to a bitfield member fixed the shift-pair-vs-and collapse
at the `cmp` site AND restored the redundant `and` at the `mla` site
in the same pass) and `func_ov002_022075a4` (bit0 feeds a `mul`
directly). Practical implication: when re-attempting a C-66 park,
check whether the draft extracts the bit via computed shift
arithmetic — if so, convert that one site to a bitfield-typed struct
member access before applying either documented fix variant; the
fix variants themselves are unchanged.

**Evidence — exceptionally well-confirmed in a single round.** At
least 8 independent instances/confirmations across 4 of 5 batches in
one round, entirely blind (no batch was told the mechanism, only that
the question existed): `func_ov002_02201614`, `func_ov002_02201498`
(variant 1, batch 1), `func_ov002_0224c0b8` (confirmed the residual,
fix not completed, batch 2), 2 more functions with variant 2 (batch 3),
`func_ov002_0221eda8` and one more (variant 1, batch 4),
`func_ov002_02214cb8` (same instruction block reproduced byte-identical
across 4 different source structurings, strong but not yet resolved,
batch 5). This is more independent same-round confirmation than any
other lever in this catalogue had at the time it was first written up.

**Provenance:** cm-ov002-unknown-sweep-14 (residual first flagged,
`func_ov002_0220ad78`), resolved cm-ov002-unknown-sweep-15 (both fix
variants found and independently reconfirmed across 4 batches);
bitfield-source-shape requirement added cm-c66-resweep, round
2026-08-03b (independent from-scratch instruction-level reproduction
on `func_ov002_02201614` and `func_ov002_022075a4` — both functions
had been touched in sweep-15 without a full function-level ship,
consistent with the companion-wall explanation below rather than a
failure of the lever itself).

> **Extension — applies to shift-then-OR bit-packing, not just
> mul/mla (cm-ov002-unknown-sweep-17, 2026-08-06, batches 4 and 5
> independently, no cross-talk).** The same "already-provably-0/1 gets
> its mask elided" mechanism also strikes an `orr`-based packed-word
> construction, not just a multiply. Batch 4
> (`func_ov002_02263858`, building `(bit0<<31)|(flag<<24)|const`): the
> original has a redundant `and` after EACH shift re-isolating an
> already-single-bit value; writing each shift result into its own
> named variable, THEN explicitly re-masking that variable as a
> separate statement (`signBit = bit0<<31; signBit = signBit &
> 0x80000000;`) reproduces it — needed for both halves independently,
> doing it for only one left the other diverging. Batch 5
> (`func_ov002_021d16f8`, a byte-pack `(u8)lo | ((u8)hi<<8)`): same
> "re-masked at point of use" treatment, fix was typing the
> intermediates as plain `int` (not `u8`) so the compiler doesn't elide
> the second mask, with an explicit `(u8)` cast at the use site. Two
> independent same-round confirmations of the OR-context extension —
> treat as established, not tentative.

> **RESOLVED (cm-ov002-unknown-sweep-17, 2026-08-06, mini-item A) — this
> was three separate outcomes wearing one symptom, not one open
> question.** The prior round's OBSERVED note (2026-08-04) flagged
> `func_ov002_0224bd3c`, `func_ov002_021f058c`, and `func_ov002_021eba34`
> together as one unresolved register-role-swap signature and
> explicitly suggested forcing the idx offset through a C-63
> bitfield-typed intermediate as the untried next step. That variant
> was tried on all three this round, directly. It did not move the
> register-pairing residual on any of them — but it separated the
> three into what they actually are:
> - `func_ov002_021eba34` is already a **documented P-20 member**
>   (see above), independently landing at the identical 76.3% figure
>   sweep-6 recorded for it in 2026-07-30. It should have been
>   recognized and parked on sight; it wasn't, because this note didn't
>   cross-reference the P-wall catalogue when it was written. Lesson
>   for future rounds: check the P-wall affected-picks lists, not just
>   the C-lever catalogue, before writing a fresh OBSERVED note.
> - `func_ov002_0224bd3c` is a genuinely new instance of **P-23**
>   (pool-constant register-pairing wall), now promoted from
>   provisional (n=2) to confirmed (n=3) — see P-23 above for the full
>   7-variation evidence trail.
> - `func_ov002_021f058c` was NOT the same wall at all. Its 39.5%
>   baseline was mostly ordinary, fixable complexity: a genuine
>   bitfield-typed struct member (matching C-63's established idiom,
>   extended here to an idx-stride of 0x14 rather than a natural
>   4-byte `int*` stride — see C-63's extension note below) plus a
>   C-55 shared-tail `goto` took it to **97.4%**, parked one word short
>   on an unrelated, narrower residual: a single commutative-operand
>   swap in a plain `add` (not an `mla`), which resisted 4 more
>   variations on its own. Not promoted to a P-wall at n=1 — flagged
>   here for a future round to recognize if it recurs, distinct from
>   both P-20 and P-23's `mla`-specific signatures.

### C-67. A 2-way mutually-exclusive `if`/`else if` on equality that resists a goto restructure may still resolve via `switch`


**The trap.** GT sometimes lays out a 2-arm mutually-exclusive
equality selection (`if (x == A) v = P; else if (x == B) v = Q;`) as a
branch to a SEPARATE block with its own dedicated load for the first
arm, rather than the compact `cmp`+`ldreq`+`cmp`+`ldreq` predicated
form a straightforward if/else-if naturally produces. A source draft
using plain if/else-if — or an explicit `goto`-based restructure
mirroring the branch-away shape directly — both compiled to the
IDENTICAL (wrong) predicated form on `func_ov002_02208118`; the goto
rewrite made no difference at all, mwcc's optimizer collapsed it back.

**The fix.** Rewrite the same two arms as a `switch` on the tested
value, one `case` per equality target:

```c
switch (field0) {
case 0x175b: val = 0xfa7; break;
case 0x17f6: val = 0xff8; break;
}
```

This produced GT's exact branch-to-separate-block shape immediately —
100% match, no further iteration needed. `switch` and `if`/`goto` are
NOT interchangeable inputs to mwcc's branch-layout decision here, even
though both are semantically identical to a human reader.

**Confidence — no longer single-instance.** The underlying mechanism
(why `switch` gets a different layout pass than an equivalent `goto`)
is still not understood, but the fix itself is now confirmed across
multiple independent functions and generalizes beyond the original
2-arm value-assignment shape.

> **Generalization — beyond value-assignment, to full block dispatch
> (cm-ov002-unknown-sweep-17, 2026-08-06, batch 3).** The lever also
> resolves 2-arm and 4-arm equality selections where each arm is a
> DIFFERENT CALL SEQUENCE, not just a different value pick.
> `func_ov002_0222d2f8` (shipped): a genuine 2-value dispatch, plus a
> separate finding that a plain `goto` to a trivial ONE-STATEMENT block
> can get silently collapsed back to predication by the optimizer even
> when written correctly — `switch` is the reliable fix there too, not
> just for the documented multi-instruction case.
> `func_ov002_021b9000` (parked, but this specific residual fully
> closed): a 4-value dispatch via a range-comparison chain — the
> `switch` restructure reproduced the entire branch/label structure
> byte-for-byte; only an unrelated register-naming residual remains
> (see P-28).

**Affected picks:** `func_ov002_02208118` (original, 100%),
`func_ov002_0222d2f8` (100%, 2-value block dispatch),
`func_ov002_021b9000` (branch structure 100%, unrelated residual
remains) — all ov002.

**Provenance:** cmatch/ov002-sweep-16, round 2026-08-04
(`func_ov002_02208118`); cm-ov002-unknown-sweep-17 (2026-08-06),
batch 3.

### C-68. A PerPlayerRowTable row entry's split 9-bit id is reconstructed by addition, not OR, across two disjoint bit ranges

**The shape.** A row entry stores a 9-bit id split as bits `[29:22]`
(upper 8 bits) plus bit `13` (1 bit) — NOT contiguous, and not simply
concatenated. Ground truth reconstructs the full value as:

```c
rowId = ((entry << 2) >> 24) << 1;
rowId += (entry << 18) >> 31;
```

This is an **ADD**, not an OR, confirmed against ground truth hex —
even though the two components never overlap bits and OR would be
semantically equivalent, only the ADD form reproduces the target
instruction sequence. The reconstructed value is then compared against
a *different* packed representation stored directly in a self-field as
`(self->fN << 17) >> 23`.

**Evidence — 4 recurring instances in one batch, entirely blind.**
`func_ov002_021eecd8`, `func_ov002_02232c84`,
`func_ov002_02227c4c`/`func_ov002_02228418` (exact twins) all decode to
this identical shape. The formula matched instruction-for-instruction
on `func_ov002_02227c4c`'s specific sub-block; applying it there took
that function from 10.3% to 51.3% (combined with a separate C-66 fix).
None of the 4 instances were fully closed to 100% this round — the
formula resolves this ONE sub-block, not the whole function; each
function's remaining residual was a broader register-allocation issue
unrelated to this specific pattern.

**Provenance:** cm-ov002-unknown-sweep-17 (2026-08-06), batch 1.

### C-69. The exact C operator/cast used to reach a bitfield member controls its codegen, not just the resulting arithmetic value

**The trap.** Two source forms that compute the identical resulting
value through a bitfield member can produce different instruction
sequences depending on the literal operator or cast used to get there
— semantic equivalence is not enough.

**Two confirmed sub-cases (cm-ov002-unknown-sweep-17, 2026-08-06,
batch 5, same round, different functions):**

1. **`x--` vs `x = x - 1` on a bitfield member.**
   `func_ov002_02220e54` needed `a0->count--;` specifically. The
   explicit-subtraction form (`a0->count = a0->count - 1;`) compiles
   as a plain `sub`; the target instead materializes the decrement as
   two chained `add`s of `0xff` and `0xff00` inside the bitfield-store
   round-trip (i.e. `+0xffff ≡ -1 mod 65536`). Only the `--` operator
   reproduces this — the arithmetically-identical explicit form does
   not.
2. **An explicit narrowing cast can be actively harmful, not just
   redundant.** `func_ov002_021d16f8`: `unsigned short x; ... x >> 8`
   already compiles to `asr` (arithmetic shift) because `x` promotes
   to plain `int` per ordinary C integer-promotion rules, even though
   it was read via a zero-extending `ldrh`. Adding an explicit
   `(short)x >> 8` cast on top — intuitively "more correct" — is
   WRONG: it makes mwcc emit a real sign-extension sequence
   (`lsl#16;asr#24`) instead of matching the target's bare `asr#8`.
   Trust plain integer promotion before reaching for an explicit cast.

**Confidence — single instance each, same round, same batch.** Worth
watching for recurrence rather than treated as fully general yet.

**Provenance:** cm-ov002-unknown-sweep-17 (2026-08-06), batch 5.

> **Extension — a hard boundary on the goto-to-distinct-labels fix
> (cm-main-tier-sweep-1, 2026-08-08, batch 1).** Two sequential
> "same trailing action" guards on DIFFERENT variables/expressions
> (`if (A==0) return; if (B==0) return;`) get compound-compare-merged
> by mwcc's optimizer regardless of surface syntax (`&&`-wrap,
> `||`-early-return, sequential-if all identical) — the fix is `goto`
> to two lexically DISTINCT labels, even if both bodies are identical
> (`ret1: return; ret2: return;`); confirmed on `func_020480b4`
> (9.5%→85.7%) and reused successfully on `func_0204931c`'s first
> guard pair. **But this does NOT work when the two conditions are
> repeated equality tests on the SAME already-loaded register**
> (`tag==0`/`tag==2` on one variable, or a 3-way `a0==2`/`a0==3`/
> `a0==4`) — there, `&&`, goto-same-label, goto-distinct-labels, and
> `switch` all either reproduce the identical compound-compare merge
> or collapse even further with each attempt (see P-33). Different-
> variable guard pairs are goto-fixable; same-register repeated-
> equality guards are not, at least not via any source-level trick
> tried so far.

### C-70. A `cmp;cmpeq` pair sharing a materialized-zero register on adjacent even-offset fields is often a disguised 64-bit `== 0` compare, not two independent `int` guards

**The trap.** A guard-chain shape showing `cmp regA,r0; cmpeq regB,r0`
(a shared zero register, materialized once via `mov r0,#0`) testing
two struct fields that look like independent 32-bit ints is very
often actually a single `long long` (64-bit) field compared to zero
— the "AND of two equality tests" some readers assume is really just
the mandatory two-half comparison ARM needs for a 64-bit `==0`.
Modeling the two halves as separate `int` fields joined with `&&`
produces 4 independent branches (wrong): every combination of
short-circuit ordering and predicate direction still shows extra
branch instructions the target doesn't have.

**The fix.** Model the pair as one `long long` struct field (or two
adjacent `long long` fields, matching the exact reserved stack/struct
span) and compare it directly to `0`:

```c
struct { long long field_0; long long field_8; int field_10; } *s;
if (s->field_0 == 0 && s->field_8 == 0) { ... }
```

Matched byte-for-byte on the next attempt once the two fields were
retyped as `long long` (was 4 independent-`int` branches; became the
target's exact `cmp;cmpeq` pair). Worth checking FIRST whenever a
guard-chain candidate shows a `cmp;cmpeq` pair sharing a materialized-
zero register on adjacent, evenly-offset fields.

**Affected picks:** `func_02044c10` (main, 100%).

**Provenance:** cm-main-tier-sweep-1 (2026-08-08), batch 1.

### C-71. A leaf function (no push/pop at all) can still require legacy-tier routing — the 3-tier discriminator gives no signal when there's no prologue/epilogue to read

**The trap.** The routing rule as documented is keyed off
prologue/epilogue shape (`sub sp,#4` + 2-step pop vs fused 1-step
pop). A leaf function has NEITHER — no stack frame, no push, no pop —
so the discriminator is silent. Compiling such a function under the
default (mwcc 2.0/sp1p5) tier can diverge early with a totally
different instruction count/shape, which looks like a source-shape
bug but is actually a compiler-version issue.

**The mechanism.** mwcc 2.0/sp1p5 aggressively peephole-optimizes an
"AND with a 16-bit mask constant that doesn't fit an ARM rotated
immediate" into an equivalent `lsl`+`lsr` shift-pair, avoiding the
pool-constant load entirely. mwcc 1.2/sp2p3 (legacy) does NOT perform
this substitution and emits the straightforward `ldr`-pool-constant +
`and`, matching the target.

**The fix.** If a leaf/no-prologue candidate's plain-tier compile
diverges early with a completely different instruction count/shape
(not just a register swap), try `.legacy.c` routing before spending
more cycles on C-source reshaping — the identical C body, just
renamed, can go from 0% to 100%.

**Affected picks:** `func_02054b44` (Park-Miller RNG step, 16807
multiplier, 0%→100% under legacy with zero body changes),
`func_020558fc` (6.7%→80% under legacy, though a separate P-20
residual remained on top) — both main.

**Provenance:** cm-main-tier-sweep-1 (2026-08-08), batch 2.

### C-72. A goto-target label's PHYSICAL POSITION in the source must match the original's actual block address order — not just "a goto exists somewhere with the right polarity"

**The trap.** C-55 already establishes that a branch-away `goto` can
be needed instead of a predicated `if`/`else`. What's easy to miss is
that the goto TARGET LABEL's placement in the source — before or
after the "main" code, at the top or bottom of the function — is
itself significant, independent of the goto's polarity being
correct. A "natural"-feeling placement (early-return code first,
shared/goto target declared last) can produce a systematically wrong
result — not a register swap, but wrong branch offsets/polarities
throughout — because it forces a different block layout than the
target, even though the control-flow graph is logically identical to
the correctly-placed version.

**The fix.** Walk the `.s` file's label positions in ADDRESS order
(the same technique C-44 already prescribes for switch-body layout)
and lay out the C `goto` targets in that same physical order — not
whatever order feels natural to write, and not always "shared exit
at the bottom of the function". Sometimes the failure label must sit
physically BEFORE the success-path label, with the guard branching
*forward* to the main path and falling through to the failure label;
sometimes it's the reverse. Read the block order off the disassembly
directly rather than assuming a convention.

**A related symptom of the same mechanism: over-merging.** When a
function has an early-exit block and a late-completion block that
are physically far apart in the target but return the identical
expression, writing a single shared `return expr;` lets mwcc
tail-merge ALL of the function's logical exit points into one block
— wrong, if the target keeps them separate. Fix: write two lexically
DISTINCT `return expr;` statements (one per block), even though
they're textually identical, to force the separate layout.

**Evidence — hit independently by 3 batches, 6+ instances, this
round alone.** `func_02051ab0` (over-merging symptom: single shared
return wrongly merged all 4 exit points; two textually separate
`return a2;` statements fixed it, 100% on the next try).
`func_02051ec0` (goto-placement symptom: `ret0:` needed to appear
BEFORE the "work" block, guard branching forward on success — the
logically-equivalent inverse compiled with systematically wrong
branch offsets throughout). `func_02055654`/`func_020556c8`/
`func_0205d614` (batch 2: the shared `ret:` label had to sit
physically BEFORE the main-path label, matching the target's early-
block/branch-over layout — placing it at the end of the function, a
seemingly equivalent CFG, produced measurably worse output than even
the naive predicated form). `func_0206e4a4`/`func_0206df54`/
`func_02070d34` (batch 4: same fix, applied by literally walking the
`.s` file's label addresses in order, matching C-44's technique).

**Affected picks (7):** `func_02051ab0`, `func_02051ec0`,
`func_02055654`, `func_020556c8`, `func_0205d614`, `func_0206e4a4`,
`func_0206df54`, `func_02070d34` — all main, all 100%.

**Provenance:** cm-main-tier-sweep-1 (2026-08-08), batches 1, 2, 4.

> **Sub-pattern — shared-exit-via-goto for two independently-
> if-converted call sites (cm-main-tier-sweep-2, 2026-08-08, batch 2).**
> A DIFFERENT symptom of the same physical-placement mechanism: the
> target reuses ONE epilogue block from multiple call sites (e.g. two
> different guard failures both fall through to the same `return 0;`),
> but a naive C source independently if-converts EACH site into its own
> predicated return — producing two separate copies of the same exit
> instead of one shared block reached by real branches. Fix: `goto` from
> both sites to one shared label, same as the main entry's return-
> statement-merging fix, but the trigger here is "two call/guard sites
> converging on one identical exit," not "physically-distant exit
> blocks." `func_020ab054` (main, 100%).

> **Diagnostic signature confirmed again, 4 more instances
> (cm-main-tier-sweep-3, 2026-08-08, batches 3 and 5).** The tell is a
> prologue `push`/`stmdb` register list short by exactly one register
> from ground truth (e.g. `e92d4000`/`{lr}` vs `e92d4010`/`{r4,lr}`, or
> `e92d4070`/`{r4,r5,r6}` vs `e92d40f0`/`{r4,r5,r6,r7}`) on a function
> with 2+ independent early-return guards ahead of a shared tail:
> `func_020a1d44` (two independent `if (cond) return 0;` sites →
> `goto fail;` into one shared `return 0;`, 8.0%->91.3% in one edit),
> `func_02089df8` (identical pattern, 6.5%->100%), `func_02089ee8`
> (early return + late return funneled through one `goto tail;`
> block, 6.5%->100%). **New sub-case (`func_020ace14`, batch 5):** two
> independent guards can also share ONE physical FALLTHROUGH block
> rather than a goto-reached tail — guard 1 explicitly branches to the
> shared block, guard 2 branches AWAY on success and falls through to
> that SAME block on failure. The shared label had to sit physically
> BETWEEN the two guards, not at the function's end (placing it at the
> end measurably regressed the match, 17.2%->still 17.2%); also needed
> a flat 3-way `if(x==0)goto; if(x==1)goto; if(x==2)…` chain rather
> than `if/else if` to match the target's dispatch-then-bodies block
> order. Took 17.2%->63.3% (parked on an unrelated partial-predication
> residual, C-72 itself fully resolved).

### C-73. A field re-read needs an explicit `volatile` qualifier to survive mwcc's CSE even with zero true aliasing risk — both for a repeated READ and for a READ immediately after a STORE

**The trap.** A struct-field dereference that appears twice in the
target with no intervening store (a trivially side-effect-free
repeated read) can still get value-numbered into a single load by
mwcc's CSE — a wider trigger than the previously-documented
"aliasing store forces reload" case. The same CSE also fires across
a STORE: when the target re-`ldr`s a field immediately after storing
to it (a fresh read of a value the compiler could easily have kept
in a register), the natural C phrasing lets mwcc fold the store's
source value straight into the following use instead of re-loading.

**What does NOT work for the store-then-reload case.** A pointer-
indirection trick (`T **p = &x->field; *p = y; if (*p == 0) ...`) did
not force the reload.

**The fix.** Mark the SPECIFIC struct member `volatile` — only that
member, not the whole struct or the whole pointer — at its
declaration. This forces a fresh load on every access, matching the
target exactly, with zero disruption to the surrounding
already-matching instructions. Works for both triggers (repeated
read; read-after-store).

**Evidence.** Repeated-read variant confirmed on `func_02046a5c`,
`func_02046ae0`, `func_0207d05c` (batch 1) — the third shows it
surviving as a single-line reload buried inside a larger doubly-
linked-list insertion, not just a small-function quirk. Read-after-
store variant confirmed on `func_020683ec`, `func_0206b47c`
(batch 3).

**Affected picks (5):** `func_02046a5c`, `func_02046ae0`,
`func_0207d05c`, `func_020683ec`, `func_0206b47c` — all main, all
100%.

**Provenance:** cm-main-tier-sweep-1 (2026-08-08), batches 1, 3.

### C-74. An address-taken local must be sized to the callee's FULL reserved stack span, not just the bytes the C source visibly reads back

**The trap.** Passing `&local` to an opaque callee that (per the
disassembly) reserves more stack than a single scalar needs
(`sub sp,#8` / `sub sp,#0xc`) — where only the first word is ever
read back by the caller itself — is easy to under-declare as a plain
`int local;` (4 bytes). This produces a PROLOGUE-ONLY divergence:
mwcc folds the "missing" bytes into an extra push register instead
of a plain `sub sp`, changing the callee-save register count and,
transitively, which physical registers everything else in the
function lands in — even though every body instruction still matches
byte-for-byte in isolation.

**The fix.** Size the local to match the ORIGINAL's reserved span
exactly (`int local[2]` for 8B, `int local[3]` for 12B), even though
the extra words are never referenced by name in the C source. This
is a variant of the sp1p5-vs-sp3 r3-filler discriminator already
documented in `sp3-routing-decision.md`, but the trigger here is
LOCAL-VARIABLE SIZING, not register-count parity.

**Affected picks:** `func_02068ab4`, `func_0206b47c` (main, both
100%).

**Provenance:** cm-main-tier-sweep-1 (2026-08-08), batch 3.

> **Extension — multiple same-scope locals passed by address to the
> SAME callee need one struct, not separate declarations, to get the
> right relative stack order (cm-main-tier-sweep-2, 2026-08-08,
> batch 3).** When a caller passes `&a` and `&b` (two separate locals)
> to one opaque callee that reads back through both, two independently-
> declared locals can land in the WRONG relative order on the stack no
> matter which declaration/reference order is tried (byte-identical
> output across 2 different orderings) — because the compiler is free
> to place unrelated locals in either order. Wrapping both in one
> anonymous `struct { ... } tmp;` and passing `&tmp.a`/`&tmp.b` forces
> the exact physical layout the target expects. `func_02065d18` (main,
> 100%, combined with a C-76 LDRH/LDRSH fix for the remaining word).

### C-75. Pure statement-order (scheduling) sensitivity, with no register, type, or control-flow change, can be the only lever a function needs

**The trap.** A function can have every register, type, and branch
choice already correct and still mismatch purely because mwcc's
scheduler hoists or sinks independent work when the C source gives it
room to — matching the target's exact instruction sequence sometimes
requires matching its exact STATEMENT order, with no other change.

**The fix.** Reorder the C statements to mirror the target's read of
the `.s` file directly — e.g. move a call-argument computation to sit
between two field stores instead of after both, if that's where the
`.s` file's instructions actually fall. Try this before reaching for
heavier restructuring tools (goto, volatile, retyping) when the diff
looks like a pure reordering with no register or value change.

**Affected picks:** `func_02074c74` (main, 100% — a call-argument
computation moved between two stores), plus the general principle
observed again in batch 5's session notes as a first-thing-to-try.

**Provenance:** cm-main-tier-sweep-1 (2026-08-08), batches 4, 5.

### C-76. Signed/unsigned typing controls more than arithmetic semantics — it selects ASR vs LSR for shifts, and can be needed at only ONE use site while leaving a related idiom's own typing untouched

**Two confirmed sub-cases (cm-main-tier-sweep-1, 2026-08-08, batches
4 and 5, same round, different functions):**

1. **Shift-instruction selection.** A plain (signed) `int`
   right-shifted compiles to `ASR`; a target's `LSR` needs the
   operand declared or cast `unsigned`. Seen cleanly on a hand-rolled
   32-bit byte-swap (`((v>>24)&0xFF) | ((v>>8)&0xFF00) | ...`) where
   all four shift instructions were affected the moment `v` was typed
   signed instead of `unsigned int` (`func_0206e720`, main, 100%).
2. **A targeted cast at the comparison site only, not the variable's
   declaration.** A modulo-16 ring-buffer index needed its counter
   variable to STAY plain signed `int` at declaration — to preserve
   mwcc's full sign-correcting modulo-by-16 idiom (`lsr #31`/`rsb`/
   `ror #28`), which silently collapses to a trivial `AND #0xf` if the
   variable is declared `unsigned` (regression to 0% when tried) — but
   the SEPARATE `count < 16` range-check specifically needed
   `(unsigned int)count < 16` to get the `CC` (carry-clear) condition
   code instead of the `LT` (signed) a plain comparison produces.
   Fixing only the comparison site, leaving the modulo's own type
   signed, matched 100% (`func_0207cdd0`, main). Related to but
   distinct from C-64 (LS-vs-EQ on `for`-loop pre-checks): this is a
   plain `if`, not a loop, and the codes involved are CC/LT, not
   LS/EQ.

**Provenance:** cm-main-tier-sweep-1 (2026-08-08), batches 4, 5.

> **Extension — LDRH-vs-LDRSH, and branch condition codes, not just shifts
> (cm-main-tier-sweep-2, 2026-08-08, batches 3, 4).** The same signed/
> unsigned lever also controls which LOAD instruction mwcc picks (a
> `short*` cast → `LDRSH`, sign-extend; `unsigned short*` → `LDRH`,
> zero-extend) at a single read site, independent of any shift (batch
> 3, `func_02065d18`). It also controls which CONDITION CODE a branch
> gets: a `for`-loop-adjacent range value declared `unsigned int`
> produces `BCC`/`BCS`; the SAME value declared plain signed `int`
> produces `BLT`/`BGE` — even when the value is provably non-negative
> either way, so "it can never be negative" is not a safe reason to
> default to `unsigned` (batch 4, `func_0208dd9c`). Check the target's
> actual condition-code mnemonic before picking a type, don't infer it
> from the value's real range.

### C-77. A scan-loop's traveling pointer must be the incoming PARAMETER itself, mutated in place — not a copy — or the final delta's operands land in swapped registers

**The trap.** For a loop that scans forward from a pointer parameter
and returns an offset/delta at the end, writing `char *p = param;`
and scanning `p` while leaving `param` untouched is semantically
identical to mutating `param` directly (`param++`) and saving a
*fresh local* for the original start — but the two forms make mwcc
assign the scanning role to different physical registers throughout
the function, swapping which operand of the final `sub` (delta
computation) lands where.

**The fix.** Mutate the incoming parameter itself in the loop; if you
need the original start value at the end, save it into a NEW local
declared before the loop, not the other way around (don't leave the
parameter untouched and scan a copy).

**Affected picks:** `func_02077094` (main, 100%), and independently
confirmed on `func_020aaf10`'s first loop (main, that function's
overall park was for an unrelated second-loop wall).

**Provenance:** cm-main-tier-sweep-2 (2026-08-08), batch 1.

### C-78. A loop's compound exit condition (e.g. "not null AND not-yet-found") must have BOTH tests physically in the check block reached by the loop's entry jump — not split across the check block and the body

**The trap.** `while (cond1) { if (cond2) return; advance(); }` is
logically equivalent to a loop that exits on `!cond1 || cond2`, but it
puts `cond2`'s test in the wrong basic block relative to the target:
many `for`/`while` loops are compiled with a jump-to-check-first
layout (entry jumps directly to the condition test, body only reached
after that test passes), and if the compound condition's second half
lives in the body instead of the check block, the resulting CFG has a
different shape entirely — extra words, wrong branch targets — even
though it's semantically identical.

**The fix.** Use explicit `goto`/labels to force BOTH halves of the
compound exit condition into the SAME block that the loop's initial
entry jump reaches, with only the advance/increment step left in the
body/backedge block.

**Affected picks:** `func_020919ac`, `func_0206e504` (main, both
100%).

**Provenance:** cm-main-tier-sweep-2 (2026-08-08), batch 1.

### C-79. Register pairing for pure data-flow (no branches involved) can hinge on declaration order or written operand order alone, with the emitted instruction order completely unchanged

**The trap.** This is C-55's "polarity" idea (source phrasing controls
codegen even when semantically inert) applied outside branches — to
plain value/register assignment. Three independent shapes hit this in
one batch: (1) a shift-amount local needed to be initialized by
COPYING the loop counter (`sh = i;`) rather than an independent literal
(`sh = 0;`) to land in the right register, even though both are 0 on
first iteration; (2) two locals (a counter and a zero-initialized
accumulator) needed to be DECLARED before an unrelated pointer local,
not after, to get the right register pairing; (3) a bitwise-OR's two
operands needed to be WRITTEN in a specific syntactic order
(`(field<<N) | (*reg&mask)`, not the reverse) even though the actual
emitted instruction sequence was byte-identical either way once
matched.

**The fix.** When a diff is a pure register-identity swap with
correct instruction count/order otherwise, try: matching a local's
initializer to reuse an already-live value instead of an independent
constant; reordering local declarations (not statements); and
reordering a commutative expression's written operand order. All
three are free, source-only changes with zero effect on the emitted
instruction SEQUENCE, only on register assignment.

**Affected picks:** `func_020442f8`, `func_02095c18`, `func_020a5f10`
(main, all 100%).

**Provenance:** cm-main-tier-sweep-2 (2026-08-08), batch 1.

### C-80. An explicit double-shift (`(x & mask) << N) >> N`) can get silently collapsed into one instruction by mwcc's own peephole, undershooting a target that keeps both shifts separate — write it so the collapse can't fire

**The trap.** This is a word-COUNT preservation issue, distinct from
C-76's condition-code/instruction-selection issue even though both
involve shift instructions. mwcc's optimizer proves an explicit
double-shift idiom (mask-then-shift-then-unshift, commonly used to
sign- or zero-extend a sub-field) is equivalent to a single ASR/LSR
and collapses it — but some targets keep the two shifts as genuinely
separate instructions, and the collapsed 1-instruction form is then
one or more words short.

**The fix.** Write the double-shift explicitly with the correct
signedness on both the masking type AND the shift operations — get
this exactly right and the collapse doesn't fire; get the signedness
wrong on either half and either the collapse still fires or the wrong
condition/value comes out.

**Affected picks:** `func_020938f8`, `func_0207da1c` (main).

**Provenance:** cm-main-tier-sweep-2 (2026-08-08), batch 2.

### C-81. For `pointer + int` addition, mwcc always assigns the POINTER operand to the ADD's Rn (base) field regardless of the C source's left/right operand order — cast both operands to a plain integer type to regain operand-order control

**The trap.** `ptr + len` and `len + ptr` are commutative in C and
compile IDENTICALLY under ordinary pointer arithmetic — mwcc always
puts the pointer in Rn (the base register position) and the integer
in Rm, regardless of which one is written first. If a target's
register allocation implies the two operands need to swap Rn/Rm
positions (matching a different physical register to each role), pure
source-order changes on a genuine pointer expression cannot produce
that.

**The fix.** Cast BOTH operands to a plain integer type (e.g.
`unsigned int`) before adding, removing pointer-ness from the
expression entirely — this restores ordinary commutative-operand-order
behavior and gives back control over which operand becomes Rn.

**Affected picks:** confirmed by controlled A/B test on `func_0207d4dc`
(main; both orderings under real pointer arithmetic produced identical
output, the cast-to-`unsigned int` form was the only one that changed
Rn/Rm assignment) — part of a park, not a full ship, but the lever
itself is a clean, isolated, reproducible finding.

**Provenance:** cm-main-tier-sweep-2 (2026-08-08), batch 4.

### C-82. A `switch` case whose body is textually identical to `default`'s must stay a SEPARATE case label — a shared `case N: default:` label lets mwcc merge their jump-table targets

**The trap.** When a case value's computed result happens to equal
the `default` arm's result, writing them as one shared label
(`case 3: default: X; break;`) is the natural C simplification — but
mwcc's redundant-block elimination treats the shared label as
license to merge the two jump-table entries onto ONE physical copy
of `X`, producing a smaller function than the target, which keeps
the two bodies as duplicate, separately-addressed code (one entry
"falls through" from an explicit `case 3:` block, the other is a
true `default:` block elsewhere) even though both compute the exact
same value.

**The fix.** Keep the two arms as textually distinct case labels —
`case 3: X; break;` and, separately, `default: X; break;` — even
though the bodies are byte-for-byte identical C. This preserves two
separate jump-table targets and two separate compiled copies,
matching the original.

**Affected picks:** `func_0206b814` (main, 120B, small dispatcher) —
28-word wrong output with the shared label, 30-word correct output
(matching the target's two redundant `ldr` pool loads) once split.
100% on the next try after the fix.

**Provenance:** cm-main-tier-sweep-3 (2026-08-08), batch 1.

> **Worked-example addendum to C-44 (cm-main-tier-sweep-3, batch 2).**
> A first pass at reading a jump table's raw `b`-list off the wrong
> mental model (assuming "the entry for value 0 is the second `b`
> after `addls`" without re-verifying against the ACTUAL list for
> this function) silently mapped every case value to the wrong body.
> Re-deriving carefully from the raw list
> (`[L_160, L_138, L_148, L_15c, L_160, L_138]`) gave the real mapping
> — value0→L_138, value1→L_148, value2→L_15c, value3→L_160 (empty
> tail), value4→L_138 (cases 0 and 4 share a body via fall-through) —
> and fixed `func_0206c3f4` straight to 100%. Worth restating as a
> standing caution: this still compiles cleanly to A jump table when
> wrong, just the wrong one — always re-count the raw `b`-list for
> THIS function rather than trusting a remembered pattern from a
> previous one.

## Permanent P-wall index (38 live, P-17 under reconsideration; P-6/P-7/P-8/P-10 retired)

mwcc keeps "winning" the codegen choice regardless of C source
variation. Budget **zero matches** for symbols hitting these
walls in yield predictions. Future pilots: skip-and-document
rather than iterating.

| P-wall | Status | Current routing note |
|---|---|---|
| P-1 | LIVE | Shift-pair vs mask collapse; source-form pipeline wall. |
| P-2 | LIVE | `ldmia`/`ldmib`/`stmia` fusion mismatch. |
| P-3 | LIVE | Constant materialisation: pool load vs add/orr chain. |
| P-4 | LIVE | Tiny-thunk register-allocation divergence. |
| P-5 | LIVE | Halfword offset above the immediate range. |
| P-6 | RETIRED | Routing-tier gap; superseded by legacy-tier routing. |
| P-7 | RETIRED | **SUPERSEDED BY C-27:** dual externs plus symbol alias and pointer dance. |
| P-8 | RETIRED | **SUPERSEDED BY C-25:** split the bit-chain into two statements. |
| P-9 | LIVE | Conditional `mvn` mask form; keep distinct from recoverable early returns. |
| P-10 | RETIRED | **SUPERSEDED BY C-29:** `if (!p) return ...` early-return polarity. |
| P-11 | LIVE | mwcc 2.0 mid-size helper-call register-allocation plateau. |
| P-12 | LIVE | Non-leaf chained-cast register-allocation divergence. |
| P-13 | LIVE | C-39c bitfield-packing cross-tier irreducible. |
| P-14 | LIVE | In-range sub-struct base-offset fold. |
| P-15 | LIVE | Legacy-tier register-allocation and constant-CSE plateau. |
| P-16 | LIVE | Repeated-address rematerialisation after a call. |
| P-17 | **UNDER RECONSIDERATION** | Briefs 288/290 commutative-add CSE/register-allocation wall — 2 of 17 members resolved by an untested lever, see body. |
| P-18 | LIVE | Task-config field-write store-reordering (independent stores resequenced). |
| P-19 | LIVE | Bit-pack intermediate register-choice CSE divergence (r0 vs r2). |
| P-20 | LIVE | Per-player row-offset multiply register-letter swap (`(player&1)*0x868` idiom). |
| P-21 | LIVE | Loop/field-extraction-variable register permutation (near-miss, 65-97%). |
| P-22 | LIVE | Slot bit-manipulation register-pressure wall — the `&1` remask lever backfires here. |
| P-23 | LIVE (tentative — was confirmed, downgraded 2026-08-18) | Pool-constant register-pairing wall (`mla`'s two constant operands, r0/r1/r3). n=2 after `02253304` retracted (shipped clean via an unrelated fix). |
| P-24 | LIVE (tentative) | Per-player row + idx*0x14-stride loop register-swap, P-20-sibling shape (5 members, unconfirmed against re-attempt). |
| P-25 | LIVE | Legacy_sp3-tier dead-value-in-callee-saved-register push/stack-padding wall. |
| P-26 | LIVE | Precheck-array-lookup P-20 variant with an added EQ-vs-LS condition-code component. |
| P-27 | LIVE | Post-call scheduling/materialization resists source-level restructuring (family, not one mechanism). |
| P-28 | LIVE (tentative) | Single-scratch-value register-mirror, broader than P-20/P-23's literal `mla`-operand shape. |
| P-29 | LIVE (tentative) | Single-symbol guard + row-loop eager-`mla` fusion (single-batch). |
| P-30 | LIVE (tentative) | Canary-lever residual — shared large-offset base reproduces structure but not its physical register (main). |
| P-31 | LIVE | Predication-resistance — mwcc fully if-converts a guard no restructuring can force into a branch (mirror of C-55). 8+ confirmed instances, no longer tentative. |
| P-32 | LIVE | OR-of-non-adjacent-equality-values resists branch separation; sticky CMP/CMPNE predicated form. Scope caveat: adjacency alone insufficient inside a larger guard chain. |
| P-33 | LIVE | Same-register repeated-equality compound-compare-merge; no working recipe (C-55 boundary case). Confirmed bidirectional across three members. |
| P-34 | LIVE (tentative) | Prologue pad-register-fold resistance — stack-alignment pad won't fold into the `lr` push from any source form. |
| P-35 | LIVE (tentative) | SUBS-flag-fusion resistance for a variable-assigned shift/subtract amount. |
| P-36 | LIVE | Instruction-scheduling order not source-controllable (6 sub-shapes); highest-yield new wall family this round. |
| P-37 | LIVE (tentative) | Register reuse via free-`lr`-after-`pop{pc}` — hand-optimized allocation trick, single instance. |

**Current count:** 32 genuinely live P-entries (P-17 under reconsideration,
not yet retired; P-23/24/28/29/30/34/35/37 tentative but counted live); four retired
entries (P-6, P-7, P-8, P-10). The three corrected headings among the
above are P-7, P-8, and P-10; their historical bodies remain intact. This
table previously undercounted by omitting P-27/28/29 after they were added
as body entries without a table update — recounted directly against the
body entries present in the file (cm-main-tier-sweep-1, 2026-08-08) rather
than propagated from the prior stated figure.

> **"Brief 294" citations are narrower than their bulk application
> (cm-ov002-unknown-sweep-2/3/4/5/6, 2026-07-26/27/29/30).**
> [`brief-294-regalloc-wall-scout.md`](brief-294-regalloc-wall-scout.md)
> is real, careful research — it A/B-tested `register`, expression
> duplication, and `volatile` on one specific shape (a value live
> across a `bl` inside a loop) and correctly found all three inert. The
> problem is downstream: that narrow "no C-level lever exists" verdict
> got cited as blanket justification for bulk-classifying thousands of
> unrelated `.s` residuals project-wide as permanently reg-alloc-walled
> — the same "mechanical bulk stamp, not per-function proof" failure
> mode the queue header's brief-651 rework note already names for the
> sibling `GLOBAL_ASM`/brief-302 tag, just wearing a more rigorous-
> sounding citation. Five consecutive ov002 sweeps (92-104B: 95/145
> shipped, 65.5%; 108-120B: 82/166, 49.4%; 124-132B: 59/145, 40.7%;
> 136-148B: 96/198, 48.5%; 152-164B: 72/160, 45.0%) worked almost
> entirely through candidates
> carrying this exact "brief
> 294 endgame" header, using levers brief-294 never tested —
> **declaration order** chief
> among them (already known to be inconsistent elsewhere in this
> index, e.g. P-4's own body — it is not a universal fix, but it is
> untested by brief-294 and demonstrably effective on a meaningful
> fraction of this specific cohort), alongside goto-shared-tail,
> positive-condition-wrap, and bitfield-struct-member access. The rate
> is NOT monotonically declining (65.5% -> 49.4% -> 40.7% -> 48.5% ->
> 45.0%) — it oscillates in a 40-65% band across bands, tracking
> per-band candidate composition, not a smooth exhaustion curve; either
> way the header itself has never
> predicted the outcome. Sweep-6 additionally cracked 2 of the sibling
> `brief 288/290`/P-17 cohort's own citations using a lever P-17's own
> research never tested — see the note in P-17's own entry above; the
> same "narrower than its bulk application" pattern extends to that
> citation too. Treat a
> bare "brief 294" citation the same way as a bare `GLOBAL_ASM`/brief-
> 302 one: a starting hypothesis to re-test with the full current lever
> set, not a verdict.

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
028 `func_0203d6c4`, brief 029
`func_0207d304`, brief 031 `func_ov002_022912c8`; brief 049
self-extend (wave 14, PR #372) originally added 7 ov002
addresses here after routing them through `*.legacy.c` expecting
C-15-style fix to apply: `func_ov002_0226af78`,
`_0226afb4`, `_0226aff0`, `_0226b094`, `_0226b13c`, `_0226b158`,
`_0226b258` — all `lsl 16; lsr 16` halfword zero-extends whose
*legacy-routed* attempt collapsed to `and #0xffff` even on mwcc
1.2/sp2p3, at the time. **Update (brief 596): all 7 are now
`complete` (matched) in the current tree** — see the
*Argument-marshalling exception* below. They no longer belong in
this affected-drops list. **Update (q-sm64ds-reingest, this PR):**
brief 028's other two citations here, `func_0209aa48` and
`func_0209d788`, were never genuine P-1 members either — their disasm
shows no `lsl K; lsr K` shift-pair at all (`ands+movne+moveq` and
`ands+bicne+strneh` respectively, a dead-value-write pattern, not a
shift/mask collapse). Both `.s` files already carried a brief-655
header comment saying so ("no duplicate-address evidence... never
assessed as a C-match target") that was never synced to this prose.
`func_0209aa48` has since shipped (C-23 routing, the dead-value-write
mechanism its actual shape matches); `func_0209d788` remains a genuine
near-miss but on a pure register-letter swap, not P-1 or C-23. **The
real remaining P-1 count is 8 of 69 (11.6%)**, not 17/69 or 10/69.
Still the largest single wall in this set and the most-frequently-
misapplied one (see *Wall family note* in C-15 entry above) — just
smaller than previously recorded, twice now.

### Argument-marshalling exception (brief 596) — not actually P-1

The 7 addresses above are shape-identical to genuine P-1 (same
`lsl K; lsr K` target body) but sit in a **different mwcc lowering
context**: the truncated value is being moved into a *different*
register to become another function's call argument (a tail-call
shim, e.g. `func_ov002_0226acf8(arg0, sel, 0, (u16)arg1)`), not
returned from the *same* register it started in (Family 7, below).
In that cross-register-move context, mwcc does **not** collapse to
`and` — it naturally lowers the truncation as the shift pair,
byte-identical to target, regardless of whether the C source spells
it as a cast or a mask.

Direct-mwcc dual-tier probe on `func_ov002_0226af78` (both
`mwccarm 2.0/sp1p5` and `1.2/sp2p3`, `.text`-only sha1):

| C idiom | mwcc emits | sha1 (both tiers identical) | Matches orig? |
|---|---|---|---|
| `(u16)arg1` (cast) | `lsl r1,r1,#16; lsr r3,r1,#16` | `2164ac87…` (28 B) | **yes** — matches the committed/matched object exactly |
| `arg1 & 0xffffu` (mask) | `lsl r1,r1,#16; lsr r3,r1,#16` | `2164ac87…` (28 B) | **yes** — byte-identical to the cast form |
| `(unsigned)(arg1<<16)>>16` (literal shift-pair) | `lsl;lsr;lsl;lsr` (4 insns — computes the C expression, then truncates *again* for the u16 argument) | `6e1fa595…` (36 B) | **no** — larger AND wrong; the one idiom that looks most like "writing the target shape directly" is the one that fails |

So the "write the shift form literally" instinct — the thing that
*doesn't* work for Family 7 either — is doubly wrong here: it
neither reproduces target nor is it a peephole-neutral no-op: it
emits the truncation twice. The working recipe is the boring one
(cast or mask, whichever reads better at the call site); brief 596
confirms it holds on both mwcc SP tiers, so no `*.legacy.c` routing
is needed or wanted.

Brief 250 added the C-42 wave-6 **Family 7** (3 main picks, the
only main functions with the P-1 zero-extend getter tail `ldr …;
lsl #K; lsr #K; pop` reading `base[n].field`): `func_0201b690`
(`lsl/lsr #24` byte → `and #0xff`), `func_02018dcc` (`#31` bit0 →
`and #1`), `func_02019184` (`#24` + `#28`, predicated). Brief 249
piloted `func_0201b690` at 85% and mis-framed it as "find the
shift form that defeats the peephole." Brief 250's variant matrix
confirmed even the literal `((unsigned)x << 24) >> 24` C source
collapses to `and` — P-1 is shape-collapse, no shift form exists.
The body up to the extract matches orig byte-for-byte; only the
final extract diverges. Classified **P-1-blocked**.

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

> **UPDATE (cm-sm64ds-lever-apply, 2026-07-25):** `func_0209bf18`
> **shipped** (`.legacy.c`) — not by defeating the fusion at all, but
> by ROUTING to the mwcc 1.2/sp2p3 tier, whose instruction selector
> never performs this specific `ldr`+`ldr` → `ldmia` fusion for a
> plain `(t[0]*60+t[1])*60+t[2]` transliteration. The "why permanent"
> framing above holds for the DEFAULT 2.0/sp1p5 tier specifically, not
> for the wall as a whole — worth checking tier-routing before
> classifying a fresh direction-B instance as unfixable. Two
> sm64ds-imported levers (#6 volatile-read pinning, #9 u64
> pointer-laundering) were also tried on this candidate and neither
> was needed once the tier was right.

**Why permanent (on the default 2.0/sp1p5 tier):** mwcc's load/
store-multiple coalescer fires on syntactic patterns, but target ROM
may have been compiled at a slightly different optimisation level /
SP version where the heuristic threshold differed. C source can't
sit on either side of the threshold reliably on that one tier.

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

### P-4. Tiny-thunk reg-allocator divergence (formerly "swap-shape")

> **UPDATE (queue item cm-regalloc-ship, following R&D swarm r6 bet 1):**
> this class is **not a blanket wall**. R&D swarm r6 independently verified
> 6 of the 8 named instances below plus `func_02084ac4` (7 total) reach
> byte-identical `.text` from ordinary C once routed to the correct
> compiler tier (plain `.c` / `.legacy.c` / `.thumb.c` — the b665/b667
> routing-tier pattern, not a new allocator lever). This session
> reproduced **5 of the 7** across two passes. Pass 1, from the report's
> evidence alone: `func_02084ac4` (plain `.c`, first-try natural C),
> `func_02096040` (`.legacy.c`, needed a `volatile` local to stop `-O4`
> dead-code-eliminating an otherwise-unread struct write that the target
> genuinely emits), `func_ov004_021de264` (`.thumb.c` — **the Thumb
> routing is load-bearing**; a `#pragma thumb on` at the top of the `.c`
> file is required, the suffix alone routes the compiler binary but does
> not by itself flip codegen mode). Pass 2, from a later-discovered live
> swarm scratchpad (r6's report claimed this evidence was ephemeral/gone;
> a different session's temp dir had in fact survived): 2 more closed once
> the real defect was diagnosed as a **wrong function signature**, not a
> register issue — `func_020a724c` takes two forwarded `int` args (was
> wrongly modeled as `void`-no-arg); `func_0207e214` needed the swarm's
> exact struct field layout/write order. Both matched first-try once
> corrected. `func_020a71e4` (2-arg vtable call) got the *same*
> signature-class correction applied — confirmed structurally correct
> (every immediate offset and relocation matches) — and **still shows
> pure register-letter residue**: mine picks r2, target picks r3, the
> exact `swap-tail-call`/`fnptr-cache` sub-shapes the table below already
> documents. Four additional source rewrites (explicit local, fn-pointer
> local, deref-call form, memory round-trip) produced byte-identical
> compiled output every time — `-O4` normalizes them before register
> allocation ever sees a difference.
>
> **UPDATE 2 (r8 bet 3, queue item cm-regalloc-trampoline):** the other
> "final" case, `func_ov004_021dbe68`, was **not actually a register-letter
> residue at all** — the diagnosis above was wrong. Its callee,
> `func_02094688`, is a genuine 3-argument `(dst, src, len)` memmove-style
> routine (`cmp r2, #0` is its first instruction, and r2 is read/decremented
> throughout the body) — confirmed by reading the callee's own `.s`, not
> just the caller's. Modeling the trampoline as forwarding only 2 args left
> r2 "dead" from the compiler's point of view, free to reuse as the
> swap-temp scratch register (picking r2); the real signature must forward
> a 3rd `int n` arg through unchanged, which forces r3 as the swap temp
> instead (r2 has to stay live to carry `n`). `int func_ov004_021dbe68(int
> a, int b, int n) { return func_02094688(b, a, n); }` compiles **byte-
> identical** (`1c03 1c08 1c19 4b01 4718 46c0`) on the first try — this was
> a wrong-arity bug, indistinguishable from a genuine register-letter wall
> from the caller's disassembly alone, since forwarding a 3rd arg
> unchanged produces *zero* additional visible instructions in the
> caller — the only symptom is which scratch register the swap uses.
> **Generalized rule: never model a trampoline/thunk's argument count from
> the caller's instruction count alone — a forwarded-but-untouched
> argument adds no visible instructions, so undercounting arity is
> invisible until you check the callee's own first instructions for which
> argument registers it actually reads.** `func_020b3850` and
> `func_0208b1ac` remain the only confirmed genuine survivors (all-tier
> DIFF, arity independently verified in both cases; do not re-attempt).
> **Action for future work:** do not park a reg-alloc-shaped candidate on
> sight — read its epilogue, route to the tier it implies, try a
> `volatile` local if a value looks dead-code-eliminated, check for a
> wrong signature (missing forwarded args, wrong return type, **or wrong
> arity confirmed by reading the callee**), then accept a register-letter
> residue as the wall itself only once all of those are ruled out. See
> `lever-payoff.md`'s reg-alloc/scratch-register row for the up-to-date
> W/F count.

> **CORRECTION (queue item cm-regalloc-discriminator, brief 674,
> following R&D swarm r8 bet 3/9).** The UPDATE above's claim that
> `func_ov004_021dbe68` is a "confirmed instance" of pure register
> residue is **wrong** — r8 found, and this brief independently
> reproduced byte-exact, that its true signature is **3 forwarded
> args, not 2**: the tail-callee `func_02094688` is a memcpy-shaped
> routine that reads `r2` as a length parameter at its very first
> instruction (`cmp r2, #0x0`). The trampoline never touches r2 at
> all — it only swaps r0↔r1 — so r2 passes through untouched from
> `func_ov004_021dbe68`'s own (unmodeled) 3rd parameter straight into
> the callee. Modeling `void func_ov004_021dbe68(void *a0, void *a1,
> int a2) { func_02094688(a1, a0, a2); }` under `.thumb.c` +
> `#pragma thumb on` reaches 100% first try. **Removed from the
> confirmed-permanent list.** Its sibling `func_ov004_021de264`
> (already fixed and shipped on `main` as of this brief, 1 forwarded
> `void *` arg instead of 0) is the same error pattern one entry over.
>
> **The discriminator this establishes — read the callee before
> parking a tail-call/thunk as reg-alloc-permanent:**
> 1. **Forwarded-argument false positive (falsifiable):** the
>    park is a tail-call/trampoline shape (swap-and-call,
>    cache-and-call, vtable dispatch) AND the residual is that an
>    *entire argument* is missing from the model, not just a
>    register-letter swap on an argument both sides agree exists.
>    Diagnostic: read the **callee's own raw disassembly** (or its
>    real callers, if the callee is already C) and check which
>    registers it reads in its first few instructions — a callee
>    that reads r2 (or r3) as real input proves the caller must be
>    forwarding that same register, whether or not the caller's own
>    body ever appears to "use" it. A pass-through/forwarding thunk's
>    own disassembly never shows a register being "used" — forwarding
>    *is* the use, and is invisible if you only read the caller. This
>    is the same lever brief 671 found for `func_020a71e4`/`func_020a724c`
>    (grep actual call sites for true arity), generalized to reading
>    the *callee* directly when it's cheaper than finding call sites.
> 2. **Genuine r2↔r3 (or r0↔r1) permanent wall (park-on-sight,
>    correctly):** every argument the caller forwards is already
>    correctly modeled (confirmed by reading the callee/call-sites as
>    above), AND the sole residual is a register choice for a value
>    **computed locally** within the function — a scratch swap-temp,
>    a pool-load pointer, or an intermediate like `sub rX, r1, r0` for
>    a range/threshold check — never a value received from the
>    caller's own parameter list. This session (briefs 672/673)
>    independently reconfirmed this exact shape 3 times
>    (`func_0207d4dc`, `func_0207dab4`, `func_0207db00` — all
>    range/threshold-check dispatch with a local `end-start`-style
>    intermediate mwcc puts in r2, target in r3) with zero movement
>    across every reshape tried (named locals, statement/declaration
>    order, operand order). **These are the r2↔r3 signature this
>    queue item asks to document: if the diff shows the entire rest
>    of the function byte-identical and the sole residual is one
>    register-operand swap on a value that never crosses a call
>    boundary, stop reshaping — it will not move.** Brief 218's own
>    12-variant exhaustive sweep (below) already proved this for the
>    original 4 swap-tail-call examples; treat any NEW instance
>    matching this exact shape (byte-identical elsewhere, one
>    never-forwarded register swap) as equally settled without
>    re-running the same 12 variants again.
> 3. **match_pct is not a valid signal for either case above.** Per
>    r8: reg-alloc/predication parks plateau deceptively HIGH (72-91%
>    observed this session and prior), because only 1-4 instructions
>    differ out of 20-40 — the rest of a correctly-modeled function
>    matches immediately regardless of which of the two cases above
>    applies. A 91% park is not "closer to shippable" than a 40% one;
>    check the discriminator (callee arity), not the percentage.

For a tiny thunk where mwcc must pick a scratch register for
a swap temp or pool-load pointer (`return target(b, a)` or
`return target(arr[idx*N])`), mwcc reliably picks the
**lowest-numbered free register** while the target ROM picks a
**higher-numbered one** (typically by one). Both choices are
semantically valid; only the byte-encoded register field
differs.

**Two empirically observed sub-shapes (brief 218):**

| Sub-shape | mwcc picks | Orig picks | Example |
|-----------|------------|------------|---------|
| Swap-tail-call (`return target(b, a)`) | r2 | r3 | `func_0207842c`, `_02078444`, `_ov002_0229cd70`, `_02052ddc` |
| Pool-load + tail-call (no swap) | r1 | r2 | `func_ov002_021b4254` |
| Fnptr-cache `ldr rN, [ptr]; bx rN`     | r0  | r1  | wave-17 `func_02084a9c`, `_02084ac4` |

The first sub-shape was documented in brief 031 (this entry's
original scope). The second was surfaced in brief 217 as a
"broader Wall 1" finding and confirmed in brief 218: it's the
same underlying mechanism (allocator picks the lowest free
register), not specific to swap shapes.

**What was tried in brief 031 / 218 (none worked):**

1. 2-arg signature with target also 2-arg → 66% partial (r2 vs r3)
2. 4-arg passthrough (`int func(int,int,int,int)`) → mwcc adds
   stack frame, breaks tail-call
3. 3-arg signature with one unused param → still r2
4. Target re-declared with real arity → adds `bl + ldmia` frame
5. `void *` first-arg cast → also breaks tail-call
6. **`register int t asm("r3") = a;`** (brief 218) → mwccarm
   1.2/sp* family rejects asm register binding; 2.0 family
   silently ignores it (still emits r2).
7. **Inline asm clobber list** `asm volatile("" ::: "r3");`
   (brief 218) → mwcc parses the empty asm but doesn't honor
   the clobber list (mwcc inline asm is non-GCC, doesn't
   support clobber annotations). Still emits r2.
8. **register storage-class** `register int t = a;` (brief 218,
   plain `register` without asm binding) → same r2 output across
   all 5 tiers.
9. **Extra local consuming a reg** `int extra_local = extra_var;
   ... + (extra_local & 0)` (brief 218) → mwcc dead-code-
   eliminates the local before allocation. Still r2.
10. **Function-pointer indirection** `extern fn_t fp; fp(b, a);`
    (brief 218) → DOES use r3 for the swap temp, but adds 6
    extra insns (stack frame for non-leaf call). Function size
    no longer matches orig.
11. **3-arg with c live** `func(c); return target(b, a);` (brief
    218) → adds a stack frame + bl call; swap temp moves to a
    callee-saved register entirely.
12. **2nd arg used in expression** `return target(arr[idx*N])
    + extra` (brief 218 broader sub-shape) → mwcc keeps r1
    live for `extra`, picks **r2** for the data ptr (matching
    orig's register), but the function body grows by 4+ insns
    (frame, add). Different overall shape.

**Why permanent (today):** brief 029 had noted that 4-arg
passthrough triggers r3 scratch; that hint applies to
straight-passthrough thunks but **not to swap-shape thunks**.
The reg-allocator's scoring of r2 vs r3 on swap shapes appears
to be mwcc-version specific. Brief 218 confirmed: 12 source-
form variants exercised across all 5 mwccarm tiers (1.2/base,
1.2/sp2p3, 1.2/sp3, 2.0/sp1p5, 2.0/sp2p4) — none reach the
orig register choice while preserving the 5-insn function shape.

**Affected drops:** brief 031 `func_02052ddc`, `_0207842c`,
`_02078444`, `_ov002_0229cd70` (all 66% partial; identical-asm
group of 3 cross-overlay siblings + 1 main); brief 053
self-extend 2 / wave 17 (PR #380) added `func_02084a9c` +
`_02084ac4` (r0-vs-r1 ldr-dest on fnptr-cache shape — a
different reg-allocator-pick variant in the same single-byte-
divergence family); brief 217 added `func_ov002_021b4254`
(broader pool-load + tail-call shape — r1 vs r2). **7 of 80+
(~9%)** across the canonical swap-thunk, fnptr-cache, and
pool-load tail-call shapes.

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

**Re-test (brief 671, cm-wall-retire, prompted by an r6 R&D report
claiming "6 of 8 + P-4's `func_02084ac4`" are falsified).** Independent
re-verification, function by function:

- **`func_02084ac4` (P-4's own cited fnptr-cache example) — RE-CONFIRMED
  PERMANENT, not falsified, AT THE TIME OF THIS BRIEF.** Reached 70%
  (r0-vs-r1 on the cached function pointer, exactly the documented
  sub-shape) and *stayed* at 70% across 3 independent source variants
  (direct field access, named local, alternate call syntax
  `(*p->fn)()`). r6's report was wrong about *this brief's* 3 variants —
  but **SUPERSEDED (brief 677 re-audit): this function has since
  SHIPPED.** `docs/research/reshape-recipes/lever-payoff.md`'s own
  reg-alloc entry records the actual fix — a later pass tried the
  *correct compiler tier* (`.legacy.c`/`.thumb.c` routing per the b665/
  b667 pattern), not just alternate source phrasing at the default
  tier, which is what brief 671's 3 variants above missed. Confirmed
  via `src/main/func_02084ac4.c` existing on disk. The P-4 fnptr-cache
  sub-shape as a *class* may still apply to other members; this
  specific named example no longer illustrates it.
- **`func_020a71e4` / `func_020a724c` — genuinely fixed, 100%, but
  neither is one of P-4's own named examples** (they're from the
  broader brief-641 lever-insensitive catalog r6's report also cites —
  a related but distinct population). The mechanism was **not** a new
  allocator lever: both had a wrong parameter arity in every prior
  attempt (this session's own brief 670 included) — the actual call
  sites (grepped via `bl func_020a71e4` / the reloc table for the
  Thumb-called sibling) show 3 live argument registers reaching the
  call, not the 0-1 previously assumed. Once the real arity was
  modeled and every parameter reaches a genuine use (an unused one
  gets dead-code-eliminated and doesn't reserve its register — see
  brief 670's refinement of this lever), both reached 100% on the
  first correct attempt. **New process lesson: when a thunk's own body
  doesn't reveal its arity (a pure pass-through call with no visible
  parameter use), grep its actual call sites before assuming arity from
  the disassembly alone** — the disassembly of the callee never shows
  a register is "used" if it's just forwarded untouched to another call.
- **Thumb-mode instances of the same register-choice pattern, newly
  confirmed permanent:** `func_ov004_021dbe68` (swap-shape, r2-vs-r3,
  plateaued at 71.4%) and `func_ov004_021de264` (fnptr-cache-adjacent,
  r0-vs-r1, plateaued at 69.2%) — both show the identical
  reshape-insensitivity as the ARM-mode instances above (multiple
  source variants tried, zero movement on the register choice). P-4's
  mechanism is confirmed to apply in Thumb mode too, not just ARM.
- **Unrelated but critical tooling finding surfaced while re-testing the
  two Thumb candidates above: a `.thumb.c`-suffixed source file that
  omits an explicit `#pragma thumb on` does NOT reliably compile in
  Thumb mode** — both functions initially showed catastrophic (0%)
  mismatches with ARM-style predicated instructions (`addeq`/`moveq`)
  appearing where Thumb has no such encoding, which looked like a deep
  semantic modeling error. Adding `#pragma thumb on` (present in every
  sibling `.thumb.c` file already in the tree, e.g.
  `func_ov004_021dd20c.thumb.c`, but easy to omit when starting a fresh
  file from scratch) immediately jumped both from 0% to 69-71%. **Any
  `.thumb.c` file that shows bizarre/predicated-ARM-looking output
  instead of a clean near-miss is missing this pragma — check for it
  before spending time on a "semantic" re-diagnosis.**

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

> **Reconfirmed (cm-ov002-unknown-sweep-8, 2026-07-31, batch 1):** hit 3
> more times in one batch, all the same `CE288->f_5a8` toggle-
> computation shape (bit0^bit14 of a u16, then a state read) —
> `func_ov002_022369c0` (5 reshape variants, zero movement, parked at
> 90.55%), `func_ov002_0222e720` and `func_ov002_02222cac` (same shape,
> recognized faster once seen once, not re-exhausted). No new lever;
> confirms this specific toggle-computation shape as a recurring, not
> one-off, P-4 trigger.

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

### P-6. Predication threshold (≥4-op if-body) — RETIRED, was a routing-tier gap

**Correction (brief 665, cm-main-small-c):** this was never a real
compiler-heuristic wall — the 4-op predication cutoff is specific to
the **default `2.0/sp1p5` tier**. All 3 originally-affected drops now
ship 100% byte-identical once routed through `.legacy.c` (mwcc
`1.2/sp2p3`), which does NOT apply the same predicate-vs-branch
cost heuristic at 4 ops. `func_02087d10` was already recovered this
way by brief 216 (see `wall-2-leaf-no-pool-reg-alloc.md`) but the
other two siblings — `func_02067b8c` and `func_0207f8f8` — were
never re-tested under the same tier until brief 665, despite sharing
the identical citation and the fix living in the same document.
**Lesson: a `P-NN` citation naming 2+ sibling functions is not proof
all siblings were re-tested after ANY one of them gets a later fix —
check every named sibling, not just the one the fix-brief mentions.**

The original (now-superseded) framing is kept below for history.

~~The boundary at the bottom of C-1: when an `if (cond) { ... }`
body expands to **4 or more ARM instructions** in mwcc's output,
the optimiser switches off the predicated-execution pass and
emits an early-`bxXX lr` branch instead. The split is binary —
3-op bodies predicate, 4-op bodies don't — and no source-shape
coercion tried so far has crossed the line.~~ ← wrong: no *source-shape*
coercion crosses the line under the default tier, but a *routing-tier*
change does.

**Why NOT permanent:** mwcc's predication pass scores predicate-cost
against branch-cost using a fixed heuristic that differs PER COMPILER
REVISION. `1.2/sp2p3` (the `.legacy.c` tier) predicates 4-op bodies
that `2.0/sp1p5` refuses.

**Affected drops (now recovered):** brief 028 `func_02067b8c`,
`func_0207f8f8`, `func_02087d10` (originally tagged C-1-coercible;
brief 033 reattempted them in the residue cluster and mis-declared
them permanent under the default-tier-only test). **3 of 47 drops
(6%)** — third-largest single wall in the set, now 0.

### P-7. Pool literal not deduplicated across uses — SUPERSEDED BY C-27 (dual-extern alias/pointer-dance recipe)

**Status:** RETIRED. Route this shape to C-27; do not treat the historical
pool-deduplication text below as a live P-wall.

**Correction (brief 668, cm-p6-followup):** this entry's own body already
noted the fix ("SUPERSEDED BY C-27", brief 107) but kept the original
"why permanent" framing above it, unlike P-6's corrected framing. To be
unambiguous: this pattern is **not permanent**. Brief 107's dual-extern +
`symbols.txt` alias entry + `void * volatile *` pointer-dance recipe
recovers byte-identical output at the project's default mwcc 2.0/sp1p5.
See C-27 for the codified recipe and its 157-occurrence cross-corpus
survey. The original framing is kept below for history.

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

### P-8. Bit-chain reg-alloc: r0-only vs r0→r1→r0 — SUPERSEDED BY C-25 (split-chain source form)

**Status:** RETIRED. Route this shape to C-25; do not treat the historical
single-register chain text below as a live P-wall.

**Correction (brief 668, cm-p6-followup):** same framing gap as P-7 —
the body already says "SUPERSEDED BY C-25" (brief 100) but the "why
permanent" section above kept the stale claim. Not permanent: splitting
the bitfield-chain expression into two statements (brief 98's permuter
discovery, codified as C-25) recovers byte-identical output. The
original framing is kept below for history.

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

### P-10. Over-predication of short tail vs early-return — SUPERSEDED BY C-29 (`if (!p)` early-return polarity)

**Status:** RETIRED. Route this shape to C-29; do not treat the historical
predication-cost text below as a live P-wall.

**Correction (brief 668, cm-p6-followup):** same framing gap as P-7/P-8
— the body already says "SUPERSEDED BY C-29" (brief 111) but the "why
permanent" section above kept the stale claim. Not permanent: writing
the null-guard as `if (!p) return -1;` (unary NOT) instead of `if (p ==
0) return -1;` (equality-with-0) — both semantically identical —
compiles to a different control-flow shape that matches orig. Brief
111's permuter run found this at iteration ~50. The original framing is
kept below for history.

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

> **Re-audit (brief 677, cm-wall-reaudit-p11-p16): 10 of the 16 members
> catalogued below have ALREADY SHIPPED as matched C, via unrelated later
> work that never looped back to correct this entry** — the entry's own
> population contradicted its "permanent" verdict. Checked by file
> presence (`.s` gone = matched), not by re-deriving from scratch:
> `func_0200b0c8`, `func_02032efc`, `func_02032f38`, `func_02032e8c`,
> `func_02032ec4`, `func_02054fd0`, `func_02055000`, `func_ov002_02238bc8`,
> `func_ov002_0226db7c`, `func_ov002_02292020`. **6 genuinely remain
> unmatched** and were spot-checked against this brief's available lever
> set (typed-struct externs, trampoline-arity, tier routing, branch-order/
> predication) — none apply: this entry's own framing above ("resist
> BOTH permuter AND source-shape iteration," "downstream of source-shape
> decisions") is a fundamentally different mechanism than the ones those
> levers address, and the extensive prior falsification history below
> (5 source variants, `volatile`-qualified reads, 900-iteration permuter
> run) already demonstrates none of them move the register-allocator's
> choice. Re-confirmed standing, not re-tested exhaustively from zero:
> `func_02024574`, `func_020270d0`, `func_02028790`, `func_ov011_021d2ca8`,
> `func_ov002_02200084`, `func_ov002_022319f4`.

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

**Census addition — brief 254 (small-function reg-alloc plateaus,
below the 0x5c-0x74 detector floor).** Four C-42 wave-8 resister
families (brief 253) are the SAME mechanism — mwcc 2.0 picks a
different operand / save-order register than orig and no source-form
variant reaches it — on **~0x40 functions**, smaller than the
documented P-11 range. They are NOT detected by the current `P-11`
rule (size floor); recognized by orig-vs-build disasm comparison.

| Family | Members | Module | Divergence |
|---|---|---|---|
| `0ca11024` | `func_02032efc` / `func_02032f38` | main | `mla rD,r6,rS,rN` operand-reg assignment (5-variant falsification, brief 254) |
| `e7e4cff1` | `func_02032e8c` / `func_02032ec4` | main | same IRQ-accessor source-family as `0ca11024` (add-offset index) |
| `96d2a201` | `func_02054fd0` / `func_02055000` | main | stack-arg setup, siblings swap r1↔r2 |
| `ef19bc9a` | `func_ov002_02238bc8` / `func_ov002_0226db7c` | ov002 | pool-load reg + callee-save order swap |

**Falsification (brief 254, `0ca11024`):** 5 source forms (`fe7c +
arg1*12`, `arg1*12 + fe7c`, base-temp, multiply-temp, `12*arg1`) all
emit `mla r1,r6,r1,r2` (constant in the multiplier reg); orig has
`mla r1,r6,r2,r1` (loaded value in the addend/accumulator reg). A
single source that reproduced orig's operand assignment would
disprove the P-11 classification — none did. The permuter is the
untested fall-through (P-11 precedent: it does not crack these).
Note: brief 253 framed these as "siblings can't share one source,"
but the siblings differ because they are *different source* (e.g.
swapped helper arg order); the binding constraint is the *per-member*
operand-reg plateau, confirmed individually. Full diagnosis:
[`brief-254-track2-leading-edge-and-c42-resisters.md`](brief-254-track2-leading-edge-and-c42-resisters.md).

**Census addition — brief 258 (C-39 CSE field-temp, ~0x3c).** Three
C-39 reg-alloc residue picks (`02200084` field→r3, `02292020`
field→r2, `022319f4` field→r3): a `@2` bitfield container read once at
entry and CSE'd for a range test + ≥2 bitfield helper-args of a ≥3-arg
helper. orig holds it in a high reg (r2/r3); mwcc takes the
lowest-free r1. **Falsification (9 source forms):** the natural
bitfield form is byte-identical EXCEPT the container reg (r1 vs r3);
every form that reaches r3 introduces a new divergence (bit0
`and`-collapse for shift forms, a stack spill for struct copies). No
clean lever. Full diagnosis + matrix in the
[C-39 residue note](#c-39-residue-cse-field-temp-reg-alloc-plateau-p-11-class)
and
[`brief-258-c39-cse-field-temp-and-taxonomy.md`](brief-258-c39-cse-field-temp-and-taxonomy.md).

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

### P-12. Non-leaf chained-cast reg-alloc divergence

**The wall.** Brief 225 locked the C-38 chained-cast leaf recipe
(`func_0207d304.legacy.c`) — `(unsigned short)(unsigned char)*p`
via named locals preserves both cast steps under mwcc 1.2/sp2p3
because the legacy compiler lacks the cast-coalescing peephole
mwcc 2.0 has. Brief 227 deferred two non-leaf siblings
(`func_0207db8c`, `func_0207dbf8`) — allocator-like functions
that use the same chained-cast idiom for a flag-byte check inside
a body wrapping alignment math + `Fill32` zero-fill. Brief 229
filed them as a P-12 candidate (recipe extends, but reg-alloc
differs from orig).

Brief 231 ran the falsification matrix (9 source-shape variants
× 5 mwcc tiers) and confirmed: **the chained-cast idiom DOES
preserve under mwcc 1.2/sp2p3 and 1.2/sp3** (the `and #0xff;
lsl/lsr #16; ands #1` sequence emits as orig has). **But mwcc's
register allocator consistently puts `end` in r0 instead of r3**
across all tested variants:

- v1 (struct ptr + inline chained cast): end in r0, fold collapsed
- v2 (u32-word + inline `((u16)(u8)*p) & 1`): end in r0, fold collapsed
- v3 (named-local chained cast): end in r0, cast PRESERVED ✓
- v4 (keep `end` alive via Fill32 size): same as v3
- v5 (register hint on `end`): no effect
- v6 (inline `aligned` via temp): same as v3
- v7 (volatile flag_word + 2.0/sp1p5): **end in r3** ✓ — but fold collapsed AND r4/r5 swapped
- v8 (volatile + 1.2/sp3): end back to r0
- v9 (mask before end load): same as v3, end still in r0

No single (source, tier) pair produces all THREE features
together:

| Feature | 2.0/sp1p5 | 1.2/sp2p3 | 1.2/sp3 |
|---|:---:|:---:|:---:|
| Right prologue/epilogue | ✓ | ✗ Style A | ✓ (matches orig sp3-style) |
| Chained cast preserved | ✗ folded | ✓ | ✓ |
| `end` in r3 | only with volatile + r4/r5 swap | ✗ | ✗ |

mwcc 1.2's register allocator looks at the post-`mov r5, r0`
state, sees `r0` is free (self moved to r5), and uses r0 for
the first load. mwcc 2.0 with volatile shuffles allocator
state enough to choose r3 — but volatile also defeats the
cast preservation (mwcc 2.0 still folds even with volatile on
the pointer).

**Falsification matrix:**

`func_0207db8c` orig reg-alloc:
- r3 = end (from `ldr r3, [r5, #4]`)
- r0 = align - 1 → then start
- r1 = size → end - size → flag-cast-then-Fill32-arg1
- r2 = ~mask → end - aligned
- r4 = aligned (callee-saved)
- r5 = self (callee-saved)

mwcc 1.2/sp3 v3 reg-alloc:
- r0 = end (first load, clobbers self after mov r5, r0)
- r2 = align - 1
- r3 = ~mask
- r2 = end - size (reused)
- r1 = start → flag → cast
- r4 = aligned (matches!)
- r5 = self (matches!)

The r4/r5 callee-saved choices MATCH orig — only the scratch
registers (r0-r3) differ.

**Verdict — permanent.** mwcc 1.2's register allocator's
"first-fit-after-mov" heuristic doesn't accept source-level
nudges. Even rewriting the source as a multi-statement form
with explicit intermediate locals doesn't change the choice.
Decomper should NOT iterate on chained-cast non-leaf picks;
budget zero ships for this family.

**Affected picks:** `func_0207db8c` (76 B), `func_0207dbf8`
(60 B). Both shipped as `.s` since brief 207 (PR #659).

**Provenance:** brief 225 leaf recipe (`func_0207d304.legacy.c`),
brief 227 deferred non-leaf siblings as scaffolder candidate,
brief 229 filed as P-12 candidate, brief 231 (this entry)
locked as P-12 with falsification matrix. Full diagnosis at
[`brief-231-c39c-cross-tier-and-c38-nonleaf-p12.md`](brief-231-c39c-cross-tier-and-c38-nonleaf-p12.md).

### P-13. C-39c bitfield-packing cross-tier irreducible

**The wall.** Brief 229 cataloged C-39c (bitfield packing into
a single u16 helper argument) as a tier-mismatch wall: no single
mwcc tier delivers all required features. Brief 231 attempted
cross-tier workarounds and additional source variants — the
verdict is that C-39c is **cross-tier irreducible** even with
the workarounds.

**Tested combinations:**

- All 5 mwcc tiers (2.0/sp1p5, 1.2/sp2, 1.2/sp2p3, 1.2/sp3,
  1.2/sp4) on the v1 baseline — all produce IDENTICAL output:
  TCO via `bx ip` + folded masks. **TCO is consistent across
  all available mwcc versions.**
- Named-local mask split (`unsigned int t1 = a & 0xff; unsigned
  int t2 = (b & 0xff) << 8;`) under 1.2/sp3 → preserves
  `and+and+orr` shape AND right outer prologue/epilogue. But
  scheduling: mwcc places `lsr r8, r0, #16` (the `(u16)` cast)
  BEFORE `mov r6, #0` (the `i = 0` init). Orig has the opposite
  order. The 4 mov instructions following are independent ops
  that mwcc's scheduler reorders.

**Three failure modes across the 3 brief 229 picks:**

| Pick | Size | Failure mode |
|---|---|---|
| `021d59cc` | 60 B | mwcc TCO's `return helper(...)` to `bx ip` across ALL tiers. No source idiom defeats TCO without ALSO breaking another feature (union forces memory-pack; extra calls add unwanted code). |
| `021d5b28` | 88 B | Right outer shape + right pack + close reg-alloc, but scheduler reorders `mov r6, #0` and `lsr r8, r0, #16` (independent ops). No source-level dependency forces orig's specific schedule. |
| `021d5c50` | 84 B | mwcc 1.2 always emits `push {regs, lr} + sub sp, #4` for unaligned reg counts. Orig has direct `push {r3, ...}` style. mwcc 2.0 has right prologue but folds masks. |

**Cross-tier workarounds attempted in brief 231:**

1. **All 5 tiers on v1 baseline** — identical output across all,
   confirms TCO is mwcc-version-independent.
2. **Declaration-order swap (`int j, i`)** — under 1.2/sp3,
   nudges loop variable reg allocation (`j` in r7, `i` in r6
   matching orig) but instruction SCHEDULING still differs.
3. **Early `i = 0` assignment** — changes scheduling AND
   reg-alloc; moves further from orig.
4. **Do-while loop form** — different label structure, same
   scheduling issue.
5. **Register storage class** — ignored by mwcc.

**Verdict — permanent.** C-39c picks must remain `.s`. The
known C-39c hits in ov002 (`021aba60`, `021d9828`, `021f6304`,
`021ff6d0`) are all already shipped as `.s` under brief 207's
C-34 recipe (they have additional C-34 cross-overlay BL walls).
The 3 brief 229 deferred picks (`021d59cc`, `021d5b28`,
`021d5c50`) should also remain `.s` — no cross-tier recipe
unlocks them.

**Affected picks:** ~10-30 C-39c-shaped picks remain in the
codebase. Most are already C-34-walled and shipped as `.s`.
Brief 231 conclusion: do not pilot C-39c further.

**Provenance:** brief 229 documented as tier-mismatch wall,
brief 231 (this entry) ran cross-tier workaround matrix and
locked as P-13. Full diagnosis at
[`brief-231-c39c-cross-tier-and-c38-nonleaf-p12.md`](brief-231-c39c-cross-tier-and-c38-nonleaf-p12.md).

### P-14. Sub-struct base-offset fold (in-range)

> **Wall family note — P-14 vs C-34.** Both are "mwcc reuses an
> address computation," but they target different machinery and have
> opposite resolutions. **C-34** is pool-literal CSE (two `ldr [pc,
> …]` of the same symbol collapse to one slot + `mov`) and has an
> `.s`-with-dual-`.word` recipe. **P-14** is addressing-mode
> offset-folding (a sub-struct base + field offset folds into one
> base-relative immediate) — there are no pool words involved and no
> C-source recipe. They only look alike at the "orig keeps a base in
> a callee-saved reg" surface level.

**The wall.** When source accesses a field of a sub-struct at a
compile-time-constant offset (`self->inner.field`, or any pointer
mwcc can prove equals `self + K`), and the field's **combined** offset
from the outer base fits the addressing mode's 12-bit immediate
(≤ `0xfff` for word `ldr`/`str`), mwcc propagates the constant offset
into each access and CSEs the **outer** base. It emits a single
`[self, #combined]` access, never the intermediate `add rN, self, #K`
followed by `[rN, #inner_off]` that the orig has.

**Target asm (`func_02032724`, 0x24):**

```text

push  {r4, lr}
add   r4, r0, #0x1fc       ; materialize &self->inner
ldr   r1, [r4, #0xc80]     ; inner.field  (combined = 0xe7c)
cmp   r1, #0
popeq {r4, pc}
bl    func_02032e6c
mov   r0, #0
str   r0, [r4, #0xc80]     ; reuse r4 base across the call
pop   {r4, pc}

```

**mwcc emits (any in-range source idiom):**

```text

push  {r4, lr}
mov   r4, r0
ldr   r1, [r4, #0xe7c]     ; folded: 0x1fc + 0xc80
cmp   r1, #0
popeq {r4, pc}
bl    func_02032e6c
mov   r0, #0
str   r0, [r4, #0xe7c]
pop   {r4, pc}

```

**Falsifiable prediction (brief 250):** if any C idiom binds
`&self->inner` to a value mwcc keeps across the call AND uses for the
field accesses, mwcc emits the orig's split. **Cheapest test:** the
6-idiom matrix on the in-range pick.

| Idiom | Result |
|---|---|
| nested/block `self->inner.field` | folded `[r4, #0xe7c]` |
| pointer alias `struct Inner *p = &self->inner` | folded |
| `(struct Inner *)((char *)self + 0x1fc)` | folded |
| helper takes `&inner` | `add #0x1fc` only as a throwaway bl arg; accesses still folded |
| `volatile int *` field | DIFFERENT split `0x27c`/`0xc00` — non-matching |
| `char *base = &self->inner` + cast back | folded |

**Result — none reproduce orig.** Two diagnostic probes pin the
mechanism: two distinct in-range fields still fold (`[r4,#0xe7c]` +
`[r4,#0xe80]`); pushing the combined offset out of range (`0x1fc +
0xf00 = 0x10fc > 0xfff`) makes mwcc **split** into the exact orig
shape (`add r4, r0, #0x1fc; ldr/str [r4, #0xf00]`). So the fold is
purely an addressing-mode-immediate decision. `func_02032724`'s
`0xe7c` fits → mwcc always folds → no C idiom forces the in-range
split. The orig's split came from a compiler/source where `&inner`
was not a provable constant offset from `self`.

**Not classifier-detectable.** An in-range folded access (`ldr rN,
[rM, #imm]` with `imm ≤ 0xfff`, reused across a `bl`) is byte-
indistinguishable from any ordinary far-field access; a detector would
fire on essentially every struct-heavy function. No
`predict_walls.py` entry — the wall is recognized by comparing orig
disasm (`add rN, base, #K` + small offset) against the natural build's
folded single offset.

**Affected picks:** `func_02032724` (the brief-248 N3 escape).
Out-of-range siblings — where the combined offset exceeds `0xfff` —
would ship under natural C (mwcc is *forced* to split and matches
orig); only the in-range case is walled.

**Provenance:** brief 247 surfaced (N3), brief 248 first falsified
(heap ptr-alias, 6 variants), brief 250 (this entry) ran the joint
Family-5/N3 investigation, added the immediate-range probe, and locked
P-14. Full diagnosis at
[`brief-250-c42-escape-classify-family5-n3-family7.md`](brief-250-c42-escape-classify-family5-n3-family7.md).

**7th idiom re-tested, still locked (brief 524).** `imported-sm64ds.md`
SM-2 proposed a 7th idiom the original 6-idiom matrix hadn't tried:
routing the computed address through a 64-bit bitwise-AND identity op
(`*(int*)(((int)base+OFF) & 0xFFFFFFFFFFFFFFFFULL) = …`), reported to
force the split on sm64ds's mwcc **1.2/sp2p3**. Re-tested against
`func_02032724` on **our** mwcc 2.0/sp1p5 (all 3 tiers via `verify.py
--cc all`): the idiom **does** force some materialization/split — a
bare-store synthetic went from 3 words (folded `[r0,#0xe7c]`) to 4
words (`add r0,r0,#0x27c; …,[r0,#0xc00]`) — so the fold is not
*universally* unconditional, contradicting a stronger reading of "no
idiom works." But the mechanism is **not steerable to the wall's
specific boundary**: mwcc always split at its own DP-immediate-encodable
point (`0x27c`/`0xc00`), never at the source-implied `0x1fc`/`0xc80`
sub-struct boundary, regardless of which of the combined address's two
occurrences it applied to (load vs store handled inconsistently — one
became a fully-materialized-then-zero-offset store, the other stayed
an offset-load). Against the real function (with its `if`/`bl` control
flow, matching orig's semantics exactly) the laundered form produced
**10 words vs orig's 9**, no tier matched. **P-14 remains
locked-permanent** — the 7th idiom is refuted as a general P-14 lift,
though the underlying "u64-mask forces materialization when the
combined offset isn't itself DP-immediate-encodable" observation is
banked as real (just uncontrollable). Full retest:
[`brief-524-lever-verification.md`](brief-524-lever-verification.md).

### P-15. Legacy-tier (1.2/sp2p3) reg-alloc + const-CSE plateau

> **Wall family note — the legacy-tier sibling of P-11.** P-11 is the
> umbrella for **mwcc 2.0/sp1p5** register-allocator divergences that
> resist source-shape iteration. P-15 is the same plateau on the
> **mwcc 1.2/sp2p3** (`.legacy.c` / Style-A) tier: a StyleA function
> whose natural C is *structurally identical* to orig but allocates
> registers differently, and no source shape steers the allocator.
> Surfaced by brief 268's Copy32 cluster.

**The wall.** A short branch-shared-value wrapper — two call targets,
each consuming the same incoming pointers in different argument
positions — forces mwcc to hold the args in "neutral" holding
registers across the branch. mwcc 1.2/sp2p3 and the orig build pick
*different* holding registers (and different constant-materialization
strategies), both correct, neither reachable from the other via C.

**Target asm (`func_0208fe58`, the Copy32 `else`-folds member):**

```text

push  {r4, lr}                 ; orig: dst parked in callee-saved r4
mov   r4, r0                   ; dst -> r4
ldr   r0, [r3]                 ; v = data_0210249c
mvn   ip, #0                   ; -1 (not an encodable cmp immediate)
mov   lr, r1                   ; src -> lr (claims lr, forcing dst -> r4)
mov   r3, r2                   ; size evacuated r2 -> r3
cmp   r0, ip
beq   .L_copy32
cmp   r3, #0x30
bls   .L_copy32
mov   r1, r4
add   r2, lr, #0x7000000       ; CONST + src, per-branch
bl    func_02094030
pop   {r4, lr}; bx lr
.L_copy32:
mov   r0, r4
mov   r2, r3                   ; size r3 -> r2
add   r1, lr, #0x7000000
bl    Copy32
pop   {r4, lr}; bx lr

```

**mwcc 1.2/sp2p3 emits (natural C, any of 10 variants):**

```text

stmfd sp!, {lr}                ; only lr saved — dst NOT in a callee-saved reg
mov   lr, r0                   ; dst -> lr (caller-saved)
ldr   r0, [r3]
mvn   r3, #0                   ; -1
mov   ip, r1                   ; src -> ip
cmp   r0, r3
...                            ; size kept in r2 (no evacuation)
add   r2, ip, #0x7000000       ; same const-fold, different regs
...

```

`dst` is provably **not** live across either call (each branch consumes
it before its `bl`), so orig's callee-saved `r4` is a pure allocator
preference — the natural build always uses the tighter caller-saved
packing (`push {lr}` vs orig's `push {r4, lr}`). For the
`0208fd30`/`0208fd90` members there is a **second** axis: orig hoists
the VRAM `CONST` into a register (`add r2, ip, lr`) where the natural C
folds it into the add immediate.

**Falsifiable prediction (brief 268).** Any natural compile yields one
saved register (`push {lr}`) where orig has two (`push {r4, lr}`). A
coercion must reproduce orig's `dst`→r4 allocation. **10 source
variants** (condition reorder, signed/unsigned `size`, hoisted
`srcAddr` temp, pointer-typed global compare, 4-arg signature,
`volatile` global, …) — none flips it. Same compiler for orig and the
probes, so the divergence is allocator-internal.

**Not classifier-detectable / not `predict_walls`-actionable.**
predict_walls already correctly flags the whole tier StyleA; P-15 is a
*match-difficulty* verdict, not a new cue. Recognized only by comparing
orig (`push {r4, …}`) against the natural build's tighter frame.

**Affected picks:** `func_0208fd30` `func_0208fd90` `func_0208fe58`
(Copy32 VRAM-copy family); plus a fraction of the brief-268 NO_BL leaf
grab-bag (e.g. `func_020905dc`, frame-vs-frameless on the same plateau).
**Permuter territory** — if a future permuter run lands orig's
allocation, demote; it resists direct source iteration. Full diagnosis
at
[`brief-268-overfire-stylea-tail-subfamilies.md`](brief-268-overfire-stylea-tail-subfamilies.md).

### P-16. Repeated-address rematerialization after a call

> **Re-audit (brief 677, cm-wall-reaudit-p11-p16): the falsification
> below used a raw pointer-cast (`*(int *)(data_ov002_022d016c + 0xd20)
> += 1;`) for the step-counter increment — the exact idiom
> `cm-overlay-small-sweep` (PR #1334) later established compiles
> differently from a typed struct member and has reversed 6 other
> "permanent" verdicts for this same reason.** The typed member is
> already available and unused: `ov002_core.h`'s own `struct
> Ov002D016c` (accessed via the `D016C` macro) has `int f_d20;` mapped
> at exactly this offset — so the untested fix is simply `D016C->f_d20
> += 1;` at all 3 sites instead of the pointer-cast form, no new struct
> work needed. **Not attempted this brief**: the surrounding function
> (`func_ov002_02269534`, 548 B / 137 insns, a 3-state duel-progress
> dispatcher) has no preserved draft to build on — brief 582's own
> working file was discarded once parked (`.s` restored, tree clean) —
> so testing this lever means reconstructing the whole function from
> the ground-truth `.s` first, not just swapping an access idiom in an
> existing near-miss. Full disassembly, prior traced semantics (state
> 0/1/2 dispatch, callee signatures, the 5-slot sweep struct), and the
> exact 12-instruction residual are all in this entry below — a future
> attempt should reconstruct with `D016C->f_d20` from the start rather
> than discovering the pointer-cast trap again.

> **Wall family note — same pool-materialization axis as P-7/C-24/C-27,
> but a distinct sub-case.** Those three are all about whether mwcc
> deduplicates two loads of the *same bare symbol* into one pool word
> or keeps two. P-16 is about a symbol accessed at a **constant offset**
> (`symbol+K`, not the bare symbol) at 3+ program points separated by
> `bl` calls: mwcc sometimes folds the combined `symbol+K` address into
> its *own* pool word and addresses through it with a zero-offset load
> (`ldr r2,[pc,#N]` → `ldr/str [r2,#0]`), where orig reloads the *bare*
> symbol (reusing the single pool word every other access in the
> function already uses) and applies `K` via the load/store
> instruction's own immediate-offset field (`ldr/str [r1,#K]`). Net
> effect: one extra 4-byte pool word plus a register-allocation ripple
> at every affected site.

**Discovered:** brief 582, `func_ov002_02269534` (ov002, 548 B duel-
progress state-machine tick). Confirmed via `docs/research/brief-582-c-
ceiling-probe.md` Target 1 and re-verified against the same `.o` this
brief (586).

**The wall.** The step counter at `data_ov002_022d016c+0xd20` is
incremented via a "reload base, indexed read, add 1, indexed store"
sequence at three independent, non-dominating return points in the
function (an early return inside one dispatch case, a fallthrough
midpoint, and the final tail) — each separated from the others by at
least one intervening `bl`. Orig reloads the bare `data_ov002_022d016c`
literal at all three sites (the exact same pool word the function's
very first access, the switch-dispatch read, already established) and
indexes `+0xd20` via the instruction's own addressing mode:

```text

; orig, at each of the 3 sites (case-0 tail shown):
    bl    func_ov002_021d479c
    ldr   r1, .L_pool0          ; bare data_ov002_022d016c (SAME pool word as the fn's 1st access)
    add   sp, sp, #0x4
    ldr   r2, [r1, #0xd20]      ; indexed read
    mov   r0, #0x0
    add   r2, r2, #0x1
    str   r2, [r1, #0xd20]      ; indexed write
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}

```

**mwcc emits when miscoded (natural C, either `x = x + 1` or `x += 1`
— both reproduce identically):**

```c

extern char data_ov002_022d016c[];
/* ... inside the function, at the same 3 program points ... */
*(int *)(data_ov002_022d016c + 0xd20) += 1;

```

```text

    bl    func_ov002_021d479c
    ldr   r2, [pc, #0x1b0]      ; FOLDED data_ov002_022d016c+0xd20 — its OWN pool word
    add   sp, sp, #0x4
    ldr   r1, [r2, #0x0]        ; zero-offset read
    add   r1, r1, #0x1
    str   r1, [r2, #0x0]        ; zero-offset write
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}

```

Result: 137 insns both sides (same instruction *count*), but the extra
pool word makes the compiled `.text` 552 B against a 548 B target, and
the register choice at each site (`r7`/`r5` in the miscoded build vs.
`r8`/`r6` in orig for two loop-locals, an unrelated knock-on) ripples
through the rest of the function. Final state: **65.2% match, 12
divergent instructions — 3 folded-vs-indexed pairs (4 instructions each:
the pool load + the read + the add + the write) plus their downstream
register echoes.** All 12 are directly attributable to this one pattern;
nothing else in the function diverges.

**Tried, no effect on the fold:**
- `x = x + 1` vs `x += 1` (longhand vs compound assignment) — identical
  output either way; ruled out CSE-on-the-lvalue-expression as the
  trigger.
- Fixing an unrelated real bug in the same function (a mis-sized helper
  struct causing a loop-stride error) — improved match% elsewhere but
  left this pattern completely unchanged, confirming it's independent
  of the rest of the function's shape.

**Not yet tried (candidates for a future brief to test):** forcing the
compiler to keep the *bare* base pointer live across the call via an
extra dummy read of a different offset right before the `bl` (denying
the optimizer a "only one offset used near this call" shortcut);
restructuring the three sites to route through one shared `goto` target
so there's only one static occurrence of the increment in the source
(the mode-1→2 fallthrough in brief 582's Target 2, `func_02037dc0`, hit
a *different but adjacent* mwcc choice — whether to hoist a sub-table
pointer above or keep it inside a loop body — and relocating the
computation to match orig's placement fixed both the extra instruction
and a register-allocation ripple in one move; worth testing whether the
same "match orig's exact placement, don't consolidate" principle
transfers here). Two more independently-observed instances (not just
this one function) would confirm the pattern is systemic rather than
this-function-specific and make a targeted coercion search worth a
dedicated timebox.

**Counter-lever status (brief 586):** not found yet. `func_ov002_022b809c`
(908 B, the brief-582 Target 3 this brief finished) has a superficially
similar-looking repeated access — a parameter-relative field
(`self+0xc00+0x6a`) read 5+ times across multiple `bl` calls — but that
case does **not** exercise this wall at all: `self` arrives in a
register at function entry (no literal-pool load involved for the base
in the first place), so there's no pool-materialization decision for
mwcc to make. That function's repeated-read pattern (deliberately
written as a fresh `*(...)`cast each time, matching orig's own re-reads,
per the C-1-adjacent lesson that hoisting into a shared local can change
codegen even when the value doesn't change) compiled correctly, but it
isn't evidence about P-16 specifically — P-16 requires a **global
symbol** (needing its own pool entry) at a **constant offset**, not a
parameter/register-relative access. A real counter-lever test needs a
fresh target that repeats a `global_symbol+K` lvalue 3+ times across
calls; none of this brief's picks happened to have that exact shape
(see the per-target notes in `brief-586-ceiling-r2.md` for what shapes
they did have).

**Affected picks:** `func_ov002_02269534` (parked, not shipped —
this is the sole reason it doesn't reach 100%).

**UPDATE (cm-parked-reaudit-1, 2026-07-25): the pool-fold mechanism
itself IS a confirmed-fixable counter-lever, softening this entry from
PERMANENT.** Accessing `data_ov002_022d016c->f_d20` through a real
typed struct member at all 3 sites (rather than the
`*(int*)(base+0xd20)` cast form quoted above) reproduces orig's
indexed `[reg,#0xd20]` addressing with zero extra pool words — the
fold this entry describes no longer occurs at all under that lever.
Combined with fixing a wrong push-list (10 registers down to the
correct 7, via reusing named locals — `own`/`opp`/`opponent` — instead
of separate `p1`/`p0`/`flag` temporaries), match rose from a 65.2%
ceiling to 50.36%... **note the two percentages aren't directly
comparable, they're different failure modes/baselines** — the earlier
65.2% was measured against the old cast-form wall; the new number is
against a mostly-different residual after the pool-fold is gone: 5 of
7 persistent registers now match exactly (player/opponent/counter/row
all correct), and what remains is 2 small scratch-register-pairing
swaps at 3 near-identical `+= 1` sites, resistant to compound-vs-
longhand form, explicit temp pointers, and label reordering — looking
like a genuine, separate instruction-scheduling wall of the
"park on sight once diagnosed" class this project already catalogs
elsewhere (not yet independently confirmed as such via a second
instance). **Status: reclassify to P- pending-scheduling-lever** (no
longer "permanent" at the pool-fold level — that part is solved — but
still parked pending either a scheduling counter-lever or a second
confirmed instance of the residual to file it as its own wall).
Full detail: `docs/research/cm-parked-reaudit-1-2026-07-25.md`.
(Brief 677's independent re-audit reached this entry the same round and had flagged it UNVERIFIED on the grounds the typed-struct lever was untried; cm-parked-reaudit-1 then actually ran that lever — the result above supersedes the untried framing.)

**SECOND independent confirmation (cm-ov002-unknown-sweep-7, 2026-07-30)
— this is exactly the "two more independently-observed instances"
this entry called for, and it arrived from a worker who had NOT read
this update** (briefs 582/586, which the sweep-7 dispatch prompt did
point workers to, still say "no known C-level fix yet" — this entry's
2026-07-25 update postdates them and wasn't itself referenced in the
dispatch). On `func_ov002_02269ab8` (a different function than
`02269534`), typing the repeatedly-accessed global as a real struct
with the field at its natural offset (`struct { char _pad[0x300];
unsigned int flags; };` in place of raw `*(int*)(base+K)` pointer-
offset arithmetic) made mwcc emit indexed addressing consistently
across every access site, closing a ~30-point match gap in one move —
independently re-deriving the same mechanism cm-parked-reaudit-1 found
on a structurally unrelated target. **The pool-fold half of P-16 is now
confirmed systemic, not this-function-specific: always reach for a
typed struct member over raw pointer-offset casting for any
repeated-global-access pattern, don't wait to diagnose the fold first.**
The residual-scheduling half (2 small scratch-register-pairing swaps,
per the 2026-07-25 update) was not re-tested this round — still open.

### P-17. Briefs 288/290 commutative-add CSE/reg-alloc wall

> **Wall family note — distinct from C-34 and P-16.** The Brief 288/290
> cohort carries a specific `.s` escape-hatch diagnosis: C is byte-identical
> except for a commutative add-operand order, but changing that source order
> can cause mwcc to re-derive a wider register-allocation mismatch. It is not
> the duplicate same-symbol pool-slot wall of C-34, nor P-16's repeated
> `symbol+K` rematerialization after calls.

**Evidence.** Brief 654 counted 17 ov002 function headers naming the
brief-288/290 diagnosis. A fresh accumulated-lever re-test of
`func_ov002_021ebf40` reproduced the `DIFF_ARG_MISMATCH` register divergence,
so the cohort remains parked pending a dedicated counter-lever study.

**Affected cohort:** `021e8b34`, `021e97bc`, `021eb128`, `021eb300`,
`021eb630`, `021ebf40`, `021ebfd0`, `021ee23c`, `021ef5a0`, `021efe44`,
`021f0028`, `021f020c`, `021f1458`, `021f1504`, `021f208c`, `021f2138`,
`021f2ac8` (all ov002). The complete cohort census and method are in the
[verified ov002 wall cohort](campaign-analytics/ov002-wall-cohort.md).

**Status:** permanent-for-now / not a C-match queue target. Re-open only
with a fresh source-form hypothesis and byte evidence; do not infer that the
17 headers represent 17 independent untested opportunities.

**Re-test (brief 668, cm-p6-followup).** Fresh independent reconstructions of
2 more cohort members (`021e8b34`, `021eb128`), applying this session's full
lever set (shift-pair-preserving idioms for the sibling bit-extract checks,
explicit statement sequencing, expression regrouping):

- `021e8b34`: reached 72.2% — every instruction matches except the exact one
  the header names (`add lr, r12, lr` vs orig's `add lr, lr, r12`), cleanly
  isolating the wall to a single instruction with no other divergence. 3
  variants tried (combined expression, explicit `(A+B)` regrouping, 2-statement
  sequencing) — regrouping and sequencing both made things *worse* (they
  perturbed the surrounding register allocation, exactly as this entry's own
  wall-family note predicts), confirming the combined single-expression form
  is already the closest reachable point.
- `021eb128`: additionally exposed a **second, independent** register-choice
  wall (callee-saved `r3` vs orig's `r4`, present throughout the whole
  function) stacked on top of the same commutative-add issue — this cohort
  member is harder to isolate cleanly, but the same core add-operand pattern
  is present.

**Verdict: P-17 remains permanent.** 3 of 17 cohort members now confirmed
independently (`021ebf40` from brief 654, plus these 2) — 14 remain
genuinely untested, but the pattern is consistent across all 3 confirmed
so far. No lever from this session's catalogue (route-before-draft,
shift-pair preservation, branch polarity, statement sequencing) touches it.

**Re-sanity-checked (cm-ov002-unknown-sweep-5, 2026-07-29).** `021eb128`
(a listed cohort member) was re-attempted per its dispatch flag and
reconfirmed at 25.0% — exact documented signature, not re-ground.
`021e8b34` (a listed cohort member) was re-checked and now reaches 97.2%
against the 72.2% recorded in brief 668 — a large jump on other levers,
but the SAME single-instruction `add lr,ip,lr`-vs-`add lr,lr,ip` residual
remains. The improvement is likely from this session's broader lever set
(neither figure was obtained with the same toolkit), not evidence the
wall itself moved — worth remembering when comparing match percentages
across sessions with different lever catalogues.

**Possible cohort expansion, unconfirmed:** two functions well outside
the originally-surveyed `021e8xxx`-`021f2xxx` address range —
`021ece34` (97.3%, 1 diff word) and `021f82b8` (97.2%, 1 diff word),
both cm-ov002-unknown-sweep-5 batch 1 — show the identical symptom
(single commutative-ADD operand-order residual, otherwise byte-exact).
Neither is a literal P-17-cohort address, so treat as a *related*
finding rather than confirmed new members: either the same underlying
allocator behavior extends well beyond the brief 288/290 census's
original address range, or this is convergent evolution from a
different cause with an identical symptom. Worth a dedicated
cross-module grep for this exact "1-word commutative-add residual"
signature rather than assuming it's bounded to the known cohort.

> **BREAKTHROUGH (cm-ov002-unknown-sweep-6, 2026-07-30): P-17 may not
> be permanent after all — status downgraded to UNDER RECONSIDERATION.**
> The two remaining pre-flagged, previously-untested cohort members
> attempted this sweep (`021f020c`, `021f1504`) were BOTH resolved to
> 100.0% using a lever not tried in briefs 654/668: **constant-immediate
> placement** — writing the sub-row array's fixed offset BEFORE the
> `idx*stride` term in the pointer expression (`row+0x30+idx*20`, not
> `row+idx*20+0x30`) — which flips which operand lands in which register
> for the commutative add, resolving the residual outright. Both went
> from the expected ~97.6% straight to 100.0%. This is a small sample
> (2 of 17, both from the same address neighborhood) but a 100% hit
> rate on a previously-untested lever against a wall documented as
> resistant to "route-before-draft, shift-pair preservation, branch
> polarity, statement sequencing" is a strong enough signal to warrant
> re-testing the other 14 members before continuing to treat this as
> permanent. If it generalizes, P-17 should be retired (superseded by a
> new C-N entry) the same way P-7/P-8/P-10 were.
>
> **`021f020c` and `021f1504` are hereby RECLASSIFIED: no longer P-17
> members — both shipped at 100.0% and are now ordinary matched `.c`
> files, not `.s` walls.** The cohort count drops from 17 to 15 as a
> result.
>
> **Action for a future brief:** re-test constant-immediate placement,
> specifically, against all 15 remaining members before falling back to
> any other lever — including the 4 already-"confirmed"-walled ones
> (`021e8b34`, `021eb128`, `021ebf40`, `021e97bc`), none of which were
> tested with this exact lever (their confirmations predate its
> discovery). The 11 genuinely untested members are `021eb300`,
> `021eb630`, `021ebfd0`, `021ee23c`, `021ef5a0`, `021efe44`, `021f0028`,
> `021f1458`, `021f208c`, `021f2138`, `021f2ac8`.

> **Continued (cm-ov002-unknown-sweep-10, 2026-07-31): `021eb630`
> reclassified — shipped 100.0% first-try via constant-immediate
> placement.** A genuine, previously-untested listed cohort member.
> **Cohort count drops from 15 to 14.** Same sweep also shipped
> `021f162c` (not one of the 17 originally-enumerated addresses, but
> in the same surveyed neighborhood between `021f1458` and `021f1504`)
> at 100.0% first-try with the same lever — treat as another instance
> of the "possible cohort expansion" pattern this entry already flagged
> (`021ece34`, `021f82b8`), not a literal cohort reclassification. Two
> more first-try 100% hits on constant-immediate placement, both from
> this round, keeps the "re-test this lever against the 10 remaining
> untested members before anything else" action item live and
> increasingly well-supported (4 of 4 attempts with this specific lever
> have now succeeded, across two separate sweeps).

### P-18. Task-config field-write store-reordering

mwcc reorders two independent (non-aliasing, no data dependency between
them) struct-field stores relative to each other, regardless of source
statement order or access-syntax style. Distinct from P-2 (that's about
load/store-multiple *fusion*; this is about the relative *order* of two
already-separate, already-unfused single-word stores).

**Target asm (`func_ov004_021cd3b4`, a task-config struct build before
`func_0201e5b8`):** writes `cfg.f0x10 = -1`, then `cfg.f0xc = 0x4080`, then
a read-modify-write of `cfg.flags`, then `cfg.f0x00 = handle`, then a
second read-modify-write of `cfg.flags` — the `handle` write sits
*between* the two flags read-modify-writes.

**Falsifiable claim:** *some source statement order reproduces this exact
sequence.* **Falsified — 2 forms tried (cm-ov004-021cd3b4-finish,
2026-07-25):**

- Source statements in the target's own literal order (`f0x10`, `f0xc`,
  flags-rmw-1, `f0x00`, flags-rmw-2) — mwcc still reorders `f0xc` and
  `f0x00` relative to each other in the compiled output.
- Same statement order, but through a proper `typedef struct` with named
  fields instead of raw `char[]` + offset casts — byte-identical output to
  the raw-cast version; the access syntax makes no difference.

**Why permanent (for now):** the two stores have no data dependency and
write to different offsets of the same local aggregate, so mwcc's
scheduler is free to reorder them and does, independent of the source's
own textual order — the compiler is choosing an order that happens not to
match target's, for reasons not yet isolated (possibly instruction-latency
scheduling around the two different constant-materialization strategies:
`f0xc`'s value comes from a pool load, `f0x00`'s from a register already
holding a call result).

**Affected picks (1):** `func_ov004_021cd3b4` (this session's dedicated
attempt reached `DIFF 188v196` overall; this is one of its 2 named
residuals — see
[`cm-ov004-021cd3b4-finish-2026-07-25.md`](cm-ov004-021cd3b4-finish-2026-07-25.md)
for the full per-instruction diff). Not yet cross-checked against other
candidates using the same `func_02006c0c`+`func_0201d47c`+`func_0201e5b8`
config-struct idiom (`func_ov008_021b2064.c`, `func_ov010_021b32ac.c`,
etc. all matched already, so they're not live test cases for this
specific residual) — flag any FUTURE unmatched user of this idiom against
this entry before re-deriving the mechanism from scratch.

**Recipe status: NONE.** Future briefs: try forcing an explicit sequence
point between the two stores (e.g. a dummy volatile read of one field
between them) as the next untried lever, or check whether the pool-load
vs. register-value distinction between the two stores is the actual
scheduling driver (P-3-adjacent).

### P-19. Bit-pack intermediate register-choice CSE divergence (r0 vs r2)

A pure-arithmetic bit-packing intermediate (`(0x81 - x) & 0xff`, later
OR'd with several other terms into a single packed word) lands in a
different register than target with no other divergence anywhere in the
surrounding code.

**Target asm (`func_ov004_021cd3b4`):** keeps the whole computation in
**r0** end to end (`rsb r0,r0,#0x81; and r0,r0,#0xff; ...; orr r0,r0,...`).
mwcc puts the same chain in **r2** instead
(`rsb r0,r0,#0x81; and r2,r0,#0xff; ...`).

**Falsifiable claim:** *some source form keeps the chain in r0.* **Falsified
— 2 forms tried (cm-ov004-021cd3b4-finish, 2026-07-25):**

- Single combined C expression (`((0x81-fa4)&0xff) | 0x2000 | 0x80000000 |
  (...)`) — lands in r2.
- Step-by-step statement-per-original-instruction transliteration (named
  temp `t0`, one operation per line, matching the target's exact
  instruction granularity) — identical compiled output, still r2.

**Why permanent (for now):** no source-shape difference between the two
forms changed mwcc's register choice at all — the two compiles are
byte-identical to each other, meaning the allocator's choice here isn't
sensitive to any of the syntactic levers this session's toolkit covers.
Correlates with the enclosing function needing one extra callee-saved
register overall (3 vs. target's 4 saves, with a compensating 4-byte
`sub sp` difference) — plausibly the SAME root allocator decision surfacing
in two places, not two independent walls, but that connection isn't proven.

**Affected picks (1):** `func_ov004_021cd3b4` — see
[`cm-ov004-021cd3b4-finish-2026-07-25.md`](cm-ov004-021cd3b4-finish-2026-07-25.md).
Not yet seen elsewhere; too new to have a cohort.

**Recipe status: NONE.** Future briefs: since both tried forms produced
*identical* codegen, the next untried axis is something structural rather
than expression-level — e.g. check whether the OTHER local variables'
declaration order/count in the same function changes overall register
pressure enough to free r0 for this chain (the extra-callee-save
correlation above), rather than reshaping this expression again.

### P-20. Per-player row-offset multiply register-letter swap (`(player&1)*0x868` idiom)

> **Wall family note — related to P-17 but a distinct cohort.** Same
> general shape as P-17 (a commutative multiply/add feeding a register
> that ends up under a different letter than target) but P-17's cohort
> is 17 named functions in the `021e8xxx`-`021f2xxx` range from briefs
> 288/290; this cohort lives in the `0224axxx`-`0224dxxx` range and is
> specific to the `(player&1)*0x868`-style per-player struct-row-offset
> calculation. Treat as a sibling wall, not the same one, until proven
> otherwise.

**The idiom:** many ov002 functions index into a per-player row of a
struct array via `(self->player & 1) * 0x868` (or an equivalent
already-masked field), then combine that row offset with a second
scaled index into the row. Original asm computes this in a specific
r1/r2 (occasionally r2/r3) register pairing; mwcc's allocator picks the
opposite pairing for the same arithmetic, with every other instruction
in the function — including instruction count and order — byte-identical.

**Falsifiable claim:** *some source-level restructuring of the row/index
computation flips the register pairing to match.* **Falsified — 11
independently-attempted cohort members, cm-ov002-unknown-sweep-4
(2026-07-27):**

- `021c3150`, `0224aac0`, `0224c160`, `0224da7c`, `02252914` (batch 3):
  named-variable separation, operand-order swaps, and a
  named-constant-first variant all tried — zero effect on codegen.
- `0224a6f4`, `0224c034`, `0224d8b4`, `02252734` (batch 2): 5 distinct
  reorderings tried — zero effect.
- `0224cd18`, `0224f7a0` (batch 4): same residual on the single-int-
  param variant of an otherwise-fully-matched template.

All 11 land at exactly 87.9% (4 diff words) except `0224da7c` at 81.2% —
remarkably consistent, suggesting one specific allocator decision point
rather than 11 independent problems.

**Why permanent (for now):** three independent batches, none aware of
the others' attempts, converged on the same conclusion via different
restructurings. Combined with the suspiciously exact, repeated 87.9%
match figure across unrelated call sites, this reads as a genuine
allocator-internal decision (likely tied to which of the two operands
was live first from an enclosing computation) rather than anything
expressible as a source-level lever from this project's current toolkit.

**Affected picks (28):** `021c3150`, `0224a6f4`, `0224aac0`, `0224c034`,
`0224c160`, `0224cd18`, `0224d8b4`, `0224da7c`, `0224f7a0`, `02252734`,
`02252914` (cm-ov002-unknown-sweep-4); `02249790`, `0224eab4`,
`02252ca4`, `022515b0`, `022483ac`, `0224a4f8`, `0224c980`, `0224e230`,
`0224f824`, `02248a1c`, `0224ab44`, `0224cc90`, `0224e490`, `02250350`,
`0224b01c` (cm-ov002-unknown-sweep-5) — 17 new members confirmed the
very next sweep, more than doubling the cohort and confirming this is
one of the largest single wall classes found in ov002 so far. Likely a
larger cohort still exists outside these two size bands given the
idiom's generality — worth a targeted grep-by-idiom census rather than
waiting for size-band sweeps to hit the rest.

**Sub-variant noted, not yet confirmed as the same mechanism:**
`0224c4e8`/`0224db94` (cm-ov002-unknown-sweep-5, 83.8%/83.3%) show the
same pool/register-order symptom but with the idiom as the function's
*first* statement, unlike every other cohort member — flagged in case a
future lever cracks this specific positioning without generalizing to
the rest of the cohort. `0224b01c` (67.6%) additionally compounds with
what its investigating batch described as an independent second
register swap — the P-20 signature is present, but isolating it cleanly
from the second issue wasn't attempted (correctly, per the "don't grind
this" standing instruction).

**More members, cm-ov002-unknown-sweep-6 (2026-07-30):** `021b3314`,
`021cb270` (89.7% each); `0224b1e0`, `0224d818`, `02250d9c` (confirmed,
69.2%/69.2%/70.7%); `021eba34`, `0224e6e8`, `02252c08`, `0229d0b0`
(76.3%/70.7%/89.7%/70.7%) — 9 more members, none pre-flagged by
address, all independently recognized by their investigating batch from
the documented symptom alone. Brings the confirmed cohort to **37**.

**More members, cm-main-exploit-drain-2 (2026-08-22):** 15 candidates
from this round's ≤192 B (Part 1) and 193–256 B (Part 2) pools shared this
exact `(self&1)*0x868` table, all reproduced the identical register-letter
symptom on independent fresh drafts, zero ships. Two are re-confirmations of
already-catalogued members — `0224b1e0` and `02250d9c` were listed above from
cm-ov002-unknown-sweep-6 (69.2%/70.7%); this round's own independent drafts
plateaued at 52.5%/57.1% respectively, a different specific figure (as
expected — different draft, different residual-word overlap) but the same
wall. The other 13 are new: `02251104`, `02251ec0`, `022527b8`, `02295efc`,
`02296240` (Part 1); `021d7a64`, `021f126c`, `022058b4`, `02215bf4`,
`0221b804`, `02239f10`, `0224ac6c`, `02251844` (Part 2). Brings the confirmed
cohort to **50** (37 + 13 new). Ledger detail and match percentages:
`cm-main-exploit-drain-2-2026-08-22.md`.

**More members, cm-main-boundary-rerun (2026-08-22):** the matched-effort
193-256B re-run drew 7 ov002 candidates from the untouched pool remainder; 5
shared this table and reproduced the identical residual: `0223252c` (3.9%),
`02233c50` (63.6%), `02249818` (5.9%), `0224a038` (4.9%), `0228130c` (0.0%,
structural). All 5 new (no overlap with prior waves' addresses). Brings the
confirmed cohort to **55** (50 + 5 new). 20 consecutive hits across three
independent rounds (`cm-main-exploit-drain-1` 7, `cm-main-exploit-drain-2`
Part 1+2 8, this round 5) with zero ships — the most heavily evidenced wall
in the catalog. Ledger detail: `cm-main-boundary-rerun-2026-08-22.md`.

### P-20-mode-switch-selector. `r0`-vs-`r1` register choice for a struct's-first-field 3-case mode switch (tentative, n=2, independent provenance)

**The shape:** a function beginning `switch (self->mode) { case 0: ...; case
1: ...; case 2: ...; }` (or the equivalent field read directly in the switch
controlling expression), where target puts the switch selector in `r1` and
every attempted C draft puts it in `r0` — a 4-word residual (one `cmp` per
case, plus the initial `ldr`) that survives switch-vs-if/else-chain
restructuring (if/else additionally inverts branch polarity and moves the
result *away* from matching, not toward it), declaration-order changes,
signedness changes on the field type, and an added unused second parameter.

**Falsifiable claim:** *some source restructuring puts the switch selector in
`r1`.* **Falsified on both members tried:**

- `func_ov014_021b2eec` (main, 252B) — `cm-main-exploit-drain-2`
  (2026-08-22), 92.2%.
- `func_ov005_021ad284` (ov005, 216B) — `cm-main-boundary-rerun`
  (2026-08-22), 92.6%.

Both are structurally independent (different module, different field
offsets, different callees, different case-body contents) and both plateau
on the exact same 4-word pattern, which is why this is recorded as tentative
rather than a single-instance curiosity — but two members from what is
effectively one shape family (mode-switch dispatchers, common in this
codebase's state-machine style) is a real but narrow evidence base. A third
independent hit on a differently-shaped switch would move this to confirmed.

**Recipe status: NONE.**

**Affected picks (2):** `021b2eec`, `021ad284`.

**Provenance:** `cm-main-exploit-drain-2` (2026-08-22);
`cm-main-boundary-rerun` (2026-08-22).

**Recipe status: NONE. Correction (2026-07-30): do NOT treat this
cohort as a case for prioritizing the permuter.** An earlier version of
this entry argued the growing member count "may justify solving the
Windows permuter blocker" — that framing was wrong by roughly 20x on
value alone: 37 members at ~136 B average is ~5,000 B, a small fraction
of a percent of the project's remaining unshipped bytes. It's also
wrong on the evidence: the permuter has actually been run against 4
functions of this general shape for ~100k iterations combined,
shipping zero. This is a genuine, well-evidenced permanent wall — park
members on sight once the symptom matches, and do not accumulate it as
a future prize or cite its size as justification for tooling
investment.

**Provenance:** cm-ov002-unknown-sweep-4 (2026-07-27), batches 2/3/4;
cm-ov002-unknown-sweep-5 (2026-07-29), batches 2/3/4/5;
cm-ov002-unknown-sweep-6 (2026-07-30), batches 2/3/4/5.

> **Independent reconfirmation, cm-ov002-unknown-sweep-17 (2026-08-06),
> mini-item A.** `021eba34` re-attempted from scratch without
> cross-referencing this entry first (flagged only as an
> OBSERVED-NOT-CONFIRMED note under C-63/C-66 by the prior round) —
> landed at exactly 76.3%, matching this entry's own sweep-6 figure for
> the same function digit-for-digit. Also tried: an explicit bitfield-
> typed struct member for a second, unrelated field read elsewhere in
> the same function (see C-63's idx-stride-struct extension) — zero
> effect on this residual, consistent with "park on sight" already
> being the right call. Worth a standing note for future sweeps: grep
> this entry's affected-picks list before writing a fresh
> OBSERVED-NOT-CONFIRMED block for a symptom that looks like this one —
> it may already be catalogued.

> **One more independent confirmation, cm-ov002-unknown-sweep-17
> (2026-08-06), batch 5.** `021d7054` (44.2%) hit the exact documented
> signature — brings the cohort to 38 confirmed members. No new
> restructuring variant tried; parked on sight per this entry's own
> "Recipe status: NONE" guidance.

### P-21. Loop/field-extraction-variable register permutation

> **Distinct from P-20.** Both are "near-miss, register-naming-only"
> walls in the same size band, but P-20 is a specific, narrow idiom
> (`(player&1)*0x868`) with a consistent 87.9% floor; P-21 is a broader
> family of loop- and field-extraction-adjacent variables landing on
> different physical registers across a wider range of match percentages
> (65-97%), with no single shared source idiom identified yet.

**The symptom:** a loop induction variable, or a variable holding a
just-extracted struct field, lands on a different physical register
than target — same instructions, same order, just systematically
different register letters — in loop or field-extraction contexts that
don't share P-20's specific per-player-row-offset shape.

**Falsifiable claim:** *some declaration-order or restructuring change
fixes the register choice.* **Falsified — 6 members,
cm-ov002-unknown-sweep-5 (2026-07-29), batch 5:**

- `02255148` (77.1%): player/xorval swap survived 4 reorderings.
- `02228290` (77.1%): loop-variable permutation after an unrelated
  sizing bug was fixed.
- `022025f4` (54.3%): off+field10\*stride+0x30 row-lookup permutation.
- `02219b48` (44.1%): 4-5-way permutation after an unrelated
  addressing-mode bug was fixed.
- `0220e040` (65.7%): bit9/bit16/field10 permutation after an unrelated
  inline-vs-branch bug was fixed.
- `0224b01c` (67.6%): compounds with a confirmed P-20 signature — the
  P-20 idiom is present, but an independent second register swap is
  layered on top of it.

**Why permanent (for now):** ~15 reordering attempts across these 6
functions never changed the register choice. In 4 of 6 cases a *real*
structural or addressing bug was found and fixed first (raising the
match percentage substantially), with this register permutation as the
remaining, unresponsive residue — meaning this isn't a case of
insufficiently-debugged source, just a genuine allocator-level wall
sitting underneath otherwise-correct C.

**Affected picks (6):** `02219b48`, `022025f4`, `02228290`, `0220e040`,
`02255148`, `0224b01c` (all ov002, all cm-ov002-unknown-sweep-5). Given
the diversity of shapes (loop bodies, field extraction, one P-20
compound case), this is likely under-counted — watch for the "correct
logic, register letters only" symptom broadly, not just in the shapes
listed here.

**Recipe status: NONE.** Same profile as P-20 — permanent, low aggregate
byte value, not a case for tooling investment (see P-20's 2026-07-30
correction). Park on sight.

**Provenance:** cm-ov002-unknown-sweep-5 (2026-07-29), batch 5.

### P-22. Slot bit-manipulation register-pressure wall (the `&1` remask lever backfires here)

> **Warning, not just a wall.** This entry exists mainly to flag that
> one of this project's most reliable levers — the explicit redundant
> `&1` re-mask — actively makes this specific shape *worse*. Check
> against this entry before reflexively applying that lever to a
> low-match per-player-slot bit computation.

**The shape:** a per-player-slot bit-manipulation computation involving
a `field8`/`bit13`-style extraction, landing at a very low match
percentage (2.9-5.4%) — broad register-allocation divergence, not a
near-miss.

**Falsifiable claim:** *the redundant `&1` re-mask lever (reliable
elsewhere in this module) fixes or improves the match.* **Falsified —
3 members, cm-ov002-unknown-sweep-5 (2026-07-29), batch 3:**

- `02203e2c` (2.9%): adding the expected redundant `&1` mask
  *increased* register pressure instead of fixing it.
- `02221e3c` (5.4%): identical slot/field8/bit13 computation, same
  result.
- `02237e00` (5.4%): confirmed same wall a third time.

**Why permanent (for now):** three independent confirmations of the
same counter-intuitive result — a lever that helps almost everywhere
else in this cohort actively hurts here. Suggests the extra masking
instruction pushes an already-tight register allocation over some
internal threshold, rather than the mask itself being the issue. No
alternative lever tried yet; the next angle is probably reducing
register pressure elsewhere in the function rather than touching the
mask.

**Affected picks (3):** `02203e2c`, `02221e3c`, `02237e00` (all ov002).

**Recipe status: NONE.** Try register-pressure-reducing restructuring
(fewer live locals, earlier frees) rather than more masking variants.

**Provenance:** cm-ov002-unknown-sweep-5 (2026-07-29), batch 3.

### P-23. Pool-constant register-pairing wall (`mla`'s two constant operands) (tentative — see 2026-08-18 correction)

> **Catalog correction (cm-main-exploit-drain-1, 2026-08-18).**
> `02253304` shipped clean in `cm-main-wall-filtered-sweep-1` (#1508) —
> the real fix was declaring an *unrelated callee's* return type
> `signed int` instead of `unsigned int` (forcing `LT` instead of `CS`
> on a `<5` compare in the caller), not anything touching the `mla`
> register pairing this entry describes. It was never actually blocked
> by this wall; it just happened to sit at a matching plateau until the
> real (unrelated) bug was found. Removed from affected picks below —
> see `attempts.tsv` for the contradicting row (result=shipped,
> brief=cm-main-wall-filtered-sweep-1). This drops confirmed membership
> from 3 to 2, which by this entry's own n=2/n=3 convention (below)
> means the wall reverts to **tentative** pending a fresh third
> independent hit.

**The shape:** an `mla` (multiply-accumulate) instruction whose two
constant operands are fed from a specific r0/r1/r3 register pairing in
target; mwcc's allocator picks a different pairing. Distinct from
P-20's r1/r2 pairing inside the multiply itself, and from P-21's
broader loop/extraction-variable permutations — this is specifically
about which registers hold the two *constants* feeding one `mla`.

**Falsifiable claim:** *some source restructuring fixes the constant's
register pairing.* **Falsified — 2 members,
cm-ov002-unknown-sweep-5 (2026-07-29) batch 3 and
cm-ov002-unknown-sweep-17 (2026-08-06) mini-item A:**

- `02251bb0` (65.7%, up from 27% after real bugs were fixed: call-result
  variable reuse for early returns, split-shift-reuse).
- `0224bd3c` (84.2%): the row-table `(player&1)*0x868` idiom feeding an
  `mla` whose two pool-loaded constants (stride, table base) AND the
  masked runtime flag all land in a different r0/r1/r3 pairing than
  target — a fuller 3-way permutation than the first member's
  2-register pairing, but the same underlying phenomenon (the `mla`'s
  operand-to-register assignment is a backend choice, not a source-level
  one). **7 independent source variations tried across this member
  alone and its 2 mini-item siblings, zero effect**: operand-order swap,
  named `stride` intermediate, named `masked` intermediate, the fused
  expression (all 4 from cm-ov002-unknown-sweep-16), plus an explicit
  bitfield-typed struct-member extraction for the surrounding row-entry
  read (cm-ov002-unknown-sweep-17 — this changed the id/category/flag
  extraction instructions completely while leaving this exact residual
  byte-for-byte untouched, confirming it's decoupled from the rest of
  the function's source shape, not just the `mla` expression's own
  phrasing).

**Why tentative (was "permanent"):** two independent members, across
two sweeps ~10 days apart, both isolated this exact residual after
unrelated real fixes raised them to their respective plateaus, and both
resisted every restructuring tried (7 variations combined on
`0224bd3c` alone). Real evidence, but per this catalogue's own n=2/n=3
convention this is provisional strength, not confirmed — the former
"third member" (`02253304`) turned out to be a different bug entirely
(see correction above). A fresh, genuinely independent third hit would
restore confirmed status.

**Affected picks (2):** `02251bb0`, `0224bd3c` (both ov002).
`02253304` (ov002) RETRACTED 2026-08-18 — shipped clean, see correction
note above; do not re-add without new evidence.

**Recipe status: NONE.**

**Provenance:** cm-ov002-unknown-sweep-5 (2026-07-29), batch 3;
cm-ov002-unknown-sweep-17 (2026-08-06), mini-item A;
cm-main-wall-filtered-sweep-1 (2026-08-17)/cm-main-exploit-drain-1
(2026-08-18) — retraction of `02253304`.

### P-24. Per-player row + idx\*0x14-stride loop register-swap (tentative, P-20-sibling)

> **Tentative — single-batch evidence.** Distinct from P-20 in shape (a
> full loop over a slot array, not a single-access row lookup) but
> shares the `(player&1)*0x868` row-offset idiom and the same 2-
> instruction register-swap symptom. Filed separately pending
> independent re-confirmation by a future sweep, per the project
> convention of not over-generalizing from one batch's findings.

**The shape:** a loop iterating a `(player&1)*0x868`-row, `idx*0x14`-
stride slot array, wrapped in the positive-condition-wrap idiom, where
an `and`/`mul` destination register choice differs from target across
every member — identical instructions/order otherwise.

**Falsifiable claim:** *some restructuring flips the register choice.*
**Falsified on all 5 attempted members, cm-ov002-unknown-sweep-6
(2026-07-30), batch 1:** operand-order swap and table-variable removal
both tried per member, zero effect.

**Affected picks (5):** `0224a580`, `0224d0f8`, `0224df78`, `02250670`,
`02252a58` (all ov002, all sharing the exact same 2-instruction
residual).

**Recipe status: NONE.**

**Provenance:** cm-ov002-unknown-sweep-6 (2026-07-30), batch 1.

### P-25. Legacy_sp3-tier dead-value-in-callee-saved-register wall

**The shape:** ground truth preserves a value in a callee-saved
register that's provably dead on the taken code path, forcing an extra
`push` + stack-padding cascade in the prologue/epilogue that no source
restructuring reproduces. Specific to the `1.2/sp3` legacy compiler
tier (fused `pop {regs, pc}` epilogue routing).

**Falsifiable claim:** *some source form avoids the extra push/pad.*
**Falsified on 3 members, cm-ov002-unknown-sweep-6 (2026-07-30), batch
5:** 6 combined restructuring attempts across the 3 members, all
byte-identical or worse.

**Affected picks (4):** `021cd414` (36.8%), `02212bc4` (75.0%, second
instance), `02228fac` (90.0%, third instance — an `unsigned char` cast
fixed a genuine r5/r6 swap first, raising it from 75% to 90% before the
push/pad residual became the sole blocker), `021be2d8` (72.1%, fourth
instance, cm-ov002-unknown-sweep-17 batch 5 — body matched 100% after
a C-55 goto fix plus a declaration reorder before isolating the same
sp3-tier push/pad choice; 3 more restructuring attempts, zero effect).

**Recipe status: NONE.**

**Provenance:** cm-ov002-unknown-sweep-6 (2026-07-30), batch 5;
cm-ov002-unknown-sweep-17 (2026-08-06), batch 5.

### P-26. Precheck-array-lookup P-20 variant (EQ-vs-LS component)

> **Related to P-20 but a distinct address range and symptom.** Shares
> the `(player&1)*0x868` row-offset idiom and the r1/r2 register-letter
> residual, but adds an EQ-vs-LS condition-code component P-20's core
> cohort doesn't show. Originally scoped to a `02249xxx`-`0224dxxx`
> precheck-guarded range; cm-ov002-unknown-sweep-17 found one member
> (`0220c0b8`) outside that range, so treat the range as descriptive of
> where most members happen to live, not a boundary condition.

**Falsifiable claim:** *some restructuring resolves either the
register swap or the condition-code mismatch.* **Falsified on 9
members across two rounds ~1 week apart:**
- cm-ov002-unknown-sweep-6 (2026-07-30), batch 5: real
  do-while/pointer/declaration-order fixes raised match% substantially
  on every member first (e.g. 4.5%→74.4% on one), isolating the
  residual cleanly — but the residual itself resisted 6 further
  attempts per member.
- cm-ov002-unknown-sweep-17 (2026-08-06): **5 new independent members
  found blind, across 2 different batches with no cross-talk, neither
  of which recognized this as an already-catalogued wall** — both
  batches (and mini-item A, separately) characterized their findings
  as a fresh "open C-64 contradiction" rather than checking the P-wall
  catalogue first, and one of their instances (`02249a54`) turned out
  to be this entry's own original member #1, independently re-hit
  rather than recognized. Restructuring attempts tried and failed this
  round: `unsigned int` declared type (not just a cast), a contrived
  for-loop-with-break to force loop-precheck synthesis, and (batch 5)
  restructuring a wrongly-added `for` into a proper `do-while` — the
  last one DID fix a real structural mismatch first (`0224dafc`
  4.8%→38.5%) before isolating the same EQ-vs-LS residual as every
  other member, consistent with the sweep-6 pattern of a real fix
  raising match% before the wall becomes the sole blocker.
  **Standing lesson for future rounds: grep the P-wall
  affected-picks lists for a candidate's address before writing up a
  "new" open question — this pattern has now been independently
  rediscovered at least 3 times across sweep-6, sweep-16, and
  sweep-17 alone.**

**Affected picks (9):** `02249a54` (74.4%, sweep-6; re-hit
sweep-17 mini-item A canary), `0224a32c` (73.2%, sweep-6), `0224c57c`
(68.3%, sweep-6), `0224ddf0` (75.6%, sweep-6), `02246ecc` (12.2%,
sweep-17), `0224dafc` (5%→38.5% across two sweep-17 batches
independently), `022499b0` (53.7%, sweep-17), `0220c0b8` (41.9%,
sweep-17 — the range-extension member), `0228c924` (12.8%, sweep-17 —
also has an unresolved secondary `-1` materialization difference,
`sub` vs `mvn`, layered on top of the same EQ-vs-LS residual) — all
ov002.

**Recipe status: NONE.**

**Provenance:** cm-ov002-unknown-sweep-6 (2026-07-30), batch 5;
cm-ov002-unknown-sweep-17 (2026-08-06), mini-item A and batches 1/3/5.

### P-27. Post-call scheduling/materialization resists source-level restructuring (family, not one mechanism)

> **A family, not a single wall.** Unlike P-20/P-23's narrow, single
> instruction-shape signature, this entry covers several DIFFERENT
> symptoms that share one property: the divergence sits in code that
> executes immediately after a function call (direct `bl` or indirect
> `blx`), and none of it responds to source-level restructuring the way
> the exact same construct does when it's NOT call-adjacent elsewhere
> in the same function. Filed as one family entry per the project's
> "don't over-generalize from one batch" caution — future rounds should
> watch whether a specific sub-symptom (branch-vs-predicate, block
> reorder, or pool-vs-immediate) earns enough independent members to
> split into its own precise entry.

**The shape(s), all confirmed cm-ov002-unknown-sweep-17 (2026-08-06),
mini-item B, building on 2 data points cm-ov002-unknown-sweep-16
(2026-08-04) flagged under C-55 as OBSERVED-NOT-CONFIRMED:**

1. **Branch-vs-predicate for a guard testing a just-returned value**
   (`func_ov002_02299c9c`, sweep-16): `if (fn() == 0) goto Y;` kept
   if-converting to predicated `mov`/`popeq` instead of target's real
   `beq`, across all 4 variations tried (plain goto, swapped label
   order, named intermediate, fully-explicit both-arms-goto). The SAME
   function's FIRST guard (`if (fn == 0) ...`, no intervening call)
   converted correctly on the first try with the identical technique.
2. **A second, distinct instance in the same function**
   (`func_ov002_02299c9c`, sweep-17): after the post-call guard passes,
   a 3-statement block (`d524[0x8]=0; d524[0x4]++; read d016c[0xd34]`)
   compiles with a different instruction order/register pairing than
   target — 2 variations tried (direct expression, named `count`
   intermediate), zero effect. Everything else in this function,
   including a second `goto`-based shared-tail restructure for the
   overall `return 0`/`return 1` convergence, matched cleanly — this
   isolates the residual to specifically the code right after `blx r0`.
3. **Pool-constant materialization instead of an immediate op**
   (`func_ov002_022a8190`, sweep-17): a 16-bit struct field assigned
   the constant `-1` right after `func_0201d47c(&d)` compiled as a
   fresh `LDR` pool load of `0xffff`, where target uses `mvn r1, #0`
   (the same 32-bit-immediate technique that correctly closed an
   UNRELATED, non-call-adjacent field two statements earlier in the
   very same function). 3 variations tried (bare `-1`, `int`
   intermediate, `~0`), zero effect. The rest of the function — the
   proven `Desc0229e4e8` struct/task-spawn idiom borrowed directly from
   the already-shipped sibling `func_ov002_0229e4e8` — reproduced the
   documented 95.0% baseline exactly, isolating this one field's
   materialization cleanly.
4. **Pool-constant re-materialization for a repeated field access**
   (`func_ov002_021d1158`, sweep-17, weaker/indirect evidence): a final
   `(*(int*)(base+0x810))++;` two calls after the base pointer was last
   live compiled as a fresh combined `base+0x810` pool constant, where
   target reloads the plain base and adds `#0x810` as an immediate. 3
   variations tried (inline repeated expression, whole-function-scoped
   `base` variable — which also regressed unrelated register allocation
   elsewhere, a caution of its own — and a call-site-local pointer
   intermediate), zero effect on this specific choice.

**Why filed as permanent (for now):** 4 independent functions, 2 sweeps
9 days apart, 3 batches with no cross-talk on the details (sweep-16's
2 original instances were flagged blind; sweep-17's mini-item B
targets were dispatched specifically to re-test them and found 2 more
independently). 12 total restructuring variations combined across all
4 instances, zero effect on any of them. The unifying, falsifiable-and-
not-yet-falsified claim: **once past a call boundary, mwcc's scheduler
and constant-materializer make choices this project's source-level
toolkit cannot currently reach**, regardless of which specific
instruction-selection question is at stake.

**Affected picks (4):** `func_ov002_02299c9c` (71.8%, two distinct
instances), `func_ov002_022a8190` (95.0%), `func_ov002_021d1158`
(87.2%, weaker evidence — see caveat above).

**Recipe status: NONE.**

**Provenance:** cm-ov002-unknown-sweep-16 (2026-08-04), canary
attempts (2 instances, filed as OBSERVED-NOT-CONFIRMED under C-55);
cm-ov002-unknown-sweep-17 (2026-08-06), mini-item B (promoted to a
numbered entry per the standing rule: a 3rd/4th independent instance
promotes an OBSERVED note).

### P-28. Single-scratch-value register-mirror, broader than P-20/P-23's literal `mla`-operand shape (tentative)

> **Tentative — proposed independently by 3 batches in one round, not
> yet given a full falsification pass of its own.** cm-ov002-unknown-
> sweep-17's batches 2, 3, and 5 each separately flagged a residual
> that resembles P-20/P-23 in character (correct logic, a single
> register-identity or operand-order choice differs, resists 2-5
> restructuring attempts) but does NOT match either entry's specific
> shape — no `(flag&1)*STRIDE`-feeding `mla`, sometimes no `mla` at
> all. Filed as its own entry per batch 5's explicit suggestion rather
> than force-fit into P-20/P-23, but genuinely tentative: the members
> below span several surface-different mechanisms (a bare `mul`, a
> `movs`-vs-`cmp` flag source, address-arithmetic scratch registers, a
> commutative `add`/`mla` operand order) that may turn out to be 2-3
> separate walls once a future round tests them independently rather
> than as one grab-bag. Do not treat membership here as confirmation
> that a fix exists for the specific sub-shape a new candidate shows.

**The shape (common thread across sub-cases):** after all real logic
bugs are fixed and the instruction sequence, count, and shape match
target exactly, ONE scratch value — a temp holding a row/flag
computation, a boolean comparison's flag source, or a small
address-arithmetic intermediate — lands in a different physical
register (or, for a commutative `add`/`mla`, a different operand
position) than target, and no combination of declaration-order swap,
statement-order swap, named-intermediate extraction, or macro-vs-raw
access changes the outcome.

**Falsifiable claim:** *some restructuring resolves the register/
operand-order choice.* **Falsified on every member attempted so far
(cm-ov002-unknown-sweep-17, 2026-08-06, batches 2/3/5, no cross-talk):**
- Batch 2: `0224a28c`/`0224f024` (90%/90%, exact twins — a bare `mul`
  computing `(player&1)*0x868`, not an `mla`); `02286ed4`/`022942d0`
  (63.4%/95% — `movs r,r0` feeding `bmi` in target vs `cmp r0,#0`
  feeding `blt` in the draft, same semantics different flag-source
  instruction, 2 confirmed instances); `021c1a2c` (63.4% — an
  `ip`-based address-arithmetic scratch register target uses that no
  restructuring reproduces).
- Batch 3: `0220c320` (78%), `0222ffc0` (90.2%), `02201614`/
  `021b9000` (83.3%/52.4%, `ip`-preference variant — for `021b9000`
  the C-67 switch fix reproduced the ENTIRE branch structure correctly
  first, isolating this as the sole remaining residual), plus 3
  instances of a pure commutative-`add` operand swap (`021ea10c`/
  `021ed090`/`021eddec`, all 97.6%, one word apart) that may be the
  same phenomenon as the `mla`-operand cases or a related-but-distinct
  one.
- Batch 5: `021eed74` (67.4%, sparse compare-tree dispatch value),
  `021f9190` (90.7%, CE288 pointer reload), `0222742c` (81.4%, CE288
  state value after a C-44-style case reorder already fixed the body),
  `021ee668` (56.4% this attempt — see cross-reference below).

**Cross-reference note:** `021ee668` was independently attempted
twice this round due to a dispatch-side duplicate (see the round's own
consolidation doc) — batch 1 reached 97.4% (a single commutative-`add`
operand-order diff after a real bitfield fix), batch 5 reached only
56.4% via a different approach. Both land in this family; batch 1's
attempt is the more advanced state of knowledge for this specific
function.

**Affected picks (16):** `0224a28c`, `0224f024`, `02286ed4`,
`022942d0`, `021c1a2c`, `0220c320`, `0222ffc0`, `02201614`,
`021b9000`, `021ea10c`, `021ed090`, `021eddec`, `021eed74`,
`021f9190`, `0222742c`, `021ee668` (all ov002).

**Recipe status: NONE.**

**Provenance:** cm-ov002-unknown-sweep-17 (2026-08-06), batches 2, 3,
and 5 independently.

### P-29. Single-symbol guard + row-loop eager-`mla` fusion (tentative, single-batch)

> **Tentative — single-batch evidence (6 instances), flagged for RE/
> permuter attention rather than further hand-drafting.** Distinct
> from P-20/P-23/P-28: those are about which *register* holds an
> already-correctly-fused value; this is about mwcc eagerly *fusing*
> a `mul`+`add` into one `mla` from the first reference, when the real
> target keeps them as two separate instructions and uses different
> addressing modes (register-indexed vs immediate-offset) for a
> single-use guard read versus a loop's repeated re-reads of the same
> row.

**The shape:** `if (data_ov002_022cf17c-style[player] <= 0) return;`
(or equivalent) followed by a loop reading
`data_ov002_022cf16c[player].someField`. Target keeps the row's
byte-offset (`mul`) and the row pointer (`add`) as two separate
instructions: **register-indexed** addressing (`ldr r0,[Rbase,
Rindex]`) for the single-use guard read, **immediate-offset**
addressing (`ldr r0,[Rrow,#imm]`) for the loop body's repeated
re-reads.

**Falsifiable claim:** *some source restructuring keeps the mul/add
split instead of fusing to one `mla`.* **Falsified on 6 members,
cm-ov002-unknown-sweep-17 (2026-08-06), batch 4:** every structural
variant tried — bare `for`, manual guard + lazy row formation, walking
pointer vs. array-indexed body, hoisted vs. inline array-pointer
expression, split-constant tricks — produced the same eager
`mla Rrow,Rbit,Rstride,Rbase` fusing both steps from the very first
reference, cascading into wrong addressing modes throughout. Working
theory (untested): mwcc's optimizer may treat the "guard-read symbol"
and "row-struct symbol" as genuinely different C-level expressions in
the true original — not something reachable by restructuring a single
unified expression.

**Affected picks (7):** `0224a1e4` (8.3%), `0224b0b0` (14.3%),
`0224c0b8` (4.8%), `0224e0dc` (11.9%), `02250498` (4.8%) — full
5-instance cohort of the clean signature — plus `02249268`/`02253000`
(54.8%/57.1%, partial: same underlying fusion but layered with an
otherwise-ordinary register-permutation residual, not cleanly
isolated).

**Recipe status: NONE.**

**Provenance:** cm-ov002-unknown-sweep-17 (2026-08-06), batch 4.

### P-30. Canary-lever residual — the shared large-offset base reproduces structure but not its physical register (tentative, main module)

> **Tentative — 5/5 hit rate on qualifying candidates in one batch,
> plus a documented counter-example where the trigger doesn't fire at
> all.** The canary lever (an explicit named local for a shared base
> pointer used at 2+ offsets exceeding the ARM LDR immediate limit,
> `>0xFFF`) reliably reproduces the CORRECT STRUCTURE — word count,
> control flow, which register holds the base across the accesses —
> but does not reliably reproduce WHICH physical register mwcc
> assigns to that base.

**The shape:** functions derived from `data_021a088c`/
`func_0207b538()`-style shared handles, each dereferencing the handle
at 2+ offsets past `0xFFF`. The named-base-variable pattern
(`char *base = (char*)handle + 0x1000; ... base + 0x210 ...`) gets the
whole function's shape and control flow right, but leaves either a
r1-vs-r2 or ip-vs-lr register choice for the base itself.

**Falsifiable claim:** *some source-level variation controls which
register the base lands in.* **Falsified on 5 members in one batch
(cm-main-tier-sweep-1, 2026-08-08, batch 5):** direct vs. named
expression, `char*` vs. `unsigned int` typing, declaration reordering
(though this fixed an UNRELATED top-level register-mapping bug on one
member first), and `&&` vs. nested-if all left the specific
register-choice residual unchanged. 13 total attempts across the 5
functions never moved it once. On a 6th member (`func_0207cbe0`),
swapping declaration order of two unrelated locals fixed a real
top-level register-mapping bug (46.4%→71.4%) BEFORE this same
residual was hit as what remained.

**Counter-example — the trigger does not universally fire.**
`func_02043250` (batch 1) has a near-identical shape (global handle +
two accesses whose combined offsets exceed `0xFFF`) but matched 100%
on the FIRST TRY with plain direct-offset expressions, no named base
needed — consistent with this project's own pre-existing reference
(`func_020403d4.legacy_sp3.c`, 5 direct-offset accesses, no named
base). Try direct-offset first; reach for the named-base lever only
once `fastmatch.py` actually shows the multi-offset residual, and
budget at most 1 attempt at fixing the specific register-choice
residual if the lever's structural fix doesn't also nail the register.

**Affected picks (5):** `func_0207af28` (86.7%), `func_0207b0e0`
(73.9%), `func_0207c8d8` (91.3%, first access matched, second
independent residual), `func_0207cbe0` (71.4%), `func_0207cc50`
(81.8%) — all main.

**Recipe status: NONE for the register-choice residual** (the
structural half of the lever — canary finding, main text above — is
a confirmed working recipe on its own).

**Provenance:** cm-main-tier-sweep-1 (2026-08-08), batch 5.

### P-31. Predication-resistance — mwcc fully if-converts a guard that no source restructuring can force into a real branch (mirror image of C-55)

> **No longer tentative — 8+ confirmed instances across two rounds and
> four separate batches, no cross-talk between most of them.**
> Originally filed on 2 members from a single batch; a second round
> (cm-main-tier-sweep-2) independently reproduced it 6+ more times
> across 3 different batches, on both guard-chain and small-dispatcher
> shapes and across all three compiler tiers. Confirmed systematic, not
> per-function noise.

**The shape:** a guard whose true-arm is a few instructions (a memory
store, a call, or a compact predicated block), false-arm is a single
constant or fallthrough — mwcc fully if-converts this to a branchless
predicated sequence (`streq`/`moveq`/`movne`, or a chained
`ldreq/cmpeq` sequence) in the target, but every source restructuring
tried produces a REAL branch for at least one arm instead. This is the
mirror image of C-55: there, mwcc predicates when a branch is wanted;
here, mwcc wants to predicate but the source can't talk it into doing
so.

**Falsifiable claim:** *some source restructuring produces the fully-
predicated (branchless) form.* **Falsified on every member tried
across two rounds:**
- cm-main-tier-sweep-1, batch 5: `func_02073ed8` (11 attempts, best
  40%), `func_0207c990` (6 attempts, best 50%).
- cm-main-tier-sweep-2, batch 3: `func_0208de4c` (leaf, no
  prologue/epilogue signal at all; 3 distinct C shapes including a
  tier switch, best 27.8%), `func_0208c940` (mirrored signature —
  target predicates the `mode==0` arm fully; 3 shapes, best 68.4%).
- cm-main-tier-sweep-2, batch 5: `func_02064580` (3-field-guard chain
  before a helper call; `&&`, goto-to-shared-label, and
  `do/while(0)`-with-break all produced byte-identical if-converted
  output; best 50%), `func_020577d8` (3 straight-line guards, NO calls
  between them — goto and `do/while(0)` actively made the merge
  TIGHTER rather than breaking it, 26→22-23 words; best 7.4%),
  `func_0209f904` (108B, 4-guard chain sharing one fail tail — this is
  the EXACT shape the round's own canary shipped successfully at a
  smaller size/simpler tail; here, with a tail call plus argument
  setup instead of a bare constant return, if-conversion wins instead
  — **the key negative finding of cm-main-tier-sweep-2**: the canary's
  successful nested-if/goto recipe does NOT generalize once the
  success path gets more complex than a bare return).
- cm-main-tier-sweep-2, batch 5 Pool A: `func_0208e6ac` — tried under
  ALL THREE compiler tiers (2.0/sp1p5, 1.2/sp2p3, 1.2/sp3, identical
  wrong output on all three, ruling out tier as the variable) and 5 C
  shapes; zero movement, best 4.5-9.1%.

**Size/complexity is the apparent trigger for WHICH direction wins.**
The round-2 evidence suggests if-conversion becomes more likely to WIN
(defeat every branch-forcing attempt) as the guard chain's success
path grows more complex — a bare constant return (the canary's shape)
lets branch-forcing recipes work; a tail call with argument setup, or
a call between guards, tips mwcc toward keeping/forcing the predicated
form regardless of source structure. Not yet a predictive rule, just
the clearest pattern across this round's members.

**Possible relation to P-32:** both are cases where mwcc's predicate/
branch decision resists every source-level lever tried; P-32 is
specifically about a 2-value OR-membership test, this entry is about
a single guard (or guard-chain) with an asymmetric true/false arm or
a call-adjacent success path.

**Affected picks (8):** `func_02073ed8`, `func_0207c990`,
`func_0208de4c`, `func_0208c940`, `func_02064580`, `func_020577d8`,
`func_0209f904`, `func_0208e6ac` — all main.

**Recipe status: NONE for the general family. PARTIAL for one named
sub-case — see below.**

> **Counter-technique found for the "guard skips an entire loop"
> sub-case (cm-main-tier-sweep-3, 2026-08-08, batch 4).**
> `func_020a7440` (a memcmp-shaped function): writing the zero-trip
> guard as its own leading statement —
> `if (count == 0) { return 0; } do { ... } while (--count != 0);` —
> got if-converted (predicated) by mwcc even though the target wants a
> real `beq` skipping the whole loop. Folding the SAME guard into the
> loop's own condition instead — `while (count != 0) { ...; count--; }`
> — produced the required branch. The guard is identical either way;
> only whether it's a separate leading statement or structurally part
> of the loop's own test changes the if-conversion decision. Does not
> generalize to P-31's other members (none of which are "a guard in
> front of a loop") — flagged as a specific, reusable fix for this one
> sub-shape, not a resolution of the family.

**Provenance:** cm-main-tier-sweep-1 (2026-08-08), batch 5;
cm-main-tier-sweep-2 (2026-08-08), batches 3, 5;
cm-main-tier-sweep-3 (2026-08-08), batch 4.

### P-32. OR-of-non-adjacent-equality-values resists suppression into two genuine branches — a sticky CMP/CMPNE predicated membership test

**The shape:** a guard of the form `field == A || field == B` where
`A` and `B` are NOT adjacent integers (e.g. 4 and 10) feeds a 3-way-
branch shared tail reached from multiple points in the target. The
target uses two genuinely separate `beq`/`bne` branches; every source
phrasing tried instead compiles to a compact, sticky `CMP`/`CMPNE`-
predicated "membership in {A,B}" encoding.

**Adjacency is the apparent trigger.** A sibling function in the same
batch testing ADJACENT values (`field == 3 || field == 4`) matched
100% on the first try via plain natural `||` syntax — no special
handling needed. Only the non-adjacent case is walled.

**Falsifiable claim:** *some source phrasing suppresses the compact
CMP/CMPNE form for non-adjacent values.* **Falsified on 1 member, 4
phrasings (cm-main-tier-sweep-1, 2026-08-08, batch 4):** plain
boolean OR, goto-with-correct-block-order (best result, 23.8%),
`switch`/`case A: case B:`, and a second goto variant all compiled to
either the identical CMPNE-predicated form or a worse fully-predicated
form. Not in the existing catalogue as such — closest is C-67, which
covers if/else-if arms with DIFFERENT bodies (value or call-sequence
dispatch), not a single combined-condition guard sharing ONE body.

**Affected picks:** `func_02070ce0` (23.8% best of 4 attempts) —
main. Contrast: `func_02070c84` (adjacent values 3/4, same batch,
100% first try, no special handling).

**Recipe status: NONE for the non-adjacent case** (the adjacent case
needs no special recipe at all).

**Provenance:** cm-main-tier-sweep-1 (2026-08-08), batch 4.

> **Scope caveat — adjacency alone is not sufficient once the OR sits
> inside a LARGER guard chain (cm-main-tier-sweep-2, 2026-08-08,
> batch 5).** `func_02046b3c`: a 2-value equality-OR on genuinely
> ADJACENT values (`field==5 || field==6`) still resisted every
> suppression attempt (plain `||`, dual-goto, dual-goto with C-72-
> corrected physical block order) when embedded as one guard among 3
> in a larger chain — mwcc collapsed it to `cmp+cmpne+bne` regardless.
> The original adjacent-values-are-fine finding was in what was likely
> an ISOLATED 2-guard context; this suggests the surrounding guard
> chain's complexity, not adjacency alone, may be the real variable.
> Best: 33.3% (26/27 words, off by one throughout). Not yet resolved
> which factor dominates — flag any future adjacent-value-OR park with
> its surrounding guard-chain size so this can be disentangled.

### P-33. Same-register repeated-equality compound-compare-merge — a C-55 boundary case with no working recipe

**The shape:** two (or three) equality tests against the SAME
already-loaded register (e.g. `tag==0`, `tag==2`, both dispatching to
the same target; or a 3-way `a0==2`/`a0==3`/`a0==4` both arms just
returning a constant) get compound-compare-merged by mwcc into a
`cmp;cmpne;beq`-style chain (or, for the 3-way case, a fully-
predicated `cmp;cmpne;cmpne;moveq;movne;bx` with no branches at all).
This is a hard boundary on the otherwise-reliable C-55 goto-to-
distinct-labels fix (see the extension note at the end of C-69):
that fix works cleanly for DIFFERENT-variable guard pairs but not for
repeated-equality tests on one already-loaded register.

**Falsifiable claim:** *some source restructuring defeats the
compound-compare-merge for same-register repeated-equality tests.*
**Falsified on 3 members, across cm-main-tier-sweep-1 and
cm-main-tier-sweep-2 (2026-08-08):**
`func_0204931c` (2-way, `tag==0`/`tag==2`) — `&&`, goto-to-shared-
label, goto-to-distinct-labels, and `switch`-with-fallthrough all
tried; 3 gave byte-identical 37.5% output, one (distinct labels) gave
a slightly different but not-better 38.5%. `func_02052704` (3-way,
`a0==2`/`3`/`4`) — an even more aggressive collapse (no branches
survive in the best attempt at all): `switch` (20.0%, best) → explicit
sequential goto (10.0%, worse) → `volatile` parameter (0.0%, worst —
forces a spurious stack frame). Attempts were NOT monotonic on this
member; further tries actively degraded the match.

**Affected picks:** `func_0204931c` (38.5%), `func_02052704` (20.0%),
`func_0206e33c` (50%) — all main.

**Recipe status: NONE.**

**Provenance:** cm-main-tier-sweep-1 (2026-08-08), batch 1.

> **Confirmed BIDIRECTIONAL (cm-main-tier-sweep-2, 2026-08-08,
> batch 4).** The original write-up only observed mwcc MERGING
> same-register repeated-equality tests when the target keeps them
> separate (source wants branches, mwcc predicates/merges — no fix).
> `func_0206e33c` reproduces the identical resistance in the OPPOSITE
> direction: the target uses REAL BRANCHES for `tag==0`/`tag==4` (both
> tested against one already-loaded signed-byte register), but every
> C form tried (goto-to-distinct-labels, `switch`) gets
> if-converted/predicate-merged by mwcc regardless — the same "nothing
> tried defeats this" character, just mirrored. P-33 blocks conversion
> in BOTH directions on this shape family, not only one. Best: 50%
> (10/20 words).

### P-34. Prologue pad-register-fold resistance — a stack-alignment pad word folds into the `lr` push in the target but never in source-driven recompiles

**The shape:** a function whose body needs a computed stack address
passed to an unconverted callee (the classic "address of the last
named local, rounded up, plus an offset" pattern — effectively a
hand-rolled `va_start`) has its 1-word alignment pad folded directly
into the `lr` push (`push {r3,lr}`, using the otherwise-unused r3 slot
as the pad) in the target. Every C form tried instead produces a
separate `push {lr}` followed by `sub sp,#4` — a 1-word divergence
confined entirely to the PROLOGUE, with the function BODY (address
math, redundant reload, the call itself) matching byte-for-byte on the
first correctly-derived draft.

**Falsifiable claim:** *some source form makes mwcc fold the pad into
the push.* **Falsified on 2 sibling functions (same wrapper family,
same callee), cm-main-tier-sweep-2, 2026-08-08, batch 1.** This
project's headers have no `<stdarg.h>` (confirmed absent from every
vendored header via grep) and mwcc doesn't recognize
`__builtin_va_list`, so 5 structurally distinct forms were tried
instead: ellipsis + manual pointer math (3 variations), and 4
plain-named-int-params with an unused trailing parameter. Every form
that compiled produced the IDENTICAL byte-for-byte prologue
divergence — confirming this is independent of source shape, not a
missing va-args idiom specifically.

**Affected picks:** `func_020a9764`, `func_020a978c` (main, both
parked, bodies match, prologue doesn't).

**Recipe status: NONE.**

**Provenance:** cm-main-tier-sweep-2 (2026-08-08), batch 1.

### P-35. SUBS-flag-fusion resistance — a variable-assigned shift/subtract amount won't fuse its flags into the following branch when the amount is stored to a local first

**The shape:** a hand-written soft-float-adjacent routine (not the
compiler's own runtime helper) computing a shift amount via
subtraction needs the flags from that SAME subtraction to feed a
following conditional branch directly — target emits `mov r2,#K;
subs r2,r2,r1,lsr#23` (SUBS, flags used by the next instruction). Any
C form that assigns the subtraction's result to a named variable
before testing it emits a plain `sub`/`rsb` followed by a SEPARATE
redundant `cmp`, never the flag-fused form.

**Falsifiable claim:** *some source form fuses the flags directly.*
**Falsified across 5 attempts, cm-main-tier-sweep-2, 2026-08-08,
batch 1:** RSB-immediate form, goto-based block reorder, compound
`-=` assignment as its own statement, the same compound assignment
inlined directly into the `if` condition, and fixing only the
overflow-expression in isolation — all hit the identical flag-fusion
gap. Every OTHER aspect of the function (branch polarity, physical
block placement, the overflow path's bit-trick) was independently
confirmed correct before isolating this as the sole remaining
residual.

**Affected picks:** `func_020b3168` (main, parked).

**Recipe status: NONE.**

**Provenance:** cm-main-tier-sweep-2 (2026-08-08), batch 1.

### P-36. Instruction-scheduling order is frequently not source-controllable at all — a family of walls where every diff is a pure reordering of otherwise-correct instructions

> **New this round, but already the single highest-yield wall family
> — explains roughly a third of cm-main-tier-sweep-2's parks across 3
> independent batches with no cross-talk.** Distinct from C-75 (pure
> statement-order sensitivity): C-75 is a LEVER — reordering C
> statements DOES fix the match. This entry is the family of cases
> where that exact technique was tried and FAILED — the scheduling
> comes from somewhere below source-level control entirely. Treat any
> of the sub-shapes below as effectively permanent once 3-4 honest
> statement-order variations are exhausted; don't keep grinding.

**Sub-shapes observed (all "correct instructions, wrong order," no
value/type/control-flow difference):**

1. **Independent pool-load scheduling hoist.** Target orders a
   hardware-register store BEFORE a following pool-constant load;
   source-driven recompiles always hoist the load first regardless of
   statement order, scoped-block placement, or declaration timing.
   4 distinct C shapes, byte-identical wrong output every time.
   (`func_0208bf3c`, cm-main-tier-sweep-2 batch 4, 90% best.)
   **3 further confirmations (cm-main-tier-sweep-3, 2026-08-08,
   batches 1 and 2):** `func_02084dc0` (89.5%, an unrelated
   table-pointer `ldr` hoisted ahead of a data-independent
   `add rN,rN,#imm`), `func_020a3308` (53.9%, three independent
   pool loads always hoisted before any of 4 independent stores
   across 3 declaration-order permutations), `func_0208de94` (59.1%
   — the function's OTHER half, the compute block, matched
   byte-for-byte with no tuning, confirming the wall is confined to
   the scheduler's handling of the two adjacent MMIO reads and
   nothing else in the function).
2. **Pipeline-scheduler register-interleaving.** For two independent
   straight-line sub-computations (e.g. two hardware-register
   bitfield packs), the target INTERLEAVES their instructions
   (A-step1, B-step1, A-step2, B-step2, ...) with a rigid
   accumulator/secondary-register role assignment; source-driven
   recompiles always fully resolve one sub-expression before starting
   the other, swapping which register ends up in which role. 5
   variations on the first instance, reproduced byte-for-byte-
   identical-diff-shape on 2 further twins with a single try each —
   systematic, not per-function noise. (`func_0208df0c`/`df60`/`e1cc`,
   cm-main-tier-sweep-2 batch 4, all 53.9%.)
   **2 further confirmations (cm-main-tier-sweep-3, 2026-08-08,
   batch 1 and batch 4):** `func_0208ddec` (8.3% — two independent
   MMIO reads, DISPCNT and BG3CNT, get their register roles and
   read-order rigidly fixed; 5 statement-order attempts produced only
   two outcomes, neither the target's), `func_0208e220` (53.9% — same
   pattern on a VRAM-address computation from two hardware reads; 3 of
   5 phrasings reproduced the identical wrong 53.9%, the other 2 made
   it worse by triggering unrelated restructuring).
3. **LDM-fusion instruction-selection resistance.** Target reads back
   2 consecutive stack words via a fused `add`+`ldm` pair; every C
   framing (array-index, pointer-variable, struct-copy, struct-typed
   local) instead emits 2 separate `ldr`s. (`func_02098038`,
   cm-main-tier-sweep-2 batch 4, 85%.)
   **Generalizes beyond stack-word LDM specifically (cm-main-tier-
   sweep-3, 2026-08-08, batch 1):** the same fusion-resistance hits
   PAIRED POST-INCREMENT loads/stores generally, not just a fused
   `ldm` read-back. `func_02054db8` (19.1%) and `func_02054ca8`
   (12.5%), both unrolled `for(n=4;...){2x ldrb-post-inc; 2x
   strb-post-inc;}` byte-copy loops: a single `*dst++ = *b++;`
   reliably compiles to true post-increment addressing, but as soon
   as a SECOND such operation appears adjacent in the same loop body
   mwcc falls back to plain offset addressing plus a separate manual
   pointer bump for BOTH accesses — named temps, direct pointer
   chaining, deferred `dst[0]=;dst[1]=;dst+=2;` array style, `for` vs
   `do-while`, mid- vs end-body decrement placement all failed to
   recover the fused form. **Companion diagnostic technique found in
   the same investigation:** when a trailing call passes a stack
   buffer a copy loop just filled, and a SECOND trailing call reuses
   the first call's return value as its own first argument with no
   explicit reload of the original first parameter, that's a strong
   signal the source chains `ret = f(a, buf); g(ret, -1);` rather than
   reusing `a` directly — confirmed on 3 separate functions now,
   always recognizable from the `.s` by an argument register live
   across a `bl` with no reload before the next `bl`.
4. **Argument-evaluation order not source-controllable.** A 5-argument
   call where the 5th argument is passed on the caller's stack: target
   computes an unrelated register-OR chain for args 1-4 BEFORE reading
   the 5th (stack) argument; every C statement ordering (direct,
   split-then-merge, ternary-fused, extra-leading-local) reads the
   stack argument FIRST instead. 4 attempts, byte-identical for the
   first 2 words every time. (`func_0208e5ec`, cm-main-tier-sweep-2
   batch 3, 8.3%.)
5. **Call-adjacent literal-pool/register-move interleaving.** Target
   interleaves an expensive literal-pool load with cheap register
   moves in a specific latency-hiding order around a call
   (`mov ip,#0` first, pool load in the middle, saves last); 2 C
   shapes (direct call, pre-computed named locals in matching textual
   order) produced byte-identical output regardless.
   (`func_020536d0`, cm-main-tier-sweep-2 batch 3, 30.8%.) This is the
   same family P-27 already catalogs for POST-call scheduling — this
   sub-shape is effectively P-27 confirmed again on a pre-call variant.
6. **Condition-code family not source-controllable.** A range/sign
   test (`cmp idx,#0x60`) uses bare PL/MI (raw N-flag test) fully
   predicated into the following ops with zero branches in the target;
   4 distinct C shapes (signed if/else, unsigned if/else,
   pre-subtracted-then-test-sign, ternary/select-based) produced 3
   different WRONG condition-code families (GE/LT, then CS/CC, then a
   worse ternary expansion) — PL/MI was never reached by any source
   form. (`func_020908c0`, cm-main-tier-sweep-2 batch 3, 8.3%.)
7. **(Tentative, single instance) Store+pointer-decrement post-index
   fusion — a possible STR-side sibling of sub-shape 3.**
   `func_02078f08` (cm-main-tier-sweep-3, batch 2, best 38.9%):
   fixing one fold (forcing `q = dst-1` to materialize as a real
   register instead of folding into `[dst,#-1]` addressing, by moving
   `dst -= 2` before its use) immediately triggers a DIFFERENT fold —
   the compiler fuses the adjacent `dst[0]=v; ...; dst-=2;` into one
   `strb r3,[r0],#-2` post-indexed store, which the target avoids
   (uses 2 plain instructions). Either fold individually suppressible
   in 3 tries; never both together. Needs independent confirmation
   before treating as established.
8. **(Tentative, single instance) Adjacent-field read-order plus
   RRWW/RWRW pairing trade-off.** `func_0209a1b8` (cm-main-tier-
   sweep-3, batch 3, best 72.7%): copies 4 adjacent `u16` struct
   fields to a destination in pairs; the target reads each pair in
   ASCENDING offset order and keeps an RRWW (read-both-then-write-
   both) pairing shape. Every combination tried (default/reversed
   declaration order, no named temporaries, reused temporaries, a
   real struct in place of raw offset casts) got EITHER the read
   order OR the RRWW pairing right, never both at once — the two
   properties seemed to trade off against each other under every
   source shape tried. Needs independent confirmation before treating
   as established.

**Recipe status: NONE for sub-shapes 1-6.** If C-75-style statement
reordering doesn't move a residual within 3-4 honest tries and the
diff looks like a pure reordering/selection choice with correct
values throughout, recognize this family and park — further
restructuring attempts have not moved any member of sub-shapes 1-6
once identified. Sub-shapes 7-8 are single-instance and tentative;
treat as candidates to watch for, not yet as confirmed permanent.

**Affected picks (17):** `func_0208bf3c`, `func_0208df0c`,
`func_0208df60`, `func_0208e1cc`, `func_02098038`, `func_0208e5ec`,
`func_020536d0`, `func_020908c0`, `func_02084dc0`, `func_020a3308`,
`func_0208de94`, `func_0208ddec`, `func_0208e220`, `func_02054db8`,
`func_02054ca8`, `func_02078f08`, `func_0209a1b8` — all main.

**Provenance:** cm-main-tier-sweep-2 (2026-08-08), batches 3, 4;
cm-main-tier-sweep-3 (2026-08-08), batches 1, 2, 3, 4.

### P-37. Register reuse via free-`lr`-after-`pop{pc}` — a hand-optimized-looking allocation trick a C compiler won't reproduce from ordinary source (tentative, single instance)

**The shape:** a function whose epilogue pops directly into `pc`
(`pop {..., pc}`, not the 2-step `pop {..., lr}; bx lr` form) frees
`lr` for use as ordinary scratch mid-body, since it's never needed for
a return branch. The target exploits this: it needs only 1 extra
callee-saved register (`push {r4,lr}`) because it reuses `ip` and `lr`
themselves as scratch space that an ordinary register allocator
wouldn't consider available until the function's actual exit. Every C
form tried allocates registers as if `lr`/`ip` were unavailable until
the epilogue, needing 2 extra callee-saved registers
(`push {r3,lr}` instead of `push {r4,lr}`) — a different push mask
and a different word count (15 vs target's 13) throughout.

**Falsifiable claim:** *some source restructuring reproduces the
reduced push-register footprint.* **Falsified across 4 shapes,
cm-main-tier-sweep-2, 2026-08-08, batch 3:** nested expression,
sequential accumulation, single fused statement, pre-computed row
pointer — none influenced the register count.

**Affected picks:** `func_0208226c` (main, parked, 0%).

**Recipe status: NONE.**

**Provenance:** cm-main-tier-sweep-2 (2026-08-08), batch 3.

> **Possible scope broadening beyond fused-`pop{pc}` epilogues
> (cm-main-tier-sweep-3, 2026-08-08, batch 2, single additional
> instance — not yet confirmed).** `func_020a67cc` (a CRC-table
> builder, parked) shows the same free-register-reuse trick — mwcc
> reuses the freed callee-saved `lr` as a general scratch register for
> the outer loop counter, the reverse of a straightforward
> allocation — but on a **separate-`bx lr` Style A epilogue**
> (`.legacy.c` tier, `pop {regs,lr}` then a standalone `bx lr`), not
> the fused `pop{...,pc}` form this entry is currently framed around.
> 3 source shapes (nested scope, flat scope, for-vs-while) produced
> byte-identical output every time, meaning the choice is fully
> source-insensitive here too. If a second independent instance
> confirms this, P-37's documented trigger condition should broaden
> from "fused-pop-pc epilogues only" to "any epilogue that frees a
> register before the function's true last use of it."

### P-40. Immediate/constant materialization strategy resists source-level control — mwcc's own optimizer prefers folding a small-enough constant into an ADD's immediate field, but the original binary sometimes doesn't

**The shape:** distinct from P-36 (which is about the ORDER of
otherwise-correct, already-selected instructions) — this is about
INSTRUCTION SELECTION itself. The target materializes a constant into
a scratch register with a separate `mov`/`mvn`, then does a
register-register `ADD` in a following instruction — a strictly
LONGER encoding than the single-instruction immediate-fold `ADD`
mwcc's optimizer produces from every C phrasing tried. 3 independent
instances, no cross-talk:

- `func_0208bed8` (cm-main-tier-sweep-3, batch 3): a `+0x80000`
  rounding bias. 5 phrasings tried (raw literal used once/twice,
  `#define`, plain `int` local, `const`-flavored local, pointer-typed
  local, computed inside vs. outside a branch, computed separately
  inside each of two mutually-exclusive branches) — all fold.
- `func_0208fd90` (cm-main-tier-sweep-3, batch 3): a `+0x6400000`
  base address, same set of phrasings tried, same result.
- `func_020a3ed8` (cm-main-tier-sweep-3, batch 5): a mid-size constant
  (`0x14a`) built via a literal-pool `LDR` combined with an
  inline-shifted `ADD` in the target, but always splits into two
  chained immediate `ADD`s with a separate `LSL` in every recompile —
  byte-identical across 3 structurally different source forms (split
  locals, reordered operands, single combined expression).

**Recipe status: NONE.** ~9 combined attempts across the 3 instances,
zero movement. Closest in spirit to P-36's pool-load scheduling hoist
sub-shape, but for a plain immediate rather than a pool load, and
about WHETHER to fold rather than WHEN — kept as its own entry rather
than folded into P-36.

**Affected picks (3):** `func_0208bed8`, `func_0208fd90`,
`func_020a3ed8` — all main.

**Provenance:** cm-main-tier-sweep-3 (2026-08-08), batches 3, 5.

### P-41. mwcc 2.0 silently truncates a folded constant offset that exceeds the 12-bit STR immediate range instead of splitting it into a register ADD plus an in-range offset — a genuine compiler correctness defect, not a source-shape wall

> **Different in kind from every other entry in this catalogue.**
> Every other P-wall is "no C source shape reproduces the target's
> instruction choice." This one is the reverse: mwcc's own constant
> folding produces a WRONG effective address that the original avoids
> by deliberately splitting its arithmetic. There is no C phrasing
> that should reproduce the buggy folded form — the target's actual
> source almost certainly looks exactly like the natural C, and mwcc's
> optimizer is what's misbehaving on the recompile.

**The bug.** `(base+0x3000)+0xf7c` constant-folds to a single
`+0x3f7c` offset, which exceeds the 12-bit `STR` immediate range
(max `0xFFF`). Instead of emitting a compensating register `ADD`,
mwcc silently truncates to the low 12 bits, producing
`str [base,#0xf7c]` — writing to the WRONG effective address. The
target correctly splits the same arithmetic into a separate `ADD`
(register) followed by an in-range `STR` offset.

**Falsifiable claim:** *some source phrasing avoids the fold.*
**Falsified across 3 shapes (cm-main-tier-sweep-3, 2026-08-08, batch
5):** an intermediate pointer local (plain — folds anyway; `volatile`
— forces a full stack spill instead, worse), and a separately-named
`int delta` for the register-held second offset (also folded away).

**Affected picks:** `func_02090574` (main, parked, 0% — the fold
produces genuinely wrong output, not just a stylistic mismatch).

**Recipe status: NONE found, though by nature of the bug a working
recipe (if one exists) would look like deliberately preventing
constant-folding across the two offset components, not adding any
new computation.**

**Provenance:** cm-main-tier-sweep-3 (2026-08-08), batch 5.

### P-42. A `void` function whose body is a single backward-branching loop with only internal `return;` exits still gets one extra unreachable trailing `bx lr` appended (tentative, single instance)

**The shape:** every source form tried (`while(1)`, `for(;;)`,
`do-while(1)`, goto-loop, goto-to-shared-return-label) produces a
byte-identical extra padding instruction after the loop that the
target doesn't have. Declaring the function non-`void` removes the
pad but breaks the predicated body instead (26.1%). Routing to
`.legacy.c` tier compiles but reintroduces a register mismatch on top
of the same pad (55.0%).

**Affected picks:** `func_020b03fc` (main, parked, 95.0% — a single
word off).

**Recipe status: NONE.** Needs independent confirmation before
treating as established; flagged rather than force-mapped onto an
existing entry.

**Provenance:** cm-main-tier-sweep-3 (2026-08-08), batch 5.

### P-43. mwcc downgrades a dead-result XOR to a flags-only TEQ — an EOR/TEQ cousin of P-35's SUBS-flag-fusion (tentative, single instance)

**The shape:** when an XOR's result register is provably dead (only
the flags feed a following branch), mwcc proves the write dead and
downgrades `eors` to `teq` — the target keeps the real `eors`
(result-register write live). Tried and inert: naming the XOR into a
local (plain — no change; `volatile` — forces a full stack spill
instead, 0%), `!=` instead of `^`, swapped operand order, explicit
`!= 0`.

**Affected picks:** `func_0207e840` (main, parked, 95.8% — a single
word off; two real C-73 fixes already closed the rest of the gap).

**Recipe status: NONE.** Needs independent confirmation before
treating as established.

**Provenance:** cm-main-tier-sweep-3 (2026-08-08), batch 5.

### P-44. Sibling-constant arithmetic reuse between two different sequentially-assigned local variables (tentative, single instance)

**The shape:** two sequentially assigned local constants in the same
case body, differing by a small integer (`msg=9; arg=-1;` — diff=10),
compile via `sub r2,<msg's register>,#10` instead of an independent
`mvn` immediate for the second — regardless of literal syntax
(`-10` vs `~9`, identical output), declaration order (swapping which
is assigned first just moves the trick to the OTHER variable, never
removes it), or `volatile` on the first variable (made it drastically
worse — forced a stack spill that broke the whole function shape, 0%
and +8 words). Distinct from P-33 (repeated-comparison merge on ONE
register) — this is arithmetic reuse between TWO DIFFERENT variables.

**Affected picks:** `func_02048880` (main, parked, 86.2% — all 4
remaining diffs isolated to this one issue).

**Recipe status: NONE across 5 variations.** Needs independent
confirmation before treating as established.

**Provenance:** cm-main-tier-sweep-3 (2026-08-08), batch 2.

### P-45. A mask-AND needed for two different downstream uses collapses to a shift-pair, resisting every caching hint (tentative, single instance)

**The shape:** `sum & 0xffff` (needed both for a fold step and, via
the same constant, a later `XOR`) compiles to `lsl #16; lsr #16`
instead of a pool-loaded `AND`, even when the mask is a named
variable, hoisted to function-top, or the truncation is written via
`(unsigned short)` cast instead of `&`. The target visibly loads
`0xffff` from the pool ONCE and reuses that register for both the AND
and the XOR (since XOR can't shift-pair-reduce, forcing a pool load
anyway, which then makes reusing it for the AND strictly cheaper) —
mwcc never made that connection compiling any recompile attempted,
regardless of the hint given.

**Affected picks:** `func_020a2c74` (main, parked, 47.4% — though the
loop body, the harder 8-word half, matched 100%).

**Recipe status: NONE across 5 attempts.** Needs independent
confirmation before treating as established.

**Provenance:** cm-main-tier-sweep-3 (2026-08-08), batch 2.

### C-83. Cross-call pointer-CSE defeat via integer round-trip — the mirror image of C-73

**The trap.** mwcc sometimes promotes a repeated `base + offset`
pointer computation into a callee-saved register so it survives an
intervening call, even when the target recomputes the same address
fresh at BOTH occurrences (no persistent register). C-73 already
covers forcing a fresh MEMORY reload via `volatile`; this is the
companion case for forcing a fresh REGISTER computation with no load
involved at all.

**The fix.** Write the second (or later) occurrence of the identical
pointer expression through an integer round-trip —
`(void *)((unsigned int)base + offset)` — instead of the plain
`(char *)base + offset` form used at the first occurrence, even
though both are semantically identical C. The type-based detour
defeats mwcc's CSE and forces a fresh `add` at that site.

**Affected picks:** `func_02041f04` (main, 204B, shipped 100%).

**Provenance:** cm-main-tier-sweep-4 (2026-08-09), batch 1.

### C-84. A named stack buffer's declared size must exclude mwcc's own outgoing-vararg argument-build area

**The trap.** For a variadic call (e.g. `OS_SNPrintf`) whose
stack-passed arguments are values already sitting in a locally
declared buffer, if that buffer's declared size covers the same
stack region mwcc wants to use as its OWN outgoing-argument build
area, the compiler reserves BOTH separately — the buffer keeps its
full declared size, plus an additional word-aligned args area is
added on top. This inflates the whole frame and shifts every
buffer-relative offset used downstream.

**The fix.** Size the named buffer to exclude the vararg-argument
bytes specifically (here: `char buf[0x40]` → `char buf[0x2c]`, with
downstream sub-pointers recomputed at the new, smaller offsets), and
pass the shift/format expressions as call arguments DIRECTLY rather
than pre-storing them into the buffer first. This is a distinct
mechanism from C-74 (which is about sizing an address-taken local to
the CALLEE's full reserved span) — here the local buffer competes
with the CALLER's own vararg spill area, not a callee's frame.

**Effect:** `func_0205337c` went from 30.2% to 100% in one step once
the buffer was resized and the pre-store removed.

**Affected picks:** `func_0205337c` (main, 144B, shipped 100%).

**Provenance:** cm-main-tier-sweep-4 (2026-08-09), batch 4.

### C-85. Taking the address of a function's own 2nd/3rd parameter for a specific two-out-param helper call forces a full 4-register incoming-argument spill block

**Not newly discovered — surfacing existing project knowledge into
this catalog for the first time.** A background research pass
during this round found the mechanism is already described in
`docs/research/rnd-swarm-2026-07-24-r11-postwall.md` and already
shipped once, uncredited, in `src/main/func_020622c8.legacy.c` — but
had never been added to this catalog under its own entry.

**The shape.** When a function calls a specific helper in the shape
`helper(&paramB, &paramC)` — passing the addresses of its OWN 2nd
and 3rd incoming `int` parameters as two output-parameter pointers —
mwcc emits `stmdb sp!, {r0,r1,r2,r3}` (spilling ALL FOUR incoming
argument registers to their stack homes) as the very FIRST
instruction, BEFORE the normal `{r4,r5,lr}` callee-saved push. This
can look identical to a genuine variadic-forwarding wrapper's
all-4-regs-spill shape (already flagged as a false-friend pattern
elsewhere in this catalog) — the disambiguator is what happens
NEXT: a true variadic wrapper forwards the spilled block wholesale;
this shape instead reuses two of the SAME spilled slots as
`helper`'s own out-parameters, verifiable by computing the exact
stack offsets (with `sub sp,#N` locals below `{r4,r5,lr}` below the
`{r0-r3}` spill block, the out-param offsets land INSIDE the r1/r2
homes).

**The fix.** Recognize the shape from the stack math, not just the
spill instruction; write the call as `helper(&paramB, &paramC)`
directly rather than inventing fresh local variables to receive the
output.

**Affected picks:** `func_0206238c` (main, 172B, shipped 100%);
`func_020622c8` (main, previously shipped under the same pattern,
uncredited).

**Provenance:** cm-main-tier-sweep-4 (2026-08-09), batch 2.

### C-86. A hand-written zero-trip guard placed immediately before a `for` loop over the same bound duplicates the loop's own auto-generated check

**The trap.** Writing `if (bound <= 0) return; for (i = 0; i <
bound; i++) { ... }` — an explicit leading guard PLUS the for-loop's
own implicit zero-trip test over the identical bound — causes mwcc
to emit the SAME predicated zero-trip-count check TWICE (once for
each redundant test) rather than recognizing the redundancy and
collapsing them, costing extra words and shifting all downstream
register allocation.

**The fix.** Remove the explicit guard and trust the for-loop's own
synthesized zero-trip check — never add a hand-written guard in
front of a for-loop that already implies the identical test.

**Affected picks:** `func_02079a08` (main, 188B, shipped 100%).

**Provenance:** cm-main-tier-sweep-4 (2026-08-09), batch 1.

### C-87. Dense fall-through case labels can force `switch` lowering into a real jump table instead of a compare-chain

**The trap.** A sparse `switch` (few, non-adjacent case values) can
compile to a linear compare-chain instead of the target's jump
table, even when the target clearly uses `addls pc, pc, rN, lsl #2`
dispatch.

**The fix.** Add redundant fall-through case labels for values the
target's own table ALSO routes to `default` (`case 2: case 3: case
4: default: ...`), densifying the visible case-value range enough
that mwcc's own heuristic switches from compare-chain to table
lowering — even though the added cases are logically redundant with
`default` and change nothing about program behavior.

**Effect:** `func_0207a7d4` went from 8.1% to 100%.

**Affected picks:** `func_0207a7d4` (main, 148B, shipped 100%).

**Provenance:** cm-main-tier-sweep-4 (2026-08-09), batch 3.

### C-88. A loop with multiple break-conditions needs ONE combined `while` condition, not separate `for(;;)`-with-internal-breaks, to get mwcc's jump-to-test-first rotation

**The trap.** `for (;;) { if (c1) break; if (c2) break; ...; body();
}` — testing each break condition as its own separate `if`-break
inside an infinite loop — does NOT get mwcc's usual "rotate the loop
so the test comes first, jump into the middle for the first
iteration" transform, even when the target clearly has that shape.

**The fix.** Combine every break-condition into ONE compound `while`
condition instead — `while (!c1 && !c2 && ...) { body(); }` — and
ONLY that form reliably gets the rotation.

**Affected picks:** `func_02070bac` (main, 148B, shipped 100%).

**Provenance:** cm-main-tier-sweep-4 (2026-08-09), batch 2.

> **C-65 extension, positive (cm-main-tier-sweep-4, 2026-08-09, batch
> 3).** `func_02044384`: an array-indexed struct-field WRITE
> (`blocks[i].v = val`, with the struct sized to match the real
> stride) avoided strength-reduction on the store side, matching
> declaration-order dependence rather than resisting all source
> forms — contrast with the negative sub-case immediately below,
> confirming the store-side behavior is shape-dependent, not
> uniformly resistant as C-65's original text implies.

> **C-65 extension, negative — new sub-shape (cm-main-tier-sweep-4,
> 2026-08-09, batch 3).** `func_02077ecc`: a CALL-ARGUMENT pointer
> (`base + accumulator`, passed directly as an argument, not used as
> a memory-store address) strength-reduces into a persistent register
> regardless of while/for/array-index phrasing — 3 forms tried,
> byte-identical wrong output every time. Extends C-65's documented
> scope from memory addressing specifically to argument-pointer
> computation generally.

> **C-73 extension (cm-main-tier-sweep-4, 2026-08-09, batch 3).** A
> global counter's own increment must re-read the global fresh even
> when a local variable already holds an equal cached copy from
> moments earlier — write `g = g + 1;`, not `g = cached + 1;`, even
> though `cached == g` is guaranteed at that point.
> (`func_02073040`.) A second instance shows the freshness
> requirement can be PER-ARGUMENT-POSITION within one call's argument
> list: one position re-reads a global fresh while sibling positions
> in the SAME call reuse an already-cached copy of the same value
> (`func_020468ec`).

> **C-56 caveat (cm-main-tier-sweep-4, 2026-08-09, batch 1).**
> Declaration-order reordering reliably resolves small (2-3-variable)
> register rotations but is not a dependable tool once more variables
> compete for the same register-file region: a 5-variable rotation
> (`func_02077db0`) resisted 4 different declaration-order
> permutations, none of them an improvement over the default order.

### P-46. Repeated pure-address computation gets cached into an extra callee-saved register, where the target recomputes it fresh at every use — no load involved

**The shape.** A repeated address expression (a local stack buffer's
address, or `pointer + constant`) referenced across 3-4 call sites
gets promoted by mwcc into a dedicated extra callee-saved register
(forcing e.g. `r8` where the target only needs `r4-r7`), while the
target recomputes the same cheap `add rN, base, #imm` fresh at every
call site with zero persistent register. Distinct from P-30
(register-CHOICE only, value already computed once) and C-73 (a
MEMORY read, not a pure address computation) — this is specifically
about caching an ADDRESS with no load anywhere in the picture.

**Falsifiable claim:** *some source restructuring forces a fresh
recomputation at each site instead of caching.* **Falsified across 2
independent instances, 5 combined attempts:** separate named
variables per site, a single consolidated/reused variable,
block-scoping the expression narrowly, pulling nested calls out of
argument lists — all byte-identical wrong output (extra register
cached) regardless.

**Affected picks:** `func_02041ca8` (main, 256B, parked, 0.0%),
`func_0204f820` (main, 208B, parked, 21.8%).

**Recipe status: NONE.**

**Provenance:** cm-main-tier-sweep-4 (2026-08-09), batch 5.

### P-47. `ip`/`lr` used as extra scratch registers beyond r0-r3 during a no-call computation window (tentative, single instance)

**The shape.** A 4-field byte-swap-and-repack sequence with no calls
anywhere in its body: the target uses `ip` and `lr` as ADDITIONAL
scratch registers beyond the normal r0-r3 argument/scratch set,
keeping only one value live in a genuine callee-saved register.
Every source restructuring tried still needed a 5th callee-saved
register instead of reaching for the free `ip`/`lr` scratch space
the target exploits.

**Affected picks:** `func_020726e0` (main, 252B, parked, 0.0%).

**Recipe status: NONE.** Needs independent confirmation before
treating as established.

**Provenance:** cm-main-tier-sweep-4 (2026-08-09), batch 5.

> **A captured-and-tested return value's canonicalization
> between `cmp`-then-test and a direct `movs`-with-flags form can
> resist source rephrasing (`func_020770bc`, cm-main-tier-sweep-4
> batch 3, 98.4%, 3 tries). No matching named sub-shape; flagged as a
> candidate for future confirmation.

> **Loop-rotation and store-scheduling notes (cm-main-tier-sweep-4,
> 2026-08-09, batch 2).** Two independent pool-constant loads inside
> one function got freely reordered by mwcc's scheduler, but the
> STORES built from them stayed pinned to source statement order —
> reordering only the store statements (not fighting the load
> scheduling directly) fixed the diff (`func_02045828`). This is a
> useful general tactic for P-36-shaped residuals: if a load's
> scheduling looks immovable, check whether the DOWNSTREAM store can
> still be reordered independently before parking.

### P-50. Composed-TU declaration order collapses to ascending byte size whenever two top-level data globals differ in size — a data-layout wall, not a codegen one (permanent, evidence chain below)

> **Different domain from every other entry in this document.** P-1
> through P-47 and C-1 through C-88 are all about FUNCTION codegen —
> register allocation, instruction scheduling, branch/predicate form.
> This entry is about **top-level DATA OBJECT ordering** inside one
> translation unit — the mechanism the `cm-restock-carve` series (data
> section carving via TU composition, see
> [`alignment-wall-tu-composition-recipe.md`](alignment-wall-tu-composition-recipe.md))
> depends on. Filed here anyway, under the shared `P-NN` number space,
> because that's where this project's wall registry lives and where a
> future wave will grep for it — not because it shares C-1..C-88's
> mechanism.

**The shape.** Two `const` (or non-`const`) top-level global
declarations in one `.c` file, composed into a single `ALIGNALL(2)`-
avoiding TU (per the proven recipe: separate named globals, in address
order, combined span 4-aligned at both ends). When the two globals
have the SAME byte size, mwcc preserves source declaration order
(confirmed extensively across `cm-restock-carve-3`/`4`/`5`, dozens of
instances). When the two globals have DIFFERING byte size, mwcc places
the SMALLER one first in the compiled `.o`'s section — regardless of
which order the `.c` source declares them in. If the real address-
ascending pair does not also have ascending size (i.e. the
lower-address symbol is the LARGER one), the compiled layout is
backward: correct total section size, wrong per-symbol content, a
SILENT SHA1 mismatch at gate time rather than a compile error.

**How it presents in the diff.** Nothing at compile time — the `.o`
compiles cleanly either way. Only a direct ELF section/symbol-offset
inspection of the standalone-compiled `.o` (`readelf`-style: section
size, then each symbol's in-section `st_value`) shows the wrong
ordering. A full link + `ninja sha1` would also catch it (wrong bytes
propagate into the final ROM), but *only* if the composed TU actually
gets linked into the build — inspecting the `.o` before linking is
strictly faster and pinpoints the cause directly, per this project's
standing "verify the built layout directly" rule.

**Falsifiable claim tested:** *some source-level construct (declaration
order, type wrapping, field packing) controls which of two
differently-sized top-level globals lands first.* **Falsified on 6
independent isolated scratch compiles** (`cm-restock-carve-5`/`6`,
2026-08-09): struct-then-scalar, scalar-then-struct (same pair, both
orders — output identical regardless), two-differently-sized-structs,
two-scalars-ascending, two-scalars-descending. Declaration order never
changed the outcome; only relative size did.

**Falsified again on 2 real in-project candidates**
(`cm-restock-carve-5`): `data_ov011_021d3034`(43B)+
`data_ov011_021d305f`(1B) and `data_ov011_021d323c`(126B)+
`data_ov011_021d32ba`(30B) — both address-ascending/size-descending
pairs, both compiled with the smaller symbol first, both confirmed via
direct `.o` inspection with the REAL byte content (not synthetic
test data).

**The one plausible alternative fix, tested and falsified with a hard
error, not just a soft one** (`cm-restock-carve-6`): merge the pair
into ONE top-level symbol (name the combined struct after the
lower-address member; the higher-address member's bytes become an
unlabeled trailing field, no separate global declared for it at all).
Since there's only one top-level declaration, mwcc has nothing left to
reorder — the byte layout comes out correct. **But this does not
survive linking**: `data_ov011_021d305f` (the member that would lose
its own symbol) is referenced BY NAME from `func_ov011_021caafc.c`
(`extern char data_ov011_021d305f[];`, already shipped and matched) —
removing its symbol produces a hard `mwldarm` link failure
(`Undefined : "data_ov011_021d305f", Referenced from
"func_ov011_021caafc"`), not a soft `dsd check symbols` warning. This
is not a coincidence specific to one candidate: the same absorption
that makes a symbol a genuine composable-recipe target (a real,
independently-referenced placeholder, per the recipe's own "not an
artificial pairing" requirement) is exactly what makes it unmergeable
— any real census candidate reached by this pattern is, by
construction, referenced by name from somewhere else in the tree.

**Why PERMANENT, not merely unbeaten** (the brief-640 standard: 0 of 5
sampled prior wall citations matched their entry's own criteria — this
entry names its criteria explicitly so a future wave can check them
directly, not just cite the label):

1. The trigger is precisely mechanical and reproducible: two top-level
   globals, differing size, address order disagreeing with size
   order. Six isolated scratch tests spanning four independent shape
   axes (scalar-vs-struct, struct-vs-struct, scalar-vs-scalar
   ascending, scalar-vs-scalar descending) all reproduce it with zero
   exceptions.
2. Two real in-project candidates, evidenced independently to this
   project's full byte-extraction/consumer standard, reproduce it a
   third and fourth time with real (not synthetic) content.
3. The one genuine alternative mechanism (eliminate the ordering
   question by eliminating one of the two symbols) was tested twice,
   not assumed — once at the C-source level (fails at `mwldarm` link
   with an undefined-symbol error, see below) and once at the
   config level (fails even earlier, at `dsd delink`, see Leg 3
   below) — for structural reasons that generalize to any candidate
   this recipe would ever target, not just the one tested.
4. No declaration-order, type-wrapping, or field-packing variant
   affected the outcome in any of the 6 scratch tests — the sort key is
   size, full stop, and nothing at the C source level reaches it.
5. **The mechanism is compiler-tier-invariant, not a default-SP
   quirk.** `cm-restock-carve-7` (2026-08-14) ran the
   two-differently-sized-globals scratch test through all three mwcc
   tiers reachable in this tree — default `2.0/sp1p5`, `.legacy.c`
   (`1.2/sp2p3`), and `.legacy_sp3.c` (`1.2/sp3`) — using the same
   43-byte-array + 1-byte-scalar shape as the real
   `data_ov011_021d3034`/`_305f` candidate, in both declaration orders
   (big-then-small, small-then-big). All three tiers, both orders: the
   compiled `.o` places the 1-byte symbol's `.data` section first
   (lower section index, lower file offset) and the 43-byte symbol's
   section second — every time, byte-identical outcome across all 6
   compiles. This closes the N-variant × SP sweep this document's `P`
   bar requires (briefs 084/088/099) — see the confirmation note below.

**Recipe status: NONE at any of the three compiler tiers reachable in
this tree** (`2.0/sp1p5` default, `1.2/sp2p3` `.legacy.c`, `1.2/sp3`
`.legacy_sp3.c` — confirmed identical by direct scratch compile,
`cm-restock-carve-7`). Composing two differently-sized top-level
globals is only safe when the real address-ascending sequence of
member *sizes* is already non-decreasing (a property of the census
data, not something source form or compiler tier can change). When it
isn't, the pair is blocked from this TU-composition recipe.

> ✅ **CONFIRMED — the evidence boundary flagged at merge review
> (2026-08-10) is now closed (`cm-restock-carve-7`, 2026-08-14).** Both
> items the brain's OBSERVED-NOT-CONFIRMED note asked for were run:
>
> **The N-variant × SP sweep.** Six isolated scratch compiles (the
> same 43B/1B shape as the real candidate, both declaration orders,
> ×3 compiler tiers) all reproduce the identical ascending-by-size
> section ordering — see item 5 above for the raw section/symbol-table
> readout. Neither `.legacy.c` nor `.legacy_sp3.c` preserves
> declaration order; both sort exactly like the default tier. This is
> the SP-sweep bar this document has required for a `P` verdict since
> `P-10`'s demotion to `C-29` — now satisfied with a clean negative
> across all three tiers, not just the default one.
>
> **Leg 3's two untested one-compile repairs — the "rewrite the
> consumer to `merged_symbol + 43`" repair was run directly** (the
> assembly-alias repair was not, see below): `func_ov011_021caafc.c`
> was rewritten to reference `data_ov011_021d3034 + 43` instead of
> `data_ov011_021d305f`, and `data_ov011_021d305f` was removed from
> `config/eur/arm9/overlays/ov011/symbols.txt` (simulating the merge).
> Result: **`dsd delink` fails immediately**, before `dsd check
> symbols` or `mwldarm` even run — `[ERROR] No symbol found for
> relocation from 0x021cabb4 in overlay 11 to 0x021d305f in overlay
> 11`. This is a *stronger* failure than the original mwldarm leg: it
> is independent of how `func_ov011_021caafc` references the address,
> because `dsd delink` validates every relocation site in the
> **original ROM's own disassembly** against `symbols.txt` — the
> original binary's own literal pool at `0x021cabb4` still targets
> `0x021d305f` regardless of what the C-source consumer says. Removing
> the symbol breaks delink unconditionally for any TU whose original
> code has a relocation to that address, which is precisely the
> "referenced from elsewhere" property that makes a symbol a real
> composable-recipe target in the first place (the recipe's own
> "not an artificial pairing" requirement, restated in delink terms).
> This confirms Leg 3 is structural, not an artifact of one consumer's
> phrasing — the assembly-alias repair (re-providing the absorbed name
> at that address via a hand-written `.s` label) was not tried and
> remains a theoretical escape, but it does not change the
> `dsd check symbols`/link-time picture this entry is about: any
> C-source-level merge is closed off. Change reverted after
> confirming the error (`git checkout --` on both files); tree is
> clean.
>
> **Verdict: `P` earns its classification. No caveat remains open at
> the default SP or either legacy tier.**

**Census impact: 4 of the 35** misaligned-struct-arc candidates are
declined citing this wall. Two are the `n=2` differing-size pairs it was
characterised on — `data_ov011_021d3034` (43 B) and
`data_ov011_021d32ba` (30 B) — and two more were declined by
`cm-restock-carve-6` itself on the same mechanism: the
`data_ov011_021d3583`/`_358b` pair ("exactly the P-50 ascending-size
sort") and the `data_ov011_021d32d8`/`_32d9`/`_334a` cell ("the
identical P-50 mechanism"). The trigger is therefore **n ≥ 2 with a
non-monotonic address-ascending size sequence**, not "two top-level
globals" — corrected at merge review, because the original entry said
2 while this same wave applied it to 4.

Separately, the `data_ov006_021ce38a` `kv_t` family (declined in
`cm-restock-carve-4`) is blocked by the RELATED but DISTINCT n>2
declaration-reordering wall — same "mwcc doesn't preserve top-level
declaration order" family, different specific trigger (symbol count
there, symbol size here); see
`alignment-wall-tu-composition-recipe.md`'s standing rule, which covers
both.

**Affected picks (4):** `data_ov011_021d3034` (43 B), `_021d32ba`
(30 B), the `_021d3583`/`_358b` pair, and the
`_021d32d8`/`_32d9`/`_334a` cell — all `ov011`.

**Provenance:** `cm-restock-carve-5` (2026-08-09, discovery, PR #1487),
`cm-restock-carve-6` (2026-08-09, formal characterization + the
merge-to-one-symbol falsification), `cm-restock-carve-7` (2026-08-14,
closes the evidence boundary: 3-tier SP sweep + the Leg 3 one-compile
repair test).
9. **Boolean materialized via `moveq`/`movne` resists instruction-
   order rephrasing — now confirmed, 2 independent instances.**
   `func_020488f4` (cm-main-tier-sweep-4, batch 3, 96.2%, 5 tries) and
   `func_02062cfc` (cm-main-tier-sweep-5, batch 5, 91.4%, 5 tries)
   both show the same shape: a boolean result built from a
   conditional-move pair, where the target's exact instruction order
   (which arm of the pair comes first) resisted every source
   rephrasing tried across both instances.
10. **Literal register-set store-order resists scheduling.**
    A run of `mov Rx,#literal` instructions feeding a byte-buffer
    init gets freely reordered by the scheduler independent of source
    statement order — only the register SET was ever correct, never
    the emission order. (`func_02069454`, cm-main-tier-sweep-5 batch
    1, 5 variations tried.)
11. **Load-pair scheduling for an unaligned struct-like copy resists
    pairing hints.** A 4-byte copy (`dst[0..3]=src[1..4]`) wants a
    load-load-store-store pairing using 2 scratch registers in the
    target; every source reshaping (named pointer, explicit temp
    pairs) instead produced a simple load-store-load-store chain
    using only 1 register. (`func_0206a724`, cm-main-tier-sweep-5
    batch 1.)
12. **Loop-invariant constant stays resident in a dedicated register
    across iterations and calls — 2 independent instances.**
    `func_02097a4c` (cm-main-tier-sweep-5, batch 1: two boolean
    constants 0/1 stay in dedicated callee-saved registers across all
    loop iterations and intervening calls; no literal/ternary/named-
    constant phrasing reproduced the extra register footprint, target
    pushes 6 regs vs. best attempt's 4) and `func_02095418`
    (cm-main-tier-sweep-5, batch 4: a small integer constant reused as
    a call argument across loop iterations gets pre-loaded into a
    dedicated register in the target; mwcc consistently re-
    materializes the immediate at each use site instead, insensitive
    to declaration placement or `for`-vs-`do-while` shape, 3 attempts
    byte-identical). Distinct from sub-shape 1 (pool-LOAD hoisting) —
    this is a plain immediate constant staying resident, not a pool
    reference.

### C-89. Guard-clause polarity inversion can be the difference between predication and a real branch

**The shape.** When a target predicates the LARGER of two mutually-
exclusive return blocks and leaves the SMALLER as an unconditional
fallthrough, a naive 1:1 transcription (writing whichever block
"looks like" the predicated arm as the explicit guard) produces a
real branch where the target has none.

**The fix.** Write the SMALLER block as the explicit
`if (fail) { ...; return; }` guard and let the LARGER block fall
through unconditionally — regardless of which block felt more
"guard-like" on a first read of the disassembly.

**Affected picks:** `func_0205b9ac` (main, 176B, shipped 100%, 4 tries).

**Provenance:** cm-main-tier-sweep-5 (2026-08-09), batch 3.

### C-90. A zero-initialized array's ELEMENT TYPE controls stmia-pair lowering vs. a byte-store loop

**The trap.** `unsigned char buf[N] = {0};` compiles to a byte-store
loop; `unsigned int buf[N/4] = {0};` (same underlying bytes, wider
element type) compiles to unrolled `stmia` word-pair stores. Which
one the target actually needs isn't obvious from the buffer's
semantic size alone.

**The fix.** Match the element type to whichever lowering the target
disassembly shows (word-pair `stmia` bursts vs. a byte-at-a-time
loop) rather than defaulting to whatever type "reads more naturally"
for the buffer's contents.

**Affected picks:** `func_02065ee0` (main, 152B, shipped 100%, 2 tries).

**Provenance:** cm-main-tier-sweep-5 (2026-08-09), batch 3.

### C-91. An extern global passed by address needs array-decay typing, not a pointer-variable declaration

**The trap.** `extern void *sym;` declares a variable that itself
HOLDS a pointer value — using it as an argument loads that stored
pointer. For a global whose address is what's actually wanted (the
symbol IS the buffer, not a pointer to one), this produces a spurious
load. `extern char sym[];` decays to the symbol's own address with no
load at all.

**The fix.** Declare a bare-address global as an array type
(`extern char sym[]` or similarly typed), never as a pointer variable,
when the target passes the symbol's address directly.

**Affected picks:** `func_0208771c` (main, 116B, parked 93.1% — this
fix took it from 9.4%, the residual 2 words are an unrelated P-28
register-choice issue).

**Provenance:** cm-main-tier-sweep-5 (2026-08-09), batch 3.

### C-92. A boolean assigned only on the true branch, relying on a pre-zeroed default, must be written as a bare `if`, not a full assignment expression

**The trap.** `x = (cond);` materializes BOTH `moveq`/`movne` arms
explicitly even when `x` was already zero-initialized and the target
only ever needs to conditionally set it to 1.

**The fix.** Write `if (cond) x = 1;` instead, relying on the
pre-zeroed default for the false case — this emits only the single
conditional set, matching a target that omits the redundant `movne`.

**Affected picks:** `func_02072544` (main, 188B, shipped 100%).

**Provenance:** cm-main-tier-sweep-5 (2026-08-09), batch 4.

### C-93. When a structurally-correct routing tier's assembler doesn't support a needed mnemonic, ship as inline `asm` under a DIFFERENT tier instead of fighting the structural router

**The situation.** `func_02080728`'s epilogue structurally reads as
`legacy_sp3` (1-step pop, no r3-pad, `sub sp` present) — but the
function's body needs a `clz` instruction, which the routed mwcc
1.2/sp3 assembler doesn't recognize (`unknown assembler instruction
mnemonic`). The structural tier classification was CORRECT; the
problem is a per-assembler mnemonic gap, a different axis entirely.

**The fix.** Hand-transliterate the target disassembly into a
`nofralloc` inline-`asm` block, filed under the PLAIN (mwcc 2.0)
tier instead of the structurally-indicated one. Since an inline-asm
block bypasses the compiler's own instruction selection entirely,
only the assembler's mnemonic table matters — the tier the `.c` file
is nominally compiled under becomes irrelevant to the shipped bytes.

**Affected picks:** `func_02080728` (main, 144B, shipped 100%).

**Provenance:** cm-main-tier-sweep-5 (2026-08-09), batch 5.

### C-94. An unnecessary cached local — even one that's re-read fresh elsewhere and never needs to survive a call — can force mwcc to allocate a genuinely extra callee-saved register

**The trap.** Caching a struct field's value in a local variable
"for convenience," when the field is in fact re-read directly at
other use sites in the same function (i.e. the cache isn't load-
bearing for correctness or for surviving an intervening call), can
still push mwcc's register allocator to reserve an EXTRA callee-saved
register purely to hold the cached copy — inflating the push/pop set
beyond what the target actually uses.

**The fix.** Remove the unnecessary named cache and read the field
directly at each use site. `func_0209240c` went from needing 6
registers to the target's correct 5 once the cached local was
removed.

**Affected picks:** `func_0209240c` (main, 180B, parked 24.4% — this
fix closed part of the gap; a residual register-role mismatch
remained after 7 total attempts). Suspected but unresolved on
`func_02092748` (main, 112B, parked 13.8%) — same shape, fix not
found in the time available.

**Provenance:** cm-main-tier-sweep-5 (2026-08-09), batch 4.

### C-95. Declare a bit-packed field as a real C bitfield, not a manual mask/shift — mwcc only emits the target's double-shift pair from an actual `: N` member

**The trap.** A struct field packed into a sub-word range (e.g. 4 or 8
bits inside a larger word) can be read/written two semantically
identical ways in C: an actual bitfield struct member
(`unsigned x : N;`) or a manual mask/shift expression (`x & mask`,
`(x << a) >> a`, `(x >> a) & mask`). These are NOT codegen-equivalent
under mwcc. The manual form always collapses to a single mask/shift
instruction under the optimizer regardless of how the expression is
phrased (parenthesization, intermediate variables, operand order all
tried, all collapse the same way) — but target ROM code for these
fields consistently emits the double-shift instruction pair (shift up
then back down, or an explicit `bic`+`orr` pair) that only a genuine
bitfield member reproduces.

**The fix.** Declare the field as an actual bitfield struct member
(mirroring the pattern C-22/P-4/P-8 already use for adjacent-bitfield
inserts — see `func_02001ef4`'s `bitfield_24_t` for a worked example)
instead of hand-rolling the mask/shift. No other source change needed;
the instruction-pair shape follows directly from the declaration.

**Affected picks:** found independently by 2 batches in
`cm-main-wall-filtered-sweep-1` (#1508, 2026-08-17) — 3 candidates in
batch5, 2 in batch2 (specific addresses not itemized in that round's
report; see it for the per-batch ledger). Not yet cross-referenced
against every existing bitfield-adjacent entry (C-22, P-4, P-8) for
overlap — a future pass should check whether any of those entries'
"tried and failed" notes were hitting this exact manual-vs-bitfield
distinction without naming it.

**Provenance:** cm-main-wall-filtered-sweep-1 (2026-08-17), batches 2
and 5 (see `docs/research/cm-main-wall-filtered-sweep-1-2026-08-17.md`,
"Other findings"); catalogued as C-95 by cm-main-exploit-drain-1
(2026-08-18) — highest existing lever was C-94 at catalog time, not
C-93 as an earlier draft assumed (kickoff_lint's 0810 taxonomy-collision
lesson: always check `origin/main` fresh before numbering).

> **C-45 extension — the range-fold lever generalizes beyond `switch`
> (cm-main-tier-sweep-5, 2026-08-09, batch 2).** `func_02064158`'s
> `if (f0c==5 || f0c==6)` collapsed to mwcc's own `sub+cmp+bhi` range
> check — the SAME range-fold C-45 documents for `switch`, but
> triggered here from a plain `||`-chained `if`, not a `switch`
> statement at all. Fix: write it as two sequential
> `if (a==X) goto L;` statements instead of the `||` form. Parked at
> 93.2% (a separate r0-vs-r3 register-choice residual remained), but
> the range-fold itself is confirmed fixed by this technique.

> **C-73 extension — `volatile` can be needed for cross-statement
> scheduling ADJACENCY, not just read/CSE freshness (cm-main-tier-
> sweep-5, 2026-08-09, batch 2).** `func_0209a210`: two independent
> struct-field read-modify-writes (`f36 |= 1; f34 &= ~1;`) compiled
> as read-read-modify-modify-store-store instead of the target's
> read-modify-store ×2, even with zero aliasing risk between the
> fields. Marking both fields `volatile` forced the correct
> sequential (adjacent) instruction order. The lever is identical to
> C-73's (mark `volatile`); the NEW diagnostic trigger is a scheduler
> reordering two independent field accesses into separate phases,
> not the CSE-reload case C-73's existing text describes.

### P-48. Register pressure can evict a passthrough parameter from r0-r3 into a callee-saved register even with no intervening calls, if the function also does non-trivial bit arithmetic (tentative, single instance)

**The shape.** A parameter that's never read except at a single final
forwarding call can still get evicted from its natural r0-r3 argument
register into a callee-saved register in the target, when the same
function also performs unrelated non-trivial bit-arithmetic — even
though nothing calls out or clobbers the argument registers in
between.

**Affected picks:** `func_0206eccc` (main, 136B, parked 5.9%).

**Recipe status: NONE.** Needs independent confirmation before
treating as established.

**Provenance:** cm-main-tier-sweep-5 (2026-08-09), batch 5.

### P-49. mwcc always folds `-(x) + CONST` into a single `rsb`-immediate, even where the target keeps two separate instructions (tentative, single instance)

**The shape.** An expression of the form "negate then add a constant"
folds to one `rsb Rd, Rn, #CONST` in every recompile attempted; the
target instead uses two separate instructions for the same
computation. Named locals, `volatile`, and statement reordering all
failed to prevent the fold. A specific RSB sub-case of the broader
P-40 family (immediate/constant materialization strategy resists
source-level control).

**Affected picks:** `func_020858cc` (main, 192B, parked 58.3%).

**Recipe status: NONE.** Needs independent confirmation.

**Provenance:** cm-main-tier-sweep-5 (2026-08-09), batch 5.

## Band ship-rate closures (pool-exhaustion findings, not codegen walls)

These are not compiler-behavior walls — they are findings about the
**candidate pool**, not about mwcc. Recorded here (rather than left as
research-doc prose that ages out of visibility) because a closed band
re-opens in three months once nobody remembers it was tested, per
`band-rate-vintage.md`'s standing rule: never quote a historical
band/pool ship-rate as a forecast without re-deriving it against the
current unattempted population.

### BR-1. The 193-256 B `.text` band (EUR, `>=4 bl/blx`, unattempted): CLOSED

**Two independent, disjoint-sample measurements, both near-zero:**

| Round | n | Shipped | Ship rate | Effort/candidate | Median `match_pct` | `>=85%` | `<50%` |
|---|---:|---:|---:|---|---:|---:|---:|
| `cm-main-exploit-drain-2` Part 2 (2026-08-22, PR #1536) | 40 | 0 | 0.0% | ~1 fastmatch attempt each | 12.9% | 1/40 | 36/40 |
| `cm-main-boundary-rerun` (2026-08-22, PR #1545) | 20 | 0 | 0.0% | 2-4+ fastmatch attempts each, real struct/register-order experiments | 5.2% | 2/20 | 16/20 |

Zero address overlap between the two 40- and 20-candidate samples (verified
directly), and zero overlap with `cm-main-tier-sweep-7`'s earlier 29
candidates in this same band (8/29 = 27.6%, 2026-08-17) or with the
`<=192 B` pool's own now-exhausted candidates. **Combined: 0/60 shipped
across this band's entire tested-since-sweep-7 remainder.**

The second measurement used *more* effort than the first (matched Part 1's
2-4-iteration protocol, plus real bitfield/struct-layout/register-order
experimentation — the C-95 bitfield lever alone moved one candidate from
~50% to 87% mid-round) and still landed on a *lower* median (5.2% vs
12.9%) and a *lower* ship rate (0% either way, but the distribution
shifted further from tractable, not toward it). This is the opposite of
what an under-iteration artifact looks like: more effort should raise a
confounded number, not lower it. Two closest near-misses across both
rounds (92.6%, 92.2%) both plateaued on a newly-confirmed register-choice
wall (see `P-20-mode-switch-selector`, new this round) that resisted 5+
independent source variations each.

**Interpretation.** Sweep-7's 27.6% on this band was a true measurement of
a real pool *at the time* — the campaign harvests in descending order of
tractability, so sweep-7 took the easiest ~29 candidates first and shipped
8 of them. What both #1536 and #1545 measured afterward is what sweep-7
*declined*: the residue. A band's ship rate is a property of the pool at
the moment it's measured, not a property of the band — see `BR-2` and
`band-rate-vintage.md` for the general pattern, confirmed independently a
second time by this same band's own two-stage collapse (27.6% → 12.9% →
5.2% across three successive harvests).

**Status: closed for this method generation.** No further ≤256 B
candidates should be drawn without a new pool derivation proving the
population has changed (e.g. new candidates surfacing from upstream
symbol/rename work). The `<=192 B` sub-band is separately confirmed fully
drained (0 unattempted `>=4 bl` candidates remain, per
`cm-main-boundary-rerun`'s pool re-derivation at that item's `main`).

**Provenance:** `cm-main-tier-sweep-7` (2026-08-17, PR unlisted here — see
`cm-main-tier-sweep-series.md`); `cm-main-exploit-drain-2` (2026-08-22, PR
#1536); `cm-main-boundary-rerun` (2026-08-22, PR #1545);
`band-rate-vintage.md` (2026-08-24 brain finding).

### BR-2. General rule: band/pool ship-rates are vintage-stamped

Confirmed on two independent bands now: the 193-256 B collapse above
(27.6% → 5.2-12.9%), and `cm-main-exploit-drain-2` Part 1's own `<=192 B`
**tail** (32 reserve candidates left over from `cm-main-exploit-drain-1`)
shipping 5/32 = 15.6%, against 73/100 = 73% on that same band's *fresh*
pool exactly one round earlier — a 4.7x collapse from residue alone,
recorded at the time in that PR's writeup but not generalized until
`band-rate-vintage.md` named the pattern explicitly.

**The rule:** never quote a historical band/pool ship-rate as a forecast
for an *unattempted* population without re-deriving the rate against the
population as it stands now. If the current population can't be sampled
in the moment, name the quoted figure's vintage explicitly rather than
presenting it as current. See `band-rate-vintage.md` for the full
derivation and the `pool_freshness.py` precedent this extends from pool
*sizes* to pool *ship rates*.

### BR-3. The 257-320 B `.text` band (EUR, `>=4 bl/blx`, unattempted): PARTIAL SAMPLE, marginal signal, not a verdict

`cm-main-band-followthrough` sampled n=20 from the unattempted 257-320 B
pool (283 candidates / 81,680 B after the `>=4 bl/blx` filter; stratified
by module, seed `20260824`), following BR-1/BR-2's warning not to trust
sweep-7's 23.5% on this same nominal band (that figure is the same
vintage as the 27.6% that collapsed to 0% in BR-1 — see `band-rate-vintage.md`).

**Coverage is partial: 9/20 sampled candidates received a real attempt
(build-tested or wall-recognized); 11/20 were read and set aside as
disproportionately complex for this round's budget, without being built
or marked attempted.** They remain in the unattempted pool, unchanged
from before this round, available to a future round at full effort.

| Outcome | n | Detail |
|---|---|---|
| Shipped | 2 | `func_ov015_021b429c` (100%, 5 attempts — control-flow guard chain, no arithmetic residue), `func_ov014_021b4294` (100%, 2 attempts — 4x `OS_SPrintf` + byte-extract shift-pair) |
| Parked, build-tested | 5 | 70.0%, 73.8%, 55.2%, 4.2%, 2.6% match — a mix of resistant register-letter/permutation residuals (3 of 5) and genuine structural mismatches (2 of 5) |
| Parked, wall-recognized (0 attempts) | 2 | `func_ov002_022341c8`, `func_ov002_0222427c` — both carry the confirmed P-20-row-offset `(self&1)*0x868` idiom against `data_ov002_022cf16c`/`022cf178` (cohort now 57); excluded on sight, not build-tested |
| Not attempted | 11 | Read in full; each carries a specific complexity marker the shipped/near-miss candidates this round did not: nested loops with signed division (`asr`+`lsr` magic-constant idioms), multi-field `bic`/`orr` bitfield repacking into a stack config struct called twice, an RGB555 min/mid/max/hue selection network, or a jump-table dispatcher with a wall-contaminated case. See the round's research doc for the full per-candidate list and reasoning. |

**On the 9 fully-processed candidates: 2/9 = 22.2%** — inside the
pre-registered 10-25% "marginal" zone, not the 25%+ "band holds" zone.
**This is not the round's verdict on the 257-320 B band**: the
denominator the pre-registered thresholds were written against is the
full n=20 sample, and only 9 of 20 were reached. Reporting 22.2% as if
it settled the question would repeat, one level down, the exact mistake
BR-2 exists to name — quoting a rate against the wrong population. What
this round adds is a real (if incomplete) data point and two more
confirmed ships, not a closed verdict either way.

A pattern worth flagging for whoever finishes the sample: every
candidate that shipped or came close (73.8%, 92.5% pre-fix) this round
was control-flow/register-pressure-bound with simple arithmetic; every
candidate set aside as too complex, and the two lowest-scoring
build-tested parks (2.6%, structural stack-frame mismatch; 55.2%,
extra-2-register cascade), involved either a loop or heavy bitfield
packing. That correlation is suggestive, not proven — n=9 is too small
to split by shape reliably — but it matches BR-1/BR-2's broader
picture of a pool where the easy, arithmetically-simple members clear
first, leaving loop-and-bitpack residue behind.

**Provenance:** `cm-main-band-followthrough` (this PR), `attempts.tsv`
rows tagged `cm-main-band-followthrough`, `band-rate-vintage.md`.

## Open questions (not levers, not walls — genuinely unresolved)

### OQ-1. Dead-branch preservation: a provably-dead compile-time-constant guard survives in the target but gets folded away by the same toolchain under every C reproduction tried

**The puzzle.** A target contains `movs r0,#6; beq <target>` — a
literal constant 6 tested against zero, which is always false at
compile time, immediately followed by the (therefore always-taken)
call this guard nominally protects. This is NOT explainable as "the
compiler always does this for this call shape" — a byte-identical use
of the SAME callee with the SAME first-argument-6 idiom is already
shipped elsewhere in this codebase (`func_02049910.legacy_sp3.c`)
WITHOUT any such guard (a plain unconditional `mov r0,#6; bl`),
proving the guard is source-real in the target, not a fixed codegen
artifact of that call shape. Yet every C reproduction attempted (bare
`if(6)`, a local `int msgId=6; if(msgId)`, `msgId` assigned inside a
switch's default case, `msgId` declared before/after the switch) gets
the dead test constant-folded away by the same compiler.

**Status:** open. 5 attempts, zero working reproduction. The rest of
the SAME function's dispatch logic (a genuine 3-way switch) resolved
cleanly via C-67 — this puzzle is isolated to one tail block. Worth a
dedicated research pass (what source shape survives dead-code
elimination for a provably-false compile-time constant?) rather than
more blind guessing.

**Affected picks:** `func_0204a960` (main, parked — this specific
block; the function's dispatch portion is otherwise resolved).

**Provenance:** cm-main-tier-sweep-2 (2026-08-08), batch 4.

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

**S-1 extension — plain miscounted padding, no rounding involved
(`func_ov002_021edce8`, cm-ov002-unknown-sweep-2, 2026-07-26).**
A variant of this pitfall that does NOT go through the rounding
mechanism above: `struct Cd3f4 { int _0; int f4; char _8[0x1c];
int f20; };` put `f20` at `0x4+0x4+0x1c = 0x24`, four bytes past
the target's real `0x20` — but `0x1c` is already 4-byte-aligned,
so mwcc's alignment rounding never enters into it at all. The pad
size itself was simply counted wrong by 4 bytes when the struct
was first transcribed from the disassembly (correct: `char
_8[0x18]`, landing `f20` at `0x20`). Symptom was identical to the
rounding case (a uniform-looking downstream offset issue) and was
misdiagnosed for at least one full campaign wave as **"the
brief-287 cd3f4-arg tail reg-alloc wall"** — see
`docs/research/brief-287-coldre-wave7-accessor-family.md:76`,
which tagged `021edce8` (plus 3 siblings sharing the same `cd3f4`
field pair: `02200310`, `0220257c`, `021e9860`) as "extra-tail /
cd3f4-arg... hand-RE later, not template" rather than a
plain-old S-1 struct bug. The function shipped byte-exact the
moment the pad size was corrected — no reg-alloc lever, no
routing-tier change, no reshape of the C logic at all.

**Why fold under S-1 (not a fresh S-3):** same "the human's
struct decl doesn't match the target's layout, mwcc is faithfully
compiling the wrong description" mechanism as the parent entry —
only the SOURCE of the wrong pad size differs (a plain counting
mistake vs. a rounding trap), not the fix (correct the pad size)
or the diagnostic shape (uniform downstream offset drift). Also a
useful negative data point for S-1's own "how to spot it before
writing" check (`4-byte-aligned-up(prev_end + pad_size)`): both
the wrong value (`0x8 + 0x1c = 0x24`) and the right one
(`0x8 + 0x18 = 0x20`) are already 4-byte-aligned on their own, so
that rounding check passes cleanly either way and would NOT have
caught this particular mistake — this variant only shows up by
comparing the computed offset against the target's *actual*
offset, not by checking the pad's internal alignment arithmetic.
"The arithmetic is self-consistent but built on a wrong input" is
a distinct trap from "the arithmetic rounds up unexpectedly," even
though both present identically in the diff.

**The other 3 siblings from the same brief-287 tag
(`02200310`, `0220257c`, `021e9860`) were NOT re-examined by this
sweep** (out of scope — only `021edce8` was in this size band) —
worth a dedicated check, since if one of the four had a miscounted
`Cd3f4` pad, the others transcribing the same struct may too.

**Provenance:** cm-ov002-unknown-sweep-2 (PR #1372), batch 1.

### Sweep result — only S-1 surfaced (waves 5+ through 22)

Cloud autonomous sweep covered 34 wave + brief PRs (briefs
020 / 022 / 028 / 029 / 030 / 031 / 033–366 — every
"iteration win" or "fixed by" note in the corpus through the
end of wave 22) looking for additional source-layout
authoring pitfalls. **S-1 (padding off-by-one) is the only
source-layout pitfall surfaced so far.**

Adjacent finds — *not* S-class, listed here for clarity:

- **`func_ov011_021ca600` drop (PR #385 wave 19) — UPDATE: coercion
  pursued and SHIPPED (`cm-overlay-small-sweep`, PR #1334, 2026-07-24).**
  Originally: "byte-pointer source would need a struct typedef to
  coerce." This looked like S-class on first read but was actually a
  **C-source shape** choice: byte-pointer arithmetic
  (`*(int*)(buf + 0x10)`) and struct-member access
  (`p->field_10`) are both valid C, but they emit different
  asm (`add + ldr` vs single `ldr [base, #imm]`). The struct
  decl wasn't wrong — the access shape was. Adjacent to C-2
  (local-pointer reuse). The typed-struct-member coercion was later
  applied and matched byte-identical — see
  [`cm-overlay-small-sweep-2026-07-24.md`](cm-overlay-small-sweep-2026-07-24.md)
  for the general lever (same root cause reversed 6 documented
  "permanent" verdicts in one sweep).
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

> **Correction (cm-ov002-unknown-sweep-7, 2026-07-30): the "free" claim
> above is too strong.** A sparse `cmp;beq`-chain candidate
> (`src/main/func_0202bcb0.s`) showed case-declaration order measurably
> affecting where mwcc places a *deferred single-instruction leaf block*
> — reordering source cases shifted the match from 84.5% to 82.5%. This
> is a real counter-example to "the C case order is free" for at least
> some sparse-chain shapes, not just the dense jump-table case this
> entry was scoped to. The exact ordering rule for the sparse case was
> NOT cracked this round (comprehension confirmed correct, mechanism
> not isolated) — treat "sparse switch order is irrelevant" as
> unconfirmed rather than established until a follow-up brief either
> finds the rule or narrows which sparse shapes are actually exempt.

> **Partial rule found (cm-ov002-unknown-sweep-8, 2026-07-31, batch 3):**
> within a genuine `switch` compiling to a `cmp;beq`-style compare chain
> (as opposed to plain `if`/`else if`, which always uses mwcc's "positive
> strategy" of inlining the first condition's true branch, per C-55),
> declaration order controls the chain's shape: **ascending** value
> order in source gives "all-`beq` plus an explicit final branch" for
> the last case; **descending** order gives "`beq` for the early-
> declared cases, then `bne`-plus-inline-fallthrough for whichever case
> was declared first." 6 confirmations in one batch. This narrows (does
> not fully resolve) the sparse-case mechanism the sweep-7 counter-
> example above left open — declaration order is at least part of the
> rule, though whether it's the *complete* rule for every sparse shape
> is still unconfirmed.

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

### P-51. `int c=0; if(rec.field){rec.field=0;c=1;}` reuses the just-emptied field's dead register for `c`; mwcc always allocates a fresh one (permanent, ov004, 18 confirmed members)

**The pattern.** A "changed" boolean derived from clearing a
struct/record field: `int c=0; if(rec.unk38){rec.unk38=0;c=1;}
if(c)...` (or an early-return variant, `if(!c)return;`). The
original binary's register allocator reuses the now-dead register
that held `rec.unk38` (typically r0, freed the instant the field is
cleared) to also hold `c`. mwcc's allocator, given the identical C
source, never makes that reuse — it always assigns `c` a fresh
register (typically r1). The result is exactly one register off on
every member, everywhere else in the function matching exactly (one
park row logged 24/24 other words matching, only the 5 changed-bool
words diverging).

**Recipe status: NONE.** This pattern was first documented in
`src/overlay004/ov004_core.h` (brief 320, wave 3) as "unsteerable" —
storing `c` back to a struct field, forcing it through `!!`, and
routing it through an explicit temp variable were all tried and all
failed to make mwcc pick the dead register. cm-main-tier-sweep-7
re-attempted several members fresh (not just re-reading the old
notes) and did not find a coercion either. Treat as permanent: park
on sight once the symptom matches (single-digit-word diff, isolated
to a cleared-flag-then-branch site), do not re-grind it.

**Mechanism note — this round's new finding.** Of the 12 sweep-7
ledger rows matching this pattern, all 12 landed in candidates with
4 or more callees (`n_call` 4–12); zero landed in any 0–1-callee
candidate, despite roughly half of sweep-7's Part 1 pool (50 of 100
candidates) being drawn specifically from the 0–1-callee band. This
is consistent with sweep-5/6/7's pooled register-pinning-via-ABI
hypothesis: more callees leave the allocator fewer free physical
registers to choose from at the clear-then-branch site, making it
more likely to land on the *specific* register the original also
converged on by chance, or conversely more likely to diverge from it
when it doesn't. It does not, on its own, explain why the original
binary's allocator *consistently* prefers the reuse and mwcc's
*consistently* doesn't — that half of the mechanism is still open.

**Affected picks — 8 pre-existing (documented, brief 320, sizes not
re-verified this round):** `021d48bc`, `021d52a0`, `021d4044`,
`021d427c`, `021d43a0`, `021d4d8c`, `021d4804`, `021d5a10`.

**Affected picks — 12 confirmed by cm-main-tier-sweep-7 (2026-08-17):**
10 genuinely new — `021d46a4` (280B), `021d4a48` (140B), `021d55d8`
(96B), `021d5638` (196B), `021d4ae4` (196B), `021d441c` (176B),
`021d5738` (180B), `021d4584` (288B), `021d5004` (296B), `021d53c0`
(364B) — plus 2 re-attempts of pre-existing members that had never
gotten an `attempts.tsv` row before this round, `021d52a0` (120B)
and `021d5a10` (128B), surfacing again as apparently-fresh candidates
because `--exclude-attempted` only filters addresses already logged
in the ledger and these had only ever been noted in prose in
`ov004_core.h` — the same pre-ledger-documentation gap already
tracked for pre-park-one.py walls elsewhere in this campaign.
**Confirmed cohort is now 18** (8 + 10 net-new; the 2 re-attempts add
ledger rows but not new membership). This lines up closely with
`ov004_core.h`'s own brief-320 "THINNING FLAG" estimate of "~19" —
a rough, unverified estimate at the time, now essentially confirmed
by direct count.

**Not the same pattern, flagged separately:** `021d3a7c` (ov004,
248B, cm-main-tier-sweep-7 p2batch2, tag
`dead-call-result-register-reuse`) is structurally similar — a dead
value's register gets reused by the original but not by mwcc — but
the dead value there is a discarded call *result*, not a
cleared *struct field*, and the site is a plain dual-source count
format rather than a clear-then-branch guard. Related family, not
folded into this entry's count.

**Provenance:** original ~8 documented in `src/overlay004/ov004_core.h`
(brief 320, wave 3, pre-dates the `attempts.tsv` ledger). 12 more
ledger rows: cm-main-tier-sweep-7 (2026-08-17), Part 1 batches 1/3/4/5
and Part 2 batches 2/3/4/5.
