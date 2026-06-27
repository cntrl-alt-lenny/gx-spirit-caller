/* CAMPAIGN-PREP candidate for func_022806a4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-returns + global store + tail flag store
 *   risk:       data_ov002_022cd444 typed as scalar int; if real symbol is array[], decl harmless (offset 0). VERIFIED byte-exact.
 *   confidence: high
 */
extern int func_ov002_022535a4(int a, int b, int c);
extern int func_ov002_0227ef2c(int a, int b, int c);
extern void func_ov002_021afa84(void);
extern void func_ov002_021afe6c(int a, int b);
extern int data_ov002_022cd444;
extern char data_ov002_022d008c[];

int func_ov002_02280594(int a, int b, int c) {
    int r;
    if (func_ov002_022535a4(a, b, c) == 0) return -1;
    data_ov002_022cd444 = a;
    r = func_ov002_0227ef2c(a, b, c);
    if (r < 0) return -1;
    func_ov002_021afa84();
    func_ov002_021afe6c(r, 1);
    *(int *)(data_ov002_022d008c + 0xd44) = 1;
    return r;
}
