/* CAMPAIGN-PREP candidate for func_021c9c94 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD-chain early-return-0; nested first guard; tail bool ==0
 *   risk:       reg-alloc-walled per file header (no prior C match); literal-pool order and movne/moveq tail selection may flip
 *   confidence: low
 */
/* func_ov002_021c9c94: guard chain. First guard inverted (021bb068 set AND
 * 021c9e14 clear => return 0). Then a run of 021b4098/021b3fd8/021b3ecc
 * predicates that each return 0 on success; final 021bae7c clear => return 1.
 * player reused across calls (callee-saved r4). */
extern int func_ov002_021b3ecc(int player, int kind, int code);
extern int func_ov002_021b3fd8(int player, int kind, int code, int d);
extern int func_ov002_021b4098(int player, int kind, int code);
extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_021bb068(int code);
extern int func_ov002_021c9e14(int player);

int func_ov002_021c9c94(int player) {
    if (func_ov002_021bb068(0x135d) != 0) {
        if (func_ov002_021c9e14(player) == 0) return 0;
    }
    if (func_ov002_021b4098(player, 0xb, 0x15ad) != 0) return 0;
    if (func_ov002_021b3fd8(player, 0xb, 0x1679, 1) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x1578) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x1a92) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x1a1b) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x1436) != 0) return 0;
    return func_ov002_021bae7c(player, 0x1972, -1) == 0;
}
