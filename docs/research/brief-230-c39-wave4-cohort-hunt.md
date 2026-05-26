[//]: # (markdownlint-disable MD013 MD041)

# Brief 230 — C-39 wave 4 (cohort hunting via C-39d detector)

**Brief:** 230 (decomper). Apply brief 228's recipe-variant taxonomy
+ brief 229's C-39d detector to hunt the next-largest uniform cohort.
Target: 25-40 ships, hard-tier 6.8% → 7.2-7.5%.

## Headline

**31 .c ships → hard-tier 6.8% → 7.2%** (578/8351, +31). All in
`src/overlay002/`. The wave mixed brief 229's C-39d natural-source
recipe with brief 228's bool-from-helper variants, drained from the
**C-39 + C-39d cohort** (432 unshipped picks).

`complete_units +31`. 3-region SHA1 PASS preserved (EUR/USA/JPN).

## Cohort breakdown post-brief-229

Brief 229 added C-39d detector → cohort sizes (unshipped):

| Cohort | Picks |
|---|---:|
| C-39 + d only | **432** ← targeted this wave |
| C-39 + b only | 157 |
| C-39 + b+d | 137 |
| C-39 alone (no sub) | 609 |
| C-39 + a only | 3 |
| Other combos | <30 each |

The C-39d-solo cohort is by far the largest. Brief 229 said it's
the "easiest" sub-shape because mwcc 2.0/sp1p5 doesn't CSE narrow
loads through pointer params across function calls — the re-read
is emitted by the natural C source.

## Source shape diversity within C-39d-solo

Despite the uniform codegen signature ("two ldrh from same offset
with at least one bl between"), source-shape diversity is HIGH:

- 25 picks: `helperX(...); helperY(...); return 0;` (no compare)
- 30 picks: `... ; cmp; movCC #1; movNCC #0; pop` (boolean tail)
- Plus: early-return + helper2, helper1 + bool early-return, etc.

The brief 228 "uniform-cohort" discipline doesn't fully apply
here — picks needed PER-SHAPE recipe decoding from disasm.

## 31 shipped picks — recipe pattern catalog

### Pattern Dα — `if (helper1) { return helper2(...) <CMP> N; } return 0;`

The early-return-on-eq + fall-through-zero shape. Critical
discovery: the `if (helper1 == 0) return 0; return helper2 <CMP> N;`
**early-return form does NOT match** — mwcc emits inline
conditional pop (`moveq #0; popeq`) which differs from orig's
branch + fall-through-zero block.

The fix: use **if-then form** `if (helper1) { return helper2 <CMP> N; } return 0;`.
This makes mwcc emit `beq .fail` + `mov r0, #0; pop` block at the
end — matching orig.

13 picks ship under Pattern Dα (variants by helper signature,
cmp value, and condition code).

### Pattern Dβ — `if (helperX) return CONST; return helperY <CMP> N;`

Early-return-with-popne/poplt for the first conditional, then
straight bool from second helper. Examples: 022077d0 (`> 5` early
+ `<= 5` tail), 0229663c (`!= 0` early-return 1 + `> 1` tail),
022964e8 (`< 0` early-return 1 + `!= 0` tail).

### Pattern Dγ — D1 dual-call same-helper return 0

Brief 229 worked-example shape. C source:

```c
helper(self->f2.bit0, ...);
helper(1 - self->f2.bit0, ...);
return 0;
```

mwcc emits the re-read naturally. 2 picks: 0222bf14 (`helper(bit0, 0)`),
022382ec (`helper(bit0, 3000)` with pool literal).

### Pattern Dδ — sign-check + bool tail (brief 227 variants)

Some C-39d-flagged picks are actually brief 227-shape (single-bl)
that the detector classified as C-39d because of bitfield reads
in argument-setup. These ship under brief 228 V variants:

- 02292914: `helper(1-bit0, 1, 0) > 0` — V11 (3-arg with 2 literals)
- 02206fb4: `helper(bit0, 11, f0, 2) == 0` — V8-extended (4-arg)
- 022967e4: `helper(bit0, 0, 1, 0) > 0` — V12 (4-arg with literals)
- 02209130: `helper(bit0, fld5, f0) != 0` — V13 (2-bitfield + f0)
- 02206024: `helper(bit0, fld5) != 0` — V14 (2-bitfield short)

### Picks shipped (31 total)

All in `src/overlay002/`:

| Addr | Size | Helper(s) + body | Tail |
|---|---:|---|---|
| `0x0222bf14` | 0x3c | `helper(bit0, 0); helper(!bit0, 0);` | return 0 |
| `0x022382ec` | 0x40 | `helper(bit0, 3000); helper(!bit0, 3000);` | return 0 |
| `0x0228830c` | 0x44 | `if helper1<0 return 0; helper2>1;` | bool gt/le |
| `0x022930a8` | 0x44 | `if helper1>0 return 0; helper2>1;` | bool gt/le |
| `0x022077d0` | 0x48 | `if helper(!bit0)>5 return 0; helper(bit0)<=5;` | bool le/gt |
| `0x02295ccc` | 0x48 | `if helper(!bit0)<2 return 0; helper(bit0)!=0;` | bool ne/eq |
| `0x022964a0` | 0x48 | `if helper(!bit0)==0 return 0; helper(bit0)!=0;` | bool ne/eq |
| `0x02296a78` | 0x48 | `if helper1==0 return 0; helper2(bit0,1)>=2;` | bool ge/lt |
| `0x02201f50` | 0x4c | `if helper1<5 return 0; helper(bit0,f0,0)!=0;` | bool ne/eq |
| `0x02203864` | 0x4c | `if helper1==0 return 0; helper(bit0,fld5)!=0;` | bool ne/eq |
| `0x022039f4` | 0x4c | `if helper1==0 return 0; helper(bit0,f0,0)!=0;` | bool ne/eq |
| `0x02203330` | 0x4c | `if helper(!bit0)==0 return 0; helper(bit0)?2:0;` | ternary |
| `0x02292404` | 0x50 | `if helper1(bit0,LIT)!=0 return 0; helper(bit0,0)>=0;` | bool ge/lt |
| `0x022881c4` | 0x50 | `if helper(!bit0,11,f0)!=0 return 0; helper(bit0)<0;` | bool lt/ge |
| `0x02292270` | 0x50 | `if helper(bit0,11,f0)!=0 return 0; helper(self,bit0)>6;` | bool gt/le |
| `0x02295bc0` | 0x50 | `if helper1==0 return 0; helper(bit0,fld5,1)!=0;` | bool ne/eq |
| `0x022964e8` | 0x50 | `if helper1<0 return 1; helper(self,!bit0,0)!=0;` | bool ne/eq |
| `0x02206cbc` | 0x54 | `if helper(bit0,5754)!=0 return 1; helper(bit0,5755)!=0;` | bool ne/eq |
| `0x02200748` | 0x54 | `if helper(bit0,!bit0) return helper(bit0,f0,0)>0; else 0;` | Dα |
| `0x02292944` | 0x54 | `if helper1 return helper(!bit0,1,0)>0; else 0;` | Dα |
| `0x0229663c` | 0x54 | `if helper(self,!bit0,1)!=0 return 1; helper(self,!bit0)>1;` | bool gt/le |
| `0x02295d88` | 0x58 | `if helper(!bit0,0,1)==0 return 0; helper(self,!bit0)!=0;` | bool ne/eq |
| `0x02294694` | 0x50 | `if helper1 return helper2(bit0,1,1)>0; else 0;` | Dα |
| `0x022884cc` | 0x58 | `if helper1(bit0,10,LIT) return helper2(bit0,10)<4; else 0;` | Dα |
| `0x02296538` | 0x5c | `if helper1(!bit0,1,0) return helper2(bit0,LIT)>0; else 0;` | Dα |
| `0x02292914` | 0x30 | `helper(1-bit0,1,0)>0` (brief 228 V11) | bool gt/le |
| `0x02206fb4` | 0x30 | `helper(bit0,11,f0,2)==0` (4-arg) | bool eq/ne |
| `0x022967e4` | 0x30 | `helper(bit0,0,1,0)>0` (4-arg) | bool gt/le |
| `0x02209130` | 0x30 | `helper(bit0,fld5,f0)!=0` (2-bitfield) | bool ne/eq |
| `0x02206024` | 0x2c | `helper(bit0,fld5)!=0` (2-bitfield short) | bool ne/eq |
| `0x02296b28` | 0x58 | `if helper(bit0,6653) return helper(bit0,0x202f430)>0; else 0;` | Dα |

## One reverted attempt — `func_ov002_02295b08`

Shape was `if (helper1) { inner } return 0;` where the inner block
had a single-helper `helper2(!bit0) == 0` check. Orig had
`moveq r0, #1; popeq` (early-pop on eq) + fall-through to `mov #0; pop`.

Tried both straight `return helper2 == 0` and nested `if (helper2 ==
0) return 1;` forms — neither produced the early-pop pattern.
mwcc compiled them with full `cmp; moveq #1; movne #0; pop`
ternary.

This is a small early-pop-vs-ternary scheduling divergence
documented as a brief 232+ candidate. Reverted to leave the
function unmatched.

## Methodology lesson — when uniform-cohort discipline breaks

Brief 227/228 success was uniform-cohort-driven: scan disasm for
exact byte signatures, batch-write C for a single shape. Brief 230's
cohort (C-39d-solo) has too much source-shape diversity (10+
distinct C shapes within the 432 picks) for a single uniform batch.

The workable approach: **scan-decode-write per-shape**. Decode each
pick's disasm into natural C; pick "natural" picks where the
inverse mapping is clear; ship in small batches; iterate. Brief 230
ratio: 31/32 = 97% (1 escape reverted).

The early-return form vs if-then form discovery is a new fact:
**mwcc compiles `if (x == 0) return CONST; rest;` differently from
`if (x) { rest; } return CONST;`.** The former emits inline
conditional pop; the latter emits branch + fall-through block.
When orig has the branch form (`beq .fail; ... .fail: ret;`), use
the if-then source form.

## What's deferred

Brief 232+ targets:

1. **C-39b solo (157)** — high diversity; recipe research per shape:
   - Allocator + Fill32 family (brief 227 deferred)
   - 3-helper-chain dispatcher
   - Cross-call compare (021f8490 sibling family)
2. **C-39d-solo remainder (~400 picks)** — same disasm-driven
   approach extended to larger sizes (0x60+):
   - Sign-check + 2 helpers + tag check (e.g., 02202840)
   - Tag1-flag early-return + 2-bitfield (e.g., 0221bdb0, 022175e0)
   - Global ptr + helper compare (e.g., 022062e0)
3. **Brief 229 early-pop vs ternary divergence** — `moveq #1; popeq`
   shape (02295b08-style). Scaffolder sub-classification candidate.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| `dsd check modules` | ✓ 27/27 OK |
| `tools/check_match_invariants.py` | ✓ 0 errors |
| `ruff check .` | ✓ All checks passed |
| Hard tier % | **6.8% → 7.2%** (578/8351) |

## Cross-references

- `docs/research/brief-227-c38-chained-cast-c39-wave2.md` — wave 2 methodology
- `docs/research/brief-228-c39-wave3-sub-shapes.md` — wave 3 variant taxonomy
- `docs/research/brief-229-c39c-d-pilots-and-c38-nonleaf.md` — C-39d recipe + detector
- `src/overlay002/func_ov002_02204f28.c` — brief 229 C-39d canonical
- `src/overlay002/func_ov002_0222bf14.c` — wave 4 D1 simple
- `src/overlay002/func_ov002_02200748.c` — wave 4 if-then Dα example
