/* CAMPAIGN-PREP candidate for func_0225680c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order p,t,slot,i; inline (t&1)*0x868 base; induction slot+=0x14
 *   risk:       orig holds slot base in sl across loop via mla then sl+=0x14; mwcc may recompute cf16c+(t&1)*0x868 per-iter instead of an induction pointer, diverging the inner addressing. permuter-class.
 *   confidence: med
 */
/* func_ov002_0225680c (ov002, class C) — nested loop, guard call, ldrneh slot chain.
 * outer p=0..1: t = (*(int*)(d016c+0xcec)) ^ p; base = cf16c + (t&1)*0x868.
 * inner i=0..4: if guard(t,i,0x16bf) && *(u16*)(slot+0x36): fire(t,i,0,0) -> 1; slot+=0x14.
 */
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int  func_ov002_021baca8(int a, int b, int code);
extern void func_ov002_021de480(int a, int b, int c, int d);

int func_ov002_0225680c(void) {
    int p;
    for (p = 0; p < 2; p++) {
        int t = *(int *)(data_ov002_022d016c + 0xCEC) ^ p;
        char *slot = data_ov002_022cf16c + (t & 1) * 0x868;
        int i;
        for (i = 0; i <= 4; i++) {
            if (func_ov002_021baca8(t, i, 0x16BF) != 0 &&
                *(unsigned short *)(slot + 0x36) != 0) {
                func_ov002_021de480(t, i, 0, 0);
                return 1;
            }
            slot += 0x14;
        }
    }
    return 0;
}
