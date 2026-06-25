/* CAMPAIGN-PREP candidate for func_021b25a0 (ov007, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch on state field + counter-increment tail
 *   risk:       struct offsets (0x34 state, 0x38 sub) confirmed from asm; case-2 early-return vs default fall-through ordering may shift branches
 *   confidence: high
 */
/* func_ov007_021b25a0: state machine on a0->state(+0x34).
 *  case 0: if (a0->sub(+0x38)==3) { func_ov007_021b2630(); state=1; sub=0; }
 *  case 1: if (func_ov007_021b2694()) { state=2; sub=0; }
 *  case 2: return 1;
 *  default & fall-through: sub++; return 0;
 */

extern void func_ov007_021b2630(void);
extern int  func_ov007_021b2694(void);

int func_ov007_021b25a0(char *a0) {
    switch (*(int *)(a0 + 0x34)) {
    case 0:
        if (*(int *)(a0 + 0x38) == 3) {
            func_ov007_021b2630();
            *(int *)(a0 + 0x34) = 1;
            *(int *)(a0 + 0x38) = 0;
        }
        break;
    case 1:
        if (func_ov007_021b2694()) {
            *(int *)(a0 + 0x34) = 2;
            *(int *)(a0 + 0x38) = 0;
        }
        break;
    case 2:
        return 1;
    }
    *(int *)(a0 + 0x38) = *(int *)(a0 + 0x38) + 1;
    return 0;
}
