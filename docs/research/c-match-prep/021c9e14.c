/* CAMPAIGN-PREP candidate for func_021c9e14 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BITFIELD shift-test early-out; long guard-chain; tail bool; bind player
 *   risk:       FIRST 021b3ecc must keep player in r0 w/o reload — likely reloads in C; 021bae7c -1 arg is mvn r2,#0 not sub
 *   confidence: low
 */
/* func_ov002_021c9e14: bitfield early-out then guard chain. First guard call
 * 021b3ecc reuses player still live in r0 (no reload) — the reg-alloc crux
 * that walled this. Bitfield test: bit21 of word at cf288+(player&1)*0x868. */
extern char data_ov002_022cf288[];
extern int func_ov002_021b3ecc(int player, int kind, int code);
extern int func_ov002_021b3fd8(int player, int kind, int code, int d);
extern int func_ov002_021b4098(int player, int kind, int code);
extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_021bb068(int code);

int func_ov002_021c9e14(int player) {
    if ((*(unsigned int *)((char *)data_ov002_022cf288 + (player & 1) * 0x868) >> 21) & 1)
        return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x12d2) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x12de) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x1710) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x1973) != 0) return 0;
    if (func_ov002_021bae7c(player, 0x13ff - 0x1400, -1) != 0) return 0;
    if (func_ov002_021bb068(0x12b1) != 0) return 0;
    if (func_ov002_021b4098(player, 0xb, 0x15ad) != 0) return 0;
    if (func_ov002_021b3fd8(player, 0xb, 0x1679, 1) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x1578) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x1a92) != 0) return 0;
    if (func_ov002_021b3ecc(player, 0xb, 0x1436) != 0) return 0;
    return func_ov002_021bae7c(player, 0x1972, -1) == 0;
}
