/* CAMPAIGN-PREP candidate for func_0224d374 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield; two count relocs (cf180 guard / +0x14 loopback); id bound across 2 calls; ternary 2:1
 *   risk:       entry guard reads count via cf180 symbol but loop reloads block+0x14; if mwcc CSEs to one ldr the guard reloc + a ldr diverge (reshape-able: keep cf180 vs cf16c+0x14 as two views). list offset 0x418 struct-guessed.
 *   confidence: med
 */
/* func_ov002_0224d374 (ov002, cls D): scan player block's 0x418 list; for each
 * entry whose :13 id passes func_0202e234, if func_ov002_021b9128(id, arg2?2:1)
 * is nonzero, post event 0xe at slot i. Entry guard reads count via cf180
 * symbol; loop bound reloads via the cf16c-relative +0x14 field. */
typedef unsigned int u32;

struct Rec { u32 key : 13; };   /* [r7]: lsl#0x13; lsr#0x13 */

extern char data_ov002_022cf16c[];   /* per-player block, 0x868 stride */
extern char data_ov002_022cf180[];   /* = cf16c+0x14, count field view */
extern int  func_0202e234(u32 id);
extern int  func_ov002_021b9128(u32 id, int arg);
extern void func_ov002_02253458(int player, int event, unsigned int slot);

void func_ov002_0224d374(int player, int arg1, int arg2) {
    int idx = (player & 1) * 0x868;
    char *base = data_ov002_022cf16c + idx;
    struct Rec *list = (struct Rec *)(base + 0x418);
    unsigned int i;
    if (*(int *)(data_ov002_022cf180 + idx) == 0)
        return;
    for (i = 0; i < *(unsigned int *)(base + 0x14); i++) {
        u32 id = list[i].key;
        if (func_0202e234(id)) {
            int arg = arg2 ? 2 : 1;
            if (func_ov002_021b9128(id, arg))
                func_ov002_02253458(player, 0xe, i);
        }
    }
}
