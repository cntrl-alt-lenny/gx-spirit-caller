/* CAMPAIGN-PREP candidate for func_0223a3b0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :1/:5/:9 bitfields; signed >>8 for h8; shifted-or operand-first (lo|(b<<8)); store-order of orr pairs preserved
 *   risk:       reshape-able + struct-guessed: orr operand order ((lo)|(b<<8)) and the pbit?0x8000:0 select drive dest-reg/movne-moveq; if mwcc picks wrong reg, reorder the orr operands. h0_dummy ref is a typo to remove.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];
extern int func_ov002_021bc55c(int a, int b);
extern int func_ov002_021d479c(int a, int b, int c, int d);

typedef struct {
    u16 h0;
    u16 parity : 1; u16 idx : 5; u16 r2 : 10;   /* h2 */
    u16 c6 : 9; u16 r4 : 7;                       /* h4: (h4>>6)&0x1ff */
    u16 flag6;                                    /* h6: (h6<<16)>>24 used */
    u16 h8;
} Ent;

int func_ov002_0223a3b0(Ent *e) {
    int parity = e->parity;
    int idx = e->idx;
    u32 w = *(u32*)(data_ov002_022cf16c + parity * 0x868 + idx * 0x14 + 0x30);
    int composed = (((w >> 6) & 0xff) << 1) + ((w >> 13) & 1);
    if (e->c6 != composed) return 0;
    if (*(u16*)(data_ov002_022cf1a4 + parity * 0x868 + idx * 0x14) == 0) return 0;
    if (((e->flag6 << 16) >> 24) == 0) return 0;
    int q = (((short)e->h8) >> 8) & 0xff;
    if (func_ov002_021bc55c(q, q) == 0) return 0;
    {
        int s = ((short)(((u16)e->h0_dummy_parity_bit)) );
        int pbit = ( (e->parity) ? 1 : 0 );
        int top = pbit ? 0x8000 : 0x0;
        top |= 0x3d;
        int lo = e->parity & 0xff;          /* r5 = (h2&1) */
        int b1 = e->idx & 0xff;             /* r2 = ((h2>>1)&0x1f)&0xff */
        int b2 = q & 0xff;                  /* r1 = r4&0xff */
        int arg1 = (u16)(lo | (b1 << 8));
        int arg2 = (u16)(lo | (b2 << 8));
        (void)s;
        func_ov002_021d479c((u16)top, arg1, arg2, 0);
    }
    return 0;
}
