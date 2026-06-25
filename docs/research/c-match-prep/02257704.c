/* CAMPAIGN-PREP candidate for func_02257704 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     resolve record; null+field-8 guard; flag-bracketed sink call
 *   risk:       the field-8 ldr reg-choice (r0 vs r1) like 022576d8; otherwise flag bracket is deterministic
 *   confidence: med
 */
/* func_ov002_02257704: resolve a record via func_ov002_02257464(arg0); if it
 * is null or its +8 field is 0, return -1; else set the ce288+0x5c0 flag,
 * call func_ov002_02257750(arg0, record->f8), clear the flag, and return the
 * call's result. */
#include "ov002_core.h"
extern char *func_ov002_02257464(int a);
extern int func_ov002_02257750(int a, int b);

int func_ov002_02257704(int arg0) {
    char *r = func_ov002_02257464(arg0);
    int ret;
    if (r == 0 || *(int *)(r + 8) == 0)
        return -1;
    *(int *)((char *)data_ov002_022ce288 + 0x5c0) = 1;
    ret = func_ov002_02257750(arg0, *(int *)(r + 8));
    *(int *)((char *)data_ov002_022ce288 + 0x5c0) = 0;
    return ret;
}
