/* CAMPAIGN-PREP candidate for func_022b3898 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: bind mode once; allow as ?1:0 to match cmp/cmpne/movne; reload base for b9c.
 *   risk:       reshape-able: orig RE-loads _LIT0(data_021040ac) for each of [b88]/[b9c]/[b9c]; if mwcc binds it in one reg, the extra ldr instances diverge. Match by separate casts.
 *   confidence: med
 */
/* func_ov002_022b3898: guard-chain on globals + one effect call.
 * p[0]==0 -> return. mode = base[+0xb88]; allow = (mode==1||mode==2).
 * If !(allow && base[+0xb9c]!=0): if mode==3 fall through else return.
 * Then p[0x68/4]=1; call _35d8(base[+0xb9c],0); call _37208(0x5e,-1,0,1). */
extern char data_021040ac[];
extern void func_02037208(int, int, int, int);
extern void func_ov002_022b35d8(int, int);

void func_ov002_022b3898(int *p) {
    int mode;
    int allow;
    if (p[0] == 0) return;
    mode = *(int *)(data_021040ac + 0xb88);
    allow = (mode == 1 || mode == 2) ? 1 : 0;
    if (!(allow && *(int *)(data_021040ac + 0xb9c) != 0)) {
        if (mode != 3) return;
    }
    p[0x1a] = 1;
    func_ov002_022b35d8(*(int *)(data_021040ac + 0xb9c), 0);
    func_02037208(0x5e, -1, 0, 1);
}
