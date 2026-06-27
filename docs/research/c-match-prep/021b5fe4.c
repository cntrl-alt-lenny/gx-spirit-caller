/* CAMPAIGN-PREP candidate for func_021b5fe4 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: walking row pointers (+14/iter) not i*14 recompute; ldrsh signed reads
 *   risk:       reshape-able/permuter-class: orig advances r7=p,r8=0224f400 by +0xe per outer iter and keeps r5=0224f3e8,r4=j-base in regs across the loop; if mwcc strength-reduces differently or reorders the two base adds, induction-var assignment diverges.
 *   confidence: med
 */
/* func_ov006_021b5fe4 (ov006, class C): snapshot 0x124 bytes, reset a flag,
 * run two passes, then a guarded 5x7 halfword gather into two stride-14
 * global tables. Original walks the row bases (p, data_0224f400) by +14 per
 * outer iter rather than recomputing i*14. */

extern void Copy32(void *dst, void *src, int n);
extern void func_ov006_021b7cfc(void *p);
extern void func_ov006_021b7e80(void *p);
extern void func_ov006_021b7bb0(void *p, int i);

extern short data_ov006_0224f400[];   /* stride-14 (7 shorts) row table */
extern short data_ov006_0224f3e8[];   /* 1 short per outer index */

int func_ov006_021b5fe4(char *p) {
    int i;
    int j;
    short *rowsrc;   /* walks p     + i*14 */
    short *rowdst;   /* walks 0224f400 + i*14 (shorts: +7 per row) */

    Copy32(p + 0x124, p, 0x124);
    *(int *)(p + 0x6294) = 1;
    func_ov006_021b7cfc(p);
    func_ov006_021b7e80(p);

    *(int *)(p + 0x6294) = 0;
    rowdst = data_ov006_0224f400;
    rowsrc = (short *)p;
    for (i = 0; i < 5; i++) {
        if (i != 0) {
            data_ov006_0224f3e8[i] =
                *(short *)(p + i * 2 + 0x6244);
            for (j = 0; j < 7; j++) {
                rowdst[j] = *(short *)((char *)rowsrc + j * 2 + 0x624e);
            }
            func_ov006_021b7bb0(p, i);
        }
        rowsrc = (short *)((char *)rowsrc + 14);
        rowdst = (short *)((char *)rowdst + 14);
    }
    return 1;
}
