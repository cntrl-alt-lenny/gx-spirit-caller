/* CAMPAIGN-PREP candidate for func_02097a04 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     p kept in r0 across calls; guarded call; ==0 cmov return
 *   risk:       func_020965ac arg order (r0=p,r1=f10) assumes p preserved; if it really takes 1 arg in r1, signature wrong.
 *   confidence: med
 */
// func_02097a04 — call chain + conditional call + ==0 return
// Recipe: r0=p preserved across calls; guarded call; ==0 cmov boolean.

typedef struct {
    unsigned char pad08[0x8];
    int f08;    // 0x08
    int f10;    // 0x10  (note: 0x0c gap)
    int f14;    // 0x14
} Obj02097a04;

extern int  func_020965ac(Obj02097a04 *p, int x);
extern void func_02096728(Obj02097a04 *p, int v);
extern int  func_02097af0(int x);
extern void func_02097a4c(void);

int func_02097a04(Obj02097a04 *p)
{
    int v;

    v = func_020965ac(p, p->f10);
    func_02096728(p, v);

    if (func_02097af0(p->f08)) {
        func_02097a4c();
    }

    return p->f14 == 0;
}
