/* CAMPAIGN-PREP candidate for func_022575c8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     inline c*20 product + (b&1)*0x868 base; bit2 via >>2&1; blx tail
 *   risk:       orig computes c*0x14 in ip and (b&1)*0x868+cf1ac in r3, adds at the ldr [ip,r3]; mwcc may fold both into one mla, changing reg use around the blx. permuter-class.
 *   confidence: med
 */
/* func_ov002_022575c8 (ov002, class C) — resolve record; bit-gate; blx handler tail.
 * r=resolve(a); if r==0||r->f8==0 return 1; clear flag; if (table-word>>2)&1 return 0;
 * else return r->f8(a,b,c). table = cf1ac + (b&1)*0x868 + c*20.
 */
extern char data_ov002_022ce288[];
extern char data_ov002_022cf1ac[];
extern char *func_ov002_02257464(int a);

int func_ov002_022575c8(int a, int b, int c) {
    char *r = func_ov002_02257464(a);
    int w;
    if (r == 0 || *(int *)(r + 8) == 0)
        return 1;
    *(int *)(data_ov002_022ce288 + 0x5C0) = 0;
    w = *(int *)(data_ov002_022cf1ac + (b & 1) * 0x868 + c * 20);
    if ((w >> 2) & 1)
        return 0;
    return (*(int (**)(int, int, int))(r + 8))(a, b, c);
}
