/* CAMPAIGN-PREP candidate for func_021baca8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order ret/ok first; raw shift-mask; (f>>2)|(f>>1) operand-first; 1<<bit tst
 *   risk:       mask block holds flags in ip across 5 shifts via mvn/and/tst; if mwcc reorders the ~bit6/~(bit2|bit1) ands or picks tst operands swapped, the and/tst pair diverges. permuter-class.
 *   confidence: med
 */
/* func_ov002_021baca8 (ov002, class C): bit-flag test + addr math.
 * if (arg2 == helper(arg0,arg1)) and the flag/hword mask passes, then
 * return !(global_bits >> (arg1 + arg0*16) & 1), else 0. */
extern unsigned short data_ov002_022cf1a4[]; /* hword table */
extern unsigned int   data_ov002_022cf1ac[]; /* flag-word table */
extern unsigned char  data_ov002_022d016c[]; /* obj holding bitmask at +0xd4 */
extern int func_ov002_021b9ecc(int a, int b);

int func_ov002_021baca8(int arg0, int arg1, int arg2) {
    int ret = 0;
    int ok = 0;
    if (arg2 == func_ov002_021b9ecc(arg0, arg1)) {
        unsigned int f =
            *(unsigned int *)((char *)data_ov002_022cf1ac + (arg0 & 1) * 0x868 + arg1 * 20);
        unsigned int h =
            *(unsigned short *)((char *)data_ov002_022cf1a4 + (arg0 & 1) * 0x868 + arg1 * 20);
        if ((h & ~((f >> 6) & 1)) & ~(((f >> 2) | (f >> 1)) & 1))
            ok = 1;
    }
    if (ok) {
        int bit = arg1 + (arg0 << 4);
        unsigned int m = *(unsigned int *)(data_ov002_022d016c + 0xd4);
        if (!(m & (1u << bit)))
            ret = 1;
    }
    return ret;
}
