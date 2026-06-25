/* CAMPAIGN-PREP candidate for func_020a1d44 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain (global!=0 && 099c) + global-index load + cmp==7
 *   risk:       Same struct-offset guess as 1bf8; the global is loaded once for the !=0 test then reloaded for indexing (two ldr) — must not CSE; ==7 -> moveq r0,#1 conditional return.
 *   confidence: med
 */
/* func_020a1d44: if(data_021a98fc==0) return 0; if(!func_020a099c(p0)) return 0;
 * if( (data_021a98fc + 0x1000)[(p0-1)].f_4e8 == 7 ) return 1; return 0. */

extern int   func_020a099c(int x);
extern char *data_021a98fc;

int func_020a1d44(int p0) {
    if (data_021a98fc == 0) return 0;
    if (func_020a099c(p0) == 0) return 0;
    {
        int *slot = (int *)(data_021a98fc + (p0 - 1) * 4 + 0x1000);
        if (slot[0x4e8 / 4] == 7) return 1;
    }
    return 0;
}
