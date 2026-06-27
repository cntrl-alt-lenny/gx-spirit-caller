/* CAMPAIGN-PREP candidate for func_021bc8c8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order kind held callee-saved across chain; signed >=5/>0; mask m1 then m2 then mvn-and-tst order
 *   risk:       orig keeps func_021b9ecc result live in r5 across 5 calls (decl-order b,c,a,ret). If mwcc reorders the callee-saved spills the kind==0x1900/0x1aad reload diverges. reshape-able (decl b,c first).
 *   confidence: med
 */
/* func_ov002_021bc8c8 : guard chain of calls + final flag-mask over parallel arrays */
extern char data_ov002_022cf1ac[];   /* word stride 0x14 */
extern char data_ov002_022cf1a4[];   /* halfword stride 0x14 */
extern int func_ov002_021b9ecc(int b, int c);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021b3fd8(int b, int c, int id, int a);
extern int func_ov002_021b3ecc(int b, int c, int id);

int func_ov002_021bc8c8(int a, int b, int c)
{
    int kind = func_ov002_021b9ecc(b, c);
    if (kind == 0) return 0;
    if (c >= 5) return 0;
    if (func_ov002_021bb068(0x13f2) > 0) return 0;
    if (a != b) {
        if (func_ov002_021b3fd8(b, c, 0x13eb, a) == 0) return 0;
    }
    if (func_ov002_021b3ecc(b, c, 0x16a4) != 0) return 0;
    if (func_ov002_021b3ecc(b, c, 0x12d1) != 0) return 0;
    if (kind == 0x1900 || kind == 0x1aad) {
        unsigned int w  = *(unsigned int *)(data_ov002_022cf1ac + (b & 1) * 0x868 + c * 0x14);
        unsigned short h = *(unsigned short *)(data_ov002_022cf1a4 + (b & 1) * 0x868 + c * 0x14);
        unsigned int m1 = (w >> 6) & 1;
        unsigned int m2 = ((w >> 2) | (w >> 1)) & 1;
        if ((h & ~m1) & ~m2) return 0;
    }
    return 1;
}
