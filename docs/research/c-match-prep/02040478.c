/* CAMPAIGN-PREP candidate for func_02040478 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload global each use (orig re-ldr r1 every block); stack args 0x1000,0x10; r3=base+0x1000
 *   risk:       the func_02091d24 call: orig builds r1=func_0203fe78, r3=*g+0x1000, ip=0x10/r3-stack=0x1000 into a specific arg slot order I inferred; arg count/positions are struct-guessed against the real prototype.
 *   confidence: low
 */
/* func_02040478 (C, 180B): setup + conditional early-out + stack-arg call + teardown.
 * func_02092844(*g+0x13d8). *(g+0x1000+0x3f0)=0. if((g+0x1000)[0x384]!=0){ if(func_02091ae0(*g+0x1318)==0) return; }
 * func_02091d24(*g+0x1318, func_0203fe78, ?, *g+0x1000, /stack:/ 0x1000, 0x10). func_020919d8(*g+0x1318).
 */
extern char *data_0219d9d4;
extern void func_0203fe78(void);
extern void func_020919d8(void *a);
extern void func_02091ae0(void *a);       /* returns int via r0 */
extern void func_02091d24(void *a, void *fn, void *b, void *c, int d, int e);
extern void func_02092844(void *a);

void func_02040478(void) {
    char *g;
    g = data_0219d9d4;
    func_02092844(g + 0x13d8);
    *(int *)(data_0219d9d4 + 0x1000 + 0x3f0) = 0;
    if (*(int *)(data_0219d9d4 + 0x1000 + 0x384) != 0) {
        if ((int)(long)func_02091ae0(data_0219d9d4 + 0x1318) == 0) {
            return;
        }
    }
    func_02091d24(data_0219d9d4 + 0x1318, func_0203fe78, (void *)0x1000,
                  data_0219d9d4 + 0x1000, 0x1000, 0x10);
    func_020919d8(data_0219d9d4 + 0x1318);
}
