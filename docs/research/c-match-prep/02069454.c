/* CAMPAIGN-PREP candidate for func_02069454 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: 32-bit shift-or byteswap; literal byte header strb-in-order; copy 4 swapped bytes
 *   risk:       struct-guessed/reshape-able: exact arg signature of func_0206950c and which spilled words it reads are inferred; the strb header order and the &w byte-copy must not be reordered or coalesced into a word store.
 *   confidence: low
 */
/* func_02069454 — full 32-bit byteswap of stack arg, then build a fixed byte
 * header {0xfd,0xfc,0x1e,0x66,0x6a,0xb2} at buf[0..5], append the 4 swapped
 * bytes at buf[6..9], len=0xa, and call func_0206950c(... , &swapped, ...).
 * Incoming r0-r3 are spilled to stack; only the 4th word [sp+0x3c] (=r3 region
 * after the arg-block push) is byteswapped and used.  Many strb are order-sensitive.
 */
typedef unsigned char u8;
typedef unsigned int u32;

extern int func_0206950c(void *p, int a, int b, int c, int d);

int func_02069454(int a0, int a1, int a2, u32 w)
{
    u8 buf[10];
    u8 *src;
    w = ((w >> 24) & 0xff) | ((w >> 8) & 0xff00) |
        ((w << 8) & 0xff0000) | ((w << 24) & 0xff000000u);
    buf[0] = 0xfd;
    buf[1] = 0xfc;
    buf[2] = 0x1e;
    buf[3] = 0x66;
    buf[4] = 0x6a;
    buf[5] = 0xb2;
    src = (u8 *)&w;
    buf[6] = src[0];
    buf[7] = src[1];
    buf[8] = src[2];
    buf[9] = src[3];
    return func_0206950c(buf, 0, 0, 0, 0xa);
}
