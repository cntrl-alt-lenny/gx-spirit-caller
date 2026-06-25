/* CAMPAIGN-PREP candidate for func_021c9fc4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BITFIELD shift-test early-out; guard-chain; tail 021b3fd8 ==0
 *   risk:       same no-reload-first-call reg-alloc wall as 021c9e14; sub r2,r1,#0x1400 came from literal 0x13ff not a constant-fold
 *   confidence: low
 */
/* func_ov002_021c9fc4: near-clone of 021c9e14, shorter chain. Same bit21
 * cf288 early-out; same no-reload first 021b3ecc crux; tail 021b3fd8 ==0
 * => return 1. */
extern char data_ov002_022cf288[];
extern int func_ov002_021b3ecc(int player, int kind, int code);
extern int func_ov002_021b3fd8(int player, int kind, int code, int d);
extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_021bb068(int code);

int func_ov002_021c9fc4(int player) {
    if ((*(unsigned int *)((char *)data_ov002_022cf288 + (player & 1) * 0x868) >> 21) & 1)
        return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x12d2) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x12de) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x1710) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x1973) != 0) return 0;
    if (func_ov002_021bae7c(player, 0x13ff - 0x1400, -1) != 0) return 0;
    if (func_ov002_021bb068(0x12b1) != 0) return 0;
    return func_ov002_021b3fd8(player, 0xb, 0x1679, 1) == 0;
}
