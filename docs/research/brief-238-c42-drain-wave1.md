[//]: # (markdownlint-disable MD013 MD041)

# Brief 238 — C-42 first mechanical drain wave

**Brief:** 238 (decomper). First mechanical drain on brief 237's C-42
multi-call thunk family. Target 30-50 ships, hard-tier 8.16% → 8.5-8.8%.

## Headline

**30 .c ships → hard-tier 8.16% → 8.52%** (712/8351, +30, +0.36 pp).
14 picks in `src/main/`, 16 picks in `src/overlay002/`. Following the
brief's strategic priority (main + ov002 carry 73.2% of pointer debt).

C-yield: **30/37 attempts = 81%** (below brief target of 95%+). The
7 escapes were mostly struct-layout mismatches on large-offset field
access (mwcc's `add r4, r0, #N; ldr [r4, #M]` split pattern) and
2-helper sequences with struct returns / pool-deref edge cases.

3-region SHA1 PASS preserved (EUR/USA/JPN).

## Recipe library used (this wave)

All 5 brief 237 sub-shapes appeared in the wave plus 6 new sub-variants:

### Sub-shape 1 — Conditional helper2 + literals (brief 237)

`if (helper1()) return CONST; return helper2(LIT1, LIT2);`

Ships: 0202f578 (`if(!= 0) return 1; return helper2(self)`),
0201f7a4 + 0201fbb8 (fn-ptr arg + cmp #2 + bool tail).

### Sub-shape 2 — Field read/write (brief 237)

`helper1(self); helper2(self->field); self->field = 0;`

Ships: 02023574 + 0202a2f8 (null-check int* + helper + return 1).

### Sub-shape 3 — Two helpers with pool data (brief 237)

`helper1(data1); helper2(data2);` using `extern char data_xxx[]`.

Ships: 0201d400 (helper + helper + global write).

### Sub-shape 4 — Helper-reuse with int n = h() (brief 237)

`int n = h(); ... return n;` mwcc spills n to r4 (callee-saved).

(Not used directly this wave.)

### Sub-shape 5 — Single helper + fn-ptr + bool (brief 237)

`return helper(x, (void *)fn) > 0;` Pool slot is the fn-ptr.

Ships: 0220886c, 0220b158 (`> 0`), 0220b720 (`>= 2`).

### NEW Sub-shape 6 — `helper2(self, helper1_ret)` chain

`helper2(self, helper1(self));` — single statement, mwcc emits the
`bl helper1; mov r1, r0; mov r0, r4; bl helper2; mov r0, #0` shape.

Ships: 0220e75c, 02217b30, 02238558, 02285dd0.

### NEW Sub-shape 7 — 2-helper sequence preserving args

`func2(self, arg1); return func3(self, arg1);` — mwcc spills self/arg1
to r4/r5 (callee-saved), restores before each bl.

Ships: 020685a4, 021f60dc.

### NEW Sub-shape 8 — Helper with arg-insert literal

`helper(self, K, a, b, c)` — function takes (self, a, b, c), helper takes
(self, K, a, b, c). mwcc does the AAPCS arg shuffle.

Ships: 021e2550, 021e276c (K=11, 5-arg with stack spill).

### NEW Sub-shape 9 — Store + cond-skip + helper

`*p = arg1; if (arg1 == 0) return; helper(self, self->f4);`

Ships: 022b3020.

### NEW Sub-shape 10 — Save / clear field / helper / restore

`int saved = *p; *p = 0; helper(p, ...); *p = saved;`

Ships: 021ded30.

### NEW Sub-shape 11 — Pool-deref + helper

`helper(((void **)data_xxx)[N], lit1, lit2); return CONST;`

Ships: 021f4d18.

## All 30 shipped picks

| Module | Addr | Size | Pattern |
|--------|------|---:|---------|
| main | `0201d400` | 0x28 | 2-helper + BSS write |
| main | `0201f7a4` | 0x28 | fn-ptr + cmp #2 + bool |
| main | `0201fbb8` | 0x28 | sibling of 0201f7a4 |
| main | `02020404` | 0x28 | u16 branch + literal arg |
| main | `02023574` | 0x28 | null + zero + helper + return 1 |
| main | `0202a2f8` | 0x28 | sibling of 02023574 |
| main | `02034574` | 0x28 | 7-helper void thunk |
| main | `0202f578` | 0x24 | conditional helper2 + literal |
| main | `0205230c` | 0x28 | 2-helper arg-passthrough |
| main | `020639a0` | 0x28 | null + field-write + helper-store |
| main | `02068f54` | 0x24 | 3-helper void chain |
| main | `020685a4` | 0x24 | 2x helper(0, field) |
| main | `0206b568` | 0x28 | helper + struct field stores |
| main | `0207dcf8` | 0x28 | E5 (with extra moveq r0, #0) |
| ov002 | `021b0c04` | 0x24 | helper1 + helper2 with addition |
| ov002 | `021d7c1c` | 0x24 | pass-through with appended literals |
| ov002 | `021ded30` | 0x24 | save/clear/helper/restore |
| ov002 | `021e2550` | 0x20 | arg-insert thunk |
| ov002 | `021e276c` | 0x20 | sibling of 021e2550 |
| ov002 | `021f4d18` | 0x24 | pool-deref + helper |
| ov002 | `021f60dc` | 0x20 | 2-helper preserving args |
| ov002 | `0220886c` | 0x20 | fn-ptr + bool > 0 |
| ov002 | `0220b158` | 0x20 | sibling of 0220886c |
| ov002 | `0220b720` | 0x20 | fn-ptr + bool >= 2 |
| ov002 | `0220e75c` | 0x20 | helper2(self, helper1_ret) |
| ov002 | `02217b30` | 0x20 | sibling of 0220e75c |
| ov002 | `02238558` | 0x20 | sibling of 0220e75c |
| ov002 | `02285dd0` | 0x20 | 2-helper preserving args |
| ov002 | `022b3020` | 0x1c | store + cond skip + helper |
| ov002 | `022b52c4` | 0x20 | helper(lit,lit) + zero-write |

## Picks deferred (7 attempts that didn't ship)

1. **`func_02000c34`** — already shipped as part of `src/main/main.c`.
   Filter bug (predict_walls saw it as unmatched).
2. **`func_020327c0`** — large-offset field access via `add r4, r0,
   #N; ldr [r4, #M]`. mwcc's split-offset emit isn't reproducing
   from a flat `struct { char pad[N]; int field; }` source.
   Brief 240 scaffolder candidate.
3. **`func_02049f38`** — 2x helper-returns-struct + field write. The
   `bl helper; str r5, [r0, #28]; bl helper; strh r4, [r0, #26]`
   shape needs the struct field types right.
4. **`func_0204b0a8`** — 2x helper-returns-struct + helper returns u64
   pair. Struct/u64 layout mismatch.
5. **`func_02050118`** — 2x helper-returns-ptr + 2x strb. Similar to
   02049f38.
6. **`func_0202bae4`** — clamp pattern `int n = h(); if (n < 0) n = 0;
   helper(self, n);` — mwcc emits different cmp/movle than expected.
7. **`func_ov002_021eeea4`** — u16 field == 0 → branch + dispatch.
   The `if (cond) return h1(); return h2();` form emits slightly
   different cond from orig.
8. **`func_ov002_02242e30`** — variant of 021eeea4, same divergence.
9. **`func_ov002_022951a4`** — bitfield != 0 ? 1 : helper. Bitfield
   layout assumption mismatch.

All 7 are flagged as brief 240 scaffolder candidates for sub-pattern
research.

## Methodology notes

- **mwcc 2.0 = C89**: no mid-scope variable declarations. Caught
  `func_0204b0a8.c` with a `struct *p = ...;` inside the function
  body — needed to hoist to function top.
- **Pool data symbols**: use `extern char data_xxx[]` per brief 237's
  gotcha. `extern int g_xxx` adds an extra `ldr` deref.
- **Early-return form vs return r form**: matched picks observed
  BOTH patterns (`int r = h(); if (r == 0) return r;` vs `if (h() ==
  0) return 0;`). The form to use depends on whether the orig has
  the redundant `moveq r0, #0` instruction. Read orig disasm first.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| `dsd check modules` | ✓ 27/27 OK |
| `tools/check_match_invariants.py` | ✓ 0 errors |
| `ruff check .` | ✓ All checks passed |
| Hard tier % | **8.16% → 8.52%** (712/8351) |

## Cross-references

- `docs/research/brief-237-hard-tier-landscape-survey.md` — C-42 classification
- `docs/research/codegen-walls.md` § C-42 — taxonomy entry + recipe template
- `src/overlay002/func_ov002_021b0c34.c` — brief 237 worked example 1
- `src/overlay000/func_ov000_021aaec4.c` — brief 237 worked example 2
- `src/overlay010/func_ov010_021b2bf8.c` — brief 237 worked example 3
- `src/overlay000/func_ov000_021aae34.c` — brief 237 worked example 4
- `src/overlay002/func_ov002_0220868c.c` — brief 237 worked example 5
