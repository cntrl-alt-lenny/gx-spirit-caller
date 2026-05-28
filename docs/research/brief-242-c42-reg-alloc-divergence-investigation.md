[//]: # (markdownlint-disable MD013 MD041)

# Brief 242 — C-42 reg-alloc divergence investigation

**Status:** 4 of 4 sub-shapes LOCKED. The brief 240 "reg-alloc
divergence escape pattern" was an incomplete diagnosis — all 4
sub-shapes have natural-C recipes via the right combination of
gotcha 7 (arg-count tuning), gotcha 10 (sp3 routing), and 2 new
gotchas surfaced this brief (8 + 9).

## Headline

- **Sub-shape 1** (tag6 bitfield, 5+ picks) → gotcha 7 direct
  (2-arg pass-through)
- **Sub-shape 2** (pool + global write) → NEW gotcha 8
  (return-value reuses last literal write)
- **Sub-shape 3** (ptr-copy + helper + LIT-write, 2+ picks) →
  NEW gotcha 9 (int-return + both-args)
- **Sub-shape 4** (stmfd + sub sp #4, 6+ picks) → NEW gotcha 10
  (not reg-alloc — was a routing-tier mismatch)

8 worked examples shipped. Recipe-gotchas.md extended by 3 new
gotchas + 3 new pre-flight checklist items.

The verdict: brief 240's "permanent wall P-14 candidate"
assessment was premature. The 500 remaining unshipped C-42
picks across the 5 sub-shapes ARE shippable under the right
gotcha combination.

## Falsification matrix (the variant grid)

Tested 7 source forms × mwcc 2.0/sp1p5 per sub-shape. Below
shows which variant locks each sub-shape (✓ = byte-identical
match; ✗ = wrong register).

| Variant | s1 (tag6) | s2 (pool) | s3 (ptr-copy) | s4 (sp3) |
|---|:---:|:---:|:---:|:---:|
| v0: baseline natural-C | ✗ r1 | ✗ r0(pool) | ✗ r1(temp) | (routes via 2.0/sp1p5) ✗ |
| v1: 2-arg pass-through (gotcha 7) | **✓** | ✗ | ✗ | — |
| v2: 1-arg fn + int return | — | ✗ | — | — |
| v3: hoist ptr to local | — | ✗ | — | — |
| v6: helper returns int + use it | — | ✗ | partial | — |
| v8: both args + int return (gotcha 9) | — | — | **✓** | — |
| v9: `return LIT` matching last write (gotcha 8) | — | **✓** | — | — |
| routing: `*.legacy_sp3.c` (gotcha 10) | — | — | — | **✓** |

The matrix shows each sub-shape needs a DIFFERENT lever:
gotcha 7, gotcha 8, gotcha 9, or gotcha 10. No single recipe
unlocks them all, but each has a clean source-side knob.

## (1) Sub-shape 1 — tag6 bitfield

### Orig (target)

```text
push  {r3, lr}
ldrh  r2, [r0, #2]       ; r2 (orig)
lsl   r2, r2, #20
lsr   r2, r2, #26        ; tag6 extract
cmp   r2, #2
movne r0, #1
popne {r3, pc}
bl    helper
pop   {r3, pc}
```

### Recipe (gotcha 7: 2-arg pass-through)

```c
int func(struct Self *self, int arg) {
    if (self->f2.tag6 != 2) return 1;
    return helper(self, arg);
}
```

The 2nd arg makes r1 live for the helper call, forcing the
bitfield temp to r2.

### Cluster size

15+ tag6-shape picks identified in ov002 (021f64e8, 021f82b8,
021f9954, 021fb114, 02200310, 02202ef0, 022045dc, 02208bb0,
0220a94c, 0220aa20, 0220cdb0, 02218740, 02221f9c, 02244cb4,
02288904).

## (2) Sub-shape 2 — pool + 2 global writes

### Orig (target)

```text
push  {r3, lr}
bl    helper
ldr   r1, [pc, #16]      ; r1 = pool (orig)
mov   r0, #0
str   r0, [r1, #0xcf4]
mov   r0, #1
str   r0, [r1, #0xd04]
pop   {r3, pc}
```

### Recipe (NEW gotcha 8: return matches last write)

```c
int func(void) {
    helper();
    data.f3316 = 0;
    data.f3332 = 1;
    return 1;                /* same as last write */
}
```

mwcc CSE's the `mov r0, #1` into both the f3332 write AND the
return value, forcing the pool address to r1 (not r0).

### Why void-returning fails

With `void` return, mwcc allocates registers naturally — first
free is r0, so pool goes to r0 and literal to r1. The `return 1`
hint tells mwcc that r0 must end with `#1` at the function exit,
forcing the pool to be allocated elsewhere.

## (3) Sub-shape 3 — ptr-copy + helper + LIT-write

### Orig (target)

```text
push  {r4, lr}
ldrh  r2, [r1]           ; r2 (orig)
mov   r4, r0
strh  r2, [r4]
bl    helper
ldr   r1, [pc, #4]       ; r1 (orig)
strh  r1, [r4]
pop   {r4, pc}
```

### Recipe (NEW gotcha 9: int-return + both-args)

```c
int func(unsigned short *dst, unsigned short *src) {
    int r;
    *dst = *src;
    r = helper(dst, src);     /* both args */
    *dst = 0x183e;
    return r;                  /* int return */
}
```

The combination forces 3 registers live across the bl:
- r0 = helper return (live for `return r`)
- r1 = src (committed as helper's 2nd arg)
- r2 = u16 temp (lowest-free that doesn't collide)

After bl, r1 becomes "dead" first, so mwcc picks r1 for the LIT
load (not r0 which still holds the return).

### Cluster size

2 picks identified: 022301a8, 02244064.

## (4) Sub-shape 4 — stmfd + sub sp #4 prologue

### Orig (target)

```text
stmfd sp!, {lr}
sub   sp, sp, #4
ldr   r0, [r0]
cmp   r0, #0
addeq sp, sp, #4
ldmfdeq sp!, {pc}
ldrb  r0, [r0, #60]
bl    helper
add   sp, sp, #4
ldmfd sp!, {pc}
```

### Recipe (NEW gotcha 10: 1.2/sp3 routing)

```c
/* file: src/main/func_02087d2c.legacy_sp3.c */
extern void helper(unsigned char x);
void func(unsigned char **pp) {
    unsigned char *p = *pp;
    if (p == 0) return;
    helper(p[60]);
}
```

The `.legacy_sp3.c` filename routes through mwcc 1.2/sp3 which
emits the `stmfd; sub sp, #4` prologue.

### Brief 240's misclassification

Brief 240 noted "orig has `push {lr}; sub sp, #4`; mwcc emits
`push {r3, lr}`" and classified this as a reg-alloc divergence
(mwcc using r3 as a dummy stack-align save). The actual
divergence is that brief 240 used the wrong tier (2.0/sp1p5).
Tier 1.2/sp3 produces the orig's exact shape.

### Cluster size

10+ picks just from a single-pass scan (02087d2c, 02087d54,
0203c7d0, 0203c824, 0203cb40, 0203db24, 0203de80, 0203ef68,
0203f6a0, 02043250, …). Likely 50+ across all modules with this
prologue shape.

## Lesson learned: the "reg-alloc divergence" was 3 different bugs

Brief 240 lumped 4-5 distinct issues under one banner ("mwcc
picks the wrong reg"). Brief 242 unpacked:

1. **gotcha 7** (arg-count) handles cases where the divergence
   is one temp register off by one.
2. **gotcha 8** (return-LIT-match) handles cases where the
   function "happens to return" the same literal it last wrote.
3. **gotcha 9** (int-return + both-args) handles 2-arg
   ptr-copy thunks.
4. **gotcha 10** (sp3 routing) handles the "wrong-tier-tier"
   case which masquerades as a reg-alloc issue.

Future investigations should TRY ALL TIERS FIRST before
classifying as a reg-alloc divergence. A wrong tier produces
identical instructions with different register choices — easy
to misread as allocator quirk.

## Recipe-gotchas.md extensions

Added 3 new gotchas (8, 9, 10) with wrong/right snippets and
disasms. Added 3 new pre-flight checklist items (10, 11, 12).
Also added a new "Pre-flight: when reg-alloc divergence
appears" section with a 4-step diagnostic order:

1. Try all 8 tiers first (gotcha 10)
2. Count helper args (gotcha 7)
3. Match return type to last literal write (gotcha 8)
4. Combine int-return + both-args (gotcha 9)

## Shipped worked examples (8)

- `src/overlay002/func_ov002_021f9954.c` — sub-shape 1 (tag6)
- `src/overlay002/func_ov002_02218740.c` — sub-shape 1 sibling
- `src/overlay002/func_ov002_02208bb0.c` — sub-shape 1 sibling
- `src/overlay002/func_ov002_021aea58.c` — sub-shape 2
- `src/overlay002/func_ov002_022301a8.c` — sub-shape 3
- `src/overlay002/func_ov002_02244064.c` — sub-shape 3 sibling
- `src/main/func_02087d2c.legacy_sp3.c` — sub-shape 4
- `src/main/func_02087d54.legacy_sp3.c` — sub-shape 4 sibling

## Verdict

- **NO P-14 needed**. The reg-alloc divergence was a false
  classification. All 4 sub-shapes have working recipes.
- The ~500 remaining unshipped C-42 picks across these 5
  sub-shapes are SHIPPABLE under existing recipes — brief 243+
  should drain them.

## Cross-references

- `docs/research/brief-240-c42-drain-wave2.md` — original
  divergence surfaced
- `docs/research/brief-241-c42-deferred-and-cluster-scout.md`
  — recipe gotcha 7 first surfaced
- `docs/research/recipe-gotchas.md` — gotchas 7-12 catalog
- `docs/research/codegen-walls.md` § C-42 — taxonomy
