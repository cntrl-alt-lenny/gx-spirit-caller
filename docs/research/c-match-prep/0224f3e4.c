/* CAMPAIGN-PREP candidate for func_0224f3e4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     do/while + :13 bitfield; ||-of-two non-encodable consts -> cmp;cmpne; reload word for tag
 *   risk:       orig hoists 0xfbe/0x18c5 into r4/r5 across the loop (pool-load once); mwcc may reload both consts each iteration. permuter-class (loop-invariant const hoisting), not C-reshape-able.
 *   confidence: med
 */
/* func_ov002_0224f3e4: +0x418 slot scan; if a slot's :13 id is 0xfbe or 0x18c5
 * AND its packed tag (bits[29:22]<<1 + bit13, from the RELOADED word) differs
 * from arg2, post list event 0xe via func_02253458. Count base+0x14 (cf180).
 * (cls D: :13 bitfield + dual-value cmp + asymmetric tag shifts.) */
typedef unsigned int u32;

struct Slot13 { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

extern int func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224f3e4(int player, int unused, int arg2) {
    char *base;
    struct Slot13 *p;
    int i;
    if (*(int *)(data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    p = (struct Slot13 *)(base + 0x418);
    i = 0;
    do {
        int id = p->id;
        if (id == 0xfbe || id == 0x18c5) {
            u32 word = *(u32 *)p;
            int tag = (((word << 2) >> 24) << 1) + ((word << 18) >> 31);
            if (arg2 != tag)
                func_ov002_02253458(player, 0xe, i);
        }
        p++;
    } while (++i < *(int *)(base + 0x14));
}
