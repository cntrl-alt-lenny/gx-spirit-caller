[//]: # (markdownlint-disable MD013 MD041)

# Entity Type Tags (b6_11 / tag6 enum)

The most semantically significant constant in the game: the entity / card-effect
type tag stored in the `b6_11` field (a 6-bit sub-field in a packed word at
`self->f2` or equivalent). Two values stand out as sentinel / wildcard tags
compared far more often than any other.

---

## Tag values and semantics

### 0x23 (35) — C-39 wildcard / universal-pass sentinel

**The single most frequent non-trivial constant in the entire codebase.**

- **154 assembly `CMP r., #0x23` hits** across all .s files
- **~60 C source lines** of the form `self->b6_11 == 0x23` or `tag6 != 0x23`
- Appears in ov002, ov003, ov019 (sibling overlays), and referenced from main

Semantics: tag 0x23 is the **universal-effect wildcard**. A card with this tag
bypasses all type-specific guards — it is treated as if it has every effect
type simultaneously. This is the "C-39 family" sentinel (YGO card C-39 =
Utopia/Number 39, a powerful universal card).

```c
/* canonical guard pattern in matched ov002 .c files: */
if (self->b6_11 == 0x23 || self->b6_11 == target_type) {
    /* proceed with effect */
}

/* or the inverse form: */
if (self->b6_11 != 0x23 && self->b6_11 != allowed_type) {
    return 0;
}
```

### 0x0F (15) — second entity-type discriminator

**Companion to 0x23.** Appears together with it in type-gating functions.

- Found in the same ov002 functions that test 0x23
- Semantics: a second "allowed through all guards" type (likely a different
  universal card family or a special duel condition tag)

### b6_11 field enum — all confirmed values

The `b6_11` field is a 6-bit field (bits 6–11 of a packed word). Confirmed
values from matched C and assembly:

| Value | Hex | Notes |
|-------|-----|-------|
| 2 | 0x02 | effect type A |
| 5 | 0x05 | effect type B |
| 6 | 0x06 | effect type C |
| 13 | 0x0D | effect type D |
| 15 | 0x0F | second wildcard / universal type |
| 22 | 0x16 | effect type E |
| 25 | 0x19 | effect type F |
| 35 | 0x23 | C-39 wildcard (universal pass) |

---

## Duel step checkpoint IDs (0x4B / 0x4C / 0x4D)

Three related constants that appear as `case` values or comparison targets in
duel-phase functions:

| Value | Notes |
|-------|-------|
| 0x4B (75) | Appears in ov002, ov003, ov019 — a shared checkpoint ID. Stored negated in `f4`: `-self->f4 == 0x4b` |
| 0x4C (76) | ov002 only (negated in f4) |
| 0x4D (77) | ov002 only (negated in f4) |

The `S2b07` struct stores the checkpoint negated:
```c
struct S2b07 {
    char _pad[4];   /* +0x00 */
    int  f4;        /* +0x04  stores -(0x4b/0x4c/0x4d) */
    char _pad2[0x60];
    int *f68;       /* +0x68  pointer to int array indexed by slot */
};
/* switch(-self->f4) { case 0x4b: ... case 0x4c: ... case 0x4d: ... } */
```

---

## Record type tag (0x1010 / 0x2010 / 0x3010)

High-nibble tier classification used in ov004:

| Value | Hex | Tier |
|-------|-----|------|
| 4112 | 0x1010 | Tier 1 (NORMAL) |
| 8208 | 0x2010 | Tier 2 (B) |
| 12304 | 0x3010 | Tier 3 (C) |

Pattern `(tag & 0xF000) >> 12` gives tier 1/2/3; low bytes always `0x010`.
Used in `func_ov004_021dd150` (all three regions have this function).

---

## C-match implications

Any MED candidate that tests `self->b6_11` needs the correct bitfield
extraction pattern. The field is 6 bits (positions 6–11) extracted as:

```c
unsigned int tag6 = (word >> 6) & 0x3F;   /* wrong: & mask */
/* vs */
unsigned int b6_11 : 6;                    /* correct: bitfield in typedef */
```

The compiler (mwcc 2.0/sp1p5) generates different shift patterns for each.
Use the `: 6` bitfield syntax in the typedef, then let the compiler pick the
shift — do NOT hand-mask.
