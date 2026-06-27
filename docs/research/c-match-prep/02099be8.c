/* CAMPAIGN-PREP candidate for func_02099be8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D store-order: 16B block, strh 0x280, strh 0x2b0, 8B block (exact)
 *   risk:       orig anchors MMIO pool at 0x290 and writes 0x280/0x2b0 via [r1,#-16]/[r1,#0x20] offsets off that one base; struct-based C loads separate bases, ldm/stm grouping diverges. permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02099be8 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: struct-copy ldm/stm grouping rarely first-build-matches.
 *   recipe:     SETTER: 16B block, strh 0x280, strh 0x2b0, 8B block; emit stores in EXACT asm order
 *   risk:       store-ORDER is the lever and is preserved; but mwcc pool-anchors the MMIO base at 0x290 (reaching 0x280/0x2b0 via negative offsets) which a struct-based C can't reproduce. permuter-class for the grouping/anchor.
 *   confidence: low
 */
/* func_02099be8: SETTER. Writes a 0x1c-byte param struct out to the DS
 * geometry box-test coord MMIO (0x04000280..0x040002bf). Store order:
 * 16-byte block -> 0x290, h18 -> 0x280, h1a -> 0x2b0, 8-byte block -> 0x2b8.
 * Symmetric with GETTER func_02099ba8 (identical struct layout). */

typedef struct {
    /* 0x00 */ int            w0[4];   /* -> 0x04000290 (16 bytes) */
    /* 0x10 */ int            w1[2];   /* -> 0x040002b8 (8 bytes)  */
    /* 0x18 */ unsigned short h18;     /* -> 0x04000280 */
    /* 0x1a */ unsigned short h1a;     /* -> 0x040002b0 */
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

void func_02099be8(BoxTestParam *s) {
    volatile GeomBoxTestRegs *r = (volatile GeomBoxTestRegs *)0x04000280;
    r->w290[0] = s->w0[0];
    r->w290[1] = s->w0[1];
    r->w290[2] = s->w0[2];
    r->w290[3] = s->w0[3];
    r->c280 = s->h18;
    r->c2b0 = s->h1a;
    r->w2b8[0] = s->w1[0];
    r->w2b8[1] = s->w1[1];
}
