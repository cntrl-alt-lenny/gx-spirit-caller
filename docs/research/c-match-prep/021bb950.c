/* CAMPAIGN-PREP candidate for func_021bb950 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base e (mla once, +=20/iter); short-circuit AND -> chained cmp/ldrneh/cmpne/addne
 *   risk:       orig fuses both tests into one predicated tail (cmp r0,#0; ldrneh; cmpne; addne) with i++/e+=20 interleaved before the second cmp. mwcc may emit a separate branch for the hword test instead of cmpne. reshape-able (keep nested if, not &&).
 *   confidence: med
 */
/* func_ov002_021bb950 (ov002, class C): counted call loop slot 0..10;
 * counts slots where pred!=0 AND entry hword(+0x38)!=0. */
extern unsigned char data_ov002_022cf16c[]; /* entry table, stride 20 */
extern int func_ov002_021ba104(int a, int b, int c);

int func_ov002_021bb950(int self, int arg2) {
    int i;
    int count = 0;
    unsigned char *e = (unsigned char *)data_ov002_022cf16c + (self & 1) * 0x868;
    for (i = 0; i <= 10; i++, e += 20) {
        if (func_ov002_021ba104(self, i, arg2)) {
            if (*(unsigned short *)(e + 0x38))
                count++;
        }
    }
    return count;
}
