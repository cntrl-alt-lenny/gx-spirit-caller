/* CAMPAIGN-PREP candidate for func_021d0bb0 (ov011, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Fill32 first; store ptrs in order; bit-test via (g<<23)>>31; early return
 *   risk:       orig binds the +0x19c word in r0 (one ldr) then reuses it for the test AND the |0x100 store; if mwcc reloads for the store, 1 extra ldr diverges. reshape-able (bind to local g, as written)
 *   confidence: med
 */
/* func_ov011_021d0bb0: zero-init 0x28 bytes via Fill32, plant two handler
 * func-ptrs, OR a flag, then a guarded tail-call. Early-return if a bit is
 * already set in a global.
 *  Fill32(0, p, 0x28); p[0x1c]=&021cc194; p[0x20]=&021cc27c;
 *  p[0x18] |= 0xe0;
 *  if ((data_021d4660[0x19c] >> 8) & 1) return;   (lsl0x17;lsr0x1f => bit8)
 *  data_021d4660[0x19c] |= 0x100; func_021d1434(p, 1); */
extern void Fill32(int v, void *dst, int size);
extern char data_ov011_021d4660[];
extern void func_ov011_021cc194(void);
extern void func_ov011_021cc27c(void);
extern void func_ov011_021d1434(void *p, int k);

void func_ov011_021d0bb0(void *p) {
    unsigned int g;

    Fill32(0, p, 0x28);
    *(void **)((char *)p + 0x1c) = (void *)func_ov011_021cc194;
    *(void **)((char *)p + 0x20) = (void *)func_ov011_021cc27c;
    *(unsigned int *)((char *)p + 0x18) |= 0xe0;

    g = *(unsigned int *)(data_ov011_021d4660 + 0x19c);
    if ((g << 0x17) >> 0x1f)
        return;
    *(unsigned int *)(data_ov011_021d4660 + 0x19c) = g | 0x100;
    func_ov011_021d1434(p, 1);
}
