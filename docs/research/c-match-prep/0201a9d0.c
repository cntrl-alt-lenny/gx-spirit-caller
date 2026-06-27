/* CAMPAIGN-PREP candidate for func_0201a9d0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ldmia/stmia struct-copy local; sel==14 64-bit LCG RMW store-order s[0]then s[1]; tmpl[sel-10] index
 *   risk:       permuter-class + struct-guessed: the 64-bit LCG umull/mla/adc sequence, the (newhi*3)>>32 scale, and the 4th call arg are reconstructed; RNG state field order and func_02091554 signature are unverified -> expect heavy iteration or .s.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0201a9d0 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED + HEAVY. 48-byte struct copy (ldmia/stmia) to a stack local,
 * then if(sel==14) advance a 64-bit LCG RNG state at data_02102c64 and pass a scaled value,
 * else pass tmpl[sel-10] directly. Both paths call func_02091554.
 * Struct layouts (12-word template, 6-word RNG state) are GUESSED.
 */
extern unsigned int data_020b5ab8[12];
extern unsigned int data_02102c64[6];
extern char data_020c5ca8[];
extern char data_020c5cc8[];
extern void func_02091554(int, char *, unsigned int, int);

void func_0201a9d0(int sel, int who) {
    unsigned int tmpl[12];
    int i;
    for (i = 0; i < 12; i++)
        tmpl[i] = data_020b5ab8[i];
    if (sel == 0xe) {
        unsigned int *s = data_02102c64;
        unsigned int a = s[0];
        unsigned long long acc = (unsigned long long)s[2] * a;
        unsigned int hi = (unsigned int)(acc >> 32);
        hi += s[2] * s[1];
        hi += s[3] * a;
        {
            unsigned int lo2 = s[4];
            unsigned int hi2 = s[5];
            unsigned int sumlo = lo2 + (unsigned int)acc;
            unsigned int newhi = hi2 + hi + (sumlo < lo2 ? 1u : 0u);
            s[0] = sumlo;
            s[1] = newhi;
            {
                unsigned int q = (unsigned int)(((unsigned long long)newhi * 3u) >> 32) + 1u;
                func_02091554(who, data_020c5ca8, tmpl[sel - 0xa], q);
            }
        }
    } else {
        func_02091554(who, data_020c5cc8, tmpl[sel - 0xa], 0);
    }
}
