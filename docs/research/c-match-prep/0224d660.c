/* CAMPAIGN-PREP candidate for func_0224d660 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield; 3-predicate && with signed `<= 0x5dc`; const 0x5dc = stride-0x28c reuse; two count relocs (cf180 / +0x14)
 *   risk:       0x5dc is built as `sub r4,r1(0x868),#0x28c` reusing the loaded stride; if mwcc materializes 0x5dc with its own mov/ldr the constant-setup diverges (reshape-able only via stride reuse, otherwise permuter-class). list 0x418 struct-guessed.
 *   confidence: med
 */
/* func_ov002_0224d660 (ov002, cls D): scan player block's 0x418 list; for each
 * entry whose :13 id passes func_0202e234, has func_0202b950(id) <= 0x5dc, AND
 * func_ov002_021b9128(id, 3) nonzero, post event 0xe at slot i. The bound
 * 0x5dc is materialized as 0x868-0x28c (reuses the stride literal). */
typedef unsigned int u32;

struct Rec { u32 key : 13; };   /* [r8]: lsl#0x13; lsr#0x13 */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];   /* = cf16c+0x14, count field view */
extern int  func_0202e234(u32 id);
extern int  func_0202b950(u32 id);
extern int  func_ov002_021b9128(u32 id, int arg);
extern void func_ov002_02253458(int player, int event, unsigned int slot);

void func_ov002_0224d660(int player) {
    int idx = (player & 1) * 0x868;
    char *base = data_ov002_022cf16c + idx;
    struct Rec *list = (struct Rec *)(base + 0x418);
    unsigned int i;
    if (*(int *)(data_ov002_022cf180 + idx) == 0)
        return;
    for (i = 0; i < *(unsigned int *)(base + 0x14); i++) {
        u32 id = list[i].key;
        if (func_0202e234(id) && func_0202b950(id) <= 0x5dc &&
            func_ov002_021b9128(id, 3))
            func_ov002_02253458(player, 0xe, i);
    }
}
