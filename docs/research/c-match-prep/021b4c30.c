/* CAMPAIGN-PREP candidate for func_021b4c30 (ov019, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD/BRANCH chain on flags + MIN clamp inc (addlt/strlt); fixed return 1
 *   risk:       struct offsets 0xb8/0xbc/0xc4 assumed; the if/else-if-then-clamp branch order and addlt+strlt conditional-store codegen may reshape
 *   confidence: med
 */
/* func_ov019_021b4c30: per-frame step. If flag at +0xb8 set, run
 * func_ov019_021b4c74; else if flag at +0xbc set, run func_ov019_021b4fdc and
 * then clamp-advance the counter at +0xc4 (+0x10 while < 0x50). Always ret 1.
 */

extern void func_ov019_021b4c74(int *p);
extern void func_ov019_021b4fdc(int *p);

int func_ov019_021b4c30(int *p) {
    if (p[0xb8 / 4] != 0) {
        func_ov019_021b4c74(p);
    } else {
        if (p[0xbc / 4] != 0) {
            func_ov019_021b4fdc(p);
        }
        if (p[0xc4 / 4] < 0x50) {
            p[0xc4 / 4] += 0x10;
        }
    }
    return 1;
}
