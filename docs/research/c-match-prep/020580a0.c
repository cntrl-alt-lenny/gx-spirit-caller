/* CAMPAIGN-PREP candidate for func_020580a0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order data/cap/len->r4/r5/r6; min via if-assign; store len,cap,data order; cap-len commute
 *   risk:       trailing str[#8]=len(reload),str[#4]=cap,str[#0]=data; if mwcc reorders/reloads len the 3 str diverge. reshape-able.
 *   confidence: med
 */
/* func_020580a0 (D): realloc-grow byte buffer then append n bytes. */
extern int  func_020453cc(unsigned char *p, int sz);
extern void func_0205ffc0(int ctx, void *lit);
extern void func_020a6d54(unsigned char *m, unsigned char *f, int z, int line);
extern void func_020a7368(unsigned char *dst, unsigned char *src, int n);
extern unsigned char data_021000b8[], data_021000d0[], data_02100154[], data_02100240[], data_02100250[];
typedef struct Vec { unsigned char *data; int cap; int len; } Vec;
int func_020580a0(int ctx, Vec *v, unsigned char *src, int n) {
    unsigned char *data;
    int cap, len, grow;
    if (src == 0)
        func_020a6d54(data_02100240, data_021000d0, 0, 0x51);
    if (n < 0)
        func_020a6d54(data_02100250, data_021000d0, 0, 0x52);
    if (v == 0)
        func_020a6d54(data_021000b8, data_021000d0, 0, 0x53);
    if (n == 0) return 0;
    len = v->len;
    cap = v->cap;
    data = v->data;
    if (cap - len < n) {
        grow = n;
        if (n < 0x800) grow = 0x800;
        cap += grow;
        data = (unsigned char *)func_020453cc(data, cap + 1);
        if (data == 0) {
            func_0205ffc0(ctx, data_02100154);
            return 1;
        }
    }
    func_020a7368(data + len, src, n);
    data[len + n] = 0;
    v->len += n;
    v->cap = cap;
    v->data = data;
    return 0;
}
