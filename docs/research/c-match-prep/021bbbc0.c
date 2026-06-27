/* CAMPAIGN-PREP candidate for func_021bbbc0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two cursors g(=base+0x30) & e(=base) +=20; (v<<19)>>19 low-19 test; bit2|bit1 guard; break on fail
 *   risk:       orig uses TWO base cursors r6(+0x30) and r7(base) advancing in lockstep, and the i==limit/lo19/hword/flag failures all branch to the SAME .L_280 (loop-tail), i.e. continue-with-increment not function-return. modeled as break -> WRONG if loop should continue; semantics ambiguous. struct-guessed + reshape-able (break vs continue).
 *   confidence: low
 */
/* func_ov002_021bbbc0 (ov002, class C): counted loop slot 0..4, bitfield
 * test (+0x30 low 19 bits) + hword(+0x38) guard + (+0x40) bit-or guard,
 * then pred(+0xc8940)==arg; counts. */
extern unsigned char data_ov002_022cf16c[]; /* entry table, stride 20 */
extern int func_ov002_021c8940(int a, int b);

int func_ov002_021bbbc0(int self, int want, int limit) {
    int i;
    int count = 0;
    unsigned char *base = (unsigned char *)data_ov002_022cf16c + (self & 1) * 0x868;
    unsigned char *g = base + 0x30; /* r6: field used for bitfield test */
    unsigned char *e = base;        /* r7: hword/flag fields */
    for (i = 0; i < 5; i++, g += 20, e += 20) {
        if (i == limit) break;
        {
            unsigned int v = *(unsigned int *)g;
            unsigned int lo19 = (v << 0x13) >> 0x13; /* movs r0,lsl#0x13; lsr#0x13 */
            if (lo19 == 0) break;
            if (*(unsigned short *)(e + 0x38) == 0) break;
        }
        {
            unsigned int f = *(unsigned int *)(e + 0x40);
            if (((f >> 2) | (f >> 1)) & 1) break;
        }
        if (want == func_ov002_021c8940(self, i))
            count++;
    }
    return count;
}
