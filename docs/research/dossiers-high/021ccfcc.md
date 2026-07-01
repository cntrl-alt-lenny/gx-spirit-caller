# func_021ccfcc (ov011, HIGH class A, 88B)

**Recipe:** Multi-field RMW, one held base, hoisted orr temp
**Risk:** WALL (multi-field RMW family). Also orig hoists `orr ...#0x10000000` into the held temp before later stores -> scheduling/reg-alloc won't match plain sequential C
**Confidence:** low

## SHA1 pitfall

**Primary mode:** Mode E — visible instruction byte diff (verify.py catches directly)

**Verify gate:**
1. `python tools/verify.py src/overlay011/func_ov011_021ccfcc.c func_ov011_021ccfcc --cc all --module ov011` (diffs visible directly)
2. `ninja sha1` (final gate)

## GROUND TRUTH (from .s)

**Pool words (literal pool, in order):**

| label | value | type |
|-------|-------|------|
| `_LIT0` | `data_ov011_021d4000` | raw |

**BL/BLX callees:** none (leaf function).

> **Mode-C reminder:** never emit `static const` arrays or struct literals — they generate a `.rodata` section that breaks the link silently. Use `extern data_XXXX` references instead.

## Reshape hints

- Run `verify.py --cc all`; instruction byte diffs tell you what to reshape
- movne/moveq: try inverting the condition or swapping then/else
- `and #1` wall: use `(x << 31u) >> 31` to force lsl;lsr pair
- jump-table: match case ordering to the orig .s branch table

## Reference

- Prep: `docs/research/c-match-prep/021ccfcc.c`
- Gap taxonomy: `docs/research/objdiff-sha1-gap/gap-taxonomy.md`
