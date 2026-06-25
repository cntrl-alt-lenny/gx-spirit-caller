/* CAMPAIGN-PREP candidate for func_022584ac (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (a==8||a==9) + reload-global + 6-arg call
 *   risk:       021d6870 arg count/order guessed from asm; d74+d78 add operand-order and the two zero stack args may schedule differently
 *   confidence: med
 */
/* func_ov002_022584ac: if cmd is 8 or 9, fire a 6-arg event built from the
 * shared duel block; always clear the +0xD50 status word on the way out. */

extern char data_ov002_022d016c[];
extern void func_ov002_021d6870(int a, int b, int c, int d, int e, int f);

void func_ov002_022584ac(int a) {
    if (a == 8 || a == 9) {
        func_ov002_021d6870(*(int *)(data_ov002_022d016c + 0xD70),
                            *(int *)(data_ov002_022d016c + 0xD74) +
                                *(int *)(data_ov002_022d016c + 0xD78),
                            0, 0, 0, 0);
    }
    *(int *)(data_ov002_022d016c + 0xD50) = 0;
}
