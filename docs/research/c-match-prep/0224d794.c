/* CAMPAIGN-PREP candidate for func_0224d794 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield; single eq predicate (cmp #0xa;bne); id read inline once; two count relocs (cf17c / +0x10)
 *   risk:       id fed straight to the call (lsl;lsr then bl, not bound) — if mwcc keeps id in a callee-saved reg the decode/use stream shifts a reg. Low surface (reshape-able). list 0x260 struct-guessed.
 *   confidence: med
 */
/* func_ov002_0224d794 (ov002, cls D): scan player block's 0x260 list; for each
 * entry whose :13 id has func_0202b878(id)==0xa, post event 0xd at slot i.
 * Single predicate. Count via cf17c / block+0x10. */
typedef unsigned int u32;

struct Rec { u32 key : 13; };   /* [r5]: lsl#0x13; lsr#0x13 */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];   /* = cf16c+0x10, count field view */
extern int  func_0202b878(u32 id);
extern void func_ov002_02253458(int player, int event, unsigned int slot);

void func_ov002_0224d794(int player) {
    int idx = (player & 1) * 0x868;
    char *base = data_ov002_022cf16c + idx;
    struct Rec *list = (struct Rec *)(base + 0x260);
    unsigned int i;
    if (*(int *)(data_ov002_022cf17c + idx) == 0)
        return;
    for (i = 0; i < *(unsigned int *)(base + 0x10); i++) {
        if (func_0202b878(list[i].key) == 0xa)
            func_ov002_02253458(player, 0xd, i);
    }
}
