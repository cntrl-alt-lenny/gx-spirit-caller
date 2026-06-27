/* CAMPAIGN-PREP candidate for func_02077e58 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     lsr#3;and#0x3f literal extract (NOT bitfield struct); rsblt/rsbge as if-else assign
 *   risk:       reshape-able: (x>>3)&0x3f already emits lsr#3;and (asm form, not the lsl;lsr pair) so no bitfield needed; if it diverges flip the rsb if/else arm order. data_02101f74 load timing minor.
 *   confidence: med
 */
/* func_02077e58: read 8 bytes (func_02078444) into o+0x10, extract bits 3..8
 * (a 6-bit field) of the word at o+0x10, compute a wrap offset (0x38-x or
 * 0x78-x), push two records via func_02077ecc (table data_02101f74 then the
 * 8-byte arg), then read 0x10 back. r0=o (r5), r1=p (r4). */
extern char data_02101f74[];
extern void func_02077ecc(void *o, int a, int b);
extern void func_02078444(void *a, void *b, int n);

void func_02077e58(unsigned char *o, unsigned char *p) {
    int x, ofs;
    func_02078444(p, o + 0x10, 8);
    x = (*(int *)(o + 0x10) >> 3) & 0x3f;
    if (x < 0x38) ofs = 0x38 - x; else ofs = 0x78 - x;
    func_02077ecc(o, (int)data_02101f74, ofs);
    func_02077ecc(o, (int)p, 8);
    func_02078444(p, o, 0x10);
}
