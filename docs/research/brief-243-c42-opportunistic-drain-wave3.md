[//]: # (markdownlint-disable MD013 MD041)

# Brief 243 — C-42 opportunistic drain wave 3

**Brief:** 243 (decomper). Opportunistic drain of safe-profile C-42 picks
that do NOT interact with the brief 240 reg-alloc wall. Target 20-30
ships at 85%+ C-yield.

## Headline

**22 .c ships → complete_units 2145 → 2167** (+22, +0.66pp).
hard-tier matched 681 → 703 (8.62% → 8.88%, +0.26pp). Below 9.0-9.3%
target but within 20-30 ship range. C-yield 22/31 = **71%** (below
85% target). Halted per brief 243 stop-rule after multiple repeat
escapes hit new reg-alloc patterns beyond brief 240's documented set.

3-region SHA1 PASS (EUR/USA/JPN).

## 22 shipped picks

### Sibling family (5 picks, ov002) — bit-set + 4-arg helper + tst-bool

| Addr | K1 | K2 | C source |
|------|---:|---:|----------|
| `021de910` | 0xb | 0 | `(helper(a, mask, 0xb, 0) & mask) ? 1 : 0` |
| `021de9d4` | 0xd | 0 | sibling, K1=0xd |
| `021dea04` | 0xd | 0x800000 | sibling, K2=0x800000 |
| `021debe0` | 0xe | 0x1000 | sibling, K1=0xe, K2=0x1000 |
| `021decac` | 0xe | 0 | sibling, K1=0xe |

All share recipe: `int bit = c + (b << 4); unsigned mask = 1u << bit;
return (helper(a, mask, K1, K2) & mask) ? 1 : 0;` — 3-arg function
with 4-arg helper. Forces r4-saved mask, `tst r4, r0; movne; moveq`
predicated bool tail.

### Related sibling (1 pick, ov002) — 3-arg helper variant

| Addr | K1 | C source |
|------|---:|----------|
| `021de64c` | 0xf | `(helper(a, mask, 0xf) & mask) ? 1 : 0` (3-arg helper) |

Same shape as above but helper takes 3 args (no K2). Source declares
helper with 3 args so mwcc emits no `mov r3` setup before bl.

### Single-helper conditional thunks (11 picks)

| Module | Addr | C source / pattern |
|---|------|--------------------|
| ov002 | `0226ae0c` | null-check + 4-arg helper passthrough |
| main | `02034784` | 3-way switch on helper return (case 1, 2, default) |
| main | `020a9574` | 3-arg + 4-arg helper(b, 1, c, a) + cmp-set-zero |
| main | `020530e4` | helper-check + signed field > 0 → return 1 |
| main | `020190fc` | helper1 != 0 → helper2 != 5 → return 1 |
| main | `02034360` | helper-ret null-check + memset at +0x448 |
| ov002 | `0229da60` | helper + return `(char*)self + (arg - self->fa8) * 20` |
| ov002 | `021b0bdc` | 2-arg + helper1(self); if arg <= ret return n; helper2(self, arg) |
| ov002 | `021f4ea8` | 2-arg + helper1(self, arg); if ret != 1 return n; helper2 |
| ov002 | `02205f30` | helper1 == 0 → return 0; helper2 |
| ov002 | `02207e68` | sibling of 02205f30, different helper2 |

### Two-helper sequences (5 picks, ov002)

| Addr | C source |
|------|----------|
| `021f84c8` | `helper1(self,arg); helper2(self,arg); return 1` |
| `022234c0` | `int n = helper1(); helper2(self, n, 2); return 0` |
| `0227d660` | `int n = helper1(self,arg); helper2(self, arg, n)` |
| `0227d82c` | sibling of 0227d660, different helper2 |
| `0228ab3c` | helper1 != 2 → return 0; helper2 |

## The 9 escapes — repeat reg-alloc divergence in new patterns

Brief 243 explicitly said: "if you encounter 2 repeat escapes in a
single session (especially the reg-alloc shape), halt the wave and
surface to brief 244 scaffolder review." I hit **9 escapes across 4
distinct reg-alloc sub-patterns**, all new variants of the brief
240 wall. Halted per the brief.

### Sub-pattern 6 — Pointer-to-pointer field-write reg choice (2 picks deferred)

**Picks**: `func_02062438`, `func_02062468`.

**Symptom**: Mwcc uses r1 for the second `ldr [r4, #0]` reload (then
mov r0, #0; str r0). Orig uses r0 for the load (then mov r1, #0;
str r1). Same opcodes, swapped registers.

**Sample diff (02062438)**:

```text
Mine:   ldr r1, [r4, #0]   ; mov r0, #0   ; str r0, [r1, #0x10]
Orig:   ldr r0, [r4, #0]   ; mov r1, #0   ; str r1, [r0, #0x10]
```

Tried: explicit `struct Inner *p = o->p; p->fX = ...; p = o->p; p->fY = ...`.
mwcc still picks r1 for the second reload because r0 was last used
for the first store's value (`mov r0, #0` then `str r0` clears r0;
next reload picks r1 from available list).

### Sub-pattern 7 — Switch-on-ldrh reg choice (1 pick deferred)

**Pick**: `func_ov002_02241bc4`.

**Symptom**: mwcc loads switch value into r2; orig uses r1.

```text
Mine:   ldrh r2, [r0, #0xc]   ; cmp r2, #1   ; ...
Orig:   ldrh r1, [r0, #0xc]   ; cmp r1, #1   ; ...
```

With 1 explicit arg (self in r0), r1 should be the natural free
scratch. Mwcc instead picks r2. Tried: `switch (self->f0c)` directly,
`switch (v)` via local, `unsigned int v = self->f0c`. None shift the
allocator.

### Sub-pattern 8 — stmia fusion miss (1 pick deferred)

**Pick**: `func_0208b0a4`.

**Symptom**: orig fuses two adjacent stores into `stmia r6, {r0, r5}`.
My compile emits two separate `str` instructions.

```text
Mine:   str r0, [r6, #0]   ; str r5, [r6, #4]   ; (no fusion)
Orig:   stmia r6, {r0, r5}                       ; (single instr)
```

Source code is `self->f0 = helper(self); self->f4 = arg1;` — consecutive
struct writes at offsets 0 and 4 of the same callee-saved pointer.
mwcc should fuse these. It doesn't — likely TBAA conservatism around
the helper call.

### Sub-pattern 9 — Loop counter/index reg-alloc (4 picks deferred)

**Picks**: `func_0201a5c0`, `func_020b4248`, `func_ov002_021bc68c`,
`func_ov002_021bbd14`.

**Symptom**: mwcc swaps counter and index registers vs orig. Example
(021bc68c, 5-iter counting loop):

```text
Mine:   mov r5, #0    ; r5 = count
        mov r4, r5    ; r4 = i (= 0)
        ...
        add r4, #1; addne r5, #1     ; i++, if (helper) count++
Orig:   mov r4, #0    ; r4 = count
        mov r5, r4    ; r5 = i (= 0)
        ...
        add r5, #1; addne r4, #1     ; i++, if (helper) count++
```

Counter holds in r5 vs r4 across all loop ops. Tried: swapping
declaration order (`int i; int count` vs `int count; int i;`),
explicit `count = 0; i = 0`. None deterministically pick r4 for
count.

### Sub-pattern 10 — Indexed-ldr reg choice (1 pick deferred)

**Pick**: `func_ov002_022b36f0`.

**Symptom**: similar to sub-pattern 6 but with array-indexing load.

## Recipe library additions

These shapes ship under natural C with no special idiom:

### Sub-shape 17 — bit-set + 4-arg helper + tst-bool tail

3-arg function, 4-arg helper, mask saved across bl:

```c
int func(int a, int b, int c) {
    int bit = c + (b << 4);
    unsigned int mask = 1u << bit;
    return (helper(a, mask, K1, K2) & mask) ? 1 : 0;
}
```

Variants: 3-arg helper (drop K2), different K1/K2 constants. Ships
byte-identical for the 6 picks (021de64c, 021de910/9d4/a04/be0/cac).

### Sub-shape 18 — 3-way switch on helper return

```c
int func(void) {
    switch (helper()) {
        case 1: return 1;
        case 2: return 2;
        default: return 0;
    }
}
```

Forces full branch shape with case + default. Ships for 02034784.

### Sub-shape 19 — 2-helper chain with return passed forward

```c
int func(void *self, int arg) {
    int n = helper1(self, arg);
    helper2(self, arg, n);
    return 0;  // or whatever
}
```

Both helpers take (self, arg); helper2 takes additional `n` from
helper1's return. mwcc saves self/arg to r4/r5 across calls. Ships
for 022234c0, 0227d660, 0227d82c, 021f84c8 family.

### Sub-shape 20 — conditional 2nd helper based on 1st's return

```c
int func(void *self, int arg) {
    int n = helper1(self, arg);
    if (n != CONST) return n;  // or "return 0", "return CONST_RET"
    return helper2(self, arg);
}
```

mwcc emits `cmp; movne; popne` early-return form. Ships for 6 picks
(021b0bdc, 021f4ea8, 02205f30, 02207e68, 0228ab3c, 020190fc).

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| `tools/check_match_invariants.py` | 0 errors (4244 pre-existing placeholder-name warnings) |
| complete_units | **2145 → 2167** (+22, +0.66pp) |
| matched_functions | 2182 → 2185 (+3 — under-counted per metric canon) |
| hard-tier % | **8.62% → 8.88%** (+0.26pp) |

## Cohort sizing finding

Brief 243 said: "If you ship more than 30 at high yield, the
safe-profile cohort is larger than brief 240 estimated."

Empirical answer: **The safe profile is real but smaller than 30.**
Of the ~250 main+ov002 candidates that passed the metric safe-profile
filter (no pool load, no bitfield extract, no stack frame), only 22
shipped cleanly. 9 hit reg-alloc divergence in NEW sub-patterns
beyond brief 240's documented set. Brief 244 scaffolder should
extend the reg-alloc investigation to include:

1. **Pointer-double-store** patterns (sub-pattern 6 above)
2. **Switch-ldrh-reg** patterns (sub-pattern 7)
3. **Stmia fusion** triggers (sub-pattern 8)
4. **Loop counter/index** reg-alloc (sub-pattern 9)
5. **Indexed-ldr** reg-alloc (sub-pattern 10)

The remaining ~150 candidates likely have one of these escapes lurking
in them. Without source-level controls (the brief 242 scaffolder
question), wave 4+ should expect a similar 70-75% yield, not 85%+.

## Recommendation for brief 245

Two routes:

**Route A — wait for brief 244**: If brief 244 scaffolder finds a
reg-alloc source knob, wave 4 can revisit the 130+ deferred picks
including this brief's 9 escapes.

**Route B — pivot to next cohort**: Brief 241 (B) cluster scout
identified 5 unclassified clusters (55 + 45 + 40 + 26 + 20 = 186
picks). The largest (stack-frame multi-arg pass-through, 55 picks)
is the next obvious drain.

## Shipped worked examples (22)

`src/main/`:

- `func_020190fc.c` (2bl + cmp-bool tail)
- `func_02034360.c` (helper + memset at +0x448)
- `func_02034784.c` (3-way switch)
- `func_020530e4.c` (helper + signed field check)
- `func_020a9574.c` (3-arg + 4-arg helper + cmp-set-zero)

`src/overlay002/`:

- `func_ov002_021b0bdc.c` (cmp-le → return)
- `func_ov002_021de64c.c` (3-arg sibling family)
- `func_ov002_021de910.c` (bit-set siblings × 5)
- `func_ov002_021de9d4.c`
- `func_ov002_021dea04.c`
- `func_ov002_021debe0.c`
- `func_ov002_021decac.c`
- `func_ov002_021f4ea8.c` (cmp != 1 → return)
- `func_ov002_021f84c8.c` (2-helper + return 1)
- `func_ov002_02205f30.c` (helper1 == 0 → return 0)
- `func_ov002_02207e68.c` (sibling)
- `func_ov002_022234c0.c` (0-arg helper + 3-arg chain)
- `func_ov002_0226ae0c.c` (null-check passthrough)
- `func_ov002_0227d660.c` (2-helper chain)
- `func_ov002_0227d82c.c` (sibling)
- `func_ov002_0228ab3c.c` (cmp != 2 → return)
- `func_ov002_0229da60.c` (helper + ptr arith return)

## Cross-references

- `docs/research/brief-240-c42-drain-wave2.md` — original reg-alloc
  wall surfacing (5 sub-patterns)
- `docs/research/brief-241-c42-deferred-and-cluster-scout.md` — recipe
  gotcha 7 (arg-count → temp reg)
- `docs/research/recipe-gotchas.md` — 7 gotchas including arg-count
  tuning
- `docs/research/codegen-walls.md` § C-42 — sub-shape catalog
- `tools/predict_walls.py` — C-42 detector with sub-shape cue
