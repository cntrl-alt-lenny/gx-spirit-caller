/* CAMPAIGN-PREP candidate for func_0224b27c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-tail + bind-off + no-array counted loop (count reload @0x14)
 *   risk:       base must stay bound in callee-saved reg with count reloaded each iter (bcc unsigned); reg-alloc of base/i may flip
 *   confidence: high
 */
/* func_ov002_0224b27c: per-parity counted loop, unconditionally tags each index. */

extern void func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

void func_ov002_0224b27c(int idx) {
    int x = idx;
    int off = (x & 1) * 0x868;
    char *base;
    int i;

    if (*(unsigned int *)(data_ov002_022cf180 + off) == 0)
        return;

    base = data_ov002_022cf16c + off;
    for (i = 0; i < *(unsigned int *)(base + 0x14); i++)
        func_ov002_02253458(x, 14, i);
}
