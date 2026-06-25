/* CAMPAIGN-PREP candidate for func_021abb2c (ov020, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     param-pack builder + tail call; mvn shared -1; shift-pack
 *   risk:       Documented permuter wall ~59%: mwcc hoists data_ae060 load; -1 may not CSE into one reg across both stores.
 *   confidence: low
 */
/* func_ov020_021abb2c (ov020) - OBJ-dispatch builder, clone family (mvn variant).
 * Differs from 021aba54: add-const = 0x1a (not 0x1e), pair[0] = 0x3000
 * (not 0x24000), acquire kind = 9, and z0 = z1 = -1 (mvn ip,#0 -> 0xffffffff
 * stored to BOTH [sp] and [sp,#4]).
 * WARNING: same permuter WALL family (ov020_core.h, ~59%). */
extern char data_ov020_021ae060[];
extern int  func_0207e638(int set, int kind);
extern void func_ov020_021aa8f0(int a0, int *a1, int spr, int *pair, int z0, int z1);

void func_ov020_021abb2c(int idx, int a0, int *a1) {
    int pair[2];
    int spr;
    pair[0] = 0x3000;
    pair[1] = (idx * 0x28 + 0x1a) << 12;
    spr = func_0207e638(*(int *)(data_ov020_021ae060 + 0x96c), 9);
    func_ov020_021aa8f0(a0, a1, spr, pair, -1, -1);
}
