/* CAMPAIGN-PREP candidate for func_021b2280 (ov023, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear init calls + :3 bitfield shift-extract + reload
 *   risk:       The :3 bitfield struct layout (pad0 then f4 at +0x4) is guessed; if mwcc binds data_02105989 instead of reloading, one ldr differs.
 *   confidence: med
 */
/* func_ov023_021b2280 (ov023) - linear init sequence. Returns 1.
 * A param at data_02104f4c+0x4 is read TWICE through a 3-bit field
 * (lsl#0x1d;lsr#0x1d) and fed to two inits. Then a 0x14-fill + an arm call
 * on data_02105989. The +0x4 word is RELOADED for each use (two separate
 * ldr), so reload it in C; the :3 bitfield must be a real bitfield to emit
 * the lsl;lsr pair (a plain & 7 folds to and #7, gotcha 25). */
extern char data_ov023_021b23a8[];
extern char data_02105989[];
extern void func_0202adf8(char *a0);
extern void func_0202ae1c(int v);
extern void func_0202c070(int v);
extern void func_020945f4(char *a0, int a1, int a2);
extern void func_ov005_021ad018(char *a0, int a1);

struct cfg_02104f4c { int pad0; unsigned f4 : 3; };
extern struct cfg_02104f4c data_02104f4c;

int func_ov023_021b2280(void) {
    func_0202adf8(data_ov023_021b23a8);
    func_0202ae1c(data_02104f4c.f4);
    func_0202c070(data_02104f4c.f4);
    func_020945f4(data_02105989, 0, 0x14);
    func_ov005_021ad018(data_02105989, 4);
    return 1;
}
