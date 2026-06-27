/* CAMPAIGN-PREP candidate for func_0206eb4c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (u16) cast => lsl#16;lsr#16; bswap16 of v + bswap32 of r computed together; byte/half/word store-order
 *   risk:       Orig computes the v-bswap16 and r-bswap32 INTERLEAVED across r5/lr/r0 (two swaps live at once) and pins the (u16) lsl;lsr — register allocation here is a coin-flip. permuter-class. Also the redundant 'a!=0' re-guard (cmp r5,#0) after the early null-return is intentional; keep both guards.
 *   confidence: low
 */
/* func_0206eb4c (main, class D) — (u16) lsl;lsr truncation + bswap16/bswap32, store-order. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned long  u32;

extern u32 func_0206e174(void *a);

int func_0206eb4c(void *a, void *dst)
{
    char *p = (char *)a;
    char *d = (char *)dst;
    u32   r;
    u16   v;

    if (a == 0) {
        return -0x27;
    }
    r = func_0206e174(p);
    v = (u16)((a != 0 && r != 0) ? *(u16 *)(p + 0x74) : 0);

    *(u8 *)(d + 0x0) = 0x8;
    *(u8 *)(d + 0x1) = 0x2;
    *(u16 *)(d + 0x2) = (u16)(((v >> 8) & 0xff) | ((v << 8) & 0xff00));
    *(u32 *)(d + 0x4) = ((r >> 24) & 0xff) | ((r >> 8) & 0xff00) |
                        ((r << 8) & 0xff0000) | (r << 24);
    return 0;
}
