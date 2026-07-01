/* CAMPAIGN-PREP candidate for func_020876a8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Cache arg in r4; u8 == const guard; pool-literal arg; reload byte; tail call
 *   risk:       Struct offsets guessed (f2c@2c,f3c@3c); p->f3c reloaded twice (ldrb) — mwcc may bind instead
 *   confidence: med
 */
/* func_020876a8: cache arg0 in r4. If p->f2c (u8) == 2, call
 * func_020950f4(p->f3c, 0xfffffd2d). Always: func_020951b0(p->f3c) then
 * tail func_020875a8(p). The 0xfffffd2d is a pool-loaded constant arg.
 */

struct Func02087790Obj {
    char _pad00[0x2c];
    unsigned char f2c;
    char _pad2d[0xf];
    unsigned char f3c;
};

extern void func_020950f4(int a, int b);
extern void func_020951b0(int a);
extern void func_020875a8(void *p);

void func_020876a8(struct Func02087790Obj *p) {
    if (p->f2c == 2) {
        func_020950f4(p->f3c, 0xfffffd2d);
    }
    func_020951b0(p->f3c);
    func_020875a8(p);
}
