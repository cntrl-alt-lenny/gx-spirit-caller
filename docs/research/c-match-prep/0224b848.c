/* CAMPAIGN-PREP candidate for func_0224b848 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     off-bind row; :13 id; 4-guard && chain; reloaded raw word; lsl/lsr packed arg
 *   risk:       packed = `mov lsl#2;lsr#0x18;...;add r3,r3,r4,lsr#0x1f` — mwcc may not fuse the final shifted-add or may CSE id-extract with raw reload; b878(arg1) lands in r4 vs b878(id). permuter-class (shifted-add fusion + reload scheduling).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224b848 (ov002, class C, MED tier) — p_0100.
 * UNVERIFIED + ITERATION-EXPECTED. Longest in batch: 5-guard chain + packed-arg call,
 * kind 13. guard cf17c, slot+0x260, count[row+0x10]. id held in r6 across calls.
 * Gate: e234(id) && b980(id)<=0x7d0 && b878(id)==b878(arg1) && 021ca440(player,id) &&
 *       021b3fd8(player, 11, 0x12a1, packed) == 0.
 * packed = ((raw>>22 & 0xff) << 1) + (raw>>13 & 1), built from a RELOADED slot word
 * (orig re-ldr [r7] after 021ca440). raw shifts asymmetric -> safe lsl;lsr (no fold).
 */
typedef unsigned int u32;
struct Ov002Slot { u32 id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int func_0202b878(int id);
extern int func_0202b980(int id);
extern int func_0202e234(int id);
extern int func_ov002_021b3fd8(int a, int b, int c, int d);
extern int func_ov002_021ca440(int a, int b);
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_0224b848(int player, int arg1) {
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    int i;
    int id;
    u32 raw;
    int packed;
    if (*(u32 *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    for (i = 0; (u32)i < *(u32 *)(row + 0x10); i++) {
        id = ((struct Ov002Slot *)(row + 0x260))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202b980(id) <= 0x7d0 &&
            func_0202b878(id) == func_0202b878(arg1) &&
            func_ov002_021ca440(player, id) != 0) {
            raw = ((u32 *)(row + 0x260))[i];
            packed = (((raw << 2) >> 0x18) << 1) + ((raw << 0x12) >> 0x1f);
            if (func_ov002_021b3fd8(player, 11, 0x12a1, packed) == 0)
                func_ov002_02253458(player, 13, i);
        }
    }
}
