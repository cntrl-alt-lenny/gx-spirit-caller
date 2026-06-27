/* CAMPAIGN-PREP candidate for func_021ec38c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: guard-first; half then row; e->flags :13; cf16c before cf1a4; self->u0 call arg
 *   risk:       e->flags loaded then only ==0-tested; dead-value extract (lsl#19;lsr#19) may fold differently than the held r0. reshape-able (:13 bitfield) + struct-guessed (+0x30).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_021ec38c (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: range guard first; half=(p&1)*0x868 then row=idx*0x14; e->flags :13 bitfield; cf16c-before-cf1a4; field arg = self->u0
 *   risk:       e->flags is read (lsl#19;lsr#19) but its value is NOT used after the ==0 test — mwcc must keep the load live only for the branch; if it folds the dead extract differently a mov/cmp pair shifts. reshape-able via :13 bitfield + struct-guessed (cf16c +0x30 layout).
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int   u32;

/* +0x30 word: low 13 bits are a bitfield (read -> lsl#19;lsr#19). */
struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };
struct Obj02 { u16 f0; u16 f2; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021b4054(int player, int index, int arg2, int arg3);

int func_ov002_021ec38c(struct Obj02 *self, int player, int index)
{
    int half;
    int row;
    struct CardEnt30 *e;

    if (index >= 5)
        return 0;

    half = (player & 1) * 0x868;
    row  = index * 0x14;

    e = (struct CardEnt30 *)(data_ov002_022cf16c + half + row);
    if (e->flags == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + half + row) == 0)
        return 0;

    if (func_ov002_021b4054(player, index, self->f0, 4) != 0)
        return 1;
    return 0;
}
