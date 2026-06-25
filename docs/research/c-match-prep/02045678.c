/* CAMPAIGN-PREP candidate for func_02045678 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD/branch-tail chain + RELOAD singleton per field (no callee-saved)
 *   risk:       reload-vs-bind of the singleton after the call and between the two f4/f6 stores; return-constant reuse may emit moveq; known reg-alloc wall
 *   confidence: low
 */
/* func_02045678: state-machine guard chain on the data_0219dad0 singleton.
 * Only lr is saved (zero callee-saved regs), so the singleton pointer is
 * reloaded for each post-call field access. Each early-return reuses the
 * constant already in r0 (no extra moveq). NOTE: shipped as .s in the
 * GLOBAL_ASM endgame (reg-alloc-walled) -- this is a fresh C retry. */

typedef struct {
    int            f0;       /* +0x00 */
    unsigned short f4;       /* +0x04 */
    unsigned short f6;       /* +0x06 */
} S;

extern S *data_0219dad0;
extern int  func_0203cbc0(void);
extern void func_0204525c(int a, int b);

int func_02045678(void) {
    S *s = data_0219dad0;
    int r;

    if (s == 0) return 0;
    if (s->f4 == 1) return 1;

    r = func_0203cbc0();
    if (r == 5) {
        data_0219dad0->f4 = 4;
        data_0219dad0->f6 = 1;
        return 4;
    }
    if (r >= 0) return 2;
    if (r < -10) {
        func_0204525c(5, r);
        data_0219dad0->f4 = 7;
        return 7;
    }
    func_0204525c(9, r - 0x2bc);
    data_0219dad0->f4 = 8;
    return 8;
}
