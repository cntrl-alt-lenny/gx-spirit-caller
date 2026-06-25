/* CAMPAIGN-PREP candidate for func_02097e18 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     16-byte stack scratch by-addr; arg pass-through; guard; tail call
 *   risk:       local treated as char[16]; if it is a typed struct the field stores inside callees are opaque so likely fine; r1 pass-through assumed.
 *   confidence: high
 */
// func_02097e18 — 0x10 stack scratch + two-call wrapper
// Recipe: local[16] by addr, pass-through arg1, guard ==0 return, tail call.

extern int func_02098228(void *p, int arg1, int zero, void *out);
extern int func_02097e5c(void *p, void *out);

int func_02097e18(void *p, int arg1)
{
    unsigned char local[0x10];

    if (func_02098228(p, arg1, 0, local) == 0) {
        return 0;
    }

    return func_02097e5c(p, local);
}
