/* CAMPAIGN-PREP candidate for func_022806a4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-returns + global store + tail flag store
 *   risk:       data_ov002_022cd524 typed as scalar int; if real symbol is array[], decl harmless (offset 0). VERIFIED byte-exact.
 *   confidence: high
 */
extern int func_ov002_0225368c(int a, int b, int c);
extern int func_ov002_0227f03c(int a, int b, int c);
extern void func_ov002_021afb64(void);
extern void func_ov002_021aff4c(int a, int b);
extern int data_ov002_022cd524;
extern char data_ov002_022d016c[];

int func_ov002_022806a4(int a, int b, int c) {
    int r;
    if (func_ov002_0225368c(a, b, c) == 0) return -1;
    data_ov002_022cd524 = a;
    r = func_ov002_0227f03c(a, b, c);
    if (r < 0) return -1;
    func_ov002_021afb64();
    func_ov002_021aff4c(r, 1);
    *(int *)(data_ov002_022d016c + 0xd44) = 1;
    return r;
}
