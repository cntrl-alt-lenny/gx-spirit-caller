/* CAMPAIGN-PREP candidate for func_0203cff8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     int v=u16 => (v>>2) ASR; predicated if/else dup shift; mla base B; store f2,f3 order
 *   risk:       (v>>2) must stay ASR: arg1[1] is unsigned short (promotes to int) so signed >> => asr; if mwcc treats it unsigned it emits lsr. reshape-able (keep int v). base B mla vs add+mul is the secondary risk. Offsets struct-guessed.
 *   confidence: med
 */
/* func_0203cff8 (cls D): arith-shift bitfield compute + dual indexed bases + clamp
 * store + Copy32. arg1->f2 is u16 loaded into int so (v>>2) is ASR (signed int).
 * if/else duplicates (v>>2) under predication. base A = arg3+0x444 + i*4 (indexed);
 * base B = arg3+0x470 + i*0xc0 (mla). 0x444 pooled (not rotatable). Store f2 then f3. */

extern void Copy32(void *src, void *dst, int size);

void func_0203cff8(int i, unsigned short *arg1, int arg2, char *arg3) {
    int v = arg1[1];                                   /* arg1->f2 (u16 -> int) */
    unsigned char *a = (unsigned char*)(arg3 + 0x444) + i * 4;
    void          *b = (arg3 + 0x470) + i * 0xc0;
    unsigned n;
    if (v & 2) {
        n = (v >> 2) & 0xff;
    } else {
        n = ((v >> 2) + 0x19) & 0xff;
    }
    if ((n & 0xff) > a[2]) {
        a[2] = (unsigned char)n;
        a[3] = (unsigned char)((a[3] & ~0x7f) | (arg2 & 0x7f));
    }
    Copy32(arg1, b, 0xc0);
}
