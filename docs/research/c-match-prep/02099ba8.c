/* CAMPAIGN-PREP candidate for func_02099ba8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D store-order: 16B then 8B block then masked halfwords, asm order
 *   risk:       MMIO base-anchor: orig holds 0x290 in r1 and reaches 0x280/0x2b0 via [r1,#-16]/[-8] negative offsets; a struct-based C can't emit those, ldm/stm grouping diverges. permuter-class (escape-to-.s likely).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02099ba8 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: struct-copy ldm/stm grouping rarely first-build-matches.
 *   recipe:     GETTER: 16B block then 8B block then masked halfwords; store-order = asm order
 *   risk:       mwcc pool-anchors the MMIO base; orig anchors at 0x290 and reaches 0x280/0x2b0 via NEGATIVE offsets (impossible from a struct based at 0x280). The exact ldm/stm grouping + base-anchor is why this shipped as .s. permuter-class (likely escape-to-.s).
 *   confidence: low
 */
/* func_02099ba8: GETTER. Reads the DS geometry box-test result/coord MMIO
 * block (0x04000280..0x040002bf) back into a compact 0x1c-byte param struct.
 * Symmetric with the SETTER func_02099be8 (identical struct layout). */

typedef struct {
    /* 0x00 */ int            w0[4];   /* <-> 0x04000290 (16 bytes) */
    /* 0x10 */ int            w1[2];   /* <-> 0x040002b8 (8 bytes)  */
    /* 0x18 */ unsigned short h18;     /* <-> 0x04000280, masked & 3 */
    /* 0x1a */ unsigned short h1a;     /* <-> 0x040002b0, masked & 1 */
} BoxTestParam;

typedef struct {
    /* 0x00 */ unsigned short c280;    /* 0x04000280 */
    /* 0x02 */ unsigned short pad282;
    /* 0x04 */ int            pad284[3];
    /* 0x10 */ int            w290[4];  /* 0x04000290 */
    /* 0x20 */ int            pad2a0[4];
    /* 0x30 */ unsigned short c2b0;    /* 0x040002b0 */
    /* 0x32 */ unsigned short pad2b2;
    /* 0x34 */ int            pad2b4;
    /* 0x38 */ int            w2b8[2];  /* 0x040002b8 */
} GeomBoxTestRegs;

void func_02099ba8(BoxTestParam *dst) {
    volatile GeomBoxTestRegs *r = (volatile GeomBoxTestRegs *)0x04000280;
    dst->w0[0] = r->w290[0];
    dst->w0[1] = r->w290[1];
    dst->w0[2] = r->w290[2];
    dst->w0[3] = r->w290[3];
    dst->w1[0] = r->w2b8[0];
    dst->w1[1] = r->w2b8[1];
    dst->h18 = (unsigned short)(r->c280 & 0x3);
    dst->h1a = (unsigned short)(r->c2b0 & 0x1);
}
