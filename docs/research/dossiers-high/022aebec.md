# func_022aebec (ov002, HIGH class A, 88B)

**Recipe:** Guard early-return; if-assign max (movlt); reload-global twice
**Risk:** Scheduling: orig hoists mov r1,#4 before the clamp and stores f38/f40 last; mwcc may reorder the two final stores or fold the reload.
**Confidence:** med

## SHA1 pitfall

**Primary mode:** Mode E — visible instruction byte diff (verify.py catches directly)

**Verify gate:**
1. `python tools/verify.py src/overlay002/func_ov002_022aebec.c func_ov002_022aebec --cc all --module ov002` (diffs visible directly)
2. `ninja sha1` (final gate)

## GROUND TRUTH (from .s)

**Pool words (literal pool, in order):**

| label | value | type |
|-------|-------|------|
| `_LIT0` | `data_ov002_022d0f2c` | raw |

**BL/BLX callees (in call order, unique):**

| instr | target | notes |
|-------|--------|-------|
| `bl` | `func_ov002_022ae284` | overlay call (ov002) |
| `bl` | `func_ov002_02259834` | overlay call (ov002) |
| `bl` | `func_ov002_022ae9c0` | overlay call (ov002) |

> **Mode-C reminder:** never emit `static const` arrays or struct literals — they generate a `.rodata` section that breaks the link silently. Use `extern data_XXXX` references instead.

## Reshape hints

- Run `verify.py --cc all`; instruction byte diffs tell you what to reshape
- movne/moveq: try inverting the condition or swapping then/else
- `and #1` wall: use `(x << 31u) >> 31` to force lsl;lsr pair
- jump-table: match case ordering to the orig .s branch table

## Reference

- Prep: `docs/research/c-match-prep/022aebec.c`
- Gap taxonomy: `docs/research/objdiff-sha1-gap/gap-taxonomy.md`
