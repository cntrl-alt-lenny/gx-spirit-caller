/* CAMPAIGN-PREP candidate for func_0200edb8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: exact field store-order; two counted clear loops; bic+orr RMW on f60
 *   risk:       loop-1 increments i before the -1 store and post-bumps p (matches add r1,#1 / str / add r2,#0x24 order); if mwcc emits store-then-inc the loop body diverges. reshape-able via stmt order
 *   confidence: med
 */
/* func_0200edb8 (main, class C/D) — init: copy 2 globals into struct, optional early Fill32,
 * set flags/fields, two clear loops (stride 0x24 then 0x10), tail flag set.
 * data_02186ae8: +0x8 and +0x10 copied to obj +0x26c/+0x270.
 * STORE-ORDER matters in the .L_4c block. */

extern void Fill32(int val, void *dst, int n);
extern int  func_0201083c(void);
extern void func_0200da18(void);
extern void func_0200ade8(void);
extern char data_02186ae8;

void *func_0200edb8(char *obj)
{
    char *g = &data_02186ae8;
    *(int *)(obj + 0x26c) = *(int *)(g + 0x8);
    *(int *)(obj + 0x270) = *(int *)(g + 0x10);

    if (*(int *)(obj + 0x18) != 0) {
        if (func_0201083c() != 0) {
            Fill32(0, obj, 0x284);
            return 0;
        }
    }

    *(unsigned int *)(obj + 0x60) = (*(unsigned int *)(obj + 0x60) & ~1u) | 5u;
    *(int *)(obj + 0x48) = 0x1000;
    *(int *)(obj + 0x4c) = 0x1000;
    *(int *)(obj + 0x50) = 0x1000;
    *(void **)(obj + 0x54) = (void *)func_0200da18;
    *(void **)(obj + 0x58) = (void *)func_0200ade8;
    *(void **)(obj + 0x5c) = obj;

    {
        char *p = obj;
        int i = 0;
        do {
            i++;
            *(int *)(p + 0xdc) = -1;
            p += 0x24;
        } while (i < 8);
    }
    {
        int i = 0;
        do {
            *(int *)(obj + (i << 4) + 0x1e8) = -1;
            i++;
        } while (i < 8);
    }

    *(int *)(obj + 0x6c) = -1;
    *(int *)(obj + 0x70) = -1;
    *(int *)(obj + 0x74) = -1;
    *(int *)(obj + 0x78) = 0;
    *(unsigned int *)(obj + 0x7c) |= 0x20000000;
    return obj;
}
