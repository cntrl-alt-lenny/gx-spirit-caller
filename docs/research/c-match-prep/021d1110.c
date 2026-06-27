/* CAMPAIGN-PREP candidate for func_021d1110 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone of 1080; only ldrh offsets +0x52/+0x54 differ; same bind/bitfield
 *   risk:       permuter-class: same as 021d1080 -- callee-saved alloc + scheduling across the func_021d0ffc call may permute; only +0x52/+0x54 differ. struct-guessed; if 1080 lands, this lands with the offset bump.
 *   confidence: low
 */
/* func_ov011_021d1110 (ov011, cls D): exact clone of 021d1080 with the u16
 * read offsets shifted to +0x52/+0x54 (vs +0x2a/+0x2c). Same recipe: bind
 * both bases before func_021d0ffc(); bitfield[8:5]-1 indexes 0x72-stride
 * table334a, +(arg0-0x11)*4; else 0x28-stride table4660 by arg0 words @+0/+4. */

extern char data_ov011_021d334a[];
extern char data_ov011_021d403c[];
extern char data_ov011_021d4660[];
extern int  func_ov011_021d0ffc(int a0);

void func_ov011_021d1110(int a0, int *out1, int *out2) {
    char *t4660 = data_ov011_021d4660;
    char *b403c = data_ov011_021d403c;

    if (func_ov011_021d0ffc(a0) == 1) {
        unsigned int v   = *(unsigned int *)(b403c + 0x268);
        unsigned int idx = (v << 0x17) >> 0x1c;       /* bits [8:5] */
        char *row  = data_ov011_021d334a + (idx - 1) * 0x72;
        char *cell = row + (a0 - 0x11) * 4;
        *out1 = *(unsigned short *)(cell + 0x52) << 0xc;
        *out2 = *(unsigned short *)(cell + 0x54) << 0xc;
    } else {
        char *e = t4660 + a0 * 0x28;
        *out1 = *(int *)e;
        *out2 = *(int *)(e + 4);
    }
}
