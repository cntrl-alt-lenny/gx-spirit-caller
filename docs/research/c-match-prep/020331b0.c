/* CAMPAIGN-PREP candidate for func_020331b0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null guard (movs+ldmeqia) + linear call sequence
 *   risk:       func_02032e6c(p,p) 2nd arg assumed = p; trailing calls assumed take 0
 *   confidence: high
 */
/* func_020331b0 — linear teardown sequence, null-guarded */

extern void func_02033488(void *p);
extern void func_020334b4(void *p);
extern void func_02032724(void *p);
extern void func_020327c0(void *p);
extern void func_02032e6c(void *p, void *q);
extern void func_0203267c(int v);
extern void func_02032624(int v);

void func_020331b0(void *p)
{
    if (p == 0)
        return;
    func_02033488(p);
    func_020334b4(p);
    func_02032724(p);
    func_020327c0(p);
    func_02032e6c(p, p);
    func_0203267c(0);
    func_02032624(0);
}
