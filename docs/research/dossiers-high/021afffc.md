# func_021afffc (ov002, HIGH class A, 80B)

**Recipe:** Linear table search, signed >>8 compare, store index/-1 to globals
**Risk:** Table base split 0x400+0x10 vs flat 0x410 may change addr-gen; reloading data base each store vs binding once.
**Confidence:** med

## SHA1 pitfall

**Primary mode:** Mode E — visible instruction byte diff (verify.py catches directly)

**Verify gate:**
1. `python tools/verify.py src/overlay002/func_ov002_021afffc.c func_ov002_021afffc --cc all --module ov002` (diffs visible directly)
2. `ninja sha1` (final gate)

## GROUND TRUTH (from .s)

**Pool words (literal pool, in order):**

| label | value | type |
|-------|-------|------|
| `_LIT0` | `data_ov002_022cdc78` | raw |

**BL/BLX callees:** none (leaf function).

> **Mode-C reminder:** never emit `static const` arrays or struct literals — they generate a `.rodata` section that breaks the link silently. Use `extern data_XXXX` references instead.

## Reshape hints

- Run `verify.py --cc all`; instruction byte diffs tell you what to reshape
- movne/moveq: try inverting the condition or swapping then/else
- `and #1` wall: use `(x << 31u) >> 31` to force lsl;lsr pair
- jump-table: match case ordering to the orig .s branch table

## Reference

- Prep: `docs/research/c-match-prep/021afffc.c`
- Gap taxonomy: `docs/research/objdiff-sha1-gap/gap-taxonomy.md`
