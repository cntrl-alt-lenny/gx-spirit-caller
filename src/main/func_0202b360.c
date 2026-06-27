/* CAMPAIGN-PREP candidate for func_0202b360 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind out(r5) + off(r4) early; store [1] then [0] (asm order str#4 then str#0)
 *   risk:       reshape-able (store-order/decl-order): asm holds r0<<3 in r4 BEFORE the two str, and writes [r5,#4] then [r5,#0]. If mwcc reorders the two zeroing stores or recomputes <<3 late, emit order diverges -- swap statement order / hoist off.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0202b360 (main, class C) -- batch p_0011.
 * UNVERIFIED build-free draft. Stream init/register: zero two header words in *out,
 * then init->open(data)->write->copy(out,8)->close->clean-DC(out,8).
 * r4 = func_0202b0b4()<<3 held across the write; r5 = out (arg1) held across stores+copy+clean.
 */
extern char data_020c6a60[];
extern int  func_0202b0b4(void);
extern void func_02038ad4(void *strm, void *buf, int len);
extern void func_020928e8(void *addr, int len);
extern int  func_02097ea4(void *strm, int off, int sel);
extern void func_02097ff0(void *strm);
extern void func_02098038(void *strm, void *data);
extern void func_02098388(void *strm);

void func_0202b360(int unused, int *out) {
    unsigned char strm[0x48];
    int off;
    off = func_0202b0b4() << 3;
    out[1] = 0;
    out[0] = 0;
    func_02098388(strm);
    func_02098038(strm, data_020c6a60);
    func_02097ea4(strm, off, 0);
    func_02038ad4(strm, out, 8);
    func_02097ff0(strm);
    func_020928e8(out, 8);
}
