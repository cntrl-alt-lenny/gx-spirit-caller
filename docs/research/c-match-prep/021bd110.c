/* CAMPAIGN-PREP candidate for func_021bd110 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain; mla-base+0xf8 13-bit id==0; movge#0 early; tail >=0?1:0
 *   risk:       the `func_ov002_021bbeac>=5` path uses movge r0,#0 + ldmgeia (conditional return) leaving a fall-through to mov#1; if mwcc materializes via a temp+branch instead of predicated return it diverges. reshape-able (if-return shape).
 *   confidence: med
 */
/* func_ov002_021bd110: if func_0202b8c0(arg1)==2 and gate
 * func_ov002_021bb068(0x16df)!=0 and player(arg0&1)'s slot-0 id field at +0xf8
 * is zero, then return func_ov002_021bbeac(arg0)>=5 ? 0 (via ge) ... ; the two
 * fall-throughs return 1; else delegate to func_ov002_021bd030. */
extern unsigned char data_ov002_022cf16c[];
extern int func_0202b8c0(int a);
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bbeac(int a);
extern int func_ov002_021bd030(int a);
struct slot { unsigned int id : 13; };

int func_ov002_021bd110(int arg0, int arg1) {
    if (func_0202b8c0(arg1) == 2) {
        if (func_ov002_021bb068(0x16df) != 0) {
            if (((struct slot *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 + 0xf8))->id == 0) {
                if (func_ov002_021bbeac(arg0) >= 5)
                    return 0;
            }
        }
        return 1;
    }
    return func_ov002_021bd030(arg0) >= 0 ? 1 : 0;
}
