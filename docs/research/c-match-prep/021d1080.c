/* CAMPAIGN-PREP candidate for func_021d1080 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind both bases pre-call (callee-saved); bitfield idx; mla 0x72 + <<2
 *   risk:       permuter-class: callee-saved assignment for the two pre-bound bases (r7/r8) and out ptrs (r4/r5) across the call is a scheduling/alloc coin-flip mwcc may permute. mla-0x72 vs separate <<2 fuse also at risk. struct-guessed offsets.
 *   confidence: low
 */
/* func_ov011_021d1080 (ov011, cls D): after func_021d0ffc()==1, index a
 * 0x72-stride table334a by (bitfield[8:5]-1), then +(arg0-0x11)*4, read u16
 * @+0x2a/+0x2c (<<12) into *out1/*out2. Else: table4660 stride 0x28 by arg0,
 * read words @+0/+4. Both bases (4660 in r7, 403c in r8) are bound BEFORE the
 * call (callee-saved). out1/out2 live across call -> r5/r4. Proto of
 * func_021d0ffc kept (int) so no extra arg setup at the bl. */

extern char data_ov011_021d334a[];
extern char data_ov011_021d403c[];
extern char data_ov011_021d4660[];
extern int  func_ov011_021d0ffc(int a0);

void func_ov011_021d1080(int a0, int *out1, int *out2) {
    char *t4660 = data_ov011_021d4660;
    char *b403c = data_ov011_021d403c;

    if (func_ov011_021d0ffc(a0) == 1) {
        unsigned int v   = *(unsigned int *)(b403c + 0x268);
        unsigned int idx = (v << 0x17) >> 0x1c;       /* bits [8:5] */
        char *row  = data_ov011_021d334a + (idx - 1) * 0x72;
        char *cell = row + (a0 - 0x11) * 4;
        *out1 = *(unsigned short *)(cell + 0x2a) << 0xc;
        *out2 = *(unsigned short *)(cell + 0x2c) << 0xc;
    } else {
        char *e = t4660 + a0 * 0x28;
        *out1 = *(int *)e;
        *out2 = *(int *)(e + 4);
    }
}
