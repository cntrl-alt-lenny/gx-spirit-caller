/* CAMPAIGN-PREP candidate for func_021ed090 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: leaf; half early; rsb-invert player==1-(u2&1); :13 flags; cf1a4!=0->0 then cf1a2!=0->1
 *   risk:       guard player==1-(self->u2&1) relies on orig's rsb ip,#1;cmp;movne; if mwcc folds to an add/xor equality the rsb disappears and a reg shifts. reshape-able (keep 1-x literal form).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_021ed090 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: leaf; half bound early; rsb-invert bit compare player==1-(self->u2&1); e->flags :13; two u16 table checks cf1a4(!=0->0) then cf1a2(!=0->1)
 *   risk:       guard is 'player == (1 - (self->u2 & 1))' — orig emits rsb ip,#1 then cmp r1,ip (movne r0,#0). If mwcc rewrites to player+(u2&1)==1 or xor form the rsb vanishes. Also cf1a2/cf1a4 are adjacent u16 fields one row apart. reshape-able (keep 1-x form) + struct-guessed (two halfword offsets).
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };
struct Obj02 { u16 f0; u16 f2; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];

int func_ov002_021ed090(struct Obj02 *self, int player, int index)
{
    int half;
    struct CardEnt30 *e;
    int flags;

    half = (player & 1) * 0x868;

    if (player != (1 - (self->f2 & 1)))
        return 0;

    e = (struct CardEnt30 *)(data_ov002_022cf16c + half + index * 0x14);
    flags = e->flags;

    if (index >= 5)
        return 0;
    if (flags == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + half + index * 0x14) != 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a2 + half + index * 0x14) != 0)
        return 1;
    return 0;
}
