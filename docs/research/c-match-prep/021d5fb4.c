/* CAMPAIGN-PREP candidate for func_021d5fb4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted nested loop; bind u16 packed across loop
 *   risk:       loop induction/var order may shift; inner-start mirror (r5) or packed narrow could schedule differently
 *   confidence: high
 */
/* func_ov002_021d5fb4: 2x5 nested counted loop posting func_021d5ab4(i, j,
 * packed, 1); packed = (u16)((arg0&0xff) | ((arg1&0xff)<<8)) bound once in r8. */

extern int func_ov002_021d5ab4(int a, int b, int c, int d);

void func_ov002_021d5fb4(int arg0, int arg1) {
    unsigned short packed = (unsigned short)((arg0 & 0xff) | ((arg1 & 0xff) << 8));
    int i, j;
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 5; j++) {
            func_ov002_021d5ab4(i, j, packed, 1);
        }
    }
}
