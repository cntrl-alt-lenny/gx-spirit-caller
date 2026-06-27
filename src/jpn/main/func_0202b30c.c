/* CAMPAIGN-PREP candidate for func_0202b30c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind out(r5) + off(r4) early; store [1] then [0] (asm order str#4 then str#0)
 *   risk:       reshape-able (store-order/decl-order): asm holds r0<<3 in r4 BEFORE the two str, and writes [r5,#4] then [r5,#0]. If mwcc reorders the two zeroing stores or recomputes <<3 late, emit order diverges -- swap statement order / hoist off.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0202b30c (main, class C) -- batch p_0011.
 * UNVERIFIED build-free draft. Stream init/register: zero two header words in *out,
 * then init->open(data)->write->copy(out,8)->close->clean-DC(out,8).
 * r4 = func_0202b060()<<3 held across the write; r5 = out (arg1) held across stores+copy+clean.
 */
extern char data_020c6980[];
extern int  func_0202b060(void);
extern void func_02038a84(void *strm, void *buf, int len);
extern void func_02092800(void *addr, int len);
extern int  func_02097db0(void *strm, int off, int sel);
extern void func_02097efc(void *strm);
extern void func_02097f44(void *strm, void *data);
extern void func_02098294(void *strm);

void func_0202b30c(int unused, int *out) {
    unsigned char strm[0x48];
    int off;
    off = func_0202b060() << 3;
    out[1] = 0;
    out[0] = 0;
    func_02098294(strm);
    func_02097f44(strm, data_020c6980);
    func_02097db0(strm, off, 0);
    func_02038a84(strm, out, 8);
    func_02097efc(strm);
    func_02092800(out, 8);
}
