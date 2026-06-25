/* CAMPAIGN-PREP candidate for func_0204f040 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-arg pack (10 words) + single call, r0 passthrough
 *   risk:       many stack slots — any reorder fails; data_ symbols passed by address
 *   confidence: med
 */
/* func_0204f040: pack 9 stack words + 4 register args and call
 * func_0209150c. r0 (a0) is passed through untouched; r1=0x100.
 * Stack (ascending): 3, data_ff980, a1, a2, a2, data_ff9a0, a3,
 *   data_ff9ac, 3. Reg: r2=data_ff9ec, r3=data_ff9b8. */

extern char data_020ff980[];
extern char data_020ff9a0[];
extern char data_020ff9ac[];
extern char data_020ff9b8[];
extern char data_020ff9ec[];
extern void func_0209150c(int a0, int a1, void *e2, void *e3,
                          int s0, void *s1, int s2, int s3, int s4,
                          void *s5, int s6, void *s7, int s8);

void func_0204f040(int a0, int a1, int a2, int a3) {
    func_0209150c(a0, 0x100, data_020ff9ec, data_020ff9b8,
                  3, data_020ff980, a1, a2, a2,
                  data_020ff9a0, a3, data_020ff9ac, 3);
}
