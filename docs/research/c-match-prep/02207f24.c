/* CAMPAIGN-PREP candidate for func_02207f24 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     no-arg guard, short-circuit (val!=0 && _0!=0x1741)->early return, then 3-arg call
 *   risk:       the && is emitted as cmp/ldrneh/cmpne/bne sharing flags from 'cmp r0,#0'; if mwcc materializes 0x1741 differently or reorders the two loads, diverges. reshape-able via operand/branch order. struct-guessed f0/_0.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct { u16 _0; u16 sel : 1; u16 _2r : 15; } Arg;
typedef struct { u32 f0; u8 pad[0x868 - 4]; } Entry;   /* data_022cf17c[] */

extern Entry data_ov002_022cf17c[2];
extern int func_ov002_021ff3bc(void);
extern int func_ov002_0223f6c4(Arg *p);
extern int func_ov002_022536e8(int a, int b, int c);

int func_ov002_02207f24(Arg *p)
{
    int r;
    if (func_ov002_021ff3bc() == 0)
        return 0;
    if (data_ov002_022cf17c[p->sel & 1].f0 != 0 && p->_0 != 0x1741)
        return 1;
    r = func_ov002_0223f6c4(p);
    if (func_ov002_022536e8(p->sel, p->_0, r) == 0)
        return 0;
    return 1;
}
