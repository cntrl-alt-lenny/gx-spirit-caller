/* CAMPAIGN-PREP candidate for func_022081b0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :6 guard skips call, :1 + mvn(-1) call, struct-array (mul 0x868) read != 0
 *   risk:       the two reads of [r4,#2] are reloads (b6 then sel separately) — keep two field accesses, don't CSE into one halfword. reshape-able (reload). 'and #1' redundancy + struct-guessed 0x868/f0.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct { u16 _0; u16 sel : 1; u16 _b : 5; u16 b6 : 6; u16 _r : 4; } Arg;
typedef struct { u32 f0; u8 pad[0x868 - 4]; } Entry;   /* data_022cf17c[] */

extern Entry data_ov002_022cf17c[2];
extern int func_ov002_021bcd80(int a, int b);

int func_ov002_022081b0(Arg *p)
{
    if (p->b6 != 0x23) {
        if (func_ov002_021bcd80(p->sel, -1) == 0)
            return 0;
    }
    return data_ov002_022cf17c[p->sel & 1].f0 != 0;
}
