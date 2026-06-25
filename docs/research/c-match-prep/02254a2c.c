/* CAMPAIGN-PREP candidate for func_02254a2c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     count from helper; signed le guards; constant-arg for loop
 *   risk:       the duplicated n<=0 guard and 0x132c/0x1f4 literals; for-loop entry may differ from do-while
 *   confidence: med
 */
/* func_ov002_02254a2c: query a count from func_ov002_021bb068(0x132c); if
 * positive, prime func_ov002_021df680(-1,0x132c) then call
 * func_ov002_021df780(arg0,0x1f4) that many times. */
extern int func_ov002_021bb068(int a);
extern int func_ov002_021df680(int a, int b);
extern int func_ov002_021df780(int a, int b);

void func_ov002_02254a2c(int arg0) {
    int n = func_ov002_021bb068(0x132c);
    int i;
    if (n <= 0)
        return;
    func_ov002_021df680(-1, 0x132c);
    for (i = 0; i < n; i++)
        func_ov002_021df780(arg0, 0x1f4);
}
