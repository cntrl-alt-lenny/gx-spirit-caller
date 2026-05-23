# First-wave wall — P-11 mwcc 2.0 reg-allocator plateau

**Brief:** 200 (scaffolder). Brief 198 (PR #648) ran permuter
across 9 Cluster B + E picks and 5 of 9 plateaued at scores
480-500. Per brief 084's "3 walls not 1" methodology, that's
not 5 stuck functions — it's ONE shared codegen mechanism the
permuter can't reach. Brief 200 characterises that mechanism,
adds a classifier rule, and documents the cohort so brief 201+
can pre-flag affected picks rather than burn permuter cycles.

## The empirical finding

5 picks plateaued at 480-500 in brief 198:

| Pick | Module | Addr | Size | Score | Variants explored |
|---|---|---|---:|---:|---:|
| E-12 `func_02024574` | main | `0x02024574` | 0x74 | 480 | 3 |
| E-13 `func_020270d0` | main | `0x020270d0` | 0x74 | 485 | 3 |
| E-14 `func_02028790` | main | `0x02028790` | 0x74 | 485 | 1 |
| B-22 `func_0200b0c8` | main | `0x0200b0c8` | 0x5c | 500 | 5 |
| B-24 `func_ov011_021d2ca8` | ov011 | `0x021d2ca8` | 0x5c | 490 | 4 |

Permuter mutated source-level constructs (variable renames,
type juggles, reorderings) and explored 1-5 source variants per
pick. None reached score 0 (= byte-match). The score plateau
across the 5 picks is suspiciously narrow given their different
semantics (E-12/13/14 are "find-empty-slot" templates; B-22 is
an array destructor; B-24 is a struct-field setter with stack
spills). That suggests the divergence is shared.

## Part 1 — disasm survey

I compared orig vs mwcc-2.0-built disasm for each of the 5
picks. Three distinct shape classes emerged:

### E-12 / E-13 / E-14 — find-empty-slot template

Identical instruction sequence across the three picks; only
the stride constant and pool symbol differ (0x16c / 0xe0 /
0x19c; `data_0219a8ec` / `data_0219a924` / `data_0219a92c`).

```text
push  {r4, r5, r6, lr}
ldr   r1, [pc, #96]          ; pool word A
mov   r4, r0
ldr   r5, [r1, #4]            ; r5 = count
ldr   r1, [pc, #88]            ; pool word B (SAME VALUE as A)
cmp   r5, #0
mov   r3, #0
ble   .L_skip
ldr   r2, [r1]                ; r2 = data.array
.Lloop:
  ldr   r0, [r2]
  cmp   r0, #0
  beq   .L_skip
  add   r3, r3, #1
  cmp   r3, r5
  add   r2, r2, #STRIDE
  blt   .Lloop
.L_skip:
  cmp   r3, r5
  mov   r0, #0
  popge {r4, r5, r6, pc}
  mov   r2, #STRIDE
  mul   r5, r3, r2
  ldr   r6, [r1]              ; reload base (3rd r1-deref)
  add   r1, r6, r5
  bl    Fill32
  str   r4, [r6, r5]
  add   r0, r6, r5
  pop   {r4, r5, r6, pc}
.word DATA_PTR
.word DATA_PTR                ; SAME pool value
```

Built `.c` (mwcc 2.0/sp1p5) for the same source:

```text
push  {r4, r5, r6, lr}
ldr   r1, [pc, #96]          ; single pool word (deduped!)
mov   r4, r0
ldr   r2, [r1, #4]            ; r2 (NOT r5) = count
mov   r3, #0
cmp   r2, #0
ble   .L_skip
ldr   r1, [r1]                ; r1 = data.array (deref-in-place)
.Lloop:
  ldr   r0, [r1]
  cmp   r0, #0
  beq   .L_skip
  add   r3, r3, #1
  cmp   r3, r2                ; cmp vs r2, not r5
  add   r1, r1, #STRIDE        ; r1 walks (orig had r2)
  blt   .Lloop
...
```

Three visible divergences:

1. **Pool count.** Orig has 2 pool words (same value); built
   has 1. mwcc 2.0/sp1p5 deduped — natural CSE.
2. **Count register.** Orig uses r5 (callee-saved across the
   loop). Built uses r2 (caller-saved). mwcc 2.0 saves the
   push-list space but spills more later.
3. **Cursor register.** Orig walks r2; built walks r1. Choice
   flows from #2.

### B-22 — array destructor with in-loop bl

Different semantics (Task_InvokeLocked called for each item),
but same divergence class:

```text
ORIG                          BUILT (mwcc 2.0/sp1p5)
====                          ====
push {r4, r5, r6, lr}         push {r3, r4, r5, lr}   ← diff push list
movs r6, r0                   movs r5, r0              ← diff reg
beq .L_done                   moveq r0, #0             ← predicated return
                              popeq {r3, r4, r5, pc}   ←   inline tail
ldr r5, [r6]                  ldr r0, [r5]             ← diff reg
mov r4, #0                    mov r4, #0
cmp r5, #0                    cmp r0, #0
ble .L_after_loop             ble .L_after_loop
ldr r0, [r6, #4]              ldr r0, [r5, #4]
ldr r0, [r0, r4, lsl #2]      ldr r0, [r0, r4, lsl #2]
cmp r0, #0                    cmp r0, #0
beq .L_skip                   beq .L_skip
bl Task_InvokeLocked          bl Task_InvokeLocked
                              ldr r0, [r5]             ← built reloads count!
add r4, r4, #1                add r4, r4, #1
cmp r4, r5                    cmp r4, r0               ← diff reg
blt .Lloop                    blt .Lloop
...                           ...
```

Three divergences:

1. **Push list**: orig `{r4, r5, r6, lr}` vs built `{r3, r4,
   r5, lr}` — mwcc 2.0 saved r3 for alignment AND used r5
   instead of r6 for the saved pointer.
2. **Conditional return shape**: orig branches to a separate
   tail (`beq .L_done`); built predicates the return inline
   (`moveq r0, #0; popeq`).
3. **In-loop reload**: built reloads `[r5]` inside the loop
   body — orig kept r5 live.

### B-24 — useless-spill stack-scratch

```text
push {r4, lr}
sub  sp, sp, #16             ; 4 ints of stack scratch
mov  r4, r0
str  r1, [r4, #0x2c]
str  r2, [r4, #0x30]
ldr  r0, [r4, #0x34]
str  r1, [sp, #8]             ← STACK WRITE #1 (never read back!)
bic  r0, r0, #1
str  r0, [r4, #0x34]
ldr  r0, [r4, #0x20]
str  r2, [sp, #0xc]           ← STACK WRITE #2 (never read back)
str  r1, [sp]                  ← STACK WRITE #3 (never read back)
str  r2, [sp, #4]              ← STACK WRITE #4 (never read back)
cmp  r0, #0
beq  .L_done_cleanup
bl   Task_InvokeLocked
mov  r0, #0
str  r0, [r4, #0x20]
.L_done_cleanup:
ldr  r0, [r4, #0x40]
bic  r0, r0, #0x100
str  r0, [r4, #0x40]
add  sp, sp, #16
pop  {r4, pc}
```

The orig has **FOUR stack writes to a 16-byte scratch slot
that are never read back**. They're dead stores — mwcc could
elide them. mwcc 2.0/sp1p5 keeps them. Source-level iteration
(volatile, `register`, etc.) doesn't reach this decision.

## Part 2 — hypothesis

**The shared mechanism is mwcc 2.0/sp1p5's reg-allocator +
liveness-analysis pass.** Specifically:

1. **Register choice for callee-saved state.** mwcc 2.0
   prioritises caller-saved registers when possible (avoids
   the push/pop cost), then chooses ad-hoc which r4..r10 to
   use when forced. The orig's choice was made by a different
   version (possibly mwcc 1.2 then back-ported, OR mwcc 2.0
   at a different optimization level / SP-point).

2. **CSE on pool loads.** mwcc 2.0 deduplicates identical
   pool-word values. The orig keeps them separate. Brief 086
   showed `.legacy.c` routing (mwcc 1.2/sp2p3) preserves the
   non-deduped form — BUT in P-11's cohort, switching to
   `.legacy.c` doesn't help because the rest of the function
   doesn't match `.legacy.c`'s shape either (orig has Style B
   `pop {pc}` epilogue, which mwcc 1.2/sp2p3 doesn't emit).

3. **Conditional return predication vs branch-to-tail.**
   mwcc 2.0 aggressively predicates 2-3 instruction tails;
   orig sometimes branches to a separate tail label. Brief
   109 / C-28 / C-29 covered specific instances of this
   choice; the picks in P-11's cohort have multiple
   conditional-return sites and the predication choice
   compounds.

4. **Dead-store elision (B-24 specifically).** mwcc 2.0's
   spill-promote pass doesn't catch all dead stores. The
   orig's spills are intentional — possibly hand-written
   asm or a different mwcc version.

**Critically, all four mechanisms are DOWNSTREAM of source-
level constructs.** Permuter mutates the source AST (rename
variables, reorder statements, change types) but the mwcc
reg-allocator runs after parse on the resulting IR. The same
source-level mutations produce the same reg-allocator
decisions; permuter can't reach the choice.

## Part 3 — recipe attempts (best effort)

I tried one targeted coercion per pick before declaring the
plateau permanent.

**Attempt: `volatile` on the global pointer to defeat CSE.**
For E-12, declared `extern volatile ctx_t data_0219a8ec;`
expecting mwcc to emit the dual pool-load. Result: shape
shifted (added a 2nd pool word AND switched cursor reg from
r1 to r5) but didn't byte-match. mwcc 2.0 with `volatile`
chose array-index addressing `[r0, r5]` instead of orig's
pointer-increment `r2 += 364`.

The diff between orig and `volatile`-coerced is now in a
different dimension (addressing mode), still far from byte
match.

**Attempt: `.legacy.c` routing (mwcc 1.2/sp2p3).** Brief 086's
recipe for the dual-pool-load shape. Result: legacy.c emits
0x84 bytes vs orig's 0x74 — 16 bytes longer due to `sub sp,
#4` prologue + Style A epilogue (`pop {r4-r7, lr}; bx lr`).
Orig is Style B (`pop {r4, r5, r6, pc}`), so `.legacy.c` is
the wrong tier.

**Attempt: structural simplification.** Tried inlining the
loop body to remove the goto, hoping to shift the reg-alloc.
Result: same plateau.

**No recipe found.** Per the brief's "Realistic expectation:
Outcomes vary. The classification + understanding IS the
deliverable. If no recipe ships, that's fine — the next round
knows what tool to reach for instead."

## Classification: P-11 (permanent under current tools)

Added as P-11 in `docs/research/codegen-walls.md`:

- **Name**: mwcc 2.0 reg-allocator plateau on mid-size
  helper-call functions
- **Size range**: 0x5c-0x74 (23-29 instructions)
- **Signal**: 3+ callee-saved push + ≥1 bl + ≥2 cond branches,
  OR `sub sp, #N` scratch + ≥1 bl + ≥1 cond branch
- **Recipe**: NONE yet (permanent)
- **Future**: may promote to C-N if a reg-alloc-hint source
  coercion is discovered (precedent: C-29 supersedes P-10)

Classifier extension in `tools/predict_walls.py`:

```python
# Main path
has_multi_callee_save_push = (3+ callee-saved regs in push)
plateau_main = (
    has_multi_callee_save_push
    and bl_count >= 1
    and cond_branch_count >= 2
)

# Alt path (B-24 stack-scratch shape)
has_stack_scratch = `sub sp, sp, #N` with N in {8,16,20,24,32}
plateau_alt = (
    has_stack_scratch
    and bl_count >= 1
    and cond_branch_count >= 1
)

if (plateau_main or plateau_alt) and 0x5c <= size_bytes <= 0x74:
    emit P-11
```

Smoke (real corpus):

- E-12/13/14 → P-11 ✓ (main path: 3+ callees + 1 bl + 3 cond)
- B-22 → P-11 ✓ (main path: 3+ callees + 3 bl + 4 cond)
- B-24 → P-11 ✓ (alt path: sub sp #16 + 1 bl + 1 cond)
- B-08 tiny leaf (0x1c) → not flagged ✓ (size below floor)
- C-23 pick #5 (0x6c, has bl + cond but only 2 cond branches)
  → not flagged as P-11 ✓ (correctly bucketed as C-23 instead)

## Test coverage

`tests/test_predict_walls.py::TestP11Detection` adds 7 cases:

- `test_e12_shape_3_callees_2_cond_1_bl` — main path positive
- `test_b22_shape_3_callees_4_cond_3_bl` — main path positive,
  more callee-saved + more cond branches
- `test_b24_shape_stack_scratch_alt_path` — alt path positive,
  verifies cue text mentions "stack-scratch"
- `test_small_leaf_no_match` — size below floor (0x1c)
- `test_too_large_no_match` — size above ceiling (0x90)
- `test_no_helper_call_no_match` — bl missing
- `test_single_callee_no_scratch_no_match` — neither main nor
  alt-path signal

47 → 54 predict_walls tests (+7 new).

## Brief 201+ next actions

1. **Reroute E-07 / E-08 / B-08 to decomp.me** (brief 198
   already recommended). These plateaued at lower scores
   (220/230/315); manual coercion has a fighting chance.

2. **Defer the 5 P-11 picks**. With the classifier flag in
   place, brief 201's decomper can `--skip-if-wall=P-11`
   when generating worklists. Don't burn budget retrying
   them through permuter or hand-iteration.

3. **Scaffolder reg-alloc-hint research (separate brief
   candidate).** The mechanism could in theory be defeated by:

   - A pragma-style hint mwcc 2.0/sp1p5 honors (e.g.
     `__regs_used`).
   - A specific mwcc command-line flag (`-O3,p` vs `-O4,p`).
   - A C-level shape that constrains the reg-allocator's
     choice (e.g. explicit register variables, though mwcc
     2.0 is known to mostly ignore `register`).

   Brief 202+ candidate: empirically sweep mwcc 2.0 SPs +
   optimization levels on E-12 and see if any produce the
   orig form.

## Cross-references

- [`docs/research/codegen-walls.md` § P-11](codegen-walls.md#p-11)
  — taxonomy entry.
- [`docs/research/brief-198-permuter-outcomes.md`](brief-198-permuter-outcomes.md)
  — input data: the 9-pick permuter wave that surfaced the
  plateau.
- [Brief 198 PR #648](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/648)
  — original permuter wave + plateau finding.
- Brief 190 PR #637 (Cluster B walls) — original brief
  classification of B-08/B-22/B-24 as "mwcc-elide" (brief
  200 promotes a subset to P-11).
- Brief 193 PR #640 (Cluster E walls) — original brief
  classification of E-07/E-08/E-12/E-13/E-14 as "reg-alloc
  drift" (brief 200 promotes E-12/13/14 to P-11; E-07/E-08
  stay at the lower-score "decomp.me candidate" tier).
- [`tools/predict_walls.py`](../../tools/predict_walls.py) —
  P-11 detector.
- [`tests/test_predict_walls.py::TestP11Detection`](../../tests/test_predict_walls.py)
  — 7 unit tests.
