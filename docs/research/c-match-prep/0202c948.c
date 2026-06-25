/* CAMPAIGN-PREP candidate for func_0202c948 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field stores + conditional-move select (movne/moveq) then store
 *   risk:       if/else may branch instead of movne/moveq; base reload-after-call and store order 0x4/0x18/0x14 must hold
 *   confidence: med
 */
/* func_0202c948: store a0@0x68, a1@0x6c on data_0219ad48; func_0202cc8c(0);
 * func_0202c9c0(0); set @0x4=-1, @0x18=0, @0x14=0; then conditional-move
 * @0xc = func_02034784() ? 0xf0 : 0x100. Reloads base after each call. */

extern void func_0202cc8c(int x);
extern void func_0202c9c0(int x);
extern int  func_02034784(void);
extern char data_0219ad48[];

void func_0202c948(int a0, int a1) {
    *(int *)(data_0219ad48 + 0x68) = a0;
    *(int *)(data_0219ad48 + 0x6c) = a1;
    func_0202cc8c(0);
    func_0202c9c0(0);
    *(int *)(data_0219ad48 + 0x04) = -1;
    *(int *)(data_0219ad48 + 0x18) = 0;
    *(int *)(data_0219ad48 + 0x14) = 0;
    if (func_02034784() != 0)
        *(int *)(data_0219ad48 + 0x0c) = 0xf0;
    else
        *(int *)(data_0219ad48 + 0x0c) = 0x100;
}
