/* CAMPAIGN-PREP candidate for func_02032644 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     switch-dispatch on call result, void tail
 *   risk:       switch may emit cmp-chain vs jump table (here cmp-chain expected); branch order to default assumed
 *   confidence: high
 */
/* func_02032644: dispatch on func_02032634's result. case 1 runs two
 * calls, case 2 one call, anything else falls through (void return).
 * Small dense cases -> cmp #1/#2 branch chain, not a jump table.
 *
 *     bl func_02032634; cmp r0,#1; beq .L_1c; cmp r0,#2; beq .L_28; b .L_30
 *  .L_1c: bl func_02031e80; bl func_02031e90; ret
 *  .L_28: bl func_02046ac4; ret
 *  .L_30: mov r0,#0; ret
 */

extern int  func_02032634(void);
extern void func_02031e80(void);
extern void func_02031e90(void);
extern void func_02046ac4(void);

void func_02032644(void) {
    switch (func_02032634()) {
    case 1:
        func_02031e80();
        func_02031e90();
        break;
    case 2:
        func_02046ac4();
        break;
    default:
        break;
    }
}
