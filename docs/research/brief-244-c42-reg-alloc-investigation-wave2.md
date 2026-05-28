[//]: # (markdownlint-disable MD013 MD041)

# Brief 244 — C-42 reg-alloc investigation, wave 2 (patterns 6-10)

**Status:** 5 of 5 patterns LOCKED. Brief 243's 5 NEW reg-alloc
sub-patterns all yielded to brief 242's methodology (variant
matrix + gotcha catalog). No P-14 needed for these patterns.

## Headline

| Pattern | Picks | Recipe | Gotcha |
|---|---:|---|---|
| **6** — pointer-double-store | 2 | `int func` returning helper ret + early-exit on `if (r)` | gotcha 8 family (kept r0 live) |
| **7** — switch-on-ldrh | 1 | 2-arg pass-through | gotcha 7 direct |
| **8** — stmia fusion miss | 1 | `*.legacy_sp3.c` routing (mwcc 1.2/sp3 doesn't fuse) | gotcha 10 |
| **9** — loop counter/index | 2 | declare loop var FIRST (before counter) | NEW gotcha 11 |
| **10** — indexed-ldr | 1 | 3-arg pass-through | gotcha 7 direct |

7 worked examples shipped. recipe-gotchas.md extended by 1 new
gotcha (11) + 2 more diagnostic-order steps.

The key insight: brief 243 reported "swapping declaration order
didn't help" for pattern 9, but the form that actually works is
declaring the loop variable as a SEPARATE statement BEFORE the
counter. Brief 243 likely used a combined or post-counter form.

## (6) Pointer-double-store — `func_02062438` + `func_02062468`

### Orig (target)

```text
push  {r4, lr}
mov   r4, r1                ; r4 = arg1 (saved)
bl    helper
cmp   r0, #0
popne {r4, pc}              ; if helper != 0: return
ldr   r0, [r4]              ; 1st reload to r0 (02062438)
                            ; or r1 (02062468 — sibling)
mov   r1, #K1
str   r1, [r0, #12]
ldr   r1, [r4]              ; 2nd reload to r1 (different reg!)
mov   r0, #K2
str   r0, [r1, #16]
pop   {r4, pc}
```

### Recipe

```c
int func_02062438(int arg0, struct Target **pp) {
    int r = func_02064864();
    if (r) return r;
    (*pp)->f12 = 2;
    (*pp)->f16 = 0;
    return 0;
}
```

The `int r = helper(); if (r) return r;` form keeps r0 "live"
across the field writes. When mwcc emits the 2nd reload, r0 is
considered allocated (returned at end as `return 0`), forcing
the reload to a different register.

### Variant matrix

| Variant | Result |
|---|---|
| v0: `void func(...)` + natural body | ✗ both reloads to r0 |
| v1: `int func(...)` returning helper ret + `return 0` | ✓ matches |

## (7) Switch-on-ldrh — `func_ov002_02241bc4`

### Orig (target)

```text
push  {r3, lr}
ldrh  r2, [r0, #12]        ; r2 (orig)
cmp   r2, #1
beq   .case1
cmp   r2, #2
beq   .case2
b     .default
.case1: bl helper; pop
.case2: mov r0, #1; pop
.default: mov r0, #1; pop
```

### Recipe (gotcha 7)

```c
int func(struct Self *self, int arg) {
    switch (self->f12) {
    case 1: return helper(self, arg);
    case 2: return 1;
    default: return 1;
    }
}
```

2-arg pass-through forces the switch temp from r1 → r2.

## (8) Stmia fusion — `func_0208b0a4`

### Orig (target)

```text
push  {r4, r5, r6, lr}
mov   r6, r0
mov   r5, r1
mov   r4, r2
bl    helper
str   r0, [r6]              ; 4 separate strs (no fusion!)
str   r5, [r6, #4]
str   r4, [r6, #12]
mov   r0, #0
str   r0, [r6, #8]
pop
```

### Recipe (gotcha 10 — `.legacy_sp3.c` routing)

```c
/* file: src/main/func_0208b0a4.legacy_sp3.c */
void func(struct Self *self, int arg1, int arg2) {
    self->f0 = helper(self);
    self->f4 = arg1;
    self->f12 = arg2;
    self->f8 = 0;
}
```

mwcc 2.0/sp1p5 fuses `str r0, [r6]` + `str r5, [r6, #4]` into
`stm r6, {r0, r5}` (10 insns total). mwcc 1.2/sp3 does NOT
fuse (11 insns matching orig).

This was misclassified by brief 243 — it's a routing-tier
issue, not a reg-alloc divergence. Same family as brief 242's
sub-shape 4.

## (9) Loop counter/index — `func_ov002_021bc68c` + `func_ov002_021bbd14`

### Orig (target, 021bc68c)

```text
push  {r4, r5, r6, lr}
mov   r5, #0           ; count = 0 (r5)
mov   r6, r0           ; self saved
mov   r4, r5           ; i = 0 (r4, derived from r5)
loop:
  mov r0, r6
  mov r1, r4           ; i passed to helper
  bl helper(self, i)
  cmp r0, #0
  add r4, #1           ; i++
  addne r5, #1         ; count++ if helper != 0
  cmp r4, #5
  blt loop
mov r0, r5             ; return count
pop
```

### Recipe (NEW gotcha 11 — declaration order)

```c
int func(int self) {
    int i;             /* declare i FIRST (gets r4) */
    int count = 0;     /* count declared SECOND (gets r5) */
    for (i = 0; i < 5; i++) {
        if (helper(self, i)) count++;
    }
    return count;
}
```

### Wrong form (brief 243 likely tried)

```c
int func(int self) {
    int count = 0;
    int i;             /* count declared first → count gets r4 */
    ...
}
```

### Why declaration order matters

mwcc allocates callee-save registers (r4, r5, r6, ...) in
declaration order. First-declared local gets r4, second gets r5,
etc. The init-expression doesn't reorder allocation — only the
textual declaration order.

Brief 243 reported "swapping declaration order didn't help"
but probably tested with both vars declared with inits on the
same line. The fix requires a SEPARATE uninitialized
declaration of the loop variable BEFORE the counter.

### Variant matrix

| Variant | Result |
|---|---|
| v0: `int count = 0; int i;` | ✗ count in r4, i in r5 |
| v1: `int i; int count = 0;` | ✓ i in r4, count in r5 |

## (10) Indexed-ldr — `func_ov002_022b36f0`

### Orig (target)

```text
push  {r3, r4, r5, lr}
mov   r5, r0
mov   r4, r1
add   r3, r5, r4, lsl #2  ; r3 = indexed addr (orig)
ldr   r3, [r3, #52]
cmp   r2, r3
beq   .skip
bl    helper(self, idx, arg2)
.skip:
add   r0, r5, r4, lsl #2
mov   r1, #60
str   r1, [r0, #60]
pop
```

### Recipe (gotcha 7)

```c
void func(struct Self *self, int idx, int arg2) {
    if (arg2 != self->tbl_a[idx]) {
        helper(self, idx, arg2);     /* 3-arg helper */
    }
    *(int *)((char *)self + idx*4 + 60) = 60;
}
```

3-arg helper signature keeps r0, r1, r2 "live" for the call,
forcing the indexed-temp to r3 instead of reusing r0.

## Sibling generalization

| Pattern | Picks total | Shipped this brief | Sibling picks for brief 245 |
|---|---:|---:|---|
| 6 | 2 | 2 | — (all 2 shipped) |
| 7 | 1 | 1 | — |
| 8 | 1 | 1 | + cluster of `stmfd+sub sp` thunks |
| 9 | 4 | 2 | 0201a5c0, 020b4248 (different shapes, not pure pattern 9) |
| 10 | 1 | 1 | — |

The pattern 9 cluster has 2 picks that match perfectly (021bc68c,
021bbd14) and 2 that brief 243 grouped but are actually different
shapes (0201a5c0 has a bitmask-OR loop; 020b4248 has a ldr-bound
loop without a counter accumulator). Those need separate analysis.

## Falsification matrix summary

| Pattern | Gotcha 7 | Gotcha 8 family | Gotcha 10 | Gotcha 11 |
|---|:---:|:---:|:---:|:---:|
| 6 | ✗ | **✓** | ✗ | ✗ |
| 7 | **✓** | ✗ | ✗ | ✗ |
| 8 | ✗ | ✗ | **✓** | ✗ |
| 9 | ✗ | ✗ | ✗ | **✓** |
| 10 | **✓** | ✗ | ✗ | ✗ |

Each pattern has a different lever. Brief 242's 4-step
diagnostic order successfully decomposes them.

## Recipe-gotchas.md extensions

- Added **gotcha 11** — local-variable declaration order picks
  callee-save register
- Added 2 more steps to "Pre-flight: when reg-alloc divergence
  appears":
  - Step 5: "int func + return helper_ret" keeps r0 live post-bl
  - Step 6: Swap local declaration order (gotcha 11)

## Verdict

- **NO P-14 needed** for any of brief 243's 5 patterns.
- The remaining 130+ deferred picks from brief 243 likely
  contain these same patterns + variations — brief 245 can
  drain them now that the gotchas are catalogued.
- Combined with brief 242's gotchas (8, 9, 10), brief 244's
  gotcha (11), and the original gotchas 1-7, the recipe-
  gotchas.md catalog (11 gotchas total) should handle the
  vast majority of C-42 reg-alloc escapes going forward.

## Shipped worked examples (7)

`src/main/`:
- `func_02062438.c` — pattern 6
- `func_02062468.c` — pattern 6 sibling
- `func_0208b0a4.legacy_sp3.c` — pattern 8

`src/overlay002/`:
- `func_ov002_02241bc4.c` — pattern 7
- `func_ov002_021bc68c.c` — pattern 9
- `func_ov002_021bbd14.c` — pattern 9 sibling
- `func_ov002_022b36f0.c` — pattern 10

## Cross-references

- `docs/research/brief-243-c42-opportunistic-drain-wave3.md` —
  original surfacing of patterns 6-10
- `docs/research/brief-242-c42-reg-alloc-divergence-investigation.md`
  — methodology + gotchas 8/9/10
- `docs/research/recipe-gotchas.md` — gotcha catalog (now 11
  gotchas + 6-step diagnostic order)
- `docs/research/codegen-walls.md` — C-42 taxonomy
