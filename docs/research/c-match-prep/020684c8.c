/* CAMPAIGN-PREP candidate for func_020684c8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     alloc-guard via movs; re-read [p+0x18] for null test (orig reloads); init stores in exact asm order; r3=func_02068594 then 2 stacked
 *   risk:       orig RELOADS [p+0x18] for the cmp instead of reusing h; if mwcc keeps h in a reg the second ldr is dropped. reshape-able (force reload by re-reading the field, as written).
 *   confidence: med
 */
/* func_020684c8 (main, class C) — alloc + many init stores, decl-order */
extern void *func_020453e8(int size);
extern void  func_020453b4(void *p);
extern void *func_02054700(int a, int b, int c, void *cb0,
                           void *cb1, void *cb2);
extern void  func_02068580(void);
extern void  func_02068594(void);
extern void  func_020685a4(void);

void *func_020684c8(int unused, int a, short b) {
    unsigned char *p;
    void *h;

    p = func_020453e8(0x24);
    if (p == 0) return 0;

    h = func_02054700(8, 8, 4, func_02068594, func_02068580, func_020685a4);
    *(void **)(p + 0x18) = h;
    if (*(void **)(p + 0x18) == 0) {
        func_020453b4(p);
        return 0;
    }

    p[0x14] = 0;
    p[0x15] = 0;
    *(int *)(p + 0x20) = 0;
    *(int *)(p + 0x1c) = 0;
    *(int *)(p + 0x10) = 0;
    *(int *)(p + 0x0)  = a;
    *(short *)(p + 0x4) = (short)b;
    *(int *)(p + 0x8)  = 0;
    *(short *)(p + 0xc) = 0;
    return p;
}
