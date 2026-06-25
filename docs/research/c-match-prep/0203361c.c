/* CAMPAIGN-PREP candidate for func_0203361c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tst flag guard + guarded call + tail-return call
 *   risk:       func_0203361c return type assumed int (tail r0); func_0204717c assumed no-arg
 *   confidence: med
 */
/* func_0203361c — flag-guarded call sequence */

typedef struct {
    unsigned char _pad_00[0xeb4];
    unsigned int flags;   /* +0xeb4 */
} Obj_0203361c;

extern int  func_020334cc(Obj_0203361c *p);
extern void func_02032d70(Obj_0203361c *p);
extern void func_0204717c(void);

int func_0203361c(Obj_0203361c *p)
{
    if (!(p->flags & 1))
        return 0;
    if (func_020334cc(p) == 0)
        func_02032d70(p);
    func_0204717c();
    return func_020334cc(p);
}
