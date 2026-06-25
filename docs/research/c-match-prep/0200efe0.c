/* CAMPAIGN-PREP candidate for func_0200efe0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     wrapper call(func_0200ef60) + flag-guard + conditional stores + setter tail
 *   risk:       a1/a2 pass-through to ef60; r0 from ef60 then re-fetched via edb8; &&-store; offsets 0x98/0x9c guessed
 *   confidence: high
 */
/* func_0200efe0: thin wrapper over func_0200ef60(a1,a2); on success and
 * flag==1, fetch the record (func_0200edb8) and, if non-null with a
 * non-null payload, record payload@0x98 and flag@0x9c. */

extern int func_0200ef60(void *o, int a2);
extern int func_0200edb8(void *p);

int func_0200efe0(void *o, int a2, void *payload, int flag) {
    if (func_0200ef60(o, a2) == 0) return 0;
    if (flag != 1) return 1;
    {
        int *r = (int *)func_0200edb8(0);
        if (r != 0 && payload != 0) {
            r[0x98 / 4] = (int)payload;
            r[0x9c / 4] = flag;
        }
        return (int)r;
    }
}
