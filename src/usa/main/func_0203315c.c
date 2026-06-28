/* CAMPAIGN-PREP candidate for func_0203315c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null guard (movs+ldmeqia) + linear call sequence
 *   risk:       func_02032e18(p,p) 2nd arg assumed = p; trailing calls assumed take 0
 *   confidence: high
 */
/* func_0203315c — linear teardown sequence, null-guarded */

extern void func_02033438(void *p);
extern void func_02033464(void *p);
extern void func_020326d0(void *p);
extern void func_0203276c(void *p);
extern void func_02032e18(void *p, void *q);
extern void func_02032628(int v);
extern void func_020325d0(int v);

void func_0203315c(void *p)
{
    if (p == 0)
        return;
    func_02033438(p);
    func_02033464(p);
    func_020326d0(p);
    func_0203276c(p);
    func_02032e18(p, p);
    func_02032628(0);
    func_020325d0(0);
}
