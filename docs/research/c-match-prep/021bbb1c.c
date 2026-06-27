/* CAMPAIGN-PREP candidate for func_021bbb1c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     base+0x64 start; k>0 then k==want; flag-mask raw; UNSIGNED >= (addcs) on +0x3c
 *   risk:       the +0x3c compare uses addcs (unsigned >=) not addeq; arg2 must be unsigned so mwcc emits cmp+addcs. if arg2 were signed it would emit addge -> 1-instr cond mismatch. reshape-able (already typed arg2 unsigned).
 *   confidence: med
 */
/* func_ov002_021bbb1c (ov002, class C): counted loop slot 5..10, flag-mask,
 * field(+0x3c) unsigned >= arg compare; counts. */
extern unsigned char data_ov002_022cf16c[]; /* entry table, stride 20 */
extern int func_ov002_021b9ecc(int a, int b);

int func_ov002_021bbb1c(int self, int want, unsigned int arg2) {
    int i;
    int count = 0;
    unsigned char *e = (unsigned char *)data_ov002_022cf16c + (self & 1) * 0x868 + 0x64;
    for (i = 5; i <= 10; i++, e += 20) {
        int k = func_ov002_021b9ecc(self, i);
        if (k > 0 && k == want) {
            unsigned int f = *(unsigned int *)(e + 0x40);
            unsigned int h = *(unsigned short *)(e + 0x38);
            if ((h & ~((f >> 6) & 1)) & ~(((f >> 2) | (f >> 1)) & 1)) {
                if (*(unsigned int *)(e + 0x3c) >= arg2)
                    count++;
            }
        }
    }
    return count;
}
