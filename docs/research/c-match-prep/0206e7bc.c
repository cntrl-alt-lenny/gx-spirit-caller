/* CAMPAIGN-PREP candidate for func_0206e7bc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     5x inlined bswap32; out-of-order tail stores (0x18,0x1c,0x14) + scalar globals; exact store-order
 *   risk:       Orig hoists the LIT pool (func ptrs at d+0x18/0x1c, globals ed58/ed54) and stores 0x18/0x1c BEFORE 0x14, interleaving with the 5th bswap held in r1 — a fixed schedule a bswap macro is unlikely to reproduce verbatim. permuter-class (register/schedule pin); store-order partly reshape-able.
 *   confidence: low
 */
/* func_0206e7bc (main, class D) — repeated bswap32 stores into a global struct. */
typedef unsigned long u32;

extern int  func_0206bd30(void *cfg);
extern void func_0206e940(void);
extern void func_0206e980(void);
extern u32  data_0219ed54;
extern u32  data_0219ed58;
extern char data_0219ed84[];   /* struct base (ip) */

static u32 bswap32(u32 v)
{
    return ((v >> 24) & 0xff) | ((v >> 8) & 0xff00) |
           ((v << 8) & 0xff0000) | (v << 24);
}

int func_0206e7bc(void *src)
{
    char *s  = (char *)src;
    char *d  = data_0219ed84;

    *(u32 *)(d + 0x0)  = (*(u32 *)(s + 0xc) == 1) ? 1 : 0;
    *(u32 *)(d + 0x4)  = bswap32(*(u32 *)(s + 0x10));
    *(u32 *)(d + 0x8)  = bswap32(*(u32 *)(s + 0x14));
    *(u32 *)(d + 0xc)  = bswap32(*(u32 *)(s + 0x18));
    *(u32 *)(d + 0x10) = bswap32(*(u32 *)(s + 0x1c));
    *(u32 *)(d + 0x18) = (u32)&func_0206e980;
    *(u32 *)(d + 0x1c) = (u32)&func_0206e940;
    *(u32 *)(d + 0x14) = bswap32(*(u32 *)(s + 0x20));
    data_0219ed58      = *(u32 *)(s + 0x4);
    *(u32 *)(d + 0x20) = 0x40;
    data_0219ed54      = *(u32 *)(s + 0x8);
    *(u32 *)(d + 0x30) = *(u32 *)(s + 0x2c);
    *(u32 *)(d + 0x34) = *(u32 *)(s + 0x30);
    return func_0206bd30(d);
}
