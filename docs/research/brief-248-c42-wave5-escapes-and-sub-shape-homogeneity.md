[//]: # (markdownlint-disable MD013 MD041)

# Brief 248 — C-42 wave 5 escapes + sub-shape homogeneity lesson

**Status:** 3 of 4 patterns LOCKED + 1 falsification. Recipe library
extended with gotcha 12 (trailing-helper LIT-match), symptom→
gotcha lookup table landed, and sub-shape homogeneity lesson
written up.

## Headline

| Pattern | Result | Recipe |
|---|---|---|
| N1 — sub-shape 2 + trailing helper | **LOCKED** | NEW gotcha 12 (trailing helper takes the field-write literal) |
| N2 — predication collapse | **LOCKED** | switch + case + default (defeats moveq/popeq fusion) |
| N3 — nested struct ptr-alias | **falsification** | mwcc's combined-offset emit is sticky; no source idiom forces the `add + ldr/str` split |
| N4 — 2-helper if-else r3 alloc | **LOCKED** | gotcha 7 with 3-arg pass-through (`r3 target → 3 args` per brief 246 mapping) |

3 worked examples shipped. recipe-gotchas.md extended with:
- Gotcha 12 (trailing-helper LIT-match)
- Symptom → gotcha quick-reference table at the top
- Sub-shape homogeneity strategy section

7-step diagnostic order (was 6-step).

## (A) The 4 patterns

### N1 — sub-shape 2 with trailing helper (LOCKED)

#### Orig

```text
push  {r3, lr}
mov   r0, #1
bl    helper1            ; helper1(1) — return discarded
ldr   r1, [pc, #12]      ; r1 = pool addr
mov   r0, #1
str   r0, [r1, #12]      ; *(pool + 12) = 1
bl    helper2            ; helper2() — trailing call
pop   {r3, pc}
```

Orig has pool in r1 and literal in r0 — same swap as brief 242's
sub-shape 2. Brief 242 used `return 1` (gotcha 8) to force this.
But here the function has a trailing helper2 call after the field
write — `return 1` doesn't apply because there's no return after
the bl.

#### Recipe (NEW gotcha 12)

```c
void func(void) {
    helper1(1);
    data->f12 = 1;
    helper2(1);          /* helper2 takes the same LIT */
}
```

The trick: make the trailing helper take the same literal as the
field write. mwcc CSEs `mov r0, #1` across the str AND the helper2
arg setup, forcing the pool to r1.

#### Variant matrix

| Variant | Result |
|---|---|
| v0: baseline `void helper2(void)` | ✗ pool in r0 |
| v1: hoist pool ptr to local | ✗ folded away |
| v2: named local `int v = 1;` | ✗ folded away |
| v3: 1-arg function (carry incoming arg) | ✗ different shape (11 insns) |
| v4: helper1 takes 0 args | ✗ different shape (8 insns) |
| v5: helper2 takes pool ptr | ✗ same as v0 |
| **v6: helper2 takes 1** | **✓ byte-identical** |

### N2 — predication collapse (LOCKED)

#### Orig

```text
push  {r3, lr}
ldr   r1, [pc, #32]
cmp   r0, r1
bne   .L_else            ; orig BRANCHES (no predicated execution)
mov   r0, #0
pop   {r3, pc}
.L_else:
bl    helper
cmp   r0, #0
moveq r0, #1
movne r0, #0
pop   {r3, pc}
```

Brief 247 reported `if (arg == K) return 0; ...` collapses to
`moveq + popeq`. Gotcha 5 (`if-then` braces) didn't unlock.

#### Recipe

```c
int func(int arg) {
    switch (arg) {
    case 0x17c4: return 0;
    default:     return (helper(arg) == 0);
    }
}
```

Switch + case + default defeats predication collapse. Same trick
as brief 241's switch shapes — the switch construct forces hard
branches per case.

### N3 — nested struct ptr-alias (FALSIFICATION)

#### Orig

```text
push  {r4, lr}
add   r4, r0, #0x1fc     ; r4 = &self->inner (pre-computed)
ldr   r1, [r4, #0xc80]   ; access via inner alias
cmp   r1, #0
popeq
bl    helper
mov   r0, #0
str   r0, [r4, #0xc80]   ; same alias used again
pop
```

Orig pre-computes the inner pointer (`self + 0x1fc`) into a
callee-save reg and accesses the field at offset 0xc80 (twice).
mwcc's natural output combines the offset (`ldr r1, [r4, #0xe7c]`).

#### Variant matrix (all failed)

| Variant | Result |
|---|---|
| v0: `struct Inner *p = &self->inner;` | ✗ combined offset |
| v1: cast through `char*` arithmetic | ✗ encoding diverges (add #0x27c vs orig add #0x1fc) |
| v2: `(struct Inner *)((char*)self + 0x1fc)` | ✗ combined offset |
| v3: helper takes inner pointer (forces materialization) | ✗ inner add only at bl, not prologue (10 insns, orig has 9) |
| v4: function takes inner directly (no self) | ✗ wrong shape (uses `mov r4, r0` not `add r4, r0, #0x1fc`) |
| v5: `&self->inner` chain via struct nesting | ✗ same as v3 |

#### Verdict

mwcc 2.0/sp1p5's "combine struct offsets" optimization is sticky.
No source-side idiom tested forces the prologue-time
`add r4, r0, #0x1fc` materialization. Two paths forward:

1. **Skip the pick** — accept N3 as a sub-shape that requires the
   orig's specific decomp idiom (likely a macro/inline that
   expanded to the alias).
2. **Defer to brief 250+** — try mwcc compiler options (e.g.
   `-opt level0` per function), or write a permuter pass that
   searches for source forms producing the split-offset emit.

### N4 — 2-helper if-else reg-alloc (LOCKED)

#### Orig

```text
push  {r3, lr}
ldr   r3, [pc, #24]      ; r3 = pool addr (orig)
ldr   r3, [r3]
cmp   r3, r0
bne   .L_else
bl    helper1
pop
.L_else:
bl    helper2
pop
```

Brief 247 said "no obvious source-side lever was tried." Brief
246's rule applies directly: temp register target → arg count
mapping. r3 target → 3-arg pass-through.

#### Recipe

```c
void func(int arg, int a, int b) {
    if (global == arg) {
        helper1(arg, a, b);
    } else {
        helper2(arg, a, b);
    }
}
```

3-arg helpers force pool temp from r1 → r3. Byte-identical match.

## (B) Symptom → gotcha lookup table

Brief 246 proposed adding a quick-reference table to recipe-
gotchas.md mapping observed disasm symptoms to the relevant
gotcha + variant. Brief 248 landed this addition at the TOP of
the recipe-gotchas.md catalog.

Format:

| Symptom (orig vs mine) | Likely gotcha | Variant |
|---|---|---|
| Wrong temp reg: orig r1, mine r0 | 7 | 1-arg pass-through |
| Wrong temp reg: orig r2, mine r1 | 7 | 2-arg pass-through |
| Wrong temp reg: orig r3, mine r1/r2 | 7 | 3-arg pass-through |
| Wrong stack-save reg: orig r4, mine r5 | 11 | swap declaration order |
| Pool/literal swap: orig r1 pool, mine r0 | 8 / 12 | `return LIT` (8), or trailing helper takes LIT (12) |
| ... (15 entries total) | | |

The decomper scans the table first. If a symptom matches, they
jump to the corresponding gotcha for details. If nothing matches,
the 7-step diagnostic order (below the gotcha sections) is the
fallback. The narrative gotcha write-ups stay as the deep-dive
reference — the table is ADDITIVE.

This is a zero-risk addition for existing readers and a major
accelerant for decomper briefs that need a fast lookup.

## (C) Sub-shape homogeneity lesson

Brief 247 empirically established:

| Wave | C-yield | Profile |
|---|---:|---|
| Wave 4 (245) | **94%** | 17 tag6 + 9 sp3 siblings |
| Wave 5 (247) | 73% | varied main thunks |

The recipe library wasn't the bottleneck. Pick selection was.
Written up as a new top-section in recipe-gotchas.md:
"Pick-selection strategy: sibling-family drains beat random
cohort picks."

Key takeaways for future decomper briefs:

1. **Lead with sibling families** — wave 4's tag6 cohort hit
   17/17 because all 17 picks reused the same gotcha 7 variant.
2. **Surface sub-shape boundaries via failure** — when a
   "sibling" needs a different recipe, you've found a new
   sub-shape. Catalog it, then try its own family.
3. **The 70-75% floor for diverse pilots is natural** — not a
   regression. Don't chase 85%+ when only diverse shapes
   remain.
4. **Pivot signal**: sustained <70% across 2+ waves with stable
   gotcha catalog = high-homogeneity targets exhausted.
   Switch wall classes (brief 241 cluster scout).

## Variant matrix summary

| Pattern | Recipe | Gotcha applied |
|---|---|---|
| N1 | `helper2(LIT)` matching field write | NEW 12 |
| N2 | switch + case + default | (switch shape, brief 241 family) |
| N3 | (none ship) | falsification |
| N4 | 3-arg pass-through | 7 (r3 mapping) |

## Verification

3-region SHA1 PASS (EUR/USA/JPN).

## Shipped worked examples (3)

- `src/main/func_020a6b30.c` — pattern N1
- `src/main/func_020305d8.c` — pattern N2
- `src/overlay002/func_ov002_0227b090.c` — pattern N4

## Cross-references

- `docs/research/brief-247-c42-opportunistic-drain-wave5.md` —
  original N1-N4 surfacing + homogeneity observation
- `docs/research/brief-246-c42-wave4-escapes-and-audit.md` —
  symptom→gotcha lookup proposal
- `docs/research/recipe-gotchas.md` — catalog now 12 gotchas +
  7-step diagnostic order + symptom-lookup table +
  homogeneity strategy
