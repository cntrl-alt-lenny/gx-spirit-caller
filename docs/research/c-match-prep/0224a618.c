/* CAMPAIGN-PREP candidate for func_0224a618 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     off-bind row; :13 id bitfield; direct ==key cmp; two reloaded-count loops
 *   risk:       Loop1 guard is bls-skip-then-fall (not early-return); first loop's i=0/base setup vs second's may color differently across the two loops. reshape-able (decl/loop-form).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224a618 (ov002, class C, MED tier) — p_0100.
 * UNVERIFIED + ITERATION-EXPECTED. Two back-to-back per-parity counted scans;
 * each tags slots whose 13-bit id EQUALS the incoming arg (direct cmp, no predicate).
 * loop1: guard cf178, kind 11, slot+0x120, count[row+0xc].
 * loop2: guard cf17c, kind 13, slot+0x260, count[row+0x10].
 */
typedef unsigned int u32;
struct Ov002Slot { u32 id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf17c[];
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_0224a618(int player, int unused, int key) {
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    int i;
    if (*(u32 *)((char *)data_ov002_022cf178 + (player & 1) * 0x868) != 0) {
        for (i = 0; (u32)i < *(u32 *)(row + 0xc); i++) {
            if ((u32)key == ((struct Ov002Slot *)(row + 0x120))[i].id)
                func_ov002_02253458(player, 11, i);
        }
    }
    if (*(u32 *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    for (i = 0; (u32)i < *(u32 *)(row + 0x10); i++) {
        if ((u32)key == ((struct Ov002Slot *)(row + 0x260))[i].id)
            func_ov002_02253458(player, 13, i);
    }
}
