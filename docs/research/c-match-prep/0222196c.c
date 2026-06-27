/* CAMPAIGN-PREP candidate for func_0222196c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f4|=4 strh-first; :1/:5 fields; range guard; deck-table no-bind; stack-arg call
 *   risk:       struct-guessed: d59cc arg count/order (3 regs + r2=0x17c2 const + stack 0) is partly inferred from the .s tail; confirm its signature and the 0x17c2 literal role.
 *   confidence: low
 */
/* func_ov002_0222196c (ov002, D) — set f4 bit2, deck-table validate, conditional
 * call with a stack arg. r4=arg1(card). f4(@+4) |= 4 (strh first!). Then pass
 * f4's :9 at bit6 of the NEW value ((f4|4)<<0x11>>0x17) + f2:1 bit0 + f2:5 bits1-5
 * to d8904. Reload f2; b=:5; guard 5<=b<=0xa. deck-table: cf16c+(f2&1)*0x868+0x30
 * +b*0x14 -> w; packed = ((w>>22)&0xff)<<1 + ((w>>13)&1); compare to f4 :9 at bit6;
 * if equal call d59cc with a 0 on the stack (sub sp,#4). returns 0. */
typedef unsigned short u16;
struct Card { u16 f0; u16 f2; u16 f4; };
extern char data_ov002_022cf16c[];
extern void func_ov002_021d59cc(int a, int b, int c, int d, int stk);
extern void func_ov002_021d8904(int a, int b, int c);

int func_ov002_0222196c(int unused_r0, struct Card *c) {
    int a, b, w, packed;
    u16 nf4 = c->f4 | 0x4;
    c->f4 = nf4;
    func_ov002_021d8904(c->f2 & 1,
                        (c->f2 << 0x1a) >> 0x1b,
                        (nf4 << 0x11) >> 0x17);
    b = (c->f2 << 0x1a) >> 0x1b;
    if (b < 5 || b > 0xa)
        return 0;
    a = c->f2 & 1;
    w = *(int *)(data_ov002_022cf16c + a * 0x868 + 0x30 + b * 0x14);
    packed = (((w >> 22) & 0xff) << 1) + ((w >> 13) & 1);
    if (packed == ((c->f4 << 0x11) >> 0x17))
        func_ov002_021d59cc(0, 0, 3, /*?*/0, 0);
    return 0;
}
