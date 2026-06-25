/* CAMPAIGN-PREP candidate for func_02021c30 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: hoist count; bind b6=base+0x1048; b7=b6+i*0x68; store a0 via [b6,off] but +4 via b7
 *   risk:       orig stores a0 via indexed [r6,r5] yet stores +4 via precomputed r7=r6+off; if mwcc folds both onto one base (or recomputes), the str pair diverges. reshape-able (split the two base exprs as written) else permuter-class
 *   confidence: med
 */
/* func_02021c30: scan up to data_02198434->fb0 entries (stride 0x68) for
 * a free f48, Fill32 it, store a0 at +0 and 0 at +4, return the slot. */

extern void Fill32(int value, void *dest, int size);
extern char data_02197434[];
extern char data_02198434[];

void *func_02021c30(int a0) {
    int count = *(int *)(data_02198434 + 0xb0);
    char *base = data_02197434;
    int i = 0;
    if (count > 0) {
        char *cur = base;
        do {
            if (*(int *)(cur + 0x1000 + 0x48) == 0) break;
            cur += 0x68;
        } while (++i < count);
    }
    if (i >= count) return 0;
    {
        char *b6 = base + 0x48 + 0x1000;
        char *b7 = b6 + i * 0x68;
        Fill32(0, b7, 0x68);
        *(int *)(b6 + i * 0x68) = a0;
        *(int *)(b7 + 0x4) = 0;
        return b7;
    }
}
