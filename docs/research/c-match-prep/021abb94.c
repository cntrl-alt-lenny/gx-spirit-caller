/* CAMPAIGN-PREP candidate for func_021abb94 (ov020, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ldrsh struct-read + shift-pack builder + dispatch call
 *   risk:       Same ~59% wall; arg roles (a0/spr) and the +0x2c pointer arg guessed; scheduling of the two ldrsh/pack pairs may reorder.
 *   confidence: low
 */
/* func_ov020_021abb94 (ov020) - OBJ-dispatch builder, struct-read variant.
 * Reads two signed halfwords from data_ov020_021aea28 (+0x44,+0x46) and the
 * dispatcher ptr at +0x2c; pos = {(s44+0x77)<<12, (s46+0xae)<<12};
 * z0=0, z1=-1. The 2nd arg to the dispatcher is data+0x2c (a pointer load).
 * WARNING: ov020_core.h flags 021abb94 as the struct-read member of the
 * ~59% OBJ-dispatch permuter WALL. */
extern char data_ov020_021aea28[];
extern void func_ov020_021aa8f0(int a0, int *a1, int spr, int *pair, int z0, int z1);

void func_ov020_021abb94(int a0, int spr) {
    int pair[2];
    short s44 = *(short *)(data_ov020_021aea28 + 0x44);
    short s46 = *(short *)(data_ov020_021aea28 + 0x46);
    int *p2  = *(int **)(data_ov020_021aea28 + 0x2c);
    pair[0] = (s44 + 0x77) << 12;
    pair[1] = (s46 + 0xae) << 12;
    func_ov020_021aa8f0(a0, p2, spr, pair, 0, 0 - 1);
}
