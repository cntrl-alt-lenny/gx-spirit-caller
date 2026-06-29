[//]: # (markdownlint-disable MD013 MD041)

# Constant / Enum → Function Cross-Reference

For each catalogued constant or mask: the matched .c files that test or assign it.
Helps identify which C-matching recipes target each constant.
Constants are documented in `docs/research/constants/`.

> Source: grep of `src/**/*.c` for constant literals
> Branch: kb/retriage
> Note: counts below are EUR canonical .c files only (exclude usa/ and jpn/ mirrors).
>   USA/JPN port copies approximately double the totals shown.

---

## Constants by frequency (EUR canonical .c hits)

### 0x23 — C-39 wildcard entity tag

**EUR .c files with `== 0x23` or `!= 0x23`:** 17 files, 26 occurrences
**Total across all regions:** ~51 files (3× EUR)

**Top callers (EUR canonical):**

| File | Code | Purpose |
|------|------|---------|
| `src/overlay002/func_ov002_022044a4.c` | `if (self->b6_11 == 0x23) return 1;` | Early return for wildcard — skip further type checks |
| `src/overlay002/func_ov002_0220dc20.c` | `if (self->b6_11 == 0x23) return 1;` | Same pattern — C-39f clone family |
| `src/overlay002/func_ov002_02202a78.c` | `if (self->b6_11 != 0x23) { helper(...) }` | Inverse guard — non-wildcard requires helper call |
| `src/overlay002/func_ov002_021ff354.c` | `if (self->f2.tag6 != 0x23) { ... }` | Type-gating with tag6 bitfield extraction |
| `src/overlay002/func_ov002_021f5180.c` | `if (self->f2.tag6 != 0x23) { helper(bit0, 0xffff, 1); } return 1;` | Returns 1 always; skips helper only for wildcard |
| `src/overlay002/func_ov002_021f609c.c` | `if (self->f2.tag6 != 0x23) { ... }` | tag6 != 0x23 type-gate chain |
| `src/overlay002/func_ov002_02202b58.c` | `if (self->f2.field6 == 0x23) { ... }` | Positive wildcard branch |
| `src/overlay002/func_ov002_02202794.c` | `return (((unsigned int)p->h_2 << 20) >> 26) != 0x23;` | Predicate: returns 1 if NOT wildcard |

**Also seen in dispatch table selection:** `src/overlay002/func_ov002_02257464.s` uses `cmp r1, #0x23` to choose between card-effect descriptor set A (when tag6 == 0x23) and set B (otherwise). See DataToFunction.md § data_ov002_022be1ac.

**Recipe implication:** any ov002 MED candidate that accesses `self->f2` or `self->b6_11` will likely need the C-39 wildcard guard. The canonical form is `if (self->b6_11 == 0x23)` (using a named bitfield, not a manual shift). Two families exist:
- **Positive form:** `if (== 0x23) return 1` (17 EUR files)
- **Inverse form:** `if (!= 0x23) { call helper; } return 1` (the remaining files)

---

### 0x7F / 0x80 — DuelQueueState active/idle flags

**EUR .c files with `== 0x7f`/`case 0x7f` or `== 0x80`/`case 0x80`:** 2 EUR files (the `switch` at `data_ov002_022ce288+0x5a8`)

| File | Code | Purpose |
|------|------|---------|
| `src/overlay002/func_ov002_0222b2e0.c` | `case 0x80: ... return 0x7f; case 0x7f: ...` | 3-way switch on queue state byte; 0x80 = active (dispatch call), 0x7f = idle (drain call) |
| `src/overlay002/func_ov002_0223483c.c` | `case 0x80: if (helper() != 0) return 0x7f; case 0x7f: ...` | Same 3-way switch — conditioned on a status helper |

**Also used as OAM priority mask:** `src/main/func_020366b0.c` uses `& 0x7f` to extract the 7-bit priority field from a card-def byte: `myPrio = defs[myOff] & 0x7f`. This is a different semantic — do not conflate with the DuelQueueState usage.

**Also used as ASCII DEL check:** `src/main/func_02044228.c` uses `if (c == 0x7f) return 0` (DEL character guard in a printable-char predicate).

**Recipe implication:** the `switch(*(int *)(data_ov002_022ce288 + 0x5a8))` pattern is a fixed 3-way switch. Both matched functions have `case 0x80` (active) and `case 0x7f` (idle) with a fall-through `return 0`. The switch with no default and a trailing `return 0` is a fixed shape — use `switch` not `if/else` or the mwcc register allocation differs.

---

### 0x868 — PerPlayerRowTable player stride

**EUR ov002 .c files with `0x868`:** 128 files (the largest constant cluster in the project)

**Top callers (representative sample):**

| File | Code | Purpose |
|------|------|---------|
| `src/overlay002/func_ov002_021b3e28.c` | `*(u16 *)((char *)data_ov002_022cf1a6 + (arg0 & 1) * 0x868 + arg1 * 20)` | 2-D table lookup: player×slot, u16 field |
| `src/overlay002/func_ov002_021b3e5c.c` | same pattern — stride literal `0x868` | u16 from cf1a6 table |
| `src/overlay002/func_ov002_021b3ecc.c` | same pattern | Predicate on u16 value |
| `src/overlay002/func_ov002_021b90a8.c` | `char *base = data_ov002_022cf16c + (arg0 & 1) * 0x868;` | zone_count read from +0 of base |
| `src/overlay002/func_ov002_021b9e00.c` | `*(int *)((char *)data_ov002_022cf1a8 + (arg0 & 1) * 0x868 + arg1 * 20)` | int field from cf1a8 sub-table |
| `src/overlay002/func_ov002_021b9e48.c` | same pattern | int field from cf1a8 |
| `src/overlay002/func_ov002_021b9d34.c` | threshold test on cf1a8 field | Comparison against a u16 threshold |
| `src/overlay002/func_ov002_021b8fcc.c` | `*(unsigned int *)(data_ov002_022cf1ac + (a0 & 1) * 0x868 + a1 * 20)` | u32 field from cf1ac sub-table |
| `src/overlay002/func_ov002_021b30ac.c` | u16 from cf1a6, forwarded to 6-arg handler | Dispatcher variant |
| `src/overlay002/func_ov002_021b4160.c` | u16 from cf1a6, call 021b3c5c(v, arg2, arg3) | Dispatcher variant |

**The standard 2-D access formula:**

```c
/* The per-player/per-row access pattern — used by ~128 EUR ov002 .c files */
base_ptr + (player & 1) * 0x868 + row_index * 0x14
```

Where `base_ptr` is one of several sub-arrays within the PerPlayerRowTable:
- `data_ov002_022cf16c` — zone card-count (field +0x000)
- `data_ov002_022cf1a6` — node-lookup u16 table (field +0x03A)
- `data_ov002_022cf1a8` — int field (field +0x03C)
- `data_ov002_022cf1ac` — u32 field (field +0x040)

**Recipe implication:** 0x868 is the single most pervasive non-trivial constant in ov002 matched .c files. It always appears in the formula `(player & 1) * 0x868`. The literal must be loaded by mwcc as an LDR-from-pool constant (not synthesized). Use the pointer-cast form exactly; any variant that mwcc generates differently will fail to match.

---

### 0x14 — actor stride / inner loop step

**EUR ov002 .c files with `0x14`:** 61 files (significant overlap with 0x868 files)

**Disambiguation by context:**

| Context | Semantic | Example |
|---------|----------|---------|
| In `+ row_index * 0x14` alongside `0x868` | 5-slot sub-array stride (20 bytes per row slot) | `func_ov002_021b3e28.c` |
| In `mov r4, #0x14` in ov002 .s context | Loop count (20 iterations) | `func_ov002_021c3e40.s` (also uses 0x868 calculation) |
| In `VRAM_PAGE_SHIFT` or display-register context | VRAM page computation | `src/main/Vram_GetBankBaseCD.c` |

**The inner-loop stride pattern:**

```c
/* The 0x14 = 20-byte inner stride always appears as the second multiplier */
(arg0 & 1) * 0x868 + arg1 * 0x14  /* arg1 = row slot 0..4 */
```

**Recipe implication:** 0x14 within a `* 0x14` multiply is the inner stride of the 5-slot sub-array inside each player half. It generates `MLA r, row, #0x14, base` in mwcc. Do not confuse with the VRAM bank constant (which appears in main arm9 code only).

---

### 0x1FFF / lsl#19 lsr#19 — Ov002Slot.id_lo13 bitfield

**EUR .c files with `0x1fff` or equivalent `lsl#19; lsr#19` pattern:** 3 EUR files in comments; the assembly pattern is more common in .s files.

| File | Code | Purpose |
|------|------|---------|
| `src/main/func_0202b0e0.c` | comment only: `lsl #19; lsr #19` (rather than `and #0x1fff`) | Documents the bitfield extraction of bits 0–12 (13-bit id_lo) |
| `src/overlay002/func_ov002_021c3e40.s` | `mov r1, r2, lsl #0x13; mov r1, r1, lsr #0x13` (asm) | Extracts id_lo13 from the slot word |

**Note:** The 13-bit id field is almost never expressed as `& 0x1fff` in matched .c files — mwcc generates the `lsl#19; lsr#19` shift pair only when the bitfield is declared as `: 13` in a typedef. Hand-masking with `& 0x1FFF` produces a different instruction sequence that will not match. The correct form is:

```c
struct Ov002Slot {
    unsigned int id_lo13 : 13;
    /* ... */
};
```

---

### 0x343FD — LCG RNG multiplier

**EUR .c files with `0x343fd`:** 2 EUR canonical files (+ 1 ov021 file)

| File | Code | Purpose |
|------|------|---------|
| `src/main/Rand_Next.c` | `s = s * 0x343fd + 0x269ec3;` | Main arm9 MSVCRT LCG random number step |
| `src/overlay002/func_ov002_021b009c.c` | `s = s * 0x343fd + 0x269ec3;` | ov002 local RNG clone (same LCG formula) |
| `src/overlay021/func_ov021_021abb40.c` | `v = v * 0x343fd + 0x269ec3;` | ov021 local RNG clone |
| `src/overlay008/Ov008_Rand.c` | `s = s * 0x343fd + 0x269ec3;` | ov008 RNG clone |

**Also in USA/JPN port files:** `func_ov002_021affbc.c` (usa/jpn only), `func_ov008_021aa42c.c` (usa/jpn), `func_020224b8.c` (usa/jpn main).

**Recipe implication:** the LCG step is a C-23 family constant — any function that implements the Microsoft rand() LCG (multiply by 0x343FD, add 0x269EC3, output bits 30:16 with `& 0x7FFF`) is a confirmed match. The four EUR files above are all verified byte-exact matches.

---

### 0x269EC3 — LCG RNG increment

Appears in all the same files as 0x343FD above. Always co-occurs with the multiplier as part of the single LCG step expression `s * 0x343fd + 0x269ec3`.

---

### 0x800 — FX_Mul rounding constant

**EUR .c files with FX_Mul or `0x800` in fixed-point context:** 1 EUR file (in comment/ASM description)

| File | Code | Purpose |
|------|------|---------|
| `src/main/SysWork_GetPointDistance.c` | comment: `adds rL, #0x800; adc rH, #0; lsr rL, #0xc` | FX_Mul round-to-nearest half-ulp addend before the 12-bit right shift |

**Also appears as hardware constant:** `0x800` appears in `src/overlay002/func_ov002_0226bad0.c` and 56 other files, but in those files it is primarily a game-logic bit-11 mask or upper-bound value, not the FX_Mul rounding constant.

**Recipe implication:** the `FX_Mul(a, b)` macro expands to `((s64)a * b + 0x800LL) >> 12`. The `0x800` addend is the half-ulp used for round-to-nearest. When this pattern appears, use the `FX_Mul` macro from `<nitro/fx/fx.h>` rather than writing the multiply-and-shift inline.

---

### 0x40000000 — DISPCNT display-enable bit / deferred-task ready bit

**EUR .c files with `0x40000000`:** 3 EUR canonical files

| File | Code | Purpose |
|------|------|---------|
| `src/overlay000/func_ov000_021aca28.c` | `s->flags &= ~0x40000000;` | Clears the bit-30 deferred-task ready flag in a singleton |
| `src/main/func_0208cc40.c` | `DISPCNT &= ~0x40000000;` | Clears DISPCNT bit 30 (display on/off toggle) |
| `src/main/func_0208ce70.c` | `DISPCNT &= ~0x40000000;` | Same — sibling display-toggle function |

**Also in main arm9 group:** `func_0208cc18.c`, `func_0208cd18.c`, `func_0208cf20.c` (all do `*(volatile u32*)0x04000000 &= ~0x40000000u`).

**Recipe implication:** `0x40000000` appears in two unrelated contexts. In ov000 it is a flag in a state-singleton (semantic: task ready). In main arm9 it is DISPCNT bit 30. The BIC pattern `s->flags &= ~0x40000000` requires that `0x40000000` appear as the IMMEDIATE in a BIC instruction — mwcc handles this correctly only if the struct field is wide enough (u32). A u16 field will not produce the right instruction shape.

---

### 0x2F07 — game-state flag mask

**EUR .c files with `0x2f07`:** 3 EUR canonical files (triplet of clone functions)

| File | Code | Purpose |
|------|------|---------|
| `src/main/func_0200aae4.c` | `if (data_02104bac.flags & 0x2f07) { return 1; }` then `func_0200aa60(0x2f07)` | Test composite flag mask; if none set, pass mask to a clear-flags helper |
| `src/main/func_0200ab28.c` | identical pattern, different helper function | Clone of func_0200aae4 |
| `src/main/func_0200ab6c.c` | identical pattern, different helper function | Clone of func_0200aae4 |

**Recipe implication:** the three functions are a verified C-41 clone family. The key code-generation feature: mwcc loads `0x2f07` into r0 once for the `tst r1, r0` and then passes the same register as the argument to the helper (`bl func_0200aa60`). This requires that both uses of `0x2f07` be the same expression — do not split them or the register will not be reused.

```c
/* Canonical form — DO NOT refactor the two uses: */
if (data_02104bac.flags & 0x2f07) {
    return 1;
}
func_0200aa60(0x2f07);  /* mwcc reuses the same r0 */
```

---

### 1601 — voice SE base ID (ov004)

**EUR .c files with `1601`:** 1 EUR canonical file

| File | Code | Purpose |
|------|------|---------|
| `src/overlay004/func_ov004_021c9d60.c` | `return func_0202c0c0(b + 1601);` | Adds the voice SE base to a 0-based voice index before passing to the audio helper |

**Also in USA/JPN ports:** `src/usa/overlay004/func_ov004_021c9c80.c` and JPN mirror use `func_0202c06c(b + 1601)` — same formula, different helper address.

**Recipe implication:** 1601 is a decimal constant (0x641 hex). It is the base SE ID for voiced lines in ov004. The function is a trivial one-liner thunk: `return audio_play(b + 1601)`. The constant appears as a MOV immediate after the add.

---

### 0xFFFF — card ID none / u16 sentinel

**EUR .c files with `0xffff`:** 39 EUR canonical files (varied contexts)

**Top callers by semantic:**

| File | Code | Purpose |
|------|------|---------|
| `src/main/func_0203a150.c` | u16 sentinel check | Card ID "none" / empty slot |
| `src/overlay002/func_ov002_0229d2ec.c` | u16 sentinel | Invalid card handle |
| `src/overlay011/ov011_021d2138.c` | u16 sentinel | ov011 event / queue sentinel |
| `src/overlay000/func_ov000_021aa7e0.c` | u16 sentinel | ov000 state "no overlay" |
| `src/main/func_02037b34.c` | `result == 0xffff` return | API not-found return value |

**Also in data tables:** `0xffff` appears as raw bytes in many `.c` data table declarations (e.g. `data_ov002_022be184` all-0xFF sentinel block). These are data bytes, not functional comparisons.

**Recipe implication:** `0xFFFF` is the universal "no value" sentinel for u16 fields. In matched .c files it always appears in the form `if (result == 0xffff)` or `return 0xffff` (not in data byte arrays). The two most common usage patterns are: (1) checking a card-ID-or-none return value, and (2) checking a search result for "not found".

---

## Constant summary table

| Constant | EUR .c files | Dominant module | Primary semantic |
|----------|-------------|-----------------|-----------------|
| 0x23 | 17 | ov002 | C-39 wildcard entity tag — type guard bypass |
| 0x868 | 128 | ov002 | PerPlayerRowTable player stride |
| 0x14 | 61 | ov002 | inner row-slot stride (often co-occurs with 0x868) |
| 0xFFFF | 39 | all | u16 sentinel / card ID none |
| 0x40000000 | 3 | main + ov000 | DISPCNT bit-30 / deferred-task flag |
| 0x2F07 | 3 | main | GlobalData02104bac composite flag mask |
| 0x343FD | 2+2 | main + ov002 | LCG RNG multiplier (always with 0x269EC3) |
| 0x7F / 0x80 | 2 | ov002 | DuelQueueState idle/active handshake |
| 0x800 | 1 (FX context) | main | FX_Mul round-to-nearest addend |
| 0x1FFF / lsl#19 | 1 + asm | ov002 | id_lo13 bitfield extraction (declare as `:13`) |
| 1601 | 1 | ov004 | voice SE base ID |

**Key finding for C-matching:** the 0x868 stride constant is the most pervasive non-trivial constant in the EUR matched .c base — it appears in 128 files. Any ov002 MED candidate that involves the PerPlayerRowTable must reproduce the exact formula `(player & 1) * 0x868 + slot * 0x14` to match. The 0x23 wildcard check is the second most significant constant for ov002 candidates (17 files), and nearly all matched card-effect functions include it.
