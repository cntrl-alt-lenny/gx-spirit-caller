/* CAMPAIGN-PREP candidate for func_02249398 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     mla base (inline, no guard) + && short-circuit + rotated for-loop
 *   risk:       inline base must fuse to mla not mul+add; count-reload-then-<5 ordering; loop rotation (b to cond)
 *   confidence: high
 */
/* func_ov002_02249398: counted loop bounded by min(count@0x10, 5); tags indices. */

extern void func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];

void func_ov002_02249398(int idx) {
    int x = 1 - idx;
    char *base = data_ov002_022cf16c + (x & 1) * 0x868;
    int i;

    for (i = 0; i < *(unsigned int *)(base + 0x10) && i < 5; i++)
        func_ov002_02253458(x, 13, i);
}
