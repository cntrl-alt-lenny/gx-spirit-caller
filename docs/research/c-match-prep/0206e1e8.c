/* CAMPAIGN-PREP candidate for func_0206e1e8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     call-guard + conditional store-pair, mvneq error code
 *   risk:       mvneq #0x26 vs movne #0; ordering of strne pair fixed by source order; arg-cache r4/r5 stable
 *   confidence: high
 */
/* func_0206e1e8: register a pointer-pair on success.
 *   r5=arg0; r4=arg1;
 *   if (func_0206e174() != 0) {
 *       data_0219ef34[0] = arg0;     ; strne r5,[r1]
 *       data_0219ef34[1] = arg1;     ; strne r4,[r1,#4]
 *       return 0;
 *   }
 *   return -0x27;                    ; mvneq r0,#0x26  (= ~0x26)
 */

extern int  func_0206e174(void);
extern void *data_0219ef34[2];

int func_0206e1e8(void *arg0, void *arg1) {
    if (func_0206e174() != 0) {
        data_0219ef34[0] = arg0;
        data_0219ef34[1] = arg1;
        return 0;
    }
    return ~0x26;
}
