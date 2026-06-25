/* CAMPAIGN-PREP candidate for func_020444e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD/early-return + shift-sub SETTER; shared-immediate call
 *   risk:       the two 0x20 args may reload separately instead of mov r1,r0; arg0 ptr type guessed
 *   confidence: med
 */
/* func_020444e4: guarded call; on success store (p[0]<<3)-0x400 to a global,
 * return 1; on failure return 0. Two literal 0x20 args share a reg (mov r1,r0). */

extern int func_02043ca4(int a, int b, void *p);
extern int data_0219da78;

int func_020444e4(unsigned short *p) {
    if (func_02043ca4(0x20, 0x20, p) == 0) return 0;
    data_0219da78 = (*p << 3) - 0x400;
    return 1;
}
