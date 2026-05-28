[//]: # (markdownlint-disable MD013 MD041)

# Recipe gotchas — pre-flight reading for hard-tier picks

A growing catalog of subtle source patterns that cause mwcc to
emit byte-different output despite semantically-equivalent C.
Each gotcha is a NEAR-MISS pattern surfaced during a worked-example
ship: the natural recipe LOOKS right but ships at 80-90% fuzzy
because of one mwcc codegen quirk. Knowing the gotcha lets the
decomper skip the fail-and-iterate loop.

**Read this before piloting any new pick.**

---

## Gotcha 1 — `return r` vs `return 0` (helper null-check tail)

**Symptom**: an extra `moveq r0, #0` (or `mov r0, #0`) between
the helper return-test and the early-return pop.

**Pattern**: the source has a `helper() == 0 → return 0` pattern
that semantically should produce just `cmp/popeq`, but mwcc emits
an extra `moveq r0, #0` because it can't see that r0 is ALREADY 0
from the helper return.

### Wrong (extra instruction):

```c
int func(void) {
    if (helper1() == 0) return 0;
    return helper2(26, 1);
}
```

mwcc 2.0/sp1p5 emits 9 instructions:

```asm
push  {r3, lr}
bl    helper1
cmp   r0, #0
moveq r0, #0          ; <-- EXTRA: mwcc doesn't know r0 is already 0
popeq {r3, pc}
mov   r0, #26
mov   r1, #1
bl    helper2
pop   {r3, pc}
```

### Right (matches orig):

```c
int func(void) {
    int r = helper1();
    if (r == 0) return r;     /* return r, NOT return 0 */
    return helper2(26, 1);
}
```

mwcc emits 8 instructions (orig shape):

```asm
push  {r3, lr}
bl    helper1
cmp   r0, #0
popeq {r3, pc}        ; r0 == 0 holds, drops through to pop
mov   r0, #26
mov   r1, #1
bl    helper2
pop   {r3, pc}
```

### Why

mwcc sees `r == 0` and folds the return as "use r's value
directly". With `return 0;`, mwcc materialises 0 in r0 even if
r0 already holds 0 — the optimizer doesn't track "this register
already equals the constant we're about to load."

### Where surfaced

Brief 237 pilot pick `func_ov002_021b0c34`. The natural recipe
v1 failed at 8 vs 9 insns; v2 with named-local + `return r`
shipped byte-identical.

---

## Gotcha 2 — `extern char data[]` vs `extern int g_arg`

**Symptom**: an extra `ldr rD, [rD]` instruction (memory deref)
after the pool load — orig has just the pool load.

**Pattern**: helper takes a data-symbol POINTER as an argument.
The pool slot in orig contains the data symbol's ADDRESS (resolved
via R_ARM_ABS32 relocation). Source declaration determines whether
mwcc emits a deref:

- `extern int g_arg;` → mwcc treats this as an `int` at the symbol
  address → emits `ldr rD, [pc, #N]` (pool load) + `ldr rD, [rD]`
  (deref to get the int value)
- `extern char data[];` → mwcc treats this as an ARRAY (array-decay
  to pointer in expression context) → emits `ldr rD, [pc, #N]` only
  (the pool load IS the address)

### Wrong (extra deref):

```c
extern int g_arg1;
extern int g_arg2;

void func(void) {
    helper1(g_arg1);
    helper2(g_arg2);
}
```

mwcc emits 8 instructions (1 extra deref per call):

```asm
push  {r3, lr}
ldr   r0, [pc, #20]      ; r0 = &g_arg1 (pool resolves to symbol addr)
ldr   r0, [r0]            ; <-- EXTRA: deref to load g_arg1's value
bl    helper1
ldr   r0, [pc, #12]
ldr   r0, [r0]            ; <-- EXTRA
bl    helper2
pop   {r3, pc}
```

### Right (matches orig):

```c
extern char data_ov010_021b8ce4[];
extern char data_ov010_021b8cd0[];

void func(void) {
    helper1(data_ov010_021b8ce4);
    helper2(data_ov010_021b8cd0);
}
```

mwcc emits 6 instructions + 2 pool words (orig shape):

```asm
push  {r3, lr}
ldr   r0, [pc, #12]      ; r0 = data_ov010_021b8ce4 (pool = address)
bl    helper1
ldr   r0, [pc, #8]       ; r0 = data_ov010_021b8cd0
bl    helper2
pop   {r3, pc}
.word data_ov010_021b8ce4
.word data_ov010_021b8cd0
```

### Why

C's array-to-pointer decay rule: when an array name appears in
an expression (not as the operand of `sizeof` or unary `&`), it
decays to a pointer to the first element. So `data_xxx` in the
helper-arg position resolves to `&data_xxx[0]` — exactly the pool
slot's value, no deref needed.

`int g_arg;` declares an `int`, so `g_arg` in expression context
is the VALUE of that int — mwcc must fetch it from the symbol's
address.

### Where surfaced

Brief 237 pilot pick `func_ov010_021b2bf8`. The natural recipe v1
failed at 8 vs 6 insns (extra `ldr rD, [rD]` derefs); v2 with
`extern char data[]` shipped byte-identical.

### When to use which

- **Helper takes a POINTER** (data buffer, string, struct ptr) →
  `extern char data_xxx[]` (or `extern struct T data_xxx[]`)
- **Helper takes a VALUE loaded from a global** (rare for game
  code) → `extern int g_arg;`
- **Pool slot is a LITERAL CONSTANT** (no relocation, just a
  `.word 0x1234`) → use a `#define` or pass the literal directly:
  `helper(0x1234)`

When in doubt, look at the orig `.word` line in the disasm:

- `.word data_xxx` followed by `R_ARM_ABS32 data_xxx` → it's a
  pointer; use `extern char data_xxx[]`
- `.word 0x1234` with no relocation → it's a literal; use the
  constant directly

---

## Gotcha 3 — ternary polarity (movge/movlt order)

**Symptom**: a swap of two conditional-move instructions
(`movge/movlt` vs `movlt/movge`) at the function tail.

**Pattern**: mwcc emits the conditional-move ORDER based on the
ternary's if-true/if-false branch ORDER. Same semantics, different
bytes.

### Wrong:

```c
return m >= 1 ? 2 : 0;   /* ge-true-first */
```

Emits:

```asm
cmp   r0, #1
movge r0, #2          ; <-- first
movlt r0, #0          ; <-- second
```

### Right (matches orig if orig has movlt first):

```c
return m < 1 ? 0 : 2;    /* lt-true-first */
```

Emits:

```asm
cmp   r0, #1
movlt r0, #0          ; <-- first
movge r0, #2          ; <-- second
```

### Why

mwcc lowers a ternary as "if-true branch first, then else
branch." The condition code in the first emitted `mov` matches the
ternary's true branch.

Both forms are semantically identical (different code paths cover
the same values), but the byte-order matters for matching.

### Where surfaced

Brief 229 pilot pick `func_ov002_02200650`. First attempt with
`m >= 1 ? 2 : 0` emitted `movge; movlt` instead of orig's `movlt;
movge`. SHA1 caught it. Fix: flip to `m < 1 ? 0 : 2`.

### General rule

When the orig disasm shows two conditional moves at the tail, the
ternary in the source must put the FIRST conditional's true-branch
as the if-TRUE side. Read orig's first `movXX` instruction to
determine the polarity.

---

## Gotcha 4 — XOR operand ordering (`a ^ b` vs `b ^ a`)

**Symptom**: bit-extract operations emitted in reverse order
between the two XOR operands. Same XOR result; different
instruction sequence.

**Pattern**: mwcc schedules the bit-extracts in source-expression
order for `a ^ b`. If orig has bit14-extract before bit0-extract,
the source must be `bit0 ^ bit14` (with bit0 first lexically) for
the scheduler to emit bit14 first.

### Wrong:

```c
helper(self->f2.bit14 ^ self->f2.bit0, n);
```

Emits bit0-extract first, then bit14-extract — operands flipped
from orig.

### Right (matches orig):

```c
helper(self->f2.bit0 ^ self->f2.bit14, n);
```

Emits bit14-extract first (matches orig).

### Why

mwcc's instruction scheduler reads source operands in
right-to-left order for some operators (likely to match the
"compute RHS first into a temp, then combine with LHS" lowering
strategy). For XOR specifically, the right operand's extract
emits first.

### Where surfaced

Brief 226 pilot pick `func_ov002_021f49d0`. First attempt with
`bit14 ^ bit0` emitted in reversed order; flipping to `bit0 ^
bit14` matched.

### General rule

When the orig has bit-extracts in a specific order, look at which
bit appears in the RIGHT operand position of the XOR — that's the
one that gets extracted first. The source XOR operand order must
put the first-extracted bit as the LEFT operand.

---

## Gotcha 5 — `if-then` vs early-return for `bmi` shape

**Symptom**: orig has `movs r1, r0; bmi .end`; mwcc with naive
early-return emits `cmp + bmi + movmi #X; popmi` (conditional
execution collapse).

**Pattern**: C-39a (sign-check + helper-reuse) requires BOTH (i)
helper2 declared to take `n` as a second arg AND (ii) if-then
control flow — NOT early-return.

### Wrong (collapses to predicated):

```c
if (n < 0) return 1;
helper2(arg, n);   /* unreached if n < 0 */
return 1;
```

mwcc collapses to:

```asm
movs r1, r0
movmi r0, #1
popmi {r4, pc}        ; <-- mwcc executed return-via-cond-pop
... helper2 setup ...
```

### Right (matches orig):

```c
if (n >= 0) {
    helper2(arg, n);
}
return 1;
```

mwcc emits the branched form:

```asm
movs r1, r0
bmi  .end            ; <-- branch instead of cond-execute
... helper2 setup ...
bl   helper2
.end:
mov  r0, #1
pop  {r4, pc}
```

### Why

mwcc's early-return-with-conditional-pop optimization fires when
the function body after the early-return is short. If-then form
forces the branch-around-body shape that preserves the orig.

### Where surfaced

Brief 226 worked examples (C-39a sign-check sub-shape). Variant
matrix found early-return collapses to conditional execution; only
if-then with `(n >= 0)` polarity matches.

---

## Gotcha 6 — `mask < 0xff` triggers C-1 predication

**Symptom**: a `value & MASK` expression where MASK is small (like
0x3 or 0x7) emits as `tst + movne/moveq` (predicated execution)
instead of the orig's branch-based test.

**Pattern**: mwcc treats `(x & SMALL_MASK) != 0` as a bit-test
candidate and emits the predicated form. Larger masks (≥ 0x100)
or different test forms can defeat this.

### Wrong:

```c
if ((self->f2 & 0x3) != 0) helper2();
```

Emits `tst r0, #3; bne` — orig may have a branch-based
test instead.

### Right (sometimes — context-dependent):

Use a bitfield struct: `unsigned short field2 : 2;` then `if
(self->f2.field2 != 0)`. The bitfield extract goes through
`lsl/lsr` instead of `tst`, matching orig's branch form.

### Why

mwcc's bit-test peephole detects `& MASK` patterns and emits
`tst`. The bitfield-extract path bypasses the peephole.

### Where surfaced

Brief 218 (C-37 → C-39 base recipe). The bitfield-struct trick
is the foundation of the entire C-39 sub-shape family.

---

## Gotcha 7 — arg-count tunes the temp register

**Symptom**: the body is right but the temp register for a
field load (e.g. `ldrh r1, [r0, #N]`) is one register lower or
higher than orig (orig uses r3, you get r1).

**Pattern**: mwcc's allocator chooses the temp register for a
short-lived value based on which arg-passing registers (r0-r3)
are "live" for the upcoming `bl`. Each pass-through arg shifts
the temp one register higher.

### Wrong (yields r1 temp)

```c
extern void helper1(struct Self *self);
extern void helper2(struct Self *self);

void func(struct Self *self) {
    if (self->f10) helper1(self);
    else helper2(self);
}
```

mwcc emits:

```text
push  {r3, lr}
ldrh  r1, [r0, #10]     <-- r1 (only r0 is live for call)
cmp   r1, #0
beq   .else
bl    helper1
pop
.else:
bl    helper2
pop
```

### Right (yields r3 temp — matches orig)

```c
extern void helper1(struct Self *self, int a, int b);
extern void helper2(struct Self *self, int a, int b);

void func(struct Self *self, int a, int b) {
    if (self->f10) helper1(self, a, b);
    else helper2(self, a, b);
}
```

mwcc emits:

```text
push  {r3, lr}
ldrh  r3, [r0, #10]     <-- r3 (r0, r1, r2 live for call)
cmp   r3, #0
...
```

### Why

mwcc avoids allocating temp registers to regs that hold incoming
args meant for an upcoming call. With 3 args (r0, r1, r2), the
allocator skips to r3. With 1 arg (just r0), r1 is free for
temp.

### Where surfaced

Brief 241 (C-42 sub-shape drain). Forced register allocation for
`021eeea4`, `02242e30`, `022951a4` via arg-count tuning.

### Discovery: count helper args first

When the orig disasm shows a temp at r2 or r3, count the args the
helper(s) call with. The orig signature dictates the allocator
state. A 0-arg helper means r1 is free for temp; 3-arg keeps r1
and r2 live, pushing temp to r3.

---

## Pre-flight checklist for new picks

Before writing the C source for a new pick:

1. **Read orig disasm carefully** — note every instruction count,
   every condition code, every pool word.
2. **Identify pool slot kinds** — relocation (data ptr or fn ptr)
   vs literal constant.
3. **Check for tail-call** (`bx ip` or direct `b helper`) vs
   regular `bl + pop`. Tail-call requires no callee-saved register
   usage; regular call needs a stack frame for state.
4. **Look at ternary tails** — note the order of conditional
   moves to determine ternary polarity (gotcha 3).
5. **Check for XOR ordering** — if orig has bit-extracts in a
   specific sequence, match the source XOR operand order (gotcha
   4).
6. **Note any extra `moveq r0, #0`** in the orig before an
   `popeq` — orig may NOT have it, requiring the `return r`
   pattern (gotcha 1).
7. **For helper args that look like data symbols** — use
   `extern char data[]` form (gotcha 2).
8. **For sign-check + helper-reuse** — use if-then NOT
   early-return (gotcha 5).
9. **Count helper args first** — match the orig's temp-register
   index by setting pass-through arg count: r1 temp → 0-1 args,
   r2 temp → 2 args, r3 temp → 3 args (gotcha 7).

If a pilot pick ships at 80-95% fuzzy on first attempt, walk
through this checklist before iterating.

---

## Contributing

When a new gotcha surfaces during a worked-example ship, append
it here with:

- The symptom (what byte-diff appears)
- The pattern (what source mistake causes it)
- Wrong/Right C snippets with disasm
- Why mwcc behaves this way
- Where surfaced (brief number + pick)

This file becomes the canonical pre-flight reference for the
decomper. Brief 238+ should read this before each pilot.

## Cross-references

- `docs/research/codegen-walls.md` — full wall taxonomy
- `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md`
  — gotchas 4 + 5 surfaced
- `docs/research/brief-229-c39c-d-pilots-and-c38-nonleaf.md` —
  gotcha 3 surfaced
- `docs/research/brief-237-hard-tier-landscape-survey.md` —
  gotchas 1 + 2 surfaced
