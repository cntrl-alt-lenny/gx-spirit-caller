/* CAMPAIGN-PREP candidate for func_021b085c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-return + do-while pump + struct-field loads to call
 *   risk:       do-while back-edge / r4-saved arg may reorder; the two cmp-after-call placements could flip
 *   confidence: med
 */
/* func_ov002_021b085c: do-while pump — bail if cd54() true, else repeatedly
 * fetch a 4xu16 record from cd44() and forward it to 021d4834(), tick cd4c(),
 * early-return when arg0==0, loop while cd54()==0. */

typedef unsigned short u16;

extern int   func_ov002_0229cd54(void);
extern u16  *func_ov002_0229cd44(void);
extern void  func_ov002_0229cd4c(void);
extern void  func_ov002_021d4834(u16 a, u16 b, u16 c, u16 d);

void func_ov002_021b085c(int arg0) {
    u16 *p;
    if (func_ov002_0229cd54()) {
        return;
    }
    do {
        p = func_ov002_0229cd44();
        func_ov002_021d4834(p[0], p[1], p[2], p[3]);
        func_ov002_0229cd4c();
        if (arg0 == 0) {
            return;
        }
    } while (func_ov002_0229cd54() == 0);
}
