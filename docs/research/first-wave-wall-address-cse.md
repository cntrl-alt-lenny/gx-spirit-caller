# First-wave wall — C-34 address-CSE

**Brief:** 202 (scaffolder). Brief 201 (PR #651) closed B-08 cleanly
but identified a new wall class blocking E-07 + E-08: mwcc 2.0's
address-CSE pass collapses two pool entries for the SAME data
symbol into one slot, producing `mov rN, rM` where orig has
`ldr rN, [pc, #...]`. Result: 1-instruction diff each — the
closest possible miss. Brief 201 ruled out `volatile`, pointer
aliasing, all three routing tiers — and explicitly said
"needs scaffolder-tier intervention." Brief 202 found the
recipe (`.s` with explicit `.word` pool directives) and ships
E-07 as the worked example.

## What address-CSE is

mwcc 2.0/sp1p5 has an IR-level **address-CSE** (common
subexpression elimination) pass. When the same data symbol is
referenced multiple times in a function, mwcc's IR resolves
all references to the same internal symbol node, and CSE
collapses them to a single materialisation.

Concretely: source code `&data_X` AND `data_X.field` AND
`((T *)0xVA)` — when they all resolve to the same address —
produce ONE `ldr` instruction loading the address into a
register, which then gets reused (often via callee-saved
register holding the value across the function body).

This is normally a great optimization — fewer pool entries,
fewer loads. But when the orig was built with a compiler /
optimization combination that DIDN'T do this CSE, the result
diverges by 1 instruction per duplicate slot eliminated.

## Empirical reproduction — pick E-07 (`func_02023f7c`)

### Orig disasm

```text
push  {r3, r4, r5, lr}
ldr   r4, [pc, #92]              @ 0x23fe4  ; r4 = &data_0219a8e4 (slot A)
mov   r5, r0
mov   r1, r4
mov   r0, #0
mov   r2, #8
bl    Fill32                     ; Fill32(0, &data, 8)
ldr   r0, [pc, #72]              @ 0x23fe8  ; r0 = &data_0219a8e4 (slot B)
str   r5, [r0, #4]               ; data.saved_arg = arg0
ldr   r0, [r0]                   ; r0 = data.handle
cmp   r0, #0
bne   .L_done
ldr   r1, [r4, #4]               ; r1 = data.saved_arg (re-read via r4)
mov   r0, #0x88
mul   r5, r1, r0
mov   r0, r5
mov   r1, #4
mov   r2, #0
bl    Task_PostLocked
mov   r1, r0
mov   r2, r5
mov   r0, #0
str   r1, [r4]
bl    Fill32
.L_done:
mov   r0, #1
pop   {r3, r4, r5, pc}
# Pool block:
.word data_0219a8e4    ; slot A — 0x23fe4
.word data_0219a8e4    ; slot B — 0x23fe8 (SAME VALUE, distinct word)
```

`relocs.txt` confirms the duplicate-target loads:

```text
from:0x02023fe4 kind:load to:0x0219a8e4 module:main
from:0x02023fe8 kind:load to:0x0219a8e4 module:main
```

### Built `.c` disasm (mwcc 2.0/sp1p5 + brief 198 stub)

```text
push  {r3, r4, r5, lr}
ldr   r4, [pc, #92]              ; r4 = &data_0219a8e4 (only slot)
mov   r5, r0
mov   r1, r4
mov   r0, #0
mov   r2, #8
bl    Fill32
mov   r0, r4                     ; ← address-CSE: r0 = r4 (no reload)
str   r5, [r0, #4]
ldr   r0, [r0]
...
.word data_0219a8e4              ; ONE pool word only
```

The diff is one instruction at offset 0x1c — `mov r0, r4` (built)
vs `ldr r0, [pc, #72]` (orig) — and a pool word's worth of size
shrinkage at the function tail.

## What was tried (all failed except the .s recipe)

| Attempt | Mechanism | Result |
|---|---|---|
| Bare `extern T data_X;` direct access | C source: two references | mwcc IR-CSE → 1 slot |
| `extern volatile T data_X;` + `volatile T *p = &data_X` | `volatile` qualifier | volatile affects loads/stores, not address materialization. CSE still fires. |
| Pointer alias `T *q = &data_X` after first use | Re-take address through a new var | mwcc CSEs across the call boundary anyway |
| `.legacy.c` (mwcc 1.2/sp2p3) | Different mwcc version | Completely different shape — StyleA epilogue + sub-sp + r4/r5 swap (brief 201 confirmed) |
| `.legacy_sp3.c` (mwcc 1.2/sp3) | Third mwcc tier | Same divergence as `.legacy.c` |
| `asm void` + `nofralloc` (brief 202) | Bypasses mwcc IR-CSE | Compiles cleanly; two `ldr rN, [pc, #imm]` emitted… but mwasmarm dedupes the literal pool when `ldr rN, =sym` is used — both `ldr` instructions point at a SINGLE pool slot |
| **`.s` with explicit `.word` pool labels** | Pure assembly | **Byte-identical match** — mwasmarm doesn't dedupe explicit `.word` directives |

## The recipe — `.s` with explicit pool labels

```text
        .text
        .extern data_0219a8e4
        .extern Fill32
        .extern Task_PostLocked
        .global func_02023f7c
        .arm

func_02023f7c:
        stmdb   sp!, {r3, r4, r5, lr}
        ldr     r4, .L_POOL_A           ; slot A (label-driven, NOT `=sym`)
        mov     r5, r0
        mov     r1, r4
        mov     r0, #0x0
        mov     r2, #0x8
        bl      Fill32
        ldr     r0, .L_POOL_B           ; slot B
        str     r5, [r0, #0x4]
        ldr     r0, [r0]
        cmp     r0, #0x0
        bne     .L_done
        ldr     r1, [r4, #0x4]
        mov     r0, #0x88
        mul     r5, r1, r0
        mov     r0, r5
        mov     r1, #0x4
        mov     r2, #0x0
        bl      Task_PostLocked
        mov     r1, r0
        mov     r2, r5
        mov     r0, #0x0
        str     r1, [r4]
        bl      Fill32
.L_done:
        mov     r0, #0x1
        ldmia   sp!, {r3, r4, r5, pc}
.L_POOL_A:
        .word   data_0219a8e4
.L_POOL_B:
        .word   data_0219a8e4
```

Three details matter:

1. **`ldr rN, label` syntax (NOT `ldr rN, =sym`).** The `=sym`
   form is a mwasmarm macro that asks the assembler to allocate
   a literal-pool slot; mwasmarm dedupes those by value. The
   explicit-label form refers to a specific `.word` directive's
   slot, which mwasmarm treats as opaque data.
2. **Two distinct labels (`.L_POOL_A`, `.L_POOL_B`)** each
   followed by their own `.word data_0219a8e4`. mwasmarm doesn't
   merge identical `.word` directives — they emit at separate
   addresses.
3. **`.extern` declarations** for the data + helper symbols.
   The `.word` references resolve at link time via mwldarm's
   reloc machinery (dsd's `kind:load` entries).

Verified: 3-region `ninja sha1` PASS (EUR / USA / JPN) when
shipped as `src/main/func_02023f7c.s`.

## Why this works mechanically

Two layers must be bypassed:

1. **mwcc IR-CSE.** Triggers on C source where two `&data_X`
   references resolve to the same symbol node. Bypassed by
   writing in `.s` — the assembler doesn't run an IR pass on
   handwritten asm.

2. **mwasmarm literal-pool dedup.** Triggers on `ldr rN, =sym`
   macros where the assembler allocates pool entries by value.
   Bypassed by writing explicit `.word` directives at labels —
   the assembler treats them as opaque data, no dedup.

Bypassing only layer 1 (the `asm void` attempt) still hits
layer 2. Both layers must be bypassed for the orig shape to
emerge.

## Why this is a `.s` recipe and not `.c` + `asm void`

`asm void` works for many wall families (C-12 push-r0 thunks,
C-20 inline-asm escapes) because the body is small enough that
literal-pool layout doesn't matter. For C-34 specifically, the
function body REFERENCES the dual pool slots — and `ldr rN,
=sym` inside `asm void` STILL invokes mwasmarm's literal-pool
allocator, which still dedupes. The full `.s` route gives
explicit control over `.word` placement.

## Detection — classifier signal

[`tools/predict_walls.py`](../../tools/predict_walls.py) gains
a `detect_address_cse` function that consults `relocs.txt`:

```python
# Pseudocode
loads_by_target: dict[int, list[int]] = {}
for line in relocs:
    if line.kind == "load" and addr <= line.from < addr + size:
        loads_by_target.setdefault(line.to, []).append(line.from)

duplicates = [
    (target, slots) for target, slots in loads_by_target.items()
    if len(slots) >= 2
]
if duplicates:
    emit C-34
```

Real-corpus smoke:

```bash
$ python tools/predict_walls.py --version eur --module main --address 0x02023f7c --size 0x70
  C-34: 1 address-CSE candidate: 0x0219a8e4 @ [0x02023fe4, 0x02023fe8] — ...

$ python tools/predict_walls.py --version eur --module main --address 0x02026fd8 --size 0x70
  C-34: 1 address-CSE candidate: 0x0219a924 @ [0x02027040, 0x02027044] — ...
```

E-07 + E-08 fire correctly. Brief 199's C-23 pick #5 (which
has only single-target loads per slot) does NOT fire.

## Affected picks (brief 202 survey)

| Pick | Module | Addr | Size | Symbol | Status |
|---|---|---|---:|---|---|
| E-07 `func_02023f7c` | main | `0x02023f7c` | 0x70 | data_0219a8e4 | **shipped** as `.s` worked example |
| E-08 `func_02026fd8` | main | `0x02026fd8` | 0x70 | data_0219a924 | Clone — same recipe; decomper brief 203+ ships |

A full-scan of EUR for C-34 candidates (via
`tools/predict_walls.py --version eur` against every function
sized 0x40-0x100 in `main`) is brief 203+ scaffolder work.

## Tests

`tests/test_predict_walls.py::TestAddressCSEDetection` — 8 cases:

- `test_e07_single_duplicate_pair` — E-07's exact relocs
- `test_e08_clone_shape` — E-08's analogous shape
- `test_triple_duplicate_pool_slots` — 3+ slots for one symbol
- `test_two_independent_duplicate_pairs` — 2 different symbols
  each with 2+ slots; detector emits one prediction covering
  both
- `test_single_load_no_match` — no duplicate targets, no fire
- `test_arm_call_relocs_ignored` — C-32 territory, not C-34
- `test_duplicate_outside_function_range` — relocs outside
  `[addr, addr+size)` don't fire
- `test_empty_relocs_text` — defensive empty input

## Cross-references

- [`docs/research/codegen-walls.md` § C-34](codegen-walls.md#c-34)
  — taxonomy entry.
- [`docs/research/brief-201-decomp-me-iteration.md`](brief-201-decomp-me-iteration.md)
  — brief 201's diagnostic that surfaced the wall + ruled out
  source-coercion paths.
- [Brief 201 PR #651](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/651)
  — pre-classification discussion.
- [`src/main/func_02023f7c.s`](../../src/main/func_02023f7c.s)
  — brief 202 worked example.
- [`tools/predict_walls.py`](../../tools/predict_walls.py)
  `detect_address_cse` — classifier.
- Brief 086 / C-23 — sibling pool-related wall (different
  signal class).
- Brief 192 / C-32 — sibling reloc-based detector (different
  reloc kind: `kind:arm_call module:none`).
