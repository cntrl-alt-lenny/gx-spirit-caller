/* CAMPAIGN-PREP candidate for func_020822f0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     post-inc arg, two-store bit-clear (bind temp)
 *   risk:       Post-inc ldr [r1],#4 form is compiler-choice; arg1=&data[1] and the &data_021a18b8 base treatment may differ.
 *   confidence: low
 */
/* func_020822f0: load globals[0], call, then clear bits 1 then 2 at +0xfc
 * with an intermediate store (keep the value in a temp, store twice). */
extern int *data_021a18b8;
extern void func_02084e0c(int a, int *b, int c);

void func_020822f0(void) {
    int *p = (int *)&data_021a18b8;
    func_02084e0c(p[0], &p[1], 0x3e);
    {
        char *base = (char *)&data_021a18b8;
        int v = *(int *)(base + 0xfc);
        v &= ~0x1;
        *(int *)(base + 0xfc) = v;
        v &= ~0x2;
        *(int *)(base + 0xfc) = v;
    }
}
