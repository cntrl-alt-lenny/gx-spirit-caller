/* CAMPAIGN-PREP candidate for func_022b84c0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :1/:5/:8 bitfield extract; signed %3 via 0x55555556 magic; branch tail.
 *   risk:       %3 sign handling: asm `add r4,r4,lr lsr#0x1f` is signed /3 then sub for %3 - C `v%3` matches only if v is signed int (it is). Sel==0 falls through to default like asm. Struct offsets/0xcc stride struct-guessed.
 *   confidence: med
 */
/* func_ov002_022b84c0 - bitfield extract + %3 select, writes two out params.
 * h = halfword at data_ov002_022d1910+0x90, bitfield {:1 f0, :5 f1, :8 f6}.
 * If f1(:5)==0xb: idx = lookup(data_ov002_022d1410 + f0*0xcc, +0x488);
 *   v = (f6:8 value) - idx ; sel = v % 3.
 * else: sel = *(short*)(data_ov002_022cccc0 + f1*6).
 * Then 3-way (sel 0/1/2) writes (*p1,*p2) constants. smull 0x55555556 = /3,
 * %3 = v - 3*(v/3). */

struct bf_84c0 {
    unsigned short f0 : 1;
    unsigned short f1 : 5;
    unsigned short f6 : 8;
};

extern unsigned short data_ov002_022d1910[];   /* _LIT0; [+0x90] halfword */
extern unsigned char  data_ov002_022d1410[];   /* _LIT1; +f0*0xcc, +0x488 */
extern short          data_ov002_022cccc0[];   /* _LIT3; [f1*6] short */

int func_ov002_022b84c0(int unused_r0, int *p1, int *p2)
{
    struct bf_84c0 h;
    int v, sel, idx;

    *(unsigned short *)&h = data_ov002_022d1910[0x90 / 2];

    if (h.f1 == 0xb) {
        idx = *(int *)(data_ov002_022d1410 + h.f0 * 0xcc + 0x488);
        v = (int)h.f6 - idx;
        sel = v % 3;
    } else {
        sel = data_ov002_022cccc0[h.f1 * 3];   /* f1*6 bytes = [f1*3] shorts */
    }

    if (sel == 0) {
        *p1 = 0x17000; *p2 = 0;
    } else if (sel == 1) {
        *p1 = 0x16000; *p2 = 0x1500;
    } else if (sel == 2) {
        *p1 = 0x15000; *p2 = 0xeb00;
    }
    return 1;
}
