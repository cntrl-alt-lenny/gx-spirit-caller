[//]: # (markdownlint-disable MD013 MD041)

# Brief 235 — C-39e + brief 232 deferred + broader-C-40 corpus

**Status:** All three investigations land clean wins. 12 worked
examples ship across 2 new classifications (C-39e sub-shape +
C-41 new wall) plus 2 brief 232 deferred recoveries + 3 strict
C-40 sibling sweeps.

- **Investigation A (C-39e null+helper-at-top)** — LOCKED. 3/3
  picks ship byte-identical on first attempt under the natural
  source recipe. Sub-classification added under C-39.
- **Investigation B (brief 232 deferred picks)** — BOTH RECOVERED.
  2/2 picks ship byte-identical under standard recipes. Brief 232's
  reported "54% fuzzy" was apparently caused by a different source
  form during that wave; the natural recipe works now.
- **Investigation C (broader C-40 corpus)** — LOCKED as new wall
  C-41. 4/4 piloted picks ship byte-identical. Recipe: MMIO
  read-modify-write + tail-call to external helper with external
  data symbol. Sibling family is 4 picks (1 mask × 2 helpers × 2
  data symbols).
- **Bonus** — 3 strict C-40 siblings (df40, e1ac, e200) ship
  trivially under brief 233's existing recipe.

**Total ships: 12 worked examples.**

## Investigation A — C-39e (null+helper-at-top)

### The shape

Orig emits at function start:

```asm
push  {r3, r4, r5, lr}
movs  r4, r1               ; spill arg1 to callee-saved r4 + set flags
mov   r5, r0               ; save self in r5
moveq r0, #0
popeq {r3, r4, r5, pc}     ; early-return 0 if arg1 == 0
```

The `movs r4, r1` is mwcc's peephole-fused combo of:

1. `mov r4, r1` — spill arg1 to callee-saved r4 (needed because
   arg1 is used past the intermediate helper1 call)
2. `cmp r1, #0` — early null-check

Both fold into a single S-flag mov.

### Recipe

```c
int func(struct Self *self, int arg1) {
    if (arg1 == 0) return 0;
    if (helper1(self, ...) == 0) return 0;
    return helper2(self, arg1);
}
```

Three structural conditions are jointly required:

1. **`arg1 == 0` test at function top** — forces the early `movs`.
2. **arg1 used past an intermediate call** (typically helper2 at
   tail) — forces the spill to callee-saved r4.
3. **Intermediate `if (helper1(...) == 0) return 0`** — matches
   the orig's middle section.

### Three shipped worked examples (3/3 ship)

| Pick | Size | Notable |
|---|---|---|
| `0228b810` | 64 B | Canonical — helper1(self, bit0); helper2(self, arg1) |
| `0228b850` | 68 B | `1 - bit0` (rsb) variant — helper1(self, !bit0) |
| `0228b894` | 52 B | Simplest — helper1(self) (no bit-extract) |

All 3 ship byte-identical on first attempt under the natural recipe.

### Cohort

Brief 232 wave 5 found 2 known picks. Brief 235's scan for the
shape signature (`push {... r4 ...}; movs r4, r1; moveq r0, #0;
popeq`) found 8 candidates in ov002:

- 021e27c0 (88 B)
- 02206608 (96 B)
- 0220c010 (60 B)
- 0228ab68 (56 B)
- 0228aba0 (56 B)
- 0228b810 (64 B) ✓ shipped
- 0228b850 (68 B) ✓ shipped
- 0228b894 (52 B) ✓ shipped

Estimated total cohort across all overlays: 10-20 picks. Small
but mechanically drainable.

## Investigation B — brief 232 deferred picks

### B1: func_ov002_02295284 (double-call disjunction)

Brief 232 deferred this pick reporting "54% fuzzy under natural
`||` short-circuit." Brief 235 retest: natural recipe ships
byte-identical on first attempt.

```c
int func(struct Self *self) {
    return helper(self->f2.bit0, 0x1181) ||
           helper(self->f2.bit0, 0x179a);
}
```

mwcc 2.0/sp1p5 lowers `||` to `bne / beq` early-exits perfectly.
The brief 232 deferral was likely caused by a different source
form during that wave (named locals, intermediate temporary,
or non-short-circuit translation).

### B2: func_ov002_0220673c (cross-call compare + helper3)

Brief 232 deferred this pick reporting "movlt r0, #0 dead-store
artifact." Brief 235 retest: natural C-39b idiom 2 + helper3 tail
ships byte-identical on first attempt.

```c
int func(struct Self *self, int arg1) {
    int n = helper1(self->f2.bit0);
    if (n < helper2(self)) return 0;
    return helper3(self, arg1);
}
```

The "dead store" brief 230 noted is just mwcc's predicated
`movlt r0, #0` immediately followed by `poplt` — both conditional
on the same flag set, equivalent to `if (lt) { r0 = 0; pop; }`.
Natural recipe produces it correctly.

Both deferrals are recipe-shippable under the brief 226/229
locked sub-shape recipes — the deferral was bookkeeping noise
from the drain wave's per-pick effort cap.

## Investigation C — broader C-40 corpus → C-41

### The broader corpus

Brief 233 noted 459 broader `0x04001xxx` pool occurrences across
EUR `.text` beyond the 4 strict C-40 picks. Brief 235 piloted
several to test if a broader recipe exists.

**Finding**: the broader corpus is HETEROGENEOUS in shape. Most
picks use MMIO registers for distinct purposes (conditional
dispatch, switch-tables, multi-step read/write) — each needs
its own recipe. But one coherent sibling family emerged:

### C-41 — MMIO bit-clear + tail-call (NEW WALL)

4 picks share this exact shape:

```asm
ldr  r2, .L_mmio          ; 0x04001000 (DISPCNT)
ldr  ip, .L_helper        ; helper func ptr (reloc)
ldr  r1, [r2]
ldr  r0, .L_data          ; data ptr (reloc)
bic  r1, r1, #IMM         ; clear 0x80000000 or 0x40000000
str  r1, [r2]
bx   ip                    ; tail-call helper(data)
```

Recipe:

```c
#define DISPCNT (*(volatile unsigned int *)0x04001000)
extern int helper(void *arg);
extern char data_symbol[];

int func(void) {
    DISPCNT &= ~MASK;
    return helper(data_symbol);
}
```

mwcc 2.0/sp1p5 emits orig shape directly. Tail-call (`bx ip`)
arises naturally because helper + data are pool-loaded externals.

**Four shipped worked examples (4/4 ship):**

| Pick | Mask | Helper | Data |
|---|---|---|---|
| `0208cc18` | 0x80000000 | func_0208cd64 | data_021a631c |
| `0208cc40` | 0x40000000 | func_0208cd64 | data_021a631a |
| `0208ce48` | 0x80000000 | func_0208cf6c | data_021a631c |
| `0208ce70` | 0x40000000 | func_0208cf6c | data_021a631a |

Classified as new wall **C-41**. Detector + 2 unit tests added.

### Bonus — 3 strict C-40 siblings shipped

The brief 219 deferred 4 picks, brief 233 shipped 1 (0208deec).
The remaining 3 (df40, e1ac, e200) ship trivially under brief
233's recipe — no new research needed.

| Pick | Mask | Shifts | Pool |
|---|---|---|---|
| `0208df40` | 0x3c | asr #2; lsl #0xe | 0x04001008 |
| `0208e1ac` | 0x1f00 | asr #8; lsl #0xb | 0x0400100a |
| `0208e200` | 0x1f00 | asr #8; lsl #0xb | 0x04001008 |

### Other broader picks tried (heterogeneous, not C-41)

- 0208de4c, 0208dd9c: MMIO read + conditional decision logic.
  Specific to per-function dispatch logic. Each needs its own
  recipe.
- 0208cfa4, 0208d030: more complex MMIO read + secondary write +
  conditional dispatch. Multi-step state machines.
- 0208df94, 0208e0a0: switch-table based on bit-field. Jump
  tables.

These are valid future-brief candidates but don't share a single
recipe with C-41. Decomper drain on broader-C-40 picks should
expect 1 recipe per shape family (≤4 picks each typically).

## Detector + tests

`tools/predict_walls.py` extensions:

- **C-39e**: fires when `movs rD, r1` (D=1..f) appears in first
  6 instructions with `moveq r0, #0` + `popeq {regs, pc}`
  in same window.
- **C-41**: fires on the 7-instruction `ldr/ldr/ldr/ldr/bic/str/bx
  ip` body + 0x04001xxx pool word.

4 new unit tests:

1. `test_e1_null_helper_at_top_fires_c39e` — C-39e canonical
   fires C-39 + C-39e.
2. `test_no_movs_r4_r1_does_not_fire_c39e` — baseline C-39
   without the early movs/popeq doesn't fire C-39e.
3. `test_canonical_mmio_bit_clear_tail_call_fires_c41` — C-41
   canonical fires.
4. `test_no_bic_does_not_fire_c41` — strict C-40 shape (no bic)
   fires C-40 but NOT C-41.

## Drain impact

12 new ships in this brief:

| Category | Picks | Wall |
|---|---|---|
| C-39e sub-shape | 3 | New: C-39e |
| Brief 232 deferred | 2 | C-39b/d recovery |
| C-41 sibling family | 4 | New: C-41 |
| Strict C-40 bonus | 3 | C-40 (existing) |

Brief 235 unlock estimate for brief 236+:

- C-39e cohort: 10-20 picks across all overlays
- C-41 cohort: 4 known + maybe 10-20 similar broader patterns
- Continued strict C-40 drain: 0 known remaining

## Cross-references

- `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md`
  — C-39a (sign-check), C-39b (helper-reuse)
- `docs/research/brief-229-c39c-d-pilots-and-c38-nonleaf.md` —
  C-39c (P-13), C-39d (multi-call re-read)
- `docs/research/brief-233-c40-mmio-bit-extract.md` — C-40 base
  recipe
- `docs/research/mmio-bit-extract.md` — full C-40 variant matrix
- `src/overlay002/func_ov002_0228b810.c` — C-39e canonical
- `src/main/func_0208cc18.c` — C-41 canonical
