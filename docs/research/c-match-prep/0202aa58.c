/* CAMPAIGN-PREP candidate for func_0202aa58 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     memcpy struct-copy 0x68; Fill32 0xec; 0xea flag RMW; dual-base post-indexed clear loop
 *   risk:       permuter-class: clear loop keeps a SEPARATE post-incrementing base (r3, strb [r3],#0x10) alongside r4+i<<4 for the halfword; mwcc usually derives both from one index → the dual-pointer form is reg-alloc-driven. struct-guessed offsets.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0202aa58 (main, class C) — brief p_0010.
 * UNVERIFIED build-free draft. Drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     struct-copy 0x68 to scratch; Fill32 0xec; copy back; flag RMW at 0xea; post-indexed clear loop (stride 0x10)
 *   risk:       the clear loop uses TWO bases (r4+i<<4 for halfword, r3 post-inc for byte) — store-order + post-index
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed short s16;

extern void Fill32(int value, void *dst, int size);

typedef struct Slotaa58 {
    char _pad0[0xa4];
    s16  fa4;       /* set to -1 */
    char _pad1[0xb7 - 0xa6];
    u8   fb7;       /* the 0xa7 base byte flag, +0x10 stride */
} Slotaa58;

typedef struct Objaa58 {
    char  blk00[0x68];      /* 0x68 copied through scratch */
    char  _pad0[0xea - 0x68];
    u16   fea;              /* 0xea flag RMW */
} Objaa58;

int func_0202aa58(char *p) {
    char save[0x68];
    u16 t;
    char *flag = p + 0xa7;
    int i;

    __builtin_memcpy(save, p, 0x68);
    Fill32(0, p, 0xec);
    __builtin_memcpy(p, save, 0x68);

    t = *(u16 *)(p + 0xea);
    t &= ~0x1; t |= 0x1;
    *(u16 *)(p + 0xea) = t;

    for (i = 0; i < 0x4; i++) {
        *(s16 *)(p + i * 0x10 + 0xa4) = -1;   /* add r0,r4,i<<4; strh -1 [r0,#0xa4] */
        *flag &= ~0x1;                         /* ldrb/bic/strb [r3], #0x10 */
        flag += 0x10;
    }
    return 1;
}
