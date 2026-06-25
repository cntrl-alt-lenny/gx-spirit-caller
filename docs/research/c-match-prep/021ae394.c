/* CAMPAIGN-PREP candidate for func_021ae394 (ov000, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: bind table base + config base; field-pack RMWs + mla-index ldrsh in asm order
 *   risk:       register-reuse / interleave sensitive (lr,r6,ip held across the whole body; the +0x2a8 word is reused as the row-index source). A C reshape is unlikely to reproduce the exact mla;add;ldrsh scheduling + the dual +0x2a4/+0x2a8 restore order. permuter-class.
 *   confidence: low
 */
/* func_ov000_021ae394 — heavy field-pack on data_ov000_021c758c (+0x2a4/+0x2a8/
 * +0x184/+0x188/+0x28c/+0x290), no calls. mla-indexed ldrsh from stride-8
 * table data_ov000_021b56b4 (row = a0*0x28 + 8, two shorts at +0/+2 reused).
 * Many interleaved RMWs; base 021c758c held in lr, table base in r6 across all
 * uses (BIND both). Class-C reg-alloc/decl-order sensitive — first build will
 * almost certainly diverge; the value here is the field map + the bind hints. */

extern unsigned char data_ov000_021b56b4[];   /* stride-0x28 rows, shorts at +8,+10 */
extern unsigned int  data_ov000_021c758c[];

void func_ov000_021ae394(int a0, int a1, int a2, int a3) {
    short *row = (short *)(data_ov000_021b56b4 + a0 * 0x28 + 8);
    /* +0x2a8 (idx 0xaa): clear top byte, set bit24 */
    data_ov000_021c758c[0xaa] = (data_ov000_021c758c[0xaa] & 0x00ffffffu) | 0x01000000u;
    /* +0x2a4 (idx 0xa9): clear 0x1000 & 0x600000, OR (a0&3)<<21 ; also clear
     *   0xf000 / set 0x1000 path feeds the later +0x2a8 re-store (=0x10000>>... ) */
    {
        unsigned int w2a8 = (data_ov000_021c758c[0xaa] & ~0xf000u) | 0x1000u;
        unsigned int w2a4 = data_ov000_021c758c[0xa9];
        w2a4 = (w2a4 & ~0x1000u & ~0x600000u) | (((unsigned)(a0 << 30)) >> 9);
        data_ov000_021c758c[0xa9] = w2a4;
        data_ov000_021c758c[0xa3] = a1;   /* +0x28c */
        data_ov000_021c758c[0xa4] = a2;   /* +0x290 */
        data_ov000_021c758c[0xaa] = w2a8; /* +0x2a8 re-store */
        /* derived index = ((w2a8<<16)>>0x1c): bits[19:16] of w2a8 -> row select */
        {
            short *e = (short *)((char *)row + ((int)((w2a8 << 16) >> 0x1c) << 3));
            data_ov000_021c758c[0x61] = (unsigned)(e[0]) << 12;        /* +0x184 */
            w2a4 = (w2a4 & ~0x600u) | (((unsigned)(a3 << 30)) >> 21);
            data_ov000_021c758c[0x62] = (unsigned)((e[1] - 1)) << 12;  /* +0x188 */
            data_ov000_021c758c[0xa9] = w2a4;
        }
    }
}
