/* CAMPAIGN-PREP candidate for func_02063548 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sparse switch (cmp-chain) on opcode, per-case bool-return dispatch
 *   risk:       hoisted a=x+3/b=y-3 before switch; per-case `if(f)return 1;return 0` vs ternary; default=1 placement; sp3 frame
 *   confidence: low
 */
/* func_02063548: switch on opcode r1 in [0x64..0x68]. Two derived
 * args a=arg2+3, b=arg3-3 are computed up front (used by 0x64/65/67;
 * 0x66 uses the raw arg2/arg3). Each matched case returns 1 if its
 * helper returned non-zero else 0; any unmatched opcode returns 1. */

extern int func_02063808(void *p, int a, int b);
extern int func_0206371c(void *p, int a, int b);
extern int func_02063710(void *p, int x, int y);
extern int func_02063664(void *p, int a, int b);
extern int func_02063620(void *p);

int func_02063548(void *p, int op, int x, int y) {
    int a = x + 3;
    int b = y - 3;
    switch (op) {
    case 0x64:
        if (func_02063808(p, a, b)) return 1;
        return 0;
    case 0x65:
        if (func_0206371c(p, a, b)) return 1;
        return 0;
    case 0x66:
        if (func_02063710(p, x, y)) return 1;
        return 0;
    case 0x67:
        if (func_02063664(p, a, b)) return 1;
        return 0;
    case 0x68:
        if (func_02063620(p)) return 1;
        return 0;
    default:
        return 1;
    }
}
