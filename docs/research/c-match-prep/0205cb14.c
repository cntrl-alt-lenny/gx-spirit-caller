/* CAMPAIGN-PREP candidate for func_0205cb14 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     assert guard + reloaded-global guard-chain dispatch to calls
 *   risk:       orig RELOADS r5[0] (ldr each test) — separate r5[0] refs reproduce that; final && short-circuit block order may differ from orig's bne chain.
 *   confidence: med
 */
extern unsigned char data_02100b64[];
extern unsigned char data_02100c90[];
extern int func_0205cbb8(int a, int *b);
extern int func_0205cf10(int a, int *b);
extern int func_0205d15c(int a, int *b);
extern void func_020a6d54(void *file, void *msg, int z, int line);

int func_0205cb14(int r6, int *r5) {
    int r4 = 0;
    if (r5[0] == 0x64) {
        func_020a6d54(data_02100c90, data_02100b64, 0, 0x1d9);
    }
    if (r5[0] != 0x69) {
        if (r5[1] != 0) {
            r4 = func_0205d15c(r6, r5);
        } else {
            r4 = func_0205cf10(r6, r5);
        }
    }
    if (r4 == 0 && r5[0] == 0x69) {
        r4 = func_0205cbb8(r6, r5);
    }
    return r4;
}
