/* CAMPAIGN-PREP candidate for func_02027738 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: addls-pc switch, 0x1ff mask CSE, pack hofs|(vofs<<16) to vu32 MMIO; guard+invoke
 *   risk:       permuter-class: orig packs as (vofs<<16)&(0x1ff<<16) (lsl-then-and with pre-shifted mask CSE) not (vofs&0x1ff)<<16; mwcc's strength choice + the addls-pc jump-table shape likely diverge.
 *   confidence: low
 */
/* func_02027738 (main, class D) - 8-way state switch writing packed BG H/V scroll
 * offsets to the GBA/NDS BGnxOFS MMIO regs. Guard on de bit0; tail invoke on bit3.
 *   if (!b0) return 1;
 *   hofs = -(x>>4); vofs = -(y>>4);
 *   switch(state) writes (hofs&0x1ff) | ((vofs&0x1ff)<<16) to one reg pair:
 *     1->04000010 2->04000014 3->04000018 4->0400001c (main BG0..3)
 *     5->04001010 6->04001014 7->04001018            (sub  BG0..2)
 *   if (b3 && d0) func_0202838c(p); return 1; */
typedef unsigned short u16;
typedef unsigned int  u32;
typedef volatile u32  vu32;

extern void func_0202838c(void *p);

typedef struct Obj27738 {
    char _p0[0xb4];
    int  x;             /* 0xb4 */
    int  y;             /* 0xb8 */
    char _p1[0xd0 - 0xbc];
    void *d0;           /* 0xd0 */
    short state;        /* 0xd4 */
    char _p2[0xde - 0xd6];
    u16  b0:1, b1:1, b2:1, b3:1;  /* 0xde */
} Obj27738;

int func_02027738(Obj27738 *p) {
    int hofs, vofs;
    if (!p->b0)
        return 1;
    hofs = -(p->x >> 4);
    vofs = -(p->y >> 4);
    switch (p->state) {
    case 1: *(vu32 *)0x04000010 = (hofs & 0x1ff) | ((vofs & 0x1ff) << 16); break;
    case 2: *(vu32 *)0x04000014 = (hofs & 0x1ff) | ((vofs & 0x1ff) << 16); break;
    case 3: *(vu32 *)0x04000018 = (hofs & 0x1ff) | ((vofs & 0x1ff) << 16); break;
    case 4: *(vu32 *)0x0400001c = (hofs & 0x1ff) | ((vofs & 0x1ff) << 16); break;
    case 5: *(vu32 *)0x04001010 = (hofs & 0x1ff) | ((vofs & 0x1ff) << 16); break;
    case 6: *(vu32 *)0x04001014 = (hofs & 0x1ff) | ((vofs & 0x1ff) << 16); break;
    case 7: *(vu32 *)0x04001018 = (hofs & 0x1ff) | ((vofs & 0x1ff) << 16); break;
    }
    if (p->b3 && p->d0)
        func_0202838c(p);
    return 1;
}
