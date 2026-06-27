/* CAMPAIGN-PREP candidate for func_0201bc3c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind sys r4; tst-bit if/else-if chain; sub?A:B sinit arg; store +0x810 then +0x918 in order
 *   risk:       reshape-able: clean tree, low divergence. The only watch is the last branch (0x20000) using an explicit if/else (not ?:) since its two arms set different f918 constants; keep that arm split to match the branch polarity.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0201bc3c (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. tst-bit if/else-if dispatch on flags; each branch runs a
 * static-init guard, stores the returned object at sys+0x810, and sets sys+0x918 to a constant.
 * Store-order is sys+0x810 then sys+0x918. Always returns 1.
 */
extern char *GetSystemWork(void);
extern void *__sinit_ov007_021b2f64(void *);
extern char data_020c5cf4[], data_020c5d08[], data_020c5d20[];
extern char data_020c5d38[], data_020c5d4c[], data_020c5d60[], data_020c5d78[];

int func_0201bc3c(int flags, int sub) {
    char *sys = GetSystemWork();
    if (flags & 0x4000) {
        *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(data_020c5cf4);
    } else if (flags & 0x8000) {
        *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(sub ? data_020c5d08 : data_020c5d20);
        *(int *)(sys + 0x918) = 4;
    } else if (flags & 0x10000) {
        *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(sub ? data_020c5d38 : data_020c5d4c);
        *(int *)(sys + 0x918) = 3;
    } else if (flags & 0x20000) {
        if (sub) {
            *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(data_020c5d60);
            *(int *)(sys + 0x918) = 3;
        } else {
            *(void **)(sys + 0x810) = __sinit_ov007_021b2f64(data_020c5d78);
            *(int *)(sys + 0x918) = 4;
        }
    }
    return 1;
}
