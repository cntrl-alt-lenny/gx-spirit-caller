/* CAMPAIGN-PREP candidate for func_021aba54 (ov020, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     param-pack stack-arg builder + tail call; shift-pack
 *   risk:       Documented permuter wall ~59%: mwcc hoists data_ae060 load, the (idx*0x28+0x1e)<<12 temp lands in a different reg.
 *   confidence: low
 */
/* func_ov020_021aba54 (ov020) - OBJ-dispatch stack-arg builder, clone family.
 * idx -> spr = acquire(set, 8); pos = {0x24000, (idx*0x28+0x1e)<<12};
 * tail-call the 6-arg OBJ position dispatcher with z0=3, z1=-1.
 * WARNING: ov020_core.h documents this exact family as a permuter WALL
 * stuck at 59% (mwcc hoists the data_ae060 pool load, fragmenting the
 * (idx*0x28+K)<<12 temp). Best-effort shape; expect ~59% on first build. */
extern char data_ov020_021ae060[];
extern int  func_0207e638(int set, int kind);
extern void func_ov020_021aa8f0(int a0, int *a1, int spr, int *pair, int z0, int z1);

void func_ov020_021aba54(int idx, int a0, int *a1) {
    int pair[2];
    int spr;
    pair[0] = 0x24000;
    pair[1] = (idx * 0x28 + 0x1e) << 12;
    spr = func_0207e638(*(int *)(data_ov020_021ae060 + 0x96c), 8);
    func_ov020_021aa8f0(a0, a1, spr, pair, 3, 3 - 4);
}
