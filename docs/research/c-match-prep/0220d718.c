/* CAMPAIGN-PREP candidate for func_0220d718 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 :1; cmp data016c[0xcec]==bit0 / [0xcf8]==1 guards; (1-bit0)&1 parity-mul cf178 bool
 *   risk:       orig keeps &data_022d016c in r0 across both 0xcec and 0xcf8 reads (one literal load, two ldr [r0,#off]); if mwcc reloads the base for the second, an extra ldr= diverges. reshape-able by binding base to one local (int *t=data_022d016c).
 *   confidence: med
 */
/* func_ov002_0220d718 (ov002, class D, MED) -- batch p_0030, leaf bool.
 * bit0 = f2.a;
 * if data_022d016c[0xcec/4] == bit0 return 0;
 * if data_022d016c[0xcf8/4] != 1 return 0;
 * return *(int*)(cf178 + ((1-bit0)&1)*0x868) != 0;
 * NOTE polarity: the 0xcec guard compares against bit0 itself, but the
 * parity-mul index uses (1 - bit0). rsb r1,r3,#1 then and #1 then mul 0x868.
 */
typedef unsigned short u16;

typedef struct Entity {
    u16 field0;
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16   : 4;
} Entity;

extern int  data_ov002_022cf178[];
extern int  data_ov002_022d016c[];

int func_ov002_0220d718(Entity *self)
{
    int bit0 = self->a;
    if (data_ov002_022d016c[0xcec / 4] == bit0) return 0;
    if (data_ov002_022d016c[0xcf8 / 4] != 1) return 0;
    return *(int *)((char *)data_ov002_022cf178 + ((1 - bit0) & 1) * 0x868) != 0;
}
