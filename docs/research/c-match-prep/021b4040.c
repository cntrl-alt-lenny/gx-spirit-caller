/* CAMPAIGN-PREP candidate for func_021b4040 (ov014, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT: 6x 12-arg window-builder calls, &coords stack local
 *   risk:       reg-alloc-walled (brief 302 shipped as .s); per-call stack-store order, r3-as-zero reuse for arg d, and coords-store hoisting unlikely to match
 *   confidence: low
 */
/* func_ov014_021b4040: build the 6 sub-windows of a panel.
 *   if (p->f58) { p->f58 = 0; return 1; }   // already torn down once
 *   coords = {0x80000, 0x60000};
 *   func_0201e964(1, p->f0c->f2c,      &coords, 0, 0,0,0,0,0,0,0,0);
 *   func_0201e964(1, p->f0c->f2c + 8,  &coords, 0, 0,0,3,0,0,0,0,0);
 *   func_0201e964(1, p->f20->f2c,      &coords, 0, 0,0,1,0x6000,0x200,0,0,0);
 *   func_0201e964(1, p->f34->f2c,      &coords, 0, 0,0,2,0xa000,0x400,0,0,0);
 *   func_0201e964(1, p->f48->f2c,      &coords, 0, 0,0,1,0x12000,0x600,0,0,0);
 *   return 1;
 * 12-arg builder = 4 reg + 8 stack; coords is a 2-int local r2 points at.
 * WALLED in brief 302 — the stack-slot store order rarely matches mwcc. */

extern void func_0201e964(int a, int b, void *coords,
                          int d, int e, int f, int g, int h,
                          int i, int j, int k, int l);

typedef struct PanelSub { char pad[0x2c]; int f2c; } PanelSub;
typedef struct Panel {
    char pad0[0x0c];
    PanelSub *f0c;          /* +0x0c */
    char pad1[0x10];
    PanelSub *f20;          /* +0x20 */
    char pad2[0x10];
    PanelSub *f34;          /* +0x34 */
    char pad3[0x10];
    PanelSub *f48;          /* +0x48 */
    char pad4[0x0c];
    int f58;                /* +0x58 */
} Panel;

int func_ov014_021b4040(Panel *p) {
    int coords[2];
    if (p->f58) { p->f58 = 0; return 1; }
    coords[0] = 0x80000;
    coords[1] = 0x60000;
    func_0201e964(1, p->f0c->f2c,     (void *)coords, 0, 0, 0, 0,       0,     0, 0, 0, 0);
    func_0201e964(1, p->f0c->f2c + 8, (void *)coords, 0, 0, 0, 3,       0,     0, 0, 0, 0);
    func_0201e964(1, p->f20->f2c,     (void *)coords, 0, 0, 0, 1,       0x6000, 0x200, 0, 0, 0);
    func_0201e964(1, p->f34->f2c,     (void *)coords, 0, 0, 0, 2,       0xa000, 0x400, 0, 0, 0);
    func_0201e964(1, p->f48->f2c,     (void *)coords, 0, 0, 0, 1,       0x12000, 0x600, 0, 0, 0);
    return 1;
}
