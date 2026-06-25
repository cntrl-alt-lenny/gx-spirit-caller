/* CAMPAIGN-PREP candidate for func_021c3cf0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     OR guard-chain as separate if-return-1; bind 1-arg0; field-eq branch
 *   risk:       reg-alloc of opp(r4) and literal-pool ordering of the 4 constants may differ; equality-branch placement
 *   confidence: med
 */
/* func_ov002_021c3cf0: OR-chain of guard predicates. Returns 1 if any guard
 * fires, else 0. Each guard is a separate `if (...) return 1;` (the asm uses
 * movne r0,#1; ldmneia at each site, not a chained ||).
 * opp = 1 - arg0 is computed once and reused across two 021bae7c calls
 * (held in a callee-saved reg, matching r4). */
extern char data_ov002_022d016c[];
extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_021bb068(int code);

int func_ov002_021c3cf0(int arg0) {
    int opp = 1 - arg0;
    if (func_ov002_021bae7c(opp, 0x137b, -1) != 0) return 1;
    if (func_ov002_021bb068(0x1340) != 0) return 1;
    if (func_ov002_021bae7c(opp, 0x17e7, -1) != 0) return 1;
    if (arg0 == *(int *)(data_ov002_022d016c + 0xcec)) {
        if (func_ov002_021bb068(0x135e) != 0) return 1;
    }
    return 0;
}
