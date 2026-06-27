/* CAMPAIGN-PREP candidate for func_02257ab8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     count first; mla base after guard; induction base+i*0x14; reload handler in loop
 *   risk:       orig holds base in r7 as induction (r7+=0x14) and reloads r->f8 per iter; mwcc may recompute base+i*0x14 or hoist the handler load, diverging loop reg-alloc. permuter-class.
 *   confidence: med
 */
/* func_ov002_02257ab8 (ov002, class C) — single counted loop, mla base, blx handler.
 * r=resolve(a); clear flag; if r==0||r->f8==0 return 0; base=cf16c+(b&1)*0x868;
 * for i=0..10: skip if (base[i].f40>>2)&1 else count += r->f8(a,b,i)!=0.
 */
extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char *func_ov002_02257464(int a);

int func_ov002_02257ab8(int a, int b) {
    int count = 0;
    char *r = func_ov002_02257464(a);
    char *base;
    int i;
    *(int *)(data_ov002_022ce288 + 0x5C0) = 0;
    if (r == 0 || *(int *)(r + 8) == 0)
        return 0;
    base = data_ov002_022cf16c + (b & 1) * 0x868;
    for (i = 0; i <= 10; i++) {
        if (((*(int *)(base + i * 0x14 + 0x40)) >> 2 & 1) == 0) {
            if ((*(int (**)(int, int, int))(r + 8))(a, b, i) != 0)
                count++;
        }
    }
    return count;
}
