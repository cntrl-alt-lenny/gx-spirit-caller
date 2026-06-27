/* CAMPAIGN-PREP candidate for func_020581a8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order data/cap/len->r0/r5/r6; strb ch, strb 0, store len,cap,data; return0 via reused r2
 *   risk:       asm holds len in r6, cap r5, data r0 (reloaded base); decl-order/bind is the coin-flip; return uses zeroed r2. reshape-able.
 *   confidence: med
 */
/* func_020581a8 (D): append one byte to a grow buffer, NUL-terminate. */
extern int  func_020453cc(unsigned char *p, int sz);
extern void func_0205ffc0(int ctx, void *lit);
extern void func_020a6d54(unsigned char *m, unsigned char *f, int z, int line);
extern unsigned char data_021000b8[], data_021000d0[], data_02100154[];
typedef struct Vec { unsigned char *data; int cap; int len; } Vec;
int func_020581a8(int ctx, Vec *v, int ch) {
    unsigned char *data;
    int cap, len;
    if (v == 0)
        func_020a6d54(data_021000b8, data_021000d0, 0, 0x25);
    len = v->len;
    cap = v->cap;
    data = v->data;
    if (cap == len) {
        cap += 0x800;
        if (func_020453cc(data, cap + 1) == 0) {
            func_0205ffc0(ctx, data_02100154);
            return 1;
        }
    }
    data[len] = (unsigned char)ch;
    data[len + 1] = 0;
    v->len += 1;
    v->cap = cap;
    v->data = data;
    return 0;
}
