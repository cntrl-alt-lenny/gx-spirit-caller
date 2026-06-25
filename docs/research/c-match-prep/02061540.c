/* CAMPAIGN-PREP candidate for func_02061540 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-then-reload field null-check; conditional setter+bool
 *   risk:       the empty sub sp,#4 frame slot and the str-then-ldr reload of f0 must both reproduce; field offsets (0,4) assumed
 *   confidence: med
 */
/* func_02061540: store func_020453e8(arg) into p->f0, null-check it
 * (reloaded from the field), set p->f4 = arg on success, return bool.
 */

typedef struct {
    void *f0;
    int f4;
} Obj_02061540;

extern void *func_020453e8(int);

int func_02061540(Obj_02061540 *p, int arg) {
    p->f0 = func_020453e8(arg);
    if (p->f0 == 0) return 0;
    p->f4 = arg;
    return 1;
}
