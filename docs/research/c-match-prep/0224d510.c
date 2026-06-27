/* CAMPAIGN-PREP candidate for func_0224d510 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield; three-predicate && chain; two count relocs (cf188 / +0x1c); 0xf reused for marker and event
 *   risk:       0xf is loaded once (r8) then mirrored to r9 (mov r9,r8) for the two uses (021c988c marker + 02253458 event); if mwcc materializes 0xf twice instead of mirroring, one mov diverges (permuter-class). list 0x5d0 struct-guessed.
 *   confidence: med
 */
/* func_ov002_0224d510 (ov002, cls D): scan player block's 0x5d0 list; for each
 * entry whose :13 id passes func_0202e234 AND func_ov002_021c3608(p,p,i) AND
 * func_ov002_021c988c(p, 0xf, i), post event 0xf at slot i. The 0xf marker is
 * mirrored into a second reg (r9=r8) by mwcc. Count via cf188 / block+0x1c. */
typedef unsigned int u32;

struct Rec { u32 key : 13; };   /* [r5]: lsl#0x13; lsr#0x13 */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf188[];   /* = cf16c+0x1c, count field view */
extern int  func_0202e234(u32 id);
extern int  func_ov002_021c3608(int player, int player2, unsigned int slot);
extern int  func_ov002_021c988c(int player, int marker, unsigned int slot);
extern void func_ov002_02253458(int player, int event, unsigned int slot);

void func_ov002_0224d510(int player) {
    int idx = (player & 1) * 0x868;
    char *base = data_ov002_022cf16c + idx;
    struct Rec *list = (struct Rec *)(base + 0x5d0);
    unsigned int i;
    if (*(int *)(data_ov002_022cf188 + idx) == 0)
        return;
    for (i = 0; i < *(unsigned int *)(base + 0x1c); i++) {
        if (func_0202e234(list[i].key) &&
            func_ov002_021c3608(player, player, i) &&
            func_ov002_021c988c(player, 0xf, i))
            func_ov002_02253458(player, 0xf, i);
    }
}
