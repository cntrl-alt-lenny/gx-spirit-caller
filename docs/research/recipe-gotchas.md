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

## Pick-selection strategy: sibling-family drains beat random cohort picks

Brief 247 surfaced an empirical pattern across 5 C-42 waves:

| Wave | Brief | Picks | C-yield | Profile |
|---|---|---:|---:|---|
| 1 | 238 | 30 | 81% | mixed cohort, post-detector |
| 2 | 240 | 8 | 53% | mixed cohort, surfaced reg-alloc wall |
| 3 | 243 | 22 | 71% | mixed cohort with novel sub-shapes |
| 4 | 245 | **33** | **94%** | **17 tag6 siblings + 9 sp3 siblings** |
| 5 | 247 | 19 | 73% | varied main thunks |

Wave 4 hit 94% yield because it leaned on two high-homogeneity
families:

- **tag6 bitfield siblings** — 17/17 ships, all via gotcha 7
- **sp3 routing siblings** — 9/10 ships, all via gotcha 10

Wave 5 hit 73% with 4 NEW escape classes in 19 attempts. The
recipe library wasn't the bottleneck — pick selection was.

### Lesson

The yield-driver at this stage is **sub-shape homogeneity**, not
catalog breadth. When the cohort still has 400+ undrained picks,
prefer to drain sibling families completely before sampling
diverse shapes. This:

1. Amortizes the gotcha-7-style fiddling across many ships
2. Surfaces sub-shape boundaries (when a "sibling" needs a
   different recipe, you've found a new sub-shape)
3. Keeps the C-yield rate above the 85% target

When the cohort thins out and only diverse shapes remain, expect
yield to drop back to 70-75% — that's the natural floor for
varied pilots, not a recipe regression.

### When to pivot

If the next wave hits sustained <70% yield and the gotcha
catalog has stabilized for 2+ waves, the cohort is exhausted of
high-homogeneity targets. Pivot to a different wall class
(brief 241 cluster scout output for candidates).

---

## Quick reference: symptom → gotcha

When the orig disasm shows a near-miss vs your build, scan this
table FIRST. The mapping says which gotcha + variant to apply.
Detailed write-ups follow below.

| Symptom (orig vs mine) | Likely gotcha | Variant |
|---|---|---|
| Wrong temp reg: orig r1, mine r0 | 7 | 1-arg pass-through |
| Wrong temp reg: orig r2, mine r1 | 7 | 2-arg pass-through |
| Wrong temp reg: orig r3, mine r1/r2 | 7 | 3-arg pass-through |
| Wrong stack-save reg: orig r4, mine r5 (or vice versa) | 11 | swap declaration order |
| Pool/literal swap: orig r1 holds pool, mine r0 | 8 / 12 | `return LIT` (8), or trailing helper takes LIT (12) |
| Pool/literal swap with int-return body | 9 | int-return + both incoming args to helper |
| stmfd + sub sp prologue mismatch | 10 | `.legacy_sp3.c` filename suffix |
| `str + str` pair instead of `stmia` fusion | 10 | `.legacy_sp3.c` (mwcc 1.2/sp3 doesn't fuse) |
| Predication collapse (orig has `bne`, mine has `moveq + popeq`) | (N2 variant) | switch + case + default form |
| Contiguous `==`-chain fused to range check (orig `cmp #N; cmpne #N+1; cmpne #N+2`, mine `mvn/sub; cmp #2; movls`) | (switch shape) | `switch(n){case N: case N+1: case N+2: …}` defeats mwcc -O4 range-fusion (brief 254 `2b07f982`) |
| Extra `moveq r0, #0` before `popeq` in mine | 1 | `return r;` with named local |
| Wrong cond predicate (orig `movge`, mine `movlt`) | 3 | swap ternary polarity |
| Wrong sub/cmp opcode (orig `sub+cmp+movle`, mine `subs+movmi`) | (clamp form) | `r <= 0` not `r < 0` |
| Wrong XOR operand order | 4 | swap `a ^ b` to match orig schedule |
| Predicated tail collapse for sign-check | 5 | `if-then` not early-return |
| C-1 predication (orig has bitfield, mine has `tst`) | 6 | use bitfield-extract not `& MASK` |
| Pool-arg loaded with extra `ldr` deref | 2 | `extern char data[]` not `extern int data` |
| Stack-arg loads `ldrh`, orig has `ldr` (stack-local struct builder) | 13 | type stack value args `int`, narrow on the `strh` store |
| Bit-0 table index `table[bit0]`: pools/index regs all shifted + orig has redundant `and #1` | 14 | 3-arg helper `helper(self, arg1, v)` + write index `(self->bit0 & 1)` |
| `global->ptr->field` chase temps land low (r1/r2) vs orig r3/ip (or global r1 vs orig r0) | 15 | match orig's incoming-arg liveness: forward the args orig forwards, or declare `void` if it takes none |
| Orig has `and #0xff` on a provably-small value; mine folds it away | 16 | route through an `unsigned char` local/cast (the type forces it; explicit `& 0xff` does not) |
| Orig keeps a dead store (`p->f=x; p->f=y`) or re-reads a just-stored value; mine elides/CSEs it | 17 | mark the field(s) `volatile` (+ a delayed-temp for any reused load) |
| Const-compare `a0==K\|\|a0==K+n`: mine predicates (`moveq#1/movne#0`), orig branches (`bne` to shared `return 0`) | (switch) | `switch(a0){case K: case K+n: return 1;} return 0;` (defeats predication; brief 266) |
| Bit/byte field-insert: orig `lsl#K; orr rN, lsr#M`, mine optimal `orr rN, lsl#pos` | 16 + shift-form | u8/u16-cast the value + write the insert as `((x<<K)>>M)`, not value-level `<<pos` |
| Orig `lsl #K; lsr #K`, mine `and #mask` (byte/halfword zero-extend) | (P-1) | permanent — no shift form defeats it; skip-and-document |

Steps 1-4 of the 6-step diagnostic order (at the bottom of the
file) also serve as a fallback when the table doesn't match.

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

## Gotcha 8 — return-value reuses the last literal write

**Symptom**: a function writes a literal value to a struct/global
field and orig "happens to" return that same value via the same
register the field write used. Your `void`-returning version
allocates a different register for the field write.

**Pattern**: when a function ends with `field = LIT; return;`,
mwcc 2.0 picks the first-free register for the LIT write (often
r0). When the function returns that same LIT via `return LIT;`,
mwcc CSE's the move — the same `mov r0, #LIT` does double duty
as the field-write source AND the return value. This forces
*other* allocations (like a pool address) to use a different
register.

### Wrong (void return, pool in r0)

```c
extern struct GlobalState data;
extern void helper(void);
void func(void) {
    helper();
    data.f3316 = 0;
    data.f3332 = 1;
}
```

mwcc emits:

```text
push  {r3, lr}
bl    helper
ldr   r0, [pc, #...]   <-- r0 = pool
mov   r1, #0
str   r1, [r0, #0xcf4]
mov   r1, #1
str   r1, [r0, #0xd04]
pop
```

### Right (int return matching last literal, pool in r1)

```c
extern struct GlobalState data;
extern void helper(void);
int func(void) {
    helper();
    data.f3316 = 0;
    data.f3332 = 1;
    return 1;          /* same as last field write */
}
```

mwcc emits:

```text
push  {r3, lr}
bl    helper
ldr   r1, [pc, #...]   <-- r1 = pool (forced!)
mov   r0, #0
str   r0, [r1, #0xcf4]
mov   r0, #1            <-- same instruction for write + return
str   r0, [r1, #0xd04]
pop
```

### Where surfaced

Brief 242 (C-42 reg-alloc divergence sub-shape 2). The `return 1`
hint shifts the pool address allocation to r1.

---

## Gotcha 9 — int-return + both-args keeps r1 alive past bl

**Symptom**: in a 2-arg function (dst, src), orig uses r2 for a
short-lived u16 temp and r1 for a post-bl LIT load. Your version
puts the temp in r1 and the LIT in r0.

**Pattern**: mwcc allocates registers based on "what's live
across the bl". When the helper takes both incoming args
(`helper(dst, src)`) AND the function returns the helper's int
return, mwcc:

1. Sees r0 = helper return → live after bl → can't reuse for LIT
2. Sees r1 = src → live up to bl → can't reuse for u16 temp
3. Allocates r2 for the u16 temp (lowest-free that won't
   collide)
4. Reuses r1 for the LIT load (now-dead post-bl)

### Wrong (1-arg helper, void return)

```c
extern void helper(unsigned short *dst);
void func(unsigned short *dst, unsigned short *src) {
    *dst = *src;       /* mwcc puts u16 temp in r1 */
    helper(dst);
    *dst = 0x183e;     /* mwcc puts LIT in r0 */
}
```

### Right (both args + int return)

```c
extern int helper(unsigned short *dst, unsigned short *src);
int func(unsigned short *dst, unsigned short *src) {
    int r;
    *dst = *src;          /* mwcc puts u16 temp in r2 */
    r = helper(dst, src); /* r1 now committed to helper arg */
    *dst = 0x183e;        /* mwcc puts LIT in r1 (post-bl) */
    return r;
}
```

### Where surfaced

Brief 242 (C-42 reg-alloc divergence sub-shape 3). The
both-args + int-return combination shifts both the u16 temp and
the LIT load to the correct registers simultaneously.

---

## Gotcha 10 — `stmfd {lr} + sub sp #4` is a 1.2/sp3 routing tier

**Symptom**: a small function with prologue `stmfd sp!, {lr}; sub
sp, sp, #4` (8-byte align via explicit sub) is observed in orig
but mwcc 2.0/sp1p5 emits `push {r3, lr}` (8-byte align via dummy
r3 save).

**Pattern**: this is NOT a reg-alloc issue. mwcc 1.2/sp3 (the
"legacy_sp3" routing tier) emits the `stmfd; sub sp` shape while
mwcc 2.0/sp1p5 emits the `push {r3, lr}` shape. Route the file
through `*.legacy_sp3.c` to get the 1.2/sp3 compiler.

### Indicators

- `stmfd sp!, {lr}` (e92d4000) followed by `sub sp, sp, #4`
  (e24dd004)
- `ldmfd sp!, {pc}` (e8bd8000) epilogue (style A pop with pc)
- Function size typically 0x20-0x40 (very short thunk)

### Where surfaced

Brief 242 (sub-shape 4 of brief 240's reg-alloc escape). Brief
240 misclassified this as a reg-alloc divergence; brief 242
empirically showed it's a routing-tier mismatch.

The lesson: BEFORE assuming reg-alloc divergence, sweep all 8
mwcc tiers — sometimes the divergence is the wrong tier
entirely.

---

## Gotcha 11 — local-variable declaration order picks callee-save reg

**Symptom**: a function with multiple long-lived locals (a loop
index and a counter, for example) saves the wrong one to r4 vs r5.
Orig has counter in r5 + loop var in r4; mine has counter in r4
+ loop var in r5.

**Pattern**: mwcc allocates callee-save registers (r4, r5, r6, ...)
to long-lived locals in **declaration order**. The variable
declared FIRST gets r4, the next gets r5, etc. Saved function args
get the highest indices first (r5, r6 used for the saved args).

### Wrong (count declared first)

```c
int func(int self) {
    int count = 0;
    int i;
    for (i = 0; i < 5; i++) {
        if (helper(self, i)) count++;
    }
    return count;
}
```

mwcc emits:

```text
mov r4, #0     <-- count goes to r4
...
mov r5, r4     <-- i = 0 (from r4)
loop:
mov r1, r5     <-- i passed as arg
add r5, #1     <-- i++
addne r4, #1   <-- count++ if helper returned non-zero
cmp r5, #5
blt loop
mov r0, r4     <-- return count
```

### Right (i declared first)

```c
int func(int self) {
    int i;
    int count = 0;
    for (i = 0; i < 5; i++) {
        if (helper(self, i)) count++;
    }
    return count;
}
```

mwcc emits:

```text
mov r5, #0     <-- count goes to r5
...
mov r4, r5     <-- i = 0 (from r5)
loop:
mov r1, r4     <-- i passed as arg
add r4, #1     <-- i++
addne r5, #1   <-- count++ if helper returned non-zero
cmp r4, #5
blt loop
mov r0, r5     <-- return count
```

### Why

mwcc walks variable declarations in source order and assigns
callee-save register slots top-down. The first declaration claims
r4; subsequent ones get r5, r6, etc. The init-expression in the
declarator does NOT change the order — only the textual
declaration order matters.

### Where surfaced

Brief 244 (pattern 9 — loop counter/index reg-alloc, 2 picks:
021bc68c + 021bbd14). Brief 243 reported "swapping declaration
order didn't help" — but that brief was swapping inside a
combined declaration. The form that works is putting the loop
variable FIRST (as a separate declaration, before count).

### Discovery: read orig's `mov r5, #0; mov r4, r5` pattern

When orig has the init `mov rX, #0; mov rY, rX` (assigns 0 to one
reg then propagates to another), the FIRST register-assigned-zero
is the one whose source-declaration came first. Match by declaring
that variable first in the C source.

---

## Gotcha 12 — trailing-helper LIT-match for pool/literal swap

**Symptom**: the same pool/literal swap as gotcha 8, but the
function has a TRAILING helper call after the field write instead
of returning. Gotcha 8's `return LIT` trick doesn't apply because
the trailing bl trashes r0 before the return.

**Pattern**: if the trailing helper takes the same literal that
the field write uses, mwcc CSEs `mov r0, #LIT` across both the
field-write source AND the helper arg setup. The CSE forces the
pool to a non-r0 register.

### Wrong (pool ends up in r0)

```c
extern void helper1(int x);
extern void helper2(void);
void func(void) {
    helper1(1);
    data->f12 = 1;
    helper2();           /* helper2 takes 0 args */
}
```

mwcc emits:

```text
push  {r3, lr}
mov   r0, #1
bl    helper1
ldr   r0, [pc, #...]   <-- r0 = pool (wrong, orig has r1)
mov   r1, #1
str   r1, [r0, #12]
bl    helper2
pop
```

### Right (pool to r1)

```c
extern void helper1(int x);
extern void helper2(int x);  /* note: helper2 takes the LIT */
void func(void) {
    helper1(1);
    data->f12 = 1;
    helper2(1);           /* same LIT as field write */
}
```

mwcc emits:

```text
push  {r3, lr}
mov   r0, #1
bl    helper1
ldr   r1, [pc, #...]   <-- r1 = pool (matches orig)
mov   r0, #1           <-- CSEd: holds #1 for both str AND helper2
str   r0, [r1, #12]
bl    helper2
pop
```

### Why

mwcc's allocator sees that r0 must hold #1 going into the bl. It
can't use r0 for the long-lived pool because the bl needs r0 = 1.
The pool gets allocated to r1.

### Where surfaced

Brief 248 pattern N1 (`func_020a6b30`). Generalizes gotcha 8 to
the trailing-call case.

### When to apply

If the orig has the pattern `helper1(K); data->f = K; helper2();`
and your build puts the pool in r0, change the helper2 signature
to take the same K. Compatible with any helper that ignores
extra args.

---

## Gotcha 13 — int-typed stack args for the stack-local struct builder

**Symptom**: a wrapper that builds a packed struct on the stack
from its arguments and passes `&local` to a helper matches the orig
*except* the stack-passed value args load with `ldrh` (halfword)
where the orig has `ldr` (word). The `add rN, sp, #0` that
materializes `&local`, and the `strh` field writes, are already
correct — only the incoming-arg load widths diverge.

**Pattern**: mwcc loads an incoming argument with the width of its
*declared type*. The orig declares the value args wider than the
struct field (typically `int`/word) and lets the narrowing to `u16`
happen on the `strh` store. Declaring the args as the narrow field
type (`u16`/`unsigned short`) makes mwcc emit `ldrh` instead.

### Wrong (yields `ldrh` on the stack args)

```c
typedef unsigned short u16;
struct P { u16 f0; u16 f2; u16 gap4; u16 f6; u16 f8; u16 gap10; };
extern void helper(int a0, int a1, int a2, void *p);

void f(int a0, int a1, int a2, u16 a3, u16 A, u16 B, u16 C) {
    struct P local;
    local.f0 = a3; local.f2 = A; local.f6 = B; local.f8 = C;
    helper(a0, a1, a2, &local);
}
```

mwcc loads the stack args A/B/C with `ldrh [sp, #N]` — a 3-of-13
instruction delta vs orig's `ldr` (≈69% fuzzy).

### Right (matches orig — stack value args `int`)

```c
void f(int a0, int a1, int a2, u16 a3, int A, int B, int C) {
    struct P local;
    local.f0 = a3;            /* r3 reg arg -> strh */
    local.f2 = A;             /* int stack arg -> ldr, narrowed on strh */
    local.f6 = B;
    local.f8 = C;
    helper(a0, a1, a2, &local);
}
```

mwcc loads A/B/C with `ldr` (word), narrows to `u16` on the `strh`
store, and emits `add r3, sp, #0` mid-write — byte-identical to orig.

### Why

The arg's declared width drives the load instruction (`ldr` vs
`ldrh`), independent of how it's later stored. The struct gaps must
be explicit `u16` pad fields so the writes land at the orig's
offsets (0/2/6/8 with gaps at 4/10). The `&local` materialization is
*not* the issue — it reproduces under any of these forms.

### Where surfaced

Brief 249 deferred Family 5 (`func_ov016_021b3560` + 3 ov016/17/19
siblings) at 69% fuzzy with `u16` args; brief 250 found the
arg-width coercion and classified it as **C-43** (codegen-walls).
One recipe drains all 4 family members.

---

## Gotcha 14 — bit-0-indexed table lookup: 3-arg helper + explicit `& 1`

**Symptom**: a C-39 bit-0 extract used as a strided-table index
(`table[self->bit0]`) ships ~44% with TWO divergences at once — the
index/pool registers are all shifted (orig field→ip, pools→r2/r3;
mine field→r2, pools→r0/r1), AND the orig has a redundant
`and rN, rN, #1` after the `lsl#31;lsr#31` extract that your build
omits.

**Pattern**: two independent levers, both needed.

1. **Reg-alloc**: the orig passes the table value as a 3rd arg to a
   tail helper, `helper(self, arg1, v)`. Declaring the helper with 3
   args keeps `self` (r0) + `arg1` (r1) live across the index
   computation, so mwcc spills the index into `ip` and the pools into
   `r2`/`r3`, landing the loaded value in `r2` (= arg2). A 2-arg
   helper frees r0/r1 and mwcc uses them for the index (the miss).
2. **Redundant mask**: writing the index as `(self->bit0 & 1)` makes
   mwcc emit the otherwise-redundant `and rN, rN, #1` the orig has.

### Wrong (2-arg helper, no mask → 44% miss)

```c
int v = *(int *)(base + self->bit0 * 0x868);
if (v == 0) return 0;
return helper(self, v);             /* frees r1 → index lands in r0/r1 */
```

### Right (matches orig — byte-identical)

```c
struct S { unsigned short f0; unsigned short bit0:1; unsigned short rest:15; };
extern char base[];
extern int helper(struct S *self, int arg1, int v);

int f(struct S *self, int arg1) {
    int v = *(int *)(base + (self->bit0 & 1) * 0x868);  /* `& 1` → redundant `and #1` */
    if (v == 0) return 0;
    return helper(self, arg1, v);                       /* 3 args → index to ip/r2/r3 */
}
```

### Why

The redundant `& 1` on a 1-bit bitfield is a no-op in C, but mwcc
emits the `and #1` faithfully. The 3-arg helper is the gotcha-7
mechanism applied to a table-index temp: live incoming args reserve
r0/r1, pushing the temp computation to the scratch/high registers.

### Where surfaced

Brief 255 deferred the `db973` family + relatives (~11 ov002 picks)
as a resister; brief 256 found both levers and classified it as
**C-39f** (codegen-walls). Pilot `func_ov002_02205508` byte-identical.

---

## Gotcha 15 — global-ptr-chase: match the orig's incoming-arg liveness

**Symptom**: a function that chases `global -> ptr -> field` (one or
more pool/pointer indirections) before a bit-extract ships at 40-70%
because the chase temps land in low registers (r1/r2 / r1) where orig
has high ones (r3/ip / r0).

**Pattern**: this is gotcha 7's mechanism (arg liveness controls temp
allocation) applied to a pointer chase. The chase temps occupy
whatever registers are NOT held by live incoming args. So the fix is
to reconstruct the function's EXACT incoming-arg signature:

- If the orig tail-forwards args to a helper (`return helper(arg0,
  arg1, arg2)`), **declare and forward them** — keeping r1/r2 live
  pushes the chase to r3/ip.
- If the orig takes NO args (loads a global into r0 and reuses it),
  **declare the function `void`** — freeing r0 lets the global land in
  r0 (lowest-free) and be reused. A stray live arg pushes it to r1.

### Wrong (chase lands low)

```c
int f(int arg0) {                       /* missing the forwarded args */
    struct Inner *p = g.ptr;            /* global->ptr */
    if (arg0 == (p->f2.bit0 ^ p->f2.bit14))
        return helper(arg0, 0, 0);      /* r1/r2 dead -> chase to r1/r2 */
    return 0;
}
```

### Right (chase to r3/ip — matches orig)

```c
int f(int arg0, int arg1, int arg2) {
    struct Inner *p = g.ptr;
    if (arg0 == (p->f2.bit0 ^ p->f2.bit14))
        return helper(arg0, arg1, arg2); /* forwarded args keep r1/r2 live */
    return 0;
}
```

### Why

The chase pointer/field temps are computed before the tail call. mwcc
allocates them to the lowest-free registers; the incoming args that
are live until the call reserve r0/r1/r2, so the chase spills to r3/ip.
Match the orig's live-arg set and the registers fall into place.

### Where surfaced

Brief 259 deferred `0223ba28` (43%) + `02273b54` (69%) as a
global-chase reg-alloc class; brief 260 recovered both byte-identical
and classified it **C-39g** (codegen-walls). Distinct from the CSE
field-temp P-11 plateau (gotcha-less): there the helper's args are all
self-derived, so r1/r2 are unavoidably free and there is no lever.

---

## Gotcha 16 — `unsigned char` type forces a redundant `& 0xff`

**Symptom**: orig keeps an `and rN, rN, #0xff` on a value the
compiler can prove is already < 256 (e.g. `(cond) + 2`, a small
runtime-packed field); your build folds the mask away, so you are one
instruction short in an arg-packing or byte-pack sequence.

**Pattern**: mwcc range-analyses the expression and drops a provably-
redundant `& 0xff`. An explicit `(x & 0xff)` in C does NOT help — mwcc
still proves `x < 256` and folds it. The lever is the **type**: route
the value through an `unsigned char` local/cast, so the byte truncation
is part of the value's type and mwcc materialises it as `and #0xff`.

### Wrong (mask folded away)

```c
int packed = ((((g.fcec == bit0) + 2) & 0xff) << 4) | 1;  /* & 0xff folds */
helper(a, b, (u16)packed, 0);
```

### Right (u8 type forces `and #0xff`)

```c
unsigned char t = (g.fcec == bit0) + 2;   /* the TYPE forces the mask */
helper(a, b, (u16)((t << 4) | 1), 0);
```

### Why

`(x & 0xff)` is a value-level mask the optimiser may prove redundant.
An `unsigned char` object has a width; assigning to it (or casting to
it) is a truncation mwcc emits as `and #0xff` even when the source
value is provably small. The `(u16)`/`(u8)` *type* survives where the
explicit `& 0xff` *expression* is folded.

### Where surfaced

Brief 262 hard-tail triage — arg-bit-packing pick `func_ov002_02231f4c`
(byte-identical with the u8 cast; 22/22). Likely also recovers brief
257's byte-pack mask-fold class (`021f4d3c`).

Brief 266 also used it for byte-FIELD inserts: `021ac508`
(`(f4 & ~0xff0000) | ((u8)a1 << 16)`) needs the u8 cast to keep the
`and #0xff` orig has (the `<< 24` would otherwise discard the high bits
and let mwcc fold the mask).

---

## Gotcha 17 — `volatile` to keep a dead store / literal re-read

**Symptom**: orig writes a field twice (`p->f = x; p->f = y;` — the
first store dead) or re-reads a just-stored value (`p->f = 0;
p->g = p->f;` — re-loading the 0), but your build elides the dead store
or CSEs the re-read (it knows the value), shipping a few instructions
short.

**Pattern**: mwcc's dead-store elimination + load-after-store CSE are
on at `-O4`. The orig was compiled from source where these stores /
loads could not be optimized away — almost always because the field is
`volatile` (memory-mapped or hardware-observed state). Declaring the
field(s) `volatile` makes mwcc emit every store and every load
verbatim, in order.

### Wrong (mwcc elides / CSEs)

```c
struct S { int f0, f4; };
void f(struct S *p) { p->f4 = 0; p->f0 = p->f4; }   /* mwcc: str 0; str 0 (no reload) */
```

### Right (volatile preserves the re-read)

```c
struct S { volatile int f0, f4; };
void f(struct S *p) { p->f4 = 0; p->f0 = p->f4; }   /* str 0; ldr f4; str -> matches orig */
```

For a dead double-store, mark the doubly-written field `volatile`. Note
the order/reg-alloc may still need a nudge — a value reused across the
dead store wants a single load held in one register; declare a temp at
block top and assign it *after* the preceding statement (C89 forbids a
mid-block declaration) so the load lands where orig has it.

### Where surfaced

Brief 266 frameless-leaf tail: `02092614` (literal re-read, volatile
struct, 12/12 byte-identical) and `020a6d94` (dead double-store +
`f24` re-load, volatile `f40`/`f24` + a delayed temp for `f32`, 12/12).

---

## Pre-flight: when reg-alloc divergence appears

mwcc's register allocator considers what's "live across the bl"
when picking temp registers. Apply in order:

1. **Try all 8 tiers first** (gotcha 10). Sometimes the
   "wrong reg" is actually a wrong-tier symptom — especially if
   mwcc 2.0/sp1p5 emits `stmia` fusion that orig lacks (brief 244
   pattern 8).
2. **Count helper args** (gotcha 7). Adjust function signature
   to push the temp to the orig's register.
3. **Make the return type match the last literal write**
   (gotcha 8). Useful when the function writes a literal and
   the return value would naturally hold that literal.
4. **Combine int-return + both-args** (gotcha 9). When the
   helper takes the function's args, returning the helper's
   result forces a 3-register live set across the bl.
5. **`int func + return helper_ret` keeps r0 live post-bl**
   — useful when the body has 2 store-blocks that each reload a
   pointer from the same source; the live r0 forces the 2nd
   reload to a different register (brief 244 pattern 6).
6. **Swap local declaration order** (gotcha 11). When the
   divergence is on callee-save registers (r4/r5/r6), the source-
   order of variable declarations dictates allocator order.
7. **Trailing-helper LIT-match** (gotcha 12). For sub-shape 2
   patterns with a trailing bl after the field write, make the
   helper take the same literal as the field write so mwcc CSEs
   r0 across both.

If none of (1)-(7) work, the divergence may be a genuine
allocator quirk — file under wall class P-14 or similar (no
known recipe).

## Gotcha 18 — dotted compiler symbols + overlay-overlap aliasing

**Symptom.** A guard/data global whose address `objdiff` displays as a
dotted compiler symbol — e.g. `.p__sinit_ov003_021cf114` (`__sinit` =
MWCC static-init routine; `.p__sinit` = its pointer word). The leading
dot + embedded dots make it an invalid C identifier; the family looks
"blocked."

**Reality.** It is almost always **overlay overlap**: a *different*
overlay's symbol sharing the same address (the two overlays are never
resident together). Check `config/<region>/.../<ovN>/relocs.txt`:
`from:… to:0xADDR module:overlay(N)` names the module `dsd` actually
resolves the reference to. The gap-obj reloc carries the **local** name
(`data_ovN_<addr>`), a clean C identifier already `.global`-defined in
that overlay's `bss/*.s` — reference **that**, not the dotted symbol.

**mwcc cannot reference a dotted symbol from C anyway.** GCC asm-labels
are NOT supported: `extern int x asm(".p__sinit_…");` errors —
mwcc reserves `asm("rN")` (post-decl) for *global register variables*
only. For a genuinely-dotted symbol with no dsd-local alias, add a
one-line `.global <clean_alias>` at that address in the overlay's
bss/data `.s` and reference the alias. **Falsification:** the gap-obj
`R_ARM_ABS32` symbol name IS the name to write; if `relocs.txt` says
`module:overlay(self)`, the local `data_*` symbol is correct and no
alias is needed. (Surfaced brief 270, the ov006 cf140 family.)

## Gotcha 19 — commutative-operand order controls pool + operand slots

**Symptom.** A commutative op (`orr`/`and`/`add`/`eor`) of two
pool-loaded globals matches every instruction *except* the operand
assignment (`orr r1, r2, r1, lsl #1` vs orig `orr r1, r1, r2, lsl #1`),
and/or the two pool `.word`s are in swapped order.

**Cause.** mwcc evaluates the source operands left-to-right; the first
operand referenced claims the first pool slot and the first temp
register. orig evaluated the **shifted / first-loaded** term first.

**Fix.** Write the term orig loads first on the left:
`(data_A << 1) | data_B`, not `data_B | (data_A << 1)`. **Falsification:**
swapping the source operand order swaps the `.word` order + the `orr`
register operands. (Surfaced brief 270, `func_ov006_021b4d68`.)

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
10. **Match return type to last literal write** — if orig writes
    a literal LIT to a field then returns, declare the function
    `int` returning `LIT` (gotcha 8). Forces other allocations
    to non-r0.
11. **Combine int-return + both-args** to push a u16 temp to r2
    in 2-arg ptr-copy thunks (gotcha 9).
12. **`stmfd; sub sp, #4` prologue → use `*.legacy_sp3.c`**
    routing (gotcha 10). Not a reg-alloc issue.
13. **Stack-local struct builder with `ldrh`/`ldr` arg-load
    mismatch** — type the stack-passed value args `int` (word),
    narrow to the field type on the `strh` store (gotcha 13).
14. **Bit-0-indexed table lookup `table[self->bit0]`** — use a
    3-arg helper `helper(self, arg1, v)` (keeps r0/r1 live → index to
    ip/r2/r3) and write the index `(self->bit0 & 1)` for the
    redundant `and #1` (gotcha 14).
15. **`global->ptr->field` chase temps land in low regs** — match the
    orig's incoming-arg liveness: forward the args orig forwards to
    the tail helper, or declare the function `void` if it takes none
    (gotcha 15).
16. **Orig keeps a redundant `and #0xff` your build folds** — route the
    value through an `unsigned char` local/cast; the type forces the
    mask where an explicit `& 0xff` is folded (gotcha 16).
17. **Orig keeps a dead store / literal re-read your build elides** —
    mark the field(s) `volatile`; add a delayed temp for any value
    reused across the dead store (gotcha 17).
18. **Guard global shows as a dotted `.p__sinit_*` symbol** — it is
    overlay overlap; check `<ovN>/relocs.txt` for the resolving module
    and reference the dsd-local `data_ovN_<addr>` (already in the bss
    `.s`), not the dotted name (gotcha 18).
19. **Commutative op of two pool globals has swapped operands** — write
    the term orig loads first on the left (`(A << 1) | B`), controlling
    pool + register slot order (gotcha 19).

If a pilot pick ships at 80-95% fuzzy on first attempt, walk
through this checklist before iterating.

---

## StyleA over-fire families (batch-drain recipe templates)

The over-fire StyleA-real tier (~614 lr-save picks, brief 263) is
dominated by a handful of regular helper-family shapes. Each ships
**byte-identical** from one source TEMPLATE on the `.legacy.c` routing
tier (mwcc 1.2/sp2p3 — the Style-A epilogue `stmfd {lr}; sub sp,#4 …
add sp; ldmfd {lr}; bx lr`; gotcha 10). Name the file `*.legacy.c`.
Brief 264 locked these on representative picks; brief 265+ batch-drains
a whole family by transcribing only the per-pick literal + arg-shape.

**Universal falsification test:** compile the template as `*.legacy.c`
(sp2p3) → predict byte-identical to the named orig. A `sp1p5` compile
emits the wrong epilogue (`push {r3, lr}` / `pop {r3, pc}`), which is
the symptom that flags the family in the first place.

### Family A — c94 5-arg helper (12 picks, `func_02094c94`)

`helper(CODE, a0, a1, 0, 0)` — a 5-arg call (r0=CODE, r1=a0, r2=a1,
r3=0, `[sp]`=0). Three arg-shapes, all from one source pattern:

```c
extern int func_02094c94(int code, int a0, int a1, int z3, int z4);

void f_1arg(int a0)          { func_02094c94(CODE, a0,  0, 0, 0); }  /* 02094cec */
void f_noarg(void)           { func_02094c94(CODE, -1,  0, 0, 0); }  /* 02094d80 */
void f_2arg(int a0, int a1)  { func_02094c94(CODE, a0, a1, 0, 0); }  /* 02094e0c */
```

Per pick: read the `mov r0, #CODE` literal (e.g. 22/24/32) and the
arg-shape from the disasm. Validated byte-identical on all three
(`02094cec` / `02094d80` / `02094e0c`).

### Family B — arg-shuffle (3 picks, `func_02094688`)

Forwards incoming args to the helper in a shuffled order, returns 0:

```c
extern int func_02094688(int x, int y, int z);
int f(int a0, int a1, int a2, int a3) { func_02094688(a2, a1, a3); return 0; }
```

Validated byte-identical on `02097ce8` (helper gets `(a2, a1, a3)`).

### Family C — `global = helper()` (2 picks)

```c
extern int helper(void);
extern int data_X;
void f(void) { data_X = helper(); }
```

Validated byte-identical on `0208f284` (`data_021a6338 =
func_0208ce48()`).

### Family D — 6-arg-stack helper (2 picks)

`helper(a0, a1, a2, 0, 0, a3)` — two stack args (`[sp]`=0, `[sp+4]`=a3):

```c
extern int helper(int a0, int a1, int a2, int z3, int z4, int a3);
void f(int a0, int a1, int a2, int a3) { helper(a0, a1, a2, 0, 0, a3); }
```

Validated byte-identical on `0206ed54`.

### Family E — two-void-call (base shape)

```c
extern void h1(int); extern void h2(int);
void f(void) { h1(K1); h2(K2); }
```

Validated byte-identical on `02094c70` (`func_02093c10(3);
func_02093d44(0);`).

### Family F — IRQ critical-section wrapper (21 picks, brief 268)

The NitroSDK critical section. `OS_DisableIrq()` returns the old IRQ
state; it must survive the inner work to reach `OS_RestoreIrq`, so mwcc
parks it in callee-saved **r4** — which IS the Style-A frame. The inner
`<work>` is ordinary per-pick C; this is a *shell* template.

```c
typedef int OSIntrMode;
extern OSIntrMode OS_DisableIrq(void);
extern OSIntrMode OS_RestoreIrq(OSIntrMode);

void f(struct Self *self) {
    OSIntrMode old = OS_DisableIrq();
    /* ... per-pick work ... */ if (self->f64 != 2) helper(&self->f9c);
    OS_RestoreIrq(old);
}
```

Validated byte-identical on `02091af4` (15/15). 21 regular
`[Disable, ≤1 helper, Restore]` shells; 140 `OS_RestoreIrq` callers
total share the shell with larger bodies.

### Family G — `func_020945f4` memset wrapper (8 picks, brief 268)

`func_020945f4` is the game's **memset** (`void(void *ptr, int val,
unsigned count)`). The wrappers call it + return; the surrounding body
varies, so this is a *recipe* (not a fixed source): transcribe the
`memset` call naturally + the per-pick body, route `.legacy.c`, add
gotcha 17 (`volatile`) where a re-read / dead-store tail appears.

```c
extern void func_020945f4(void *ptr, int val, unsigned count);
int f(int a0, unsigned a1, int a2, unsigned a3) {       /* 0206fc2c 16/16 */
    if (a3 < a1) { unsigned n = a1 - a3; func_020945f4((void*)a2, a0, n); a2 += n; }
    return a2;
}
```

Validated byte-identical on `0206fc2c` (16/16, conditional fill) and
`02097810` (14/14, fill + gotcha-17 re-read tail).

> **Not every StyleA leaf is a template.** The NO_BL leaf grab-bag
> (brief 268) does NOT batch — it is the brief-266 frameless-tail shape
> population *plus a frame*, coercible per-pick via the same gotchas
> (16 / 17 / `switch` / `volatile`-MMIO; e.g. MMIO bitfield `0208c98c`
> 16/16 via a `volatile` register). A fraction hit the P-15 reg-alloc
> plateau (frame-vs-frameless) — skip those. The **Copy32 VRAM-copy**
> family (`0208fd30/fd90/fe58`) is **P-15**, not a recipe. See
> [`codegen-walls.md`](codegen-walls.md) § P-15.

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
