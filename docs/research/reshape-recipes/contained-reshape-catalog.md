[//]: # (markdownlint-disable MD013 MD041)

# Contained-reshape recipe catalog

**Status:** build-free analysis, 2026-07-02. Mined from `brief-516-cmatch-high-w9.md`'s
four accepted EUR matches (`0200b1bc`, `0200a454`, `0200592c`, `0200b0c8`) plus two
additional already-matched `main`-tier functions (`0201bea8`, `02038270`) chosen to
cover the two symptom classes the brief-516 sample didn't exercise. Every entry below
is verified against the **real pre-match `.s`** (recovered via `git show` on the
commit before each function was matched) and the **real matched `.c`** currently on
`main` — not paraphrased from wave-report prose.

## Why this catalog is scoped differently from `recipe-gotchas.md`

[`recipe-gotchas.md`](../recipe-gotchas.md) is the mature catalog from the earlier
codegen-walls campaign (briefs 218–288) — 26 gotchas, mostly register-allocation and
CSE-timing quirks discovered while draining reg-alloc-walled `.s` families. It remains
the first stop for a *register/temp-placement* near-miss (its own "Quick reference:
symptom → gotcha" table at the top covers that ground well; gotcha 3 in particular is
the canonical condition-code-polarity writeup and is cross-referenced below rather
than duplicated).

This catalog is scoped to the **current containment-gated campaign** specifically:
[`brief-514-forensics.md`](../brief-514-forensics.md) found that the "localized
candidate-byte mismatch" bucket (small, *contained* diffs — not the link/layout
avalanche bucket) is a distinct, tractable population once you know the exact C
reshape. Brief 516 closed four of those out. **Reshaping speed is now the campaign's
bottleneck** (per this task's own framing) — this catalog is the fast lookup table for
that specific bucket: read the byte-diff symptom, find the matching entry, apply the
fix, verify.

**Every recipe here assumes containment is already established** (the brief-514
ARM9-diff pre-gate passed — see [`safe-queue-v2.md`](../campaign-analytics/safe-queue-v2.md)
§6). These are instruction-level reshapes for candidates already known not to
avalanche, not a containment technique.

---

## Quick reference: symptom → recipe

| Byte-diff symptom | Recipe | Worked example |
|---|---|---|
| A commutative `add`/arithmetic op has its two operands in the wrong order (result correct, one register-pair swapped) | [#1 Add operand-order](#recipe-1--add-operand-order-accumulator-first) | `0200b1bc` |
| A pool-loaded base address ends up in the wrong register, or a literal/register assignment is subtly off, in a function with **two** pool bases | [#2 Pool/register binding](#recipe-2--asymmetric-poolregister-binding) | `0200a454` |
| A block of MMIO/hardware-register zero-stores is byte-different — extra or missing instructions around the store sequence | [#3 MMIO store shape](#recipe-3--mmio-store-shape-selective-base-binding) | `0200592c` |
| A loop's diff is contained but larger than expected (tens of bytes) — the loop count or an array-base load looks "reordered" | [#4 Loop count/lifetime](#recipe-4--selective-loop-hoisting-count-yes-base-no) | `0200b0c8` |
| A boolean/comparison sequence has a conditionally-executed instruction (`ldreq`/`streq`/etc.) that your build made unconditional, or vice versa | [#5 Condition-code lowering](#recipe-5--short-circuit-condition-code-lowering) | `0201bea8` |
| Multiple independent field stores (or calls) are correct individually but in the wrong sequence — not address order, not declaration order | [#6 Store/call order](#recipe-6--store-order-follows-source-argument-order-not-memory-address-order) | `02038270` |

If none of these match, check [`recipe-gotchas.md`](../recipe-gotchas.md)'s own
symptom table first (register-placement and CSE-timing quirks), then
[`codegen-walls.md`](../codegen-walls.md) for permanent-wall classification.

---

## Recipe 1 — add operand-order (accumulator-first)

**Symptom:** a counted loop does `array[i] += something` (or the equivalent), and the
diff is tiny (2 bytes in the worked example) but non-zero — the loaded array value and
the "other" operand are in the swapped register pair inside an `add`.

**Original `.s` shape:**

```asm
.L_2c:
    ldr r0, [r6, r1, lsl #0x3]   ; r0 = base[i].v (the loaded value)
    add r0, r5, r0               ; r5 (accumulator/addend) FIRST, r0 (loaded) SECOND
    str r0, [r6, r1, lsl #0x3]
```

**Fix:** the natural C reading of `base[i].v += addend` puts the *loaded* value first
(`base[i].v = base[i].v + addend`) — mwcc's left-to-right operand evaluation then loads
the array element into the first-claimed register and adds the addend second, which
is the WRONG order here. Bind the addend to a named local **before** the loop, then
write the addition as `local = addend; local += loaded_value;` — i.e. put the
already-resident value (the addend, which doesn't change across iterations and is
already in a register from the function's own argument) as the *left* operand of the
accumulation, and the freshly-loaded array element as the *right* operand:

```c
int func_0200b1bc(struct E8 *base, int a1, int addend, unsigned count)
{
    unsigned i;
    func_02094550(a1, base, count * 8);
    for (i = 0; i < count; i++) {
        int v = addend;          /* addend bound first */
        v += base[i].v;          /* loaded value added second, matching add r0,r5,r0 */
        base[i].v = v;
    }
    return 1;
}
```

**Why:** this is the same underlying mechanism as `recipe-gotchas.md` gotcha 19
(commutative-operand order follows source left-to-right evaluation) — but the specific
lever here is *which value gets named as a local first*, not source-expression operand
position, since the actual statement is a loop-carried accumulate. Whichever value you
assign to the local FIRST becomes the accumulator (left operand); the array read stays
the second (right) operand of the `add`.

**Worked example:** [`func_0200b1bc`](../../../brain/src/main/func_0200b1bc.c) —
brief 516: "contained, 2-byte add operand-order diff → zero. Rewrote the additive loop
with an accumulator temp so mwcc emitted `add r0, r5, r0`."

---

## Recipe 2 — asymmetric pool/register binding

**Symptom:** a function references **two** separate pool-loaded base addresses (two
`.word` globals / two `ldr rN, _LITx`), and the diff is small (5 bytes in the worked
example) but touches which register ends up holding which base, or an addressing-mode
detail around one of them.

**Original `.s` shape:**

```asm
    ldr r3, _LIT0          ; r3 = &data_02104f4c  (DEST base)
    ldr r2, _LIT1          ; r2 = &data_020b476c  (SRC base)
    mov ip, #0x0
.L_c70:
    add r0, r3, ip, lsl #0x2   ; dest address computed from r3 every iteration
    ldr r1, [r2, ip, lsl #0x2] ; src loaded directly from r2 every iteration
    add r0, r0, #0x1000
    add ip, ip, #0x1
    str r1, [r0, #0xaa8]
    cmp ip, #0x4
    blt .L_c70
```

**Fix:** the natural instinct for a "copy loop between two globals" is to bind
**both** bases to local pointers symmetrically (`int *dst = ...; int *src = ...;`).
That's wrong here — mwcc's register allocator only promoted **one** of the two bases
(the destination) to a value worth keeping resident across the whole loop; the source
was re-referenced through the extern symbol directly on each iteration. Bind only the
base whose register the `.s` shows getting reused/offset-adjusted mid-loop (here, the
dest base `r3`, which later gets a `+0x1000` mid-sequence bump); leave the other base
as a **direct extern array reference**, not a local:

```c
extern unsigned int data_02104f4c[];   /* dest base — BOUND to a local */
extern unsigned int data_020b476c[];   /* src base — left as a direct reference */

void func_0200a454(void)
{
    unsigned int *dst = data_02104f4c;
    int i;
    for (i = 0; i < 4; i++)
        dst[0x6aa + i] = data_020b476c[i];   /* src NOT bound to a local */
}
```

**Why:** binding a value to a named local is a hint to the register allocator that the
value is worth keeping resident; mwcc still makes its own final call, but the asymmetry
in the *source* nudges it toward the asymmetric allocation the original had. When two
pool bases are present and only one ends up "sticky" across the loop in the `.s`, mirror
that asymmetry — don't bind both just because both look like they need it.

**Diagnostic:** check which base's register gets an extra arithmetic op (`add rN, rN,
#0x1000`-style offset bump, or gets reused inside the loop body for computed
addressing) mid-sequence in the `.s` — that's the one to bind. The other, referenced
via a single fresh `ldr [rBase, index]` each iteration with no persistent adjustment,
should stay a direct array reference.

**Worked example:** [`func_0200a454`](../../../brain/src/main/func_0200a454.c) —
brief 516: "contained, 5-byte pool/register diff → zero. Bound only the destination
base as a local to recover the original literal/register assignment."

---

## Recipe 3 — MMIO store shape (selective base binding)

**Symptom:** a block of hardware-register (MMIO) zero-stores or fixed-value stores is
byte-different from the original — usually a handful of bytes (12 in the worked
example) around the store sequence, not the individual store instructions themselves.

**Original `.s` shape:**

```asm
    mov r2, #0x0
    ldr r1, _LIT0          ; r1 = 0x04000010
    ldr r0, _LIT1          ; r0 = 0x04001014  (separate literal — not reachable
                            ;                   from r1 via a cheap immediate offset)
    str r2, [r1]
    str r2, [r1, #0x4]
    str r2, [r1, #0x8]
    str r2, [r1, #0xc]
    add r1, r1, #0x1000     ; r1 now 0x04001010 — reused via offset, no fresh pool load
    str r2, [r1]
    str r2, [r0]
    str r2, [r0, #0x4]
    str r2, [r0, #0x8]
```

**Fix:** there are two address "groups" here — one reachable from the first pool base
via a cheap immediate `+0x1000` bump (no second pool load needed), and one that needed
its own separate literal. Model this in C as **one** `volatile` pointer local bound to
the group that has its *own* literal (here, `0x4001014`), and write every other store —
including the one reached via the `+0x1000` bridge — as a **direct literal-address
volatile store**, not through any bound local:

```c
void func_0200592c(void) {
    volatile int *b = (volatile int *)0x4001014;   /* only the "own literal" base bound */

    /* ... unrelated teardown calls ... */

    *(volatile int *)0x4000010 = 0;
    *(volatile int *)0x4000014 = 0;
    *(volatile int *)0x4000018 = 0;
    *(volatile int *)0x400001c = 0;
    *(volatile int *)0x4001010 = 0;   /* reached via +0x1000 from 0x4000010 in the orig;
                                          written as a raw literal here too, NOT via `b` */
    b[0] = 0;
    b[1] = 0;
    b[2] = 0;
}
```

**Why:** this is Recipe 2's asymmetric-binding lever applied to MMIO addresses instead
of data pointers. `volatile` is required on the bound pointer (per `recipe-gotchas.md`
gotcha 17's mechanism) so mwcc doesn't fold/reorder the stores — but the KEY decision
is *which* address group gets the bound pointer. Check whether one MMIO group's base
address is reachable from another via a small immediate offset (a `+0x1000`-class
bump) in the `.s` — if so, that group does NOT need its own local; only the group that
required a fresh, separate pool load does.

**Worked example:** [`func_0200592c`](../../../brain/src/main/func_0200592c.c) —
brief 516: "contained, 12-byte MMIO register diff → zero. Rewrote the MMIO zero
stores as direct stores plus a single `0x4001014` base local."

---

## Recipe 4 — selective loop hoisting (count: yes, base: no)

**Symptom:** a loop's diff is contained (doesn't avalanche) but larger than a simple
operand-order miss — tens of bytes (61 in the worked example) — and the mismatch looks
like it's about *which values are cached in registers across iterations* versus
reloaded from memory each time.

**Original `.s` shape:**

```asm
    movs r6, r0
    beq .L_11c              ; null-check on the WHOLE struct pointer, not on ->count
    ldr r5, [r6, #0x0]      ; count LOADED ONCE, kept in r5 across the whole loop
    mov r4, #0x0
    cmp r5, #0x0
    ble .L_104               ; skip the loop body entirely if count <= 0
.L_0e4:
    ldr r0, [r6, #0x4]      ; arr base RELOADED from r6+4 on EVERY iteration
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_0f8
    bl Task_InvokeLocked
.L_0f8:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_0e4
```

**Fix:** hoist the loop-invariant **count** into a local before the loop (matching
`r5`'s single load), but deliberately **do not** hoist the array base — keep it as a
fresh `p->arr[i]` struct-field dereference inside the loop body, re-evaluated every
iteration, matching `r0`'s reload from `r6+4` each pass:

```c
int func_0200b0c8(List *p)
{
    int i;

    if (p) {
        int count = p->count;    /* HOISTED: single load, matches r5 */
        i = 0;

        if (count > 0) {
            do {
                void *t = p->arr[i];   /* NOT hoisted: p->arr re-read every iteration */
                if (t)
                    Task_InvokeLocked(t);
                i++;
            } while (i < count);
        }
        Task_InvokeLocked((void *)p->arr);
        Task_InvokeLocked((void *)p);
        return 1;
    }
    return 0;
}
```

Two more details that matter here, both visible directly in the `.s`:

- The null check is on `p` itself (`movs r6, r0; beq ...`), not on `p->count` — check
  the whole pointer, don't fold the guard into a field access.
- The `ble`-then-bottom-tested-loop shape (skip-if-`count<=0`, otherwise fall into an
  unconditional loop body with the compare at the *bottom*) is a `do { } while` in C,
  not a `for`/`while` (which would emit a *second*, redundant top-of-loop test).

**Why:** mwcc's register allocator decides what's "worth" caching across loop
iterations based on how the *source* accesses the value — a local variable read
repeatedly stays in its register; a struct-field access written as `p->arr[i]` (rather
than hoisted to `void **arr = p->arr;` before the loop) gets re-evaluated as a fresh
load each time, because nothing in the C told the compiler the value was safe/worth
caching. This is a lever, not a universal default: **check the `.s` for whether the
base register carries a fresh `ldr` inside the loop body or stays untouched** — if
fresh, don't hoist that one in C even though hoisting *looks* like the more natural
optimization to write.

**Worked example:** [`func_0200b0c8`](../../../brain/src/main/func_0200b0c8.c) —
brief 516: "contained, 61-byte loop/count diff → zero. Bound `p->count` once, used
branch-to-tail null shape, then adjusted variable lifetime to match the original
callee-saved allocation."

---

## Recipe 5 — short-circuit condition-code lowering

**Symptom:** a boolean expression combining two comparisons ships with a **conditionally
executed** load or store (`ldreq`/`streq`/`ldrne`/etc.) in the original, but your first
C draft either makes both loads unconditional, or (going the other way) an
unconditional-in-orig load comes out predicated in your build.

**Original `.s` shape:**

```asm
    ldr r0, [r5, #0x8]       ; a->f8
    cmp r0, #0x0
    ldreq r0, [r5, #0x10]    ; a->f10 loaded ONLY IF f8 == 0 — genuinely conditional
    cmpeq r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
```

**Fix:** write the condition as a short-circuiting `&&` over the two field
comparisons, in the same field order, and negate the whole boolean the way the
`.s`'s final `movne #1 / moveq #0` shows (true-if-NOT-both-zero):

```c
int func_0201bea8(char *a) {
    char *w = GetSystemWork();
    Copy32(w + 0x810, a, 0x20);
    *(int *)(w + 0x8e0) |= 2;
    func_0201bddc(a);
    *(int *)(w + 0x8e0) &= ~2;
    return !(*(int *)(a + 8) == 0 && *(int *)(a + 0x10) == 0);
}
```

**Why:** C's `&&` is a genuine short-circuit operator — the second operand is not
evaluated if the first is false. mwcc 2.0/sp1p5 realizes that guarantee literally at
the instruction level: the second field's `ldr` is emitted with the `eq` condition
code (conditionally executed based on the first comparison), not as a plain
unconditional `ldr` followed by a second `cmp`. **The critical trap:** if you instead
write the condition as two independent comparisons combined with a bitwise `&`, or as
two separately-materialized booleans ANDed together, mwcc has no short-circuit
guarantee to exploit and will emit an unconditional load for the second field —
one instruction longer, and it will not match. The `&&` is load-bearing, not
stylistic.

**Cross-reference:** for the *polarity* of which conditional-move comes first when
the orig shows two `movXX` at a tail (a related but distinct symptom), see
`recipe-gotchas.md` gotcha 3.

**Worked example:** [`func_0201bea8`](../../../brain/src/main/func_0201bea8.c) — its
own risk-note comment (right on the source) documents the mechanism directly: "the
bool return is `cmp f8,#0; ldreq f10; cmpeq f10,#0; movne r0,#1; moveq r0,#0` (f10 load
predicated on f8==0) — if mwcc loads f10 unconditionally the ldreq becomes a plain
ldr; keep the `&&` so the second load stays conditional."

---

## Recipe 6 — store order follows source-argument order, not memory-address order

**Symptom:** several independent byte/halfword/word field stores are individually
correct but the diff shows them emitted in an unexpected sequence — specifically, NOT
in ascending struct-offset (memory-address) order.

**Original `.s` shape:**

```asm
    strb r2, [r0, #0x2e]   ; store b  (arg 3) — offset 0x2e
    ldr r2, [sp]           ; load d  (arg 5, stack) — deferred until right before use
    strb r3, [r0, #0x30]   ; store c  (arg 4) — offset 0x30
    strb r2, [r0, #0x2f]   ; store d  (arg 5) — offset 0x2f  <- LOWER address than
                            ;                                    the store before it!
```

Address order would be `0x2e, 0x2f, 0x30` (b, d, c); the actual emitted order is
`0x2e, 0x30, 0x2f` (b, c, d).

**Fix:** write the field stores in the function's **parameter order**, not sorted by
struct offset:

```c
int func_02038270(unsigned char *obj, int mode, int b, int c, int d) {
    unsigned short h;

    obj[0x2e] = (unsigned char)b;   /* param order: b, c, d */
    obj[0x30] = (unsigned char)c;
    obj[0x2f] = (unsigned char)d;
    /* ... */
}
```

**Why:** mwcc emits store instructions in **C statement order**, full stop — there is
no reordering-by-address optimization at `-O4` for independent stores to different
fields of the same object. The original author (or, more precisely, the original
*expression* the disassembly was compiled from) wrote the assignments in argument
order, which happens not to match ascending memory offset because the struct's field
layout doesn't mirror the function's parameter order. When you're reading a `.s` and
guessing at a plausible C reshape, resist the instinct to "clean up" the store
sequence into address order — transcribe the exact sequence the `.s` shows, one
statement per store, in that order. The bonus tell in this example: `d` is a
stack-passed argument, and its `ldr` is scheduled **lazily**, right before the store
that consumes it (not eagerly at function entry) — a further sign the compiler is
just walking the source statements in order, not planning ahead.

**Worked example:** [`func_02038270`](../../../brain/src/main/func_02038270.c) — its
own source comment states this was independently re-verified: "VERIFIED byte-exact
vs target (store order 0x2e,0x30,0x2f with d-load interleaved...). No divergence
observed."

---

## Applying this catalog

1. Get the byte-diff (`ninja report` / `objdiff-cli diff` per
   [`resolved-check-loop.md`](../speed/resolved-check-loop.md), or the brief-514
   containment-checked ARM9 diff if the mismatch is small enough to read directly).
2. Match the symptom shape against the quick-reference table above.
3. Apply the fix, re-diff.
4. If none of the six match, or the fix doesn't close the diff, escalate to
   `recipe-gotchas.md`'s full 26-gotcha catalog (register-placement/CSE quirks are a
   much larger space) before concluding it's a permanent wall
   (`codegen-walls.md`).
5. **Containment is a precondition, not a byproduct of these recipes** — none of them
   change a candidate's link/layout risk. Re-run the brief-514 ARM9-diff containment
   check after any reshape that touches global/static declarations, since adding a
   new `static`/initialized global is exactly the Mode-C risk `safe-queue-v2.md`
   already down-ranks.

## Contributing

When a new contained-reshape win surfaces, append it here with the same structure:
symptom, original `.s` shape (verbatim), the fix, why it works, and a link to the
worked example. Keep worked examples pinned to *verified matched* functions with
their real pre-match `.s` recovered via `git show <pre-match-commit>:<path>.s` — do
not paraphrase from a wave-report summary alone; the `.s`/`.c` pair is the ground
truth.
