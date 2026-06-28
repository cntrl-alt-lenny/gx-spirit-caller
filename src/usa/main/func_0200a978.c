/* CAMPAIGN-PREP candidate for func_0200a978 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD + 5-arg call (1 stack arg) + function-pointer arg
 *   risk:       func_02035184 arg count/types guessed; one-stack-arg frame {r3,lr}+str[sp] assumed
 *   confidence: med
 */
/* func_0200a978 — stack-arg call, guard, then two more calls (clean wrapper). */

extern int  func_02035184(void *a, void *b, int c, int d, int e);
extern void func_0200585c(void *fn);
extern void func_02035198(void);
extern void func_020379a8(int v);
extern int  data_020c3ec0;
extern int  data_02106978;

void func_0200a978(void)
{
    if (func_02035184(&data_020c3ec0, &data_02106978, 0x80000, 0xa, 0x18))
        func_0200585c((void *)func_02035198);
    func_020379a8(1);
}
