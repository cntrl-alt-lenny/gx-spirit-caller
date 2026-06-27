/* CAMPAIGN-PREP candidate for func_02204a10 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     d016c[+0xcec] vs (1-a) guard; code.c==0x19 guard; return !(f14.bit10) value-map
 *   risk:       reshape-able: orig's `cmp ip,r1` puts the d016c word first, so write `if (d016cval != 1-a)`; the `movs;moveq#1;movne#0` inverted-bit map = `!bit`. struct-guessed f14 bit10 offset.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02204a10 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     d016c[+0xcec] vs rsb(1-a) guard; code.c==0x19 guard; return !(f14 bit10) via movs;moveq#1
 *   risk:       reshape-able: orig forms `1-a` (rsb) and `cmp ip,r1` so d016c word is the FIRST cmp operand — write `if (d016cval != 1 - a)`. final `movs;moveq#1;movne#0` is the inverted-bit value-map; `!(bit)` reproduces it. struct-guessed f14 bit10.
 *   confidence: med
 */
#include "types.h"

typedef struct Code_4a10 {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_4a10;

typedef struct F14_4a10 {
    u32 lo10 : 10;
    u32 b10  : 1;     /* bit 10 (lsl#0x15;lsr#0x1f) */
    u32 top  : 21;
} F14_4a10;

typedef struct Obj_4a10 {
    u16 id;           /* +0x0 */
    Code_4a10 code;   /* +0x2 */
    u8 pad4[0x10];
    F14_4a10 f14;     /* +0x14 */
} Obj_4a10;

extern char data_ov002_022d016c[];

int func_ov002_02204a10(Obj_4a10 *obj) {
    if (*(int *)(data_ov002_022d016c + 0xcec) != 1 - obj->code.a) {
        return 0;
    }
    if (obj->code.c != 0x19) {
        return 0;
    }
    return obj->f14.b10 == 0 ? 1 : 0;
}
