/* CAMPAIGN-PREP candidate for func_0206e174 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global dispatch via pool literals, reload-global, switch-ish guards
 *   risk:       return reloads data_0219ef1c; mwcc could CSE the two reads but the intervening calls/store block it
 *   confidence: med
 */
/* func_0206e174: global state dispatch.
 *   x = data_0219ef1c;
 *   if (x != 0) { if (data_0219ece0 == 0) data_0219ece0 = x; }
 *   else if ((data_0219ece4 & 3) == 1) {
 *       if (func_02093808() != 0x12) func_02091768(0xa);
 *   }
 *   return data_0219ef1c;            ; LIT0 reloaded at tail
 * data_0219ef1c is read at entry (for the test) and re-read at the
 * return; the call / cross-global store prevent CSE, matching the two
 * separate ldr-from-pool loads.
 */

extern int  data_0219ef1c;
extern int  data_0219ece4;
extern int  data_0219ece0;
extern int  func_02093808(void);
extern void func_02091768(int n);

int func_0206e174(void) {
    int x = data_0219ef1c;
    if (x != 0) {
        if (data_0219ece0 == 0) {
            data_0219ece0 = x;
        }
    } else if ((data_0219ece4 & 3) == 1) {
        if (func_02093808() != 0x12) {
            func_02091768(0xa);
        }
    }
    return data_0219ef1c;
}
