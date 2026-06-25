/* CAMPAIGN-PREP candidate for func_0205407c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     assert-on-null guard then null-early-return + forwarding tail call
 *   risk:       movs/bne uses the same r5==0 test twice; mwcc may fold the two null checks or reorder. func_020a6d54 arg count (4) inferred from r0-r3 setup.
 *   confidence: med
 */
extern unsigned char data_020ffb04[];
extern unsigned char data_020ffb5c[];
extern int func_02053fc4(int a, int b, int c);
extern void func_020a6d54(void *file, void *msg, int z, int line);

int func_0205407c(int *r5, int r4) {
    if (!r5) {
        func_020a6d54(data_020ffb5c, data_020ffb04, 0, 0xa0);
    }
    if (r5 == 0) {
        return 0;
    }
    return func_02053fc4((int)r5, r4, r5[0]);
}
