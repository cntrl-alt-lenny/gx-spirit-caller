/* CAMPAIGN-PREP candidate for func_02285d68 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     init-once guard; 0xc8 stack buf; store-order preserved
 *   risk:       none material — VERIFIED byte-exact. buf size 0xc8 and store order ([0x1e0] then [0x1cc]) both confirmed.
 *   confidence: high
 */
extern void func_ov002_02285984(void *buf, int a);
extern void func_ov002_022859e8(int a);
extern int  func_ov002_02285be0(int a);
extern void func_ov002_022859b4(void *buf, int a);
extern char data_ov002_022cd524[];

int func_ov002_02285d68(int a) {
    char buf[0xc8];
    if (*(int *)(data_ov002_022cd524 + 0x1cc) == 0) {
        func_ov002_02285984(buf, a);
        func_ov002_022859e8(a);
        *(int *)(data_ov002_022cd524 + 0x1e0) = func_ov002_02285be0(a);
        *(int *)(data_ov002_022cd524 + 0x1cc) = 1;
        func_ov002_022859b4(buf, a);
    }
    return *(int *)(data_ov002_022cd524 + 0x1e0);
}
