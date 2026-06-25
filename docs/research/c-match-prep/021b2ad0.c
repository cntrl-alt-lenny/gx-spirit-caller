/* CAMPAIGN-PREP candidate for func_021b2ad0 (ov007, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch on state field + counter-increment tail
 *   risk:       case-1 inner branch (==0 reset vs else tail call) ordering may flip beq/bne; offsets +0x8/+0xc confirmed
 *   confidence: high
 */
/* func_ov007_021b2ad0: state machine on a0->state(+0x8).
 *  case 0: if (a0->f_c(+0xc)==2){ func_ov007_021b2d0c(); state=1; f_c=0; }
 *  case 1: if (func_020215d8(a0->f_0)==0){ a0->f_0=0; state=2; f_c=0; }
 *          else func_ov007_021b2d3c(a0);
 *  case 2: return 1;
 *  default & fall-through: f_c++; return 0;
 */

extern int  func_020215d8(int a);
extern void func_ov007_021b2d0c(void);
extern void func_ov007_021b2d3c(void *a);

int func_ov007_021b2ad0(char *a0) {
    switch (*(int *)(a0 + 0x8)) {
    case 0:
        if (*(int *)(a0 + 0xc) == 2) {
            func_ov007_021b2d0c();
            *(int *)(a0 + 0x8) = 1;
            *(int *)(a0 + 0xc) = 0;
        }
        break;
    case 1:
        if (func_020215d8(*(int *)a0) == 0) {
            *(int *)a0 = 0;
            *(int *)(a0 + 0x8) = 2;
            *(int *)(a0 + 0xc) = 0;
        } else {
            func_ov007_021b2d3c(a0);
        }
        break;
    case 2:
        return 1;
    }
    *(int *)(a0 + 0xc) = *(int *)(a0 + 0xc) + 1;
    return 0;
}
