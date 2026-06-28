# Matched-function reference — recipe cookbook

## How to use

Find the recipe class that matches the dominant codegen pattern of the function you are writing a dossier for, then copy the nearest worked example as your starting template. When the asm shows multiple patterns in the same function, check the Cross-recipe patterns section at the bottom.

---

## store-order

### What it is
MWCC emits ldr/str pairs in exactly the C source order for struct field accesses; reordering fields in C reorders the loads and stores in the output. When the asm interleaves loads from one struct and stores into another, the C must reproduce that interleaving literally — no rewriting as a temp+batch-store.

### Gotchas
- Do not hoist multiple struct reads into temporaries before writing — this reorders the ldr/str sequence and breaks the match.
- Volatile MMIO stores (`*(volatile unsigned long *)0x04000000 &= ~0x1f00`) must appear in the exact textual position they occupy in the asm, not collapsed or merged.
- The `&= ~mask` / `|= bits` RMW pair on a single field must stay as two separate expressions; do not simplify into `= (x & ~mask) | bits` unless the original asm uses a single bic+orr without an intervening reload.
- In the `021b43d8` / `021b50b0` full-init family the two if/else branches each write the DISPCNT-mode sequence independently — do not factor them out. The asm duplicates the sequence.

### Worked examples
| path | addr | key lesson |
|---|---|---|
| `src/overlay006/func_ov006_021b43d8.c` | `021b43d8` | 0x220 full-init: two if/else branches each independently write the display-mode registers in asm order; `data_ov006_0224f290[2] = a` at the end |
| `src/overlay006/func_ov006_021b50b0.c` | `021b50b0` | Family sibling of `021b43d8`, same shape with different per-state struct (`data_ov006_0224f330`) |
| `src/overlay006/func_ov006_021b45f8.c` | `021b45f8` | Blank-display family: `*disp &= ~0x1f00` then `*(0x04001000) &= ~0x1f00` in source order; the volatile dereference must be explicit |
| `src/overlay006/func_ov006_021b52d0.c` | `021b52d0` | Same blank-display family; different per-state struct |
| `src/overlay011/func_ov011_021cc250.c` | `021cc250` | Free two handles in asm order: `func_0207fd28(+0x114, 0x1000)` then `func_0207fd28(+0x118, 0x1000)` — do not re-use a pointer variable |
| `src/overlay011/func_ov011_021cd024.c` | `021cd024` | Frameless leaf: two global-field arithmetic stores in order; `+568 = +600 - 0x80000`, `+572 = +604 - 0x60000` |
| `src/overlay015/func_ov015_021b31f0.c` | `021b31f0` | Four consecutive short stores into `+0x54..+0x5a` then zero `+0x60`, then computed `+0x64`; the order mirrors asm |

---

## reload-bind

### What it is
MWCC decides whether to cache a global pointer in a callee-saved register or reload it from the pool before each use. The two shapes are distinct: the "bind" form loads the global once near function entry and reuses the register throughout; the "reload" form re-loads the pool constant before each access. Choosing the wrong form produces extra `ldr` instructions that differ from the original.

### Gotchas
- A global that appears in a single expression block is typically bound once; a global touched in multiple separate statements across a loop iteration may be reloaded between iterations.
- The `#include "ovXXX_core.h"` guard is the canonical way to get the shared `data_ovXXX_021dXXXX` globals without per-file `extern` declarations; use it when the function reads from the core state block.
- In the ov006 callback-dispatch family, `data_ov006_021cbac0[data_ov006_021cf140[0]]` loads `021cf140` once into a register; `021cf140[1]` is a second indexed access on the same register (not a fresh pool load).
- When two globals appear as the RHS of a single expression (`(data_020c3e48 << 1) | data_02103da0`), mwcc may issue two separate pool-loads; keep the expression inline rather than binding to temporaries.

### Worked examples
| path | addr | key lesson |
|---|---|---|
| `src/overlay006/func_ov006_021b2280.c` | `021b2280` | Callback-dispatch: `data_ov006_021cbac0[data_ov006_021cf140[0]]` — the state array is loaded once and indexed twice |
| `src/overlay006/func_ov006_021b49b4.c` | `021b49b4` | Same dispatch shape with a different state/table pair (`021cbb74` / `021cbb74`) |
| `src/overlay006/func_ov006_021b4668.c` | `021b4668` | MMIO family: `*(int *)0x04000540 = (data_020c3e48 << 1) | data_02103da0` — two globals each loaded from pool separately |
| `src/overlay006/func_ov006_021b4d68.c` | `021b4d68` | Same MMIO pattern with `data_ov006_0224f2e8` guard |
| `src/overlay008/func_ov008_021ada90.c` | `021ada90` | Global struct field update: bind `data_ov008_021b2dc8` once, store `func_ov008_021ada0c()` into its `.f_18` field |
| `src/overlay011/func_ov011_021cc7dc.c` | `021cc7dc` | 2-call composition: `func_ov011_021cc7a0(func_ov011_021cd6d0(), data_ov011_021d4000.f_2a0)` — the struct field is loaded inline as a second argument |
| `src/overlay015/func_ov015_021b30b0.c` | `021b30b0` | Two-output store: `data_ov015_021b5ba0.f8` and `.fc` each loaded once and passed as second arg to their respective helpers |

---

## bitfield

### What it is
MWCC translates C bitfield reads and writes into shift pairs: `(unsigned)(x << (32 - topbit)) >> (32 - width)` for unsigned, or the signed equivalent with arithmetic right shift. The mask and shift constants in the asm exactly encode the bit position and width. Getting the signed vs unsigned distinction wrong produces a different shift instruction.

### Gotchas
- A `(unsigned int)(x << A) >> B` pair extracts an unsigned field; `(int)(x << A) >> B` would produce an arithmetic shift (sign-extending). Use `(unsigned int)` cast explicitly when the field is non-negative.
- The `lsl N / lsr N` zero-extend pair for `unsigned short` return values is forced by MWCC whenever a masked `int` value is returned as `unsigned short`; write `return (unsigned short)(v & mask)` rather than a plain cast.
- A `bic + orr` pair in the asm for a single bit (`bic r1, r2, #0x80 / orr r0, r1, r0, lsr #0x18`) must be expressed as `(*p & ~mask) | ((val << 31) >> shift)` not as a ternary or a direct assign.
- The `orr r0, r0, #0x1 / orr r0, r0, #0x1` double-set pattern (`func_ov005_021aaf08`) requires writing the redundant `(x & ~1) | 1` form even though it simplifies logically to `x | 1`.
- When writing a 4-bit field followed by re-clearing higher bits in the same word (`func_ov011_021cfaf8`), the re-clear must be the outer expression: `((word & ~field_mask) | shifted_val) & outer_mask`.

### Worked examples
| path | addr | key lesson |
|---|---|---|
| `src/overlay011/func_ov011_021cfaf8.c` | `021cfaf8` | 4-bit field write at bits 12:9 then re-clear bits 28:13 with outer `& 0xffe01fff`; two-step: bic+orr then and |
| `src/overlay011/func_ov011_021cfb24.c` | `021cfb24` | Three-step: set bit26 of `+0x2bc`, call helper with arg `1`, then set bits at `+0x2b0 & 0xffe01fff \| 0x18000` |
| `src/overlay011/func_ov011_021cf2b8.c` | `021cf2b8` | Single-field insert: `(*p & 0xe01fffff) | 0x200000`; clear bits 28:21, set bit 21 |
| `src/overlay011/func_ov011_021d0e58.c` | `021d0e58` | MLA row address + bitfield insert: `(*p & 0xf807ffffu) | ((val << 24) >> 5)`; the mask on the shifted-val side must be omitted so mwcc fuses the lsr into the orr |
| `src/overlay011/func_ov011_021d11a0.c` | `021d11a0` | bic+orr bit 7: `(*p & ~0x80u) | ((val << 31) >> 24)` — bit 0 of val into bit position 7 |
| `src/overlay011/func_ov011_021d11c8.c` | `021d11c8` | Clone of `021d11a0` at bit 6: `(*p & ~0x40u) | ((val << 31) >> 25)` |
| `src/overlay011/func_ov011_021cdc3c.c` | `021cdc3c` | Guarded actor-field update: `actor[2] = (actor[2] & ~0x100) | (((unsigned)flag << 31) >> 23)` |
| `src/overlay005/func_ov005_021aaf08.c` | `021aaf08` | Redundant bic+orr: `(p->f_18 & ~0x1u) | 0x1u` where the bic is redundant but must be preserved |
| `src/overlay005/func_ov005_021ab384.c` | `021ab384` | lsl16/lsr16 zero-extend pair: `return (unsigned short)(v & mask)` forces the `lsl #0x10 / lsr #0x10` pair |
| `src/overlay011/func_ov011_021caafc.c` | `021caafc` | Complex multi-field extract: `(unsigned int)(x << 23) >> 28` extracts a 5-bit field starting at bit 4; each nibble extraction must use the exact shift-pair encoding |

---

## divmod-magic

### What it is
MWCC replaces signed integer division by a constant with a multiply-high (smull) sequence when the divisor is a compile-time constant. A plain `a / b` call via `func_020b3870` is used when the divisor is a runtime value. The `func_020b3870` helper returns the quotient in r0 and the remainder in r1; to get the remainder from the return value use `(int)(func_020b3870(a, b) >> 32)`.

### Gotchas
- `func_020b3870(a, b)` returns a 64-bit value; the quotient is the low 32 bits (cast to `int`) and the remainder is the high 32 bits (shift right 32 and cast to `int`). Use `long long` return type.
- When only the quotient is needed, declare `func_020b3870` as returning `int` and use it directly.
- `x * 0xFF` in the asm comes from a `* 255` multiply; MWCC does not simplify this to `(x << 8) - x` in C — write `arg0 * 0xFF` literally.
- The `d * (a2 + 1) / 63` pattern in `func_ov008_021ac06c` produces a compile-time divide-by-63 smull sequence; the `a2 + 1` must appear before the divide, not as a multiply constant.

### Worked examples
| path | addr | key lesson |
|---|---|---|
| `src/overlay015/func_ov015_021b36c4.c` | `021b36c4` | Quotient + remainder from one call: `w += n - (int)(func_020b3870(w, n) >> 32)` to get `n - (w % n)` |
| `src/overlay008/func_ov008_021ac590.c` | `021ac590` | Runtime divmod: `func_020b3870(240, v << 1)` returns quotient; `r << 1` shifts before multiply |
| `src/overlay011/func_ov011_021cc7a0.c` | `021cc7a0` | Cascaded calls: `func_020b3870(arg0 * 0xFF, 0x400 << (((arg1==1)?1:0) + 0xC))` followed by `func_020b3870(result, v4)` |
| `src/overlay008/func_ov008_021ac06c.c` | `021ac06c` | Three-branch clamp with `d * (a2 + 1) / 63`; the constant-63 division is a smull magic sequence |

---

## switch-table

### What it is
A C `switch` over a small dense integer range compiles to a branch table (ldr pc, [pc, r0, lsl #2]) when the case count is high enough. For sparse switches or switches with a default that does interesting work, mwcc may emit a comparison chain instead. The `sel` argument index determines which branch table variant is used.

### Gotchas
- Cases that fall through to the same code must share the same label in C (no separate `return` in each arm).
- A `default: return 0` on a two-case switch may produce a branch table with the default case at a third slot, or it may produce a two-arm cmp chain — check the asm.
- The order of the `case` arms in C must follow the asm's branch table slot order; do not re-sort numerically.
- In `func_ov006_021b6bac`, the `default: return 0` is the third slot of a two-case table — the explicit `case 0` / `case 1` arms must be written, not collapsed with a ternary.

### Worked examples
| path | addr | key lesson |
|---|---|---|
| `src/overlay006/func_ov006_021b6bac.c` | `021b6bac` | Two-case dense switch (sel 0/1) selecting different `int` fields; `default: return 0` |
| `src/overlay006/func_ov006_021b6be0.c` | `021b6be0` | Four-case switch selecting pointer offsets; case 2 returns `base` (no offset); default returns null |
| `src/overlay006/func_ov006_021b6c30.c` | `021b6c30` | Guard + four-case switch; case 2 returns constant; cases 3/default share `return 0` |
| `src/overlay006/func_ov006_021b6ca0.c` | `021b6ca0` | Guard + four-case switch; cases 2/3/default share `return -1`; case 1 has indexed load |
| `src/overlay011/func_ov011_021cc9b4.c` | `021cc9b4` | Two-case switch on `*(int *)(data_ov011_021d4000 + 0x2A0)` copying struct blocks; omitting default is intentional |

---

## if-assign / clamp

### What it is
A conditional assignment `r = x; if (y <= x) r = y;` or `r = (cond ? a : b)` compiles to a `movne`/`moveq`/`movgt` conditional move instruction. The shape of the predicated move depends on whether the condition is equality, ordering, or a zero-test.

### Gotchas
- `moveq r0, #1 / movne r0, #0` maps to `return (a == b)` not to a ternary; write the comparison as the return expression.
- A `moveq r0, #1 / ldmeqia` early-exit followed by a regular path (`return 0` after the calls) means the function returns `1` when the condition is false and does work when it is true — the C must invert the guard: `if (cond == 0) return 1; ...; return 0;`.
- The `if (x <= d) r = x; return r;` clamp pattern in `func_ov005_021ac984` must be written as a binding of the initial value then a conditional reassignment, not as `return (x < d) ? x : d`.
- `(flag != 0)` stored as `(int)` bool must be written exactly as `*(int *)(p + offset) = (flag != 0)` — using `!!flag` or `flag ? 1 : 0` may produce different code.

### Worked examples
| path | addr | key lesson |
|---|---|---|
| `src/overlay006/func_ov006_021b6250.c` | `021b6250` | `(flag != 0)` stored as bool; loop guard `if (i != 0) continue` to produce the branch-table skip inside the for loop |
| `src/overlay011/func_ov011_021cc15c.c` | `021cc15c` | `return func_a(h) == func_b(h) - 1` compiles to `moveq r0, #1 / movne r0, #0` |
| `src/overlay011/func_ov011_021d1b48.c` | `021d1b48` | `if (func_ov011_021cf060() == 0) return 1` — the early-return on the false branch with predicated `ldmeqia` |
| `src/overlay005/func_ov005_021ac984.c` | `021ac984` | Two-variable clamp: `int r = d; if (x <= d) r = x; return r;` — bind initial then conditional reassign |
| `src/overlay006/func_ov006_021b2b08.c` | `021b2b08` | Guard-and-return: `int r = f(); if (r) global = 9; return r;` — the gotcha-1 "return r" shape |
| `src/overlay015/func_ov015_021b34a4.c` | `021b34a4` | null-check early return: `moveq r0, #0 / bxeq lr` maps to `if (p->f_5c == 0) return 0;` before two stores |

---

## decl-order

### What it is
The order in which local variables are declared controls which callee-saved register MWCC assigns to each variable. Variables declared earlier in the function body get lower-numbered registers (r4, r5, r6 ...). Reordering declarations without changing logic changes the register assignments and breaks the match.

### Gotchas
- Declare variables in the order their first store appears in the prologue `stmdb`, not in the order that is logically clearest.
- A variable used only in one branch of an if/else still gets a register if it is declared before the branch.
- The `int i; func_init(); for (i = 0; ...)` pattern assigns i to a lower-numbered register than variables declared after `func_init()` — declare loop counters early.
- In families where siblings share the same shape (ov006 state-machine enter/step/dispatch), declaration order is stable across all members; copy the exact order from a verified sibling.

### Worked examples
| path | addr | key lesson |
|---|---|---|
| `src/overlay006/func_ov006_021b493c.c` | `021b493c` | `int a = ...; int b = ...;` declares probe results in call order; `int ok = ...` inside the braced block comes last |
| `src/overlay006/func_ov006_021b4ea8.c` | `021b4ea8` | Same enter-family: `a` and `b` declared at top, `ok` inside a braced block at the bottom to match the register sequence |
| `src/overlay006/func_ov006_021b33c4.c` | `021b33c4` | Third enter-family member; same `a, b, ok` order confirmed across all 8 family members |
| `src/overlay011/func_ov011_021cf1f8.c` | `021cf1f8` | `idx` and `v` are already params; no extra locals — `mul` uses `idx` directly without a binding |
| `src/overlay005/func_ov005_021abbfc.c` | `021abbfc` | Four conditional Task_InvokeLocked calls in asm order `f_2c, f_28, f_60, f_3c` — NOT struct address order; field visit order controls the ldr sequence |

---

## struct-field-RMW

### What it is
A read-modify-write on a struct field (or a global array element treated as a struct) requires reading the full word, masking the old bits with bic, and OR-ing in the new bits. The asm shows `ldr / bic / orr / str` (or `ldr / and / orr / str`). The C must express this as `*p = (*p & ~mask) | newbits` without any intermediate reads.

### Gotchas
- If the same field is written twice in succession (`clear then set` pattern), both the bic and the orr must appear in the C even if the net result is equivalent to a single write.
- When both a mask-clear and a second mask-clear of an unrelated bit are chained on the same word, both `& ~mask_A` and `& ~mask_B` must appear — do not combine into `& ~(mask_A | mask_B)` unless the asm uses a single literal.
- A `|= 0x10000` on a field where `0x10000` is a power-of-two bit must be written as `|=` not via bic+orr (the asm uses orr without a preceding bic in this case).
- The `func_ov011_021d1230` pattern shows a conditional RMW (`if (arg1 != 0) { RMW to set mode; }`) where the guard ensures one branch does a bic+orr while the other does a bic+orr into a zero.

### Worked examples
| path | addr | key lesson |
|---|---|---|
| `src/overlay011/func_ov011_021d1230.c` | `021d1230` | Two-level RMW: outer `& ~0x100` then conditional inner `& ~0xC00 \| 0x400` on same word |
| `src/overlay011/func_ov011_021cc3d4.c` | `021cc3d4` | Loop body with `bic` clear on `b + 0x268`: `*(int *)(b + 0x268) &= ~0x10` after the loop |
| `src/overlay011/func_ov011_021d1ce8.c` | `021d1ce8` | `*(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xFF) \| 1` — clear low byte then or-in 1 |
| `src/overlay006/func_ov006_021b45f8.c` | `021b45f8` | MMIO `&= ~0x1f00` on both display registers: each must be a separate `&=` expression on a volatile pointer |
| `src/overlay005/func_ov005_021b1000.c` | `021b1000` | Read-field, mask low bits, shift back, re-store: `g[0] = (g[0] & ~0x1f00) \| ((f & ~3) << 8)` |

---

## loop-induction

### What it is
For loops with an index multiplied by a stride (typically via `mla` on ARM) compile from a plain `for (i = 0; i < N; i++)` in C together with `ptr + i * stride` index expressions. MWCC uses `mla` for `start + i * stride` within the loop body. An alternative form increments a pointer directly (`p += stride`) which generates an `add` without `mla`.

### Gotchas
- Using a pointer-increment form (`char *p = base; p += stride;`) instead of an index form (`base + i * stride`) switches between the `add` and `mla` forms; match the asm to determine which.
- `for (unsigned int i = 0; i < N; i++)` (unsigned loop counter) produces a `cmp r5, #N / blt` back-edge, while `for (int i = 0; i < N; i++)` may produce a `bge` or `blt` depending on context. Use `unsigned int` when the asm back-edge is `blt` with an unsigned `cmp`.
- In `func_ov011_021d1884` the counter is `unsigned int i = 0` and the pointer is incremented, producing `add r4, r4, #0x28 / cmp r5, #10 / blt`.
- In `func_ov011_021d1f9c` the stride is `0xa` and the index is `(a0 - 1)` — the subtraction must appear inside the `mla` expression not as a pre-decrement of the variable.
- When a loop visits actor-table entries at stride `0x14` (as in `func_ov011_021cc374` and `func_ov011_021cc3d4`), the pointer is incremented by `+= 0x14` per iteration rather than recomputed from the index.

### Worked examples
| path | addr | key lesson |
|---|---|---|
| `src/overlay011/func_ov011_021d1884.c` | `021d1884` | Pointer-increment loop: `unsigned int i = 0; char *p = base; for (; i < 10; i++) { f(p); p += 0x28; }` |
| `src/overlay011/func_ov011_021cc374.c` | `021cc374` | Actor-table scan with `entry += 0x14`; three-predicate early-return inside the loop |
| `src/overlay011/func_ov011_021cc3d4.c` | `021cc3d4` | Same `entry += 0x14` stride; two-call per-entry pattern |
| `src/overlay011/func_ov011_021d1f9c.c` | `021d1f9c` | MLA index form: `data + (a0 - 1) * 0xa + (a1 - 1)` — subtraction before multiply in the array subscript |
| `src/overlay006/func_ov006_021b7b48.c` | `021b7b48` | Simple counted loop `for (i = 0; i < 5; i++)` with a single call per iteration |
| `src/overlay015/func_ov015_021b25f8.c` | `021b25f8` | Loop with post-increment source pointer: `for (i = 0; i < 6; i++) { dst->arr[i] = f(ctx, *src++); }` |
| `src/overlay015/func_ov015_021b28f0.c` | `021b28f0` | Sibling of above with stride-2 and count-2 |
| `src/overlay008/func_ov008_021aedfc.c` | `021aedfc` | Reverse loop `for (i = 0; i < 26; i++) { int k = 25 - i; ... }` with `k` derived from the counter inside |
| `src/overlay011/func_ov011_021cf228.c` | `021cf228` | Actor loop with special-cased index `i == 4` and bitfield guard in the body |

---

## misc

### What it is
Functions that do not fit neatly into the above classes, including pure thunks, multi-step init sequences, callback-dispatch state machines, and handle-management patterns.

### Gotchas
- Thunks that forward all arguments (`func_ov008_021b23ac`) require no local variables; the function body is a single `externalfunc(p)` call. Even a single extra local changes the register allocation.
- In the `021b2f50` double-invoke pattern (ov011), the second `if (p->f_0)` block is not dead code — the asm literally has both checks, and MWCC will not elide the second one. Write it redundantly.
- The `func_ov008_021b219c` store-order pattern visits `[1]` before `[0]` in the conditional chain — this is NOT alphabetical or address order; it is the asm order.
- The `func_ov006_021b8c50` lazy-init pattern (check-if-zero then call factory) must keep each check and store as separate if-blocks, not combined into a logical-or guard.
- In the enter/step families (8 members in ov006), the only variable parts are the two `init_a` / `init_b` function pointers and the `status` value — all other code is structurally identical. Use `func_ov006_021b493c.c` as the canonical template.

### Worked examples
| path | addr | key lesson |
|---|---|---|
| `src/overlay008/func_ov008_021b23ac.c` | `021b23ac` | Pure thunk: `externalfunc(p)` with no locals |
| `src/overlay011/func_ov011_021d2f50.c` | `021d2f50` | Double-invoke: two identical `if (p->f_0) { invoke; zero; }` blocks — second block is not dead |
| `src/overlay006/func_ov006_021b8c50.c` | `021b8c50` | Lazy-init pair: two separate `if (== 0) slot = factory()` blocks in sequence |
| `src/overlay006/func_ov006_021b8cb8.c` | `021b8cb8` | Guarded teardown pair: two separate `if (!= 0) { invoke; zero; }` blocks |
| `src/overlay008/func_ov008_021b219c.c` | `021b219c` | Visit `[1]` then `[0]` — not address order; each block clears its own slot after calling the shared helper |
| `src/overlay011/func_ov011_021d2d28.c` | `021d2d28` | Thunk with address arithmetic: `data_ov000_021b4e38((char *)p + 8, p)` — first arg is `p + 8`, not `p` |
| `src/overlay011/func_ov011_021cbb64.c` | `021cbb64` | Handle-config: `if (a1 != -1) retag(); configure(); if (a1 != -1) return; reset+release()` — early return skips teardown |
| `src/overlay011/func_ov011_021cc424.c` | `021cc424` | Sibling of above over a different handle table |
| `src/overlay015/func_ov015_021b59a4.c` | `021b59a4` | Multi-resource teardown: guarded job-stop, font-release, then two separate guarded handle-frees with explicit slot-clear |
| `src/overlay005/func_ov005_021acf34.c` | `021acf34` | Result-capture pattern: `int r = f(data); g(data); side_effect_a(); side_effect_b(); return r;` |

---

## Cross-recipe patterns

### store-order + bitfield
When a function performs an RMW on a field whose new value is extracted from another field via shifts, both the load-modify-write and the shift-pair appear together. Write the shift expression inline in the `orr` operand rather than binding to a temp. Example: `func_ov011_021cfaf8` combines the bitfield-write recipe (shift-pair to insert 4 bits) with the store-order recipe (the result is immediately stored back to the same word). The outer `& 0xffe01fff` re-clear after the insert is the second store-order step.

### bitfield + if-assign (guarded bitfield write)
`func_ov011_021cdc3c` shows a guard (`if (id == 0) return`) followed by a bitfield RMW. The guard is an early-return on the zero case (`ldmeqia sp!, {r4, pc}`), which in C is `if (id == 0) return;`. The bitfield write follows the standard `& ~mask | shifted_val` form.

### loop-induction + bitfield (field visit inside loop)
`func_ov011_021cf228` combines a pointer-stride loop with bitfield extraction in the loop body. The `((unsigned int)(*(int *)(s + 0x274) << 11) >> 24)` extraction is inside the loop and must be written as the shift-pair form each iteration; binding to a pre-loop local would produce a different register allocation.

### store-order + reload-bind (interleaved subsystem init)
The ov006 8-member enter family (`func_ov006_021b493c`, `021b4ea8`, `021b33c4`, `021b39a4`, `021b559c`, `021b2de0`) mixes both patterns: two globals (`a`, `b`) are bound once at the top via function calls (reload-bind), then seven interleaved calls follow in store order, then the two state writes (`data[0] = status`) appear. The `int ok = a != 0 && b != 0` at the end must be in a separate braced block to place its register assignment after the seven calls.
