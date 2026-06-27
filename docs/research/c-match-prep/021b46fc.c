/* CAMPAIGN-PREP candidate for func_021b46fc (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch jump-table; halfword unpack v>>16 / v&0xffff; store-order kept
 *   risk:       reshape-able: orig table covers 0..6 with cmp #5 (case6 unreachable) and bundles 0-3 with default — if mwcc emits a denser table or peels case6, reorder cases or drop case6. v loaded before calls; if mwcc reloads after, ldr count diverges.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b46fc (ov006, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: switch(sel) jump-table on [src+0x50];
 * cases 0-3 -> store 1; case4 -> unpack halfwords of v into [+0x14]/[+0x18],
 * store 5; case5 -> same unpack, store 1; case6 -> -1,-1, store 1.
 * Store order [+0x14] then [+0x18] then [base] kept exactly.
 */
extern int  data_ov006_0225cbb8[];   /* src: [+0x50]=sel, [+0x54]=v          */
extern int  data_ov006_0225e068[];   /* arg to func_ov006_021c9ef4           */
extern int  data_ov006_0224f290[];   /* out: [0]=mode,[+0x14],[+0x18]        */
extern void func_ov006_021c9ef4(void *a, void *b);
extern void func_ov006_021c19e4(void *a);
extern void func_ov006_021b45f8(void);

int func_ov006_021b46fc(void) {
    int *src = data_ov006_0225cbb8;
    int sel  = *(int *)((char *)src + 0x50);
    unsigned int v = (unsigned int)*(int *)((char *)src + 0x54);
    int *out;

    func_ov006_021c9ef4(data_ov006_0225cbb8, data_ov006_0225e068);
    func_ov006_021c19e4(data_ov006_0225cbb8);
    func_ov006_021b45f8();

    out = data_ov006_0224f290;
    switch (sel) {
    case 4:
        *(int *)((char *)out + 0x14) = v >> 16;
        *(int *)((char *)out + 0x18) = v & 0xffff;
        out[0] = 5;
        break;
    case 5:
        *(int *)((char *)out + 0x14) = v >> 16;
        *(int *)((char *)out + 0x18) = v & 0xffff;
        out[0] = 1;
        break;
    case 6:
        *(int *)((char *)out + 0x14) = -1;
        *(int *)((char *)out + 0x18) = -1;
        out[0] = 1;
        break;
    default:
        out[0] = 1;
        break;
    }
    return 1;
}
