/* CAMPAIGN-PREP candidate for func_02257a44 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     count declared first (r4 pre-zeroed); reload r->f8 inside inner loop; j init 5
 *   risk:       orig reloads ldr r3,[r5,#8] every inner iter and inits j=5; mwcc could hoist the handler load out of the loop, adding a stale-reg diff. Otherwise blx family proven. reshape-able (keep deref inline).
 *   confidence: med
 */
/* func_ov002_02257a44 (ov002, class C) — nested counted loop, blx record handler.
 * r=resolve(a); clear flag; if r==0||r->f8==0 return 0;
 * for i=0..1 for j=5..10: count += r->f8(a,i,j)!=0.
 */
extern char data_ov002_022ce288[];
extern char *func_ov002_02257464(int a);

int func_ov002_02257a44(int a) {
    int count = 0;
    char *r = func_ov002_02257464(a);
    int i, j;
    *(int *)(data_ov002_022ce288 + 0x5C0) = 0;
    if (r == 0 || *(int *)(r + 8) == 0)
        return 0;
    for (i = 0; i < 2; i++) {
        for (j = 5; j <= 10; j++) {
            if ((*(int (**)(int, int, int))(r + 8))(a, i, j) != 0)
                count++;
        }
    }
    return count;
}
