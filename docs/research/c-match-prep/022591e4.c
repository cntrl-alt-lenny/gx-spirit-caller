/* CAMPAIGN-PREP candidate for func_022591e4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard call + switch(b) cases 12-15 returning constants
 *   risk:       switch body layout: orig emits case-13 body before case-12 (.L_d1c<.L_d34); mwcc may order bodies by source instead, flipping branch targets
 *   confidence: low
 */
/* func_ov002_022591e4: gated branch-table. If 021c9a08(a,b) is false return 0;
 * else dispatch on b (12..15) returning 2 under various +0xD04 / selection
 * conditions, default 0. */

extern char data_ov002_022d016c[];
extern char data_ov002_022cd73c[];
extern int func_ov002_021c9a08(int a, int b);

int func_ov002_022591e4(int a, int b) {
    if (func_ov002_021c9a08(a, b) == 0)
        return 0;
    switch (b) {
    case 12:
        if (*(int *)(data_ov002_022d016c + 0xD04) == 3)
            return 2;
        if (a == *(int *)(data_ov002_022cd73c + 0x4))
            return 2;
        return 0;
    case 13:
        if (*(int *)(data_ov002_022d016c + 0xD04) == 3)
            return 2;
        return 0;
    case 14:
    case 15:
        return 2;
    default:
        return 0;
    }
}
