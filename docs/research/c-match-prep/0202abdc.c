/* CAMPAIGN-PREP candidate for func_0202abdc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     goto-shared per-reg block; :1 bitfields for 0xea; :3 MMIO bitfield insert |=/&=~
 *   risk:       struct-guessed: the [15:13] :3 insert layout is inferred; mwcc's |= bitfield idiom must emit and 0xe000;lsr13;orr val;lsl13 with the double word-load. If it adds a redundant &7 or reorders the two loads, codegen diverges.
 *   confidence: low
 */
/* func_0202abdc (main, class D): 4-way switch on signed-short field 0xdc, then
 * a 3-bit MMIO bitfield insert at bits [15:13] (mask 0xe000) of 0x04000000
 * (cases 0/1) or 0x04001000 (cases 2/3). val=1/2 per case. When both :1 bits
 * of field 0xea are set -> field |= val; else field &= ~val. goto shares the
 * per-reg insert block (matches the .L_8e8 / .L_95c fallthrough-to-shared).
 * struct-guessed: 0xdc selector, 0xea two :1 bits; MMIO :3 field bit13. */
typedef volatile struct { unsigned int :13; unsigned int f : 3; unsigned int :16; } RegBld;

struct Obj0202abdc {
    char _p[0xdc];
    short sel;                                   /* +0xdc, ldrsh */
    char _q[0xea - 0xde];
    struct { unsigned short b0 : 1; unsigned short b1 : 1; } ea;  /* +0xea */
};

int func_0202abdc(struct Obj0202abdc *p) {
    int val;
    RegBld *r;

    switch (p->sel) {
    case 0: val = 1; goto blk_a;
    case 1: val = 2;
    blk_a:
        r = (RegBld *)0x04000000;
        if (p->ea.b0 && p->ea.b1) r->f |= val; else r->f &= ~val;
        break;
    case 2: val = 1; goto blk_b;
    case 3: val = 2;
    blk_b:
        r = (RegBld *)0x04001000;
        if (p->ea.b0 && p->ea.b1) r->f |= val; else r->f &= ~val;
        break;
    }
    return 1;
}
