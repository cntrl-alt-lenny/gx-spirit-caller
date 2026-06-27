/* CAMPAIGN-PREP candidate for func_020296cc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     memcpy struct-copy; Fill32; bind +0x100 base; bic/orr RMW; shift-insert BLDCNT
 *   risk:       permuter-class: 6-iter ldm/stm copy loops are mwcc-version/reg-rotation dependent and asm is TRUNCATED past .L_114; whole-function reg-alloc shape unverifiable here. struct-guessed offsets too.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020296cc (main, class C) — brief p_0010.
 * UNVERIFIED build-free draft. NOTE: asm in batch is TRUNCATED at .L_114
 * (final literal-pool MMIO tail not shown). This reconstructs the full body
 * from the visible shape + the standard 0x4000000 BLDCNT eva-coef RMW.
 *   recipe:     struct-copy via memcpy (ldm/stm 0x68); Fill32; bind base r7+0x100; bic/orr flag RMW; BLDCNT divmod-free shift RMW
 *   risk:       reg-alloc on the 6-iter ldm/stm copy loops + the 0x4000000-vs-LIT0 branch tail
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed short s16;

extern void Fill32(int value, void *dst, int size);

/* save/restore image copied to a 0x68 scratch, init, copied back */
typedef struct Obj296cc {
    char  _pad0[0x68];
    char  blk68[0x2c];      /* 0x68 : 11 words copied from param1 (r6) */
    char  _pad1[0x100 - 0x94];
    char  blk100[0xa0];     /* 0x100 sub-struct: +0x84 s16, +0x8c s16, +0x9a u16 */
    char  _pad2[0x16c - (0x100 + 0xa0)];
    char  blk16c[0xc];      /* 0x16c : 3 words from param1+0x1c */
    char  _pad3[0x187 - 0x178];
    u8    f187;             /* 0x187 byte flag */
} Obj296cc;

extern u16 data_020c66dc;   /* _LIT0 base for the else-branch BLDCNT-like reg */

int func_020296cc(Obj296cc *p, char *src1, int arg2) {
    char save[0x68];
    s16 keep8c;
    u16 *blend;
    u16 t, lo;

    /* copy 0x68 of p into scratch (ldm/stm 6x4+2) */
    Fill32(0, save, 0);            /* placeholder to anchor extern; removed below */
    (void)arg2;

    __builtin_memcpy(save, p, 0x68);
    keep8c = *(s16 *)(p->blk100 + 0x8c);
    Fill32(0, p, 0x19c);
    __builtin_memcpy(p, save, 0x68);
    *(s16 *)(p->blk100 + 0x8c) = keep8c;

    __builtin_memcpy(p->blk68, src1, 0x1c);        /* 7 words */
    __builtin_memcpy(p->blk16c, src1 + 0x1c, 0xc); /* 3 words */

    t = *(u16 *)(p->blk100 + 0x9a);
    t &= ~0x4;
    *(u16 *)(p->blk100 + 0x9a) = t;
    t = *(u16 *)(p->blk100 + 0x9a);
    t |= 0x2; t &= ~0x1; t |= 0x1;
    *(u16 *)(p->blk100 + 0x9a) = t;
    *(s16 *)(p->blk100 + 0x84) = -1;
    p->f187 &= ~0x1;

    if (*(s16 *)(p->blk100 + 0x8c) == 0)
        blend = (u16 *)0x04000000;
    else
        blend = (u16 *)&data_020c66dc;

    /* BLDCNT eva-coef field: ((reg>>8 & 0x1f)+0x10) reinserted at bits 8..12 */
    {
        unsigned int r = *(unsigned int *)blend;
        unsigned int coef = (r & 0x1f00) >> 8;
        r = (r & ~0x1f00) | (((coef + 0x10) & 0xff) << 8);
        *(unsigned int *)blend = r;
    }
    (void)lo;
    return 1;
}
