/* CAMPAIGN-PREP candidate for func_0200a994 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD + 5-arg call (1 stack arg) + function-pointer arg
 *   risk:       func_020351d4 arg count/types guessed; one-stack-arg frame {r3,lr}+str[sp] assumed
 *   confidence: med
 */
/* func_0200a994 — stack-arg call, guard, then two more calls (clean wrapper). */

extern int  func_020351d4(void *a, void *b, int c, int d, int e);
extern void func_02005878(void *fn);
extern void func_020351e8(void);
extern void func_020379f8(int v);
extern int  data_020c3fa0;
extern int  data_02106a58;

void func_0200a994(void)
{
    if (func_020351d4(&data_020c3fa0, &data_02106a58, 0x80000, 0xa, 0x18))
        func_02005878((void *)func_020351e8);
    func_020379f8(1);
}
