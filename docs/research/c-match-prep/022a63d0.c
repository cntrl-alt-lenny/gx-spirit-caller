/* CAMPAIGN-PREP candidate for func_022a63d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :N extracts via shifts, header reloaded per call, store-order calls
 *   risk:       reshape-able(bitfield): extracts must be :N members (lsl;lsr) not masks (and); first inline r4 mla (sel=b) is guessed-structured — confirm 022a6324 inlines vs calls.
 *   confidence: low
 */
/* func_ov002_022a63d0 (ov002, D) — unpack [r2+0] header bitfields, run 3 dispatch
 * calls. r0=base(r7), r1=arg(r6), r2=rec(r5). Header u16 at rec+0: a:1,b:5,c:8.
 * First builds ptr via the 022a6324 inline mla (sel=b, idx=a) into r4; then
 * 022a6324(base, a-pack...) -> r8, 0229d184(r8,arg,rec) if nonzero, 0229ed30 if
 * r4!=0, finally 022a60f4(base, a, b, c). Header RELOADED before each call. */
typedef unsigned short u16;
struct Hdr { u16 k0; u16 a : 1, b : 5, c : 8, : 2; };
extern void *func_ov002_022a6324(void *base, int i, int sel, int sub);
extern void func_ov002_0229d184(void *p, int arg, struct Hdr *rec);
extern void func_ov002_0229ed30(void *p, void *q, int one);
extern void func_ov002_022a60f4(void *base, int a, int b, int c);

void func_ov002_022a63d0(char *base, int arg, struct Hdr *rec) {
    u16 h = rec->k0;        /* not used; placeholder to anchor first ldrh */
    char *r4;
    void *r8;
    int b = (rec->k0 >> 1) & 0x1f;
    int a = rec->k0 & 1;
    (void)h;
    if (b < 0xc) r4 = 0;
    else r4 = base + 0x280 + a * 0xb0 + (b - 0xc) * 0x2c;
    r8 = func_ov002_022a6324(base, a, (rec->k0 >> 6) & 0xff, 0);
    if (r8 != 0) func_ov002_0229d184(r8, arg, rec);
    if (r4 != 0) func_ov002_0229ed30(r4, r8, 1);
    func_ov002_022a60f4(base, rec->k0 & 1, (rec->k0 >> 1) & 0x1f, (rec->k0 >> 6) & 0xff);
}
