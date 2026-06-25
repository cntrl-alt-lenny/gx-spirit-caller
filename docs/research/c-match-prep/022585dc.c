/* CAMPAIGN-PREP candidate for func_022585dc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     state dispatch; unsigned >= guard; 021d479c u16 pack
 *   risk:       the (cf0+1) compare must emit bcs (unsigned) not bge; if it flips to signed the predicate mismatches
 *   confidence: med
 */
/* func_ov002_022585dc: tiny 2-state machine on data->+0xD68.
 * state 0: tick a +0xCF0 counter; <10 -> fire event 0x52 then clear +0xD50,
 *          >=10 -> kick helper 6 and bump the state.
 * state 1: if +0xD44 latched, emit a 021d479c command, then clear +0xD50. */

extern char data_ov002_022d016c[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae484(int x);
extern int func_ov002_021d479c(int a, int b, int c, int d);

void func_ov002_022585dc(void) {
    int state = *(int *)(data_ov002_022d016c + 0xD68);
    if (state == 0) {
        if ((unsigned int)(*(int *)(data_ov002_022d016c + 0xCF0) + 1) >= 0xA) {
            func_ov002_021ae484(6);
            *(int *)(data_ov002_022d016c + 0xD68) =
                *(int *)(data_ov002_022d016c + 0xD68) + 1;
            return;
        }
        func_ov002_021ae400(*(int *)(data_ov002_022d016c + 0xD6C), 0x52);
        *(int *)(data_ov002_022d016c + 0xD50) = 0;
        return;
    }
    if (state == 1) {
        if (*(int *)(data_ov002_022d016c + 0xD44) != 0) {
            func_ov002_021d479c(
                (unsigned short)((*(int *)(data_ov002_022d016c + 0xD70) ? 0x8000 : 0) | 0x23),
                0xA, 0, 0);
        }
        *(int *)(data_ov002_022d016c + 0xD50) = 0;
    }
}
