/* CAMPAIGN-PREP candidate for func_021b3e38 (ov019, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD early-return + struct-halfword loads + stack marshalling + two tail calls
 *   risk:       struct field offsets (0x4bc,0x448,0x2c) and arg layout guessed; the (u16)a2 zero-extend and store scheduling may reorder
 *   confidence: med
 */
/* func_ov019_021b3e38: guard on a0->f4bc; pick sub-object at a0[a1].f448;
 * stash (p->h0<<12),(p->h2<<12) on the stack; if a2!=-1 call func_0201e800;
 * always call func_0201e964 with the marshalled args; if a2!=-1 finish with
 * func_0201e7ec + func_0207fd28.
 */

typedef unsigned short u16;

extern void func_0201e800(int obj, int v);
extern void func_0201e964(int a0, int a1, void *attr, int a3, int a4,
                          int a5, int a6, int a7, int a8, int a9, int a10);
extern void func_0201e7ec(int obj, int v);
extern void func_0207fd28(int obj, int v);

typedef struct {
    u16 h0;
    u16 h2;
    u16 h4;
    u16 h6;
    u16 h8;
} Pt021b3e38;

void func_ov019_021b3e38(int *a0, int a1, int a2, Pt021b3e38 *p) {
    int obj;
    int x12;
    int y12;

    if (a0[0x4bc / 4] == 0) {
        return;
    }
    obj = *(int *)((char *)a0 + a1 * 4 + 0x448);

    x12 = p->h0 << 12;
    y12 = p->h2 << 12;

    if (a2 != -1) {
        func_0201e800(obj, (u16)a2);
    }
    {
        int attr[2];
        attr[0] = x12;
        attr[1] = y12;
        func_0201e964(2, *(int *)((char *)obj + 0x2c), attr,
                      0, 0, p->h8, p->h6, 0, 0, 0, 0);
    }
    if (a2 != -1) {
        func_0201e7ec(obj, 1);
        func_0207fd28(obj, 0x1000);
    }
}
