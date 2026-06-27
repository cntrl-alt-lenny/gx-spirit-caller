/* CAMPAIGN-PREP candidate for func_0208cd64 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ands+predicated strneb chain via if(f&bit); (u16)f re-zero-extend before call; return full f
 *   risk:       whether mwcc predicates each store (ands;ldrne;strneb) vs emitting a conditional branch per bit. The skipped 0x247 (0x80->0x248) is a literal addr table, not contiguous. permuter-class if mwcc branches; reshape-able if it predicates (already if-guarded).
 *   confidence: med
 */
// func_0208cd64 — consume 9 dirty bits, zero per-channel MMIO bytes, then notify
// data_021a62fc: u16 read and passed to func_02093a44.
extern unsigned short data_021a62fc;
extern void func_02093a44(unsigned int a, unsigned int b);

unsigned int func_0208cd64(unsigned short *p)
{
    unsigned short f = *p;
    *p = 0;
    if (f & 0x001) *(volatile unsigned char *)0x04000240 = 0;
    if (f & 0x002) *(volatile unsigned char *)0x04000241 = 0;
    if (f & 0x004) *(volatile unsigned char *)0x04000242 = 0;
    if (f & 0x008) *(volatile unsigned char *)0x04000243 = 0;
    if (f & 0x010) *(volatile unsigned char *)0x04000244 = 0;
    if (f & 0x020) *(volatile unsigned char *)0x04000245 = 0;
    if (f & 0x040) *(volatile unsigned char *)0x04000246 = 0;
    if (f & 0x080) *(volatile unsigned char *)0x04000248 = 0;
    if (f & 0x100) *(volatile unsigned char *)0x04000249 = 0;
    func_02093a44((unsigned short)f, data_021a62fc);
    return f;
}
