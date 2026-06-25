/* CAMPAIGN-PREP candidate for func_021bd45c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     13-bit :bitfield slot; bind base, reload count via base+0x14 each iter; &&-chain
 *   risk:       orig reloads loop-bound: entry test reads cf180 alias, loop-back reads [base+0x14] (same lvalue). If mwcc hoists count, the per-iter ldr diverges. reshape-able (read *(base+0x14) in the loop condition, not a hoisted local).
 *   confidence: med
 */
/* func_ov002_021bd45c: walk player[arg0&1]'s id-array at +0x418 (stride 4,
 * count at +0x14); count entries whose card-type (func_0202b878 of the low
 * 13-bit id) is 22 AND whose func_0202b8c0 value equals arg1. */

struct slot { unsigned int id : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf180[];
extern int  func_0202b878(int id);
extern int  func_0202b8c0(int id);

int func_ov002_021bd45c(int arg0, int arg1) {
    int idx = (arg0 & 1) * 0x868;
    int count = 0;
    int i = 0;
    if (*(int *)((char *)data_ov002_022cf180 + idx) != 0) {
        char *base = data_ov002_022cf16c + idx;
        struct slot *p = (struct slot *)(base + 0x18 + 0x400);
        do {
            int id = p->id;
            if (func_0202b878(id) == 22 && func_0202b8c0(id) == arg1)
                count++;
            i++;
            p++;
        } while (i < *(int *)(base + 0x14));
    }
    return count;
}
