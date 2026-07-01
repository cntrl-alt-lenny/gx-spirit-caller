[//]: # (markdownlint-disable MD013 MD041)

# Overlay Magic Constants — ov008, ov010, ov016

Compiler-generated magic constants (smull reciprocals) and notable scalar
limits found in ov008, ov010, and ov016 GLOBAL_ASM `.s` files.
Constants already documented in `MagicDivisionConstants.md` are listed here
only where overlays add new usage sites or context.

---

## Confirmed new constants

### 0x1b4e81b5 — smull reciprocal for ÷150

**Source:** `func_ov008_021acd04.s`  
**Occurrences:** 1 (ov008 only)

**Derivation:**
2^36 / 0x1b4e81b5 ≈ 150.0 → post-shift `asr #0x4` → divisor = 150 = 0x96.

**Code context:**
```asm
; r0 = input x-coordinate in range [0x34, 0xca] (52 to 202)
sub r3, r0, #0x34       ; r3 = r0 - 52 → range [0, 150]
ldr ip, _LIT_1b4e81b5   ; 0x1b4e81b5
smull r2, r4, r3, ip    ; r4:r2 = (r0 - 52) * 0x1b4e81b5
asr r4, r4, #0x4        ; r4 = (r0 - 52) / 150  [0..1 range]
```

**Meaning:** Normalizes an x-coordinate from the range [52, 202] (width=150)
to [0, 1] as a fixed-point fraction, then scales into a target sub-range.
This is the "how far along the range am I?" calculation for a track selector
or scroll position indicator. The 0x96 = 150 denominator matches the valid
data range width (`0xca - 0x34 = 0x96`).

---

### 0x55555556 — smull reciprocal for ÷3

**Source:** `func_ov016_021b5284.s`  
**Occurrences:** 1 (ov016 only)

**Derivation:**
2^33 / 0x55555556 ≈ 3.0 → post-shift `asr #0x1` → divisor = 3.

**Code context:**
```asm
ldr r1, _LIT_55555556   ; 0x55555556
smull r0, r2, r1, r3    ; r2:r0 = r3 * 0x55555556
add r2, r2, r0, lsr #0x1f  ; sign-correct
asr r2, r2, #0x1        ; r2 = r3 / 3
```

Standard mwcc signed divide-by-3 recipe. Context in ov016 is likely the
tri-color channel split (R, G, B = 3 components) or a 3-item table index.

---

## Previously documented constants seen in new overlays

### 0x66666667 — smull reciprocal for ÷10

**Already in:** `MagicDivisionConstants.md`  
**New overlay sites:**

| File | Count | Post-shift | Divisor |
|------|-------|------------|---------|
| `func_ov008_021abbf0.s` | 1 | `asr #0x2` | 10 |
| `func_ov008_021acd04.s` | 1 | `asr #0x2` | 10 |
| (9 other ov008 .s files) | 9 | `asr #0x2` | 10 |
| `func_ov010_021b3774.s` | 1 | `asr #0x1` | 10 |
| (2 other ov010 .s files) | 2 | `asr #0x1` | 10 |

**Total new occurrences:** 14 (10 in ov008, 3 in ov010, 1 in ov016 — see below).

Post-shift `asr #0x2` gives: effective post-shift = 33 + 2 = 35 bits → divisor 10.
Post-shift `asr #0x1` gives: effective post-shift = 33 + 1 = 34 bits → also
divisor 10 (same constant works at two precision levels depending on how
mwcc sizes the intermediate).

Both patterns produce `quotient = value / 10` for typical signed 32-bit inputs.

**ov008 context** (`func_ov008_021abbf0.s`): Used alongside the constant
`0x0098967F` (see below) to format a score value for display —
ten-divides to extract successive decimal digits.

**ov010 context** (`func_ov010_021b3774.s`): Decimal-digit extraction from
a card count or score value.

Note: The comment in `src/overlay016/ov016_core.h` already references
`0x66666667` as "known ÷10 reciprocal" — this cross-overlay prevalence
confirms it is a first-class decomp KB constant.

---

### 0x51eb851f — smull reciprocal for ÷100

**Already in:** `MagicDivisionConstants.md`  
**New overlay site:** `func_ov008_021aa6a4.s`

Used to convert a raw score in range [0, 10000] to a percentage [0, 100].
Context: the ov008 battle-music scoring system computes a percentage weight
for each queued music entry.

---

### 0xcccccccd — smull reciprocal for ÷10 (unsigned)

**Already in:** `MagicDivisionConstants.md`  
**New overlay site:** `func_ov008_021aa6a4.s` (alongside 0x51eb851f)

Unsigned variant of the ÷10 reciprocal (mwcc emits this for `unsigned /10`
vs. `0x66666667` for `signed /10`). Context: unsigned intermediate
calculation in the same scoring function.

---

## Scalar limit constants

### 0x0098967F = 9,999,999 (decimal upper limit)

**Source:** `func_ov008_021abbf0.s`  
**Occurrences:** 1

```asm
ldr r1, _LIT_0098967F   ; 9,999,999
cmp r0, r1
bgt .cap                 ; if value > 9,999,999, cap at max
```

This is a 7-digit score cap. The function formats scores for on-screen display;
9,999,999 is the maximum displayable 7-digit value.

---

## Non-magic word constants (MMIO / addresses)

The ov016 .s files contain many `.word` constants that are MMIO register
addresses rather than magic division reciprocals:

| Value | Meaning |
|-------|---------|
| `0x04000000` | NDS GPU DISPCNT (Display Control) |
| `0x04001000` | NDS GPU DISPCNT (Engine B) |
| `0x04000008` | BGCNT (BG0/BG1/BG2/BG3 control) |
| `0x05000000` | Palette RAM base (Engine A BG) |
| `0x05000400` | Palette RAM base (Engine A OBJ) |
| `0x05800000` | Palette RAM base (Engine B BG) |
| `0x05800400` | Palette RAM base (Engine B OBJ) |

These are Nintendo DS hardware registers, not compiler-generated constants.
They are documented here for completeness; the KB `MMIORegisters.md` is the
authoritative reference.
