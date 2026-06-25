/* CAMPAIGN-PREP candidate for func_02095c48 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested init loops; bind row base ip+=0x24; inner j starts at i; reuse zero r4 (class C)
 *   risk:       inner loop starts j=i (asm: `mov lr,r3` seeds inner counter from outer i, NOT 0). also orig binds row base in ip across both stores; if mwcc recomputes p+i*0x24 the inner `add r1,ip,lr,lsl#1` diverges. struct-guessed offsets. permuter-class on base-bind.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02095c48 (main, class C) — MED tier.
 * UNVERIFIED build-free draft.
 *   recipe:  nested struct-init loops; bind row base in ip; reuse zero in r4
 *   class C: decl-order (outer i, inner j), shared -1 halfword store value
 * struct-guessed: 16 rows of stride 0x24, each {?@0; i32@0x40 row idx? ...}; tail [0x60+] block.
 */
/* func_02095c48: clear/init a board struct at r0.
 *   p->f4 = 0; p->h8 = 0; p->ha = 0; p->f0 = 0;
 *   for (i=0;i<16;i++){ row = (char*)p + i*0x24;
 *       *(int*)(row+0x40) = i;
 *       for (j=0;j<16;j++) *(short*)(row+0x20 + j*2) = -1; }
 *   for (k=0;k<16;k++) *(short*)((char*)p + 0x260 + k*2) = -1;
 *   func_02092904(p, 0x280);
 * The outer index i is stored into [row+0x40] (mov lr,r3 ; str r3,[ip,#0x40]),
 * so the inner counter restarts from i each row -- NOTE inner starts at lr=i,
 * not 0. */

extern void func_02092904(void *p, int len);

void func_02095c48(unsigned char *p)
{
    int i, j;

    *(int   *)(p + 0x04) = 0;
    *(short *)(p + 0x08) = 0;
    *(short *)(p + 0x0a) = 0;
    *(int   *)(p + 0x00) = 0;

    for (i = 0; i < 16; i++) {
        unsigned char *row = p + i * 0x24;
        *(int *)(row + 0x40) = i;
        for (j = i; j < 16; j++)
            *(short *)(row + 0x20 + j * 2) = -1;
    }
    for (i = 0; i < 16; i++)
        *(short *)(p + 0x260 + i * 2) = -1;

    func_02092904(p, 0x280);
}
