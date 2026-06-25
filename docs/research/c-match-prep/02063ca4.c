/* CAMPAIGN-PREP candidate for func_02063ca4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     halfword counter bump + if-else selector cascade with guarded calls
 *   risk:       asm truncated: case 6 handler + its arg-shape inferred; dispatcher drops arg 'a' passing (p,b,c); f66 offset 0x66 guessed
 *   confidence: med
 */
/* func_02063ca4: bump halfword counter p->f66, then dispatch on sel
 * (if-else cascade, NOT a switch/jump-table) to one of 7 handlers.
 * Each handler returns 0 => this returns 0; otherwise returns 1.
 * Handlers 0-3,5 take (p, b, c); handlers 4 and 6 take (p) only.
 * Case 6 -> func_02063dc8 inferred from the .extern set (asm body
 * truncated after case 5).
 */

typedef struct {
    char _pad[0x66];
    unsigned short f66;
} Obj_02063ca4;

extern int func_02064158(Obj_02063ca4 *, int, int);
extern int func_020640c0(Obj_02063ca4 *, int, int);
extern int func_02063fe4(Obj_02063ca4 *, int, int);
extern int func_02063ed0(Obj_02063ca4 *, int, int);
extern int func_02063e78(Obj_02063ca4 *);
extern int func_02063e0c(Obj_02063ca4 *, int, int);
extern int func_02063dc8(Obj_02063ca4 *);

int func_02063ca4(Obj_02063ca4 *p, int sel, int b, int c) {
    p->f66++;
    if (sel == 0) {
        if (func_02064158(p, b, c) == 0) return 0;
    } else if (sel == 1) {
        if (func_020640c0(p, b, c) == 0) return 0;
    } else if (sel == 2) {
        if (func_02063fe4(p, b, c) == 0) return 0;
    } else if (sel == 3) {
        if (func_02063ed0(p, b, c) == 0) return 0;
    } else if (sel == 4) {
        if (func_02063e78(p) == 0) return 0;
    } else if (sel == 5) {
        if (func_02063e0c(p, b, c) == 0) return 0;
    } else if (sel == 6) {
        if (func_02063dc8(p) == 0) return 0;
    }
    return 1;
}
