/* CAMPAIGN-PREP candidate for func_021ca2d0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     repeated call-compare skip-guard blocks; tail bool ==0; bind 1-arg0
 *   risk:       each KEY literal must be reused for both 0202b890 and 021bb068 from one pool slot; reg-alloc-walled; tail arg order
 *   confidence: low
 */
/* func_ov002_021ca2d0: six `if (arg1 != func_0202b890(KEY)) <021bb068(KEY)>`
 * blocks (skip the 021bb068 guard when arg1 equals the looked-up value), then
 * tail 021bba5c(1-player, KEY, arg1) ==0 => return 1. arg0=player(r5),
 * arg1=val(r4). */
extern int func_0202b890(int id);
extern int func_ov002_021bb068(int code);
extern int func_ov002_021bba5c(int a, int code, int v);

int func_ov002_021ca2d0(int arg0, int arg1) {
    if (arg1 != (int)func_0202b890(0x1ae2)) {
        if (func_ov002_021bb068(0x1ae2) != 0) return 0;
    }
    if (arg1 != (int)func_0202b890(0x1ae3)) {
        if (func_ov002_021bb068(0x1ae3) != 0) return 0;
    }
    if (arg1 != (int)func_0202b890(0x1ae4)) {
        if (func_ov002_021bb068(0x1ae4) != 0) return 0;
    }
    if (arg1 != (int)func_0202b890(0x1ae5)) {
        if (func_ov002_021bb068(0x1ae5) != 0) return 0;
    }
    if (arg1 != (int)func_0202b890(0x1ae6)) {
        if (func_ov002_021bb068(0x1ae6) != 0) return 0;
    }
    if (arg1 != (int)func_0202b890(0x1ae7)) {
        if (func_ov002_021bb068(0x1ae7) != 0) return 0;
    }
    return func_ov002_021bba5c(1 - arg0, 0x197d, arg1) == 0;
}
