/* CAMPAIGN-PREP candidate for func_02201eb4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :1 for b0; stride-0x868 base = ptr+(idx)*0x868; rsb→1-b0
 *   risk:       First bl sets only r0=entity (r1 leftover=b0); modeling it as the 2-arg call may add an extra r1 set — reshape-able via arg pruning, else permuter-class. Also struct-guessed (0x868 stride/tables).
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u8 _pad0[2];
    u16 b0 : 1;      /* bit 0  (lsl#31;lsr#31) */
    u16 b1_5 : 5;    /* bits 1..5 */
    u16 kind : 6;    /* bits 6..11 */
    u16 b12_13 : 2;
    u16 b14 : 1;
    u16 b15 : 1;
} Entity;

/* stride-0x868 selector tables; first word is read */
extern u8 data_ov002_022cf178[];   /* _LIT1 */
extern u8 data_ov002_022cf17c[];   /* _LIT2 */
extern int func_ov002_021ff2c8(Entity *e, int sel);

int func_ov002_02201eb4(Entity *e)
{
    int v;
    int r;

    v = *(u32 *)(data_ov002_022cf178 + (1 - e->b0 & 1) * 0x868);
    if (v < 6)
        return 0;
    if (func_ov002_021ff2c8(e, e->b0) > 2)
        return 0;
    r = func_ov002_021ff2c8(e, e->b0);
    v = *(u32 *)(data_ov002_022cf17c + e->b0 * 0x868);
    return v >= 5 - r ? 1 : 0;
}
