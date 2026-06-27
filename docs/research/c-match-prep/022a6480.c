/* CAMPAIGN-PREP candidate for func_022a6480 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :N extracts, store-order +0xa then +0x4, header reloaded
 *   risk:       reshape-able(store-order): the two slot strh must stay +0xa-before-+0x4; the func_02037208 arg pack (mov 0x35/sub -> r1=-1, r3=1) is inferred — confirm signature.
 *   confidence: med
 */
/* func_ov002_022a6480 (ov002, D) — accessor: unpack [r1+0] header (a:1,b:5,c:8),
 * call 022a6324; if it returns a slot, init the slot ([+0xa]=hdr, [+0x4]=8) and
 * spawn via func_02037208(-1,8,1) (note mov r0,#0x35; sub r1,r0,#0x36 => r0=0x35,
 * r1=-1). Then unconditionally call 022a60f4(base,a,b,c). r0=base(r5), r1=rec(r4).
 * stores into the returned slot kept in asm order: strh hdr@+0xa then 8@+0x4. */
typedef unsigned short u16;
struct Hdr { u16 k0; u16 a : 1, b : 5, c : 8, : 2; };
struct Slot { char _p[4]; u16 f4; char _q[4]; u16 fa; };
extern void func_02037208(int a, int b, int c, int d);
extern struct Slot *func_ov002_022a6324(void *base, int i, int sel, int sub);
extern void func_ov002_022a60f4(void *base, int a, int b, int c);

void func_ov002_022a6480(char *base, struct Hdr *rec) {
    struct Slot *s = func_ov002_022a6324(base, rec->k0 & 1, (rec->k0 >> 1) & 0x1f,
                                         (rec->k0 >> 6) & 0xff);
    if (s != 0) {
        s->fa = rec->k0;     /* strh [r0,#0xa] */
        s->f4 = 8;           /* strh [r0,#0x4] */
        func_02037208(0x35, -1, 1, 1);
    }
    func_ov002_022a60f4(base, rec->k0 & 1, (rec->k0 >> 1) & 0x1f, (rec->k0 >> 6) & 0xff);
}
