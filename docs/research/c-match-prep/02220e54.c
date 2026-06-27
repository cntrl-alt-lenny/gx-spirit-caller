/* CAMPAIGN-PREP candidate for func_02220e54 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order n,raw,tag,r5; signed :8 via (short)>>8; hi-byte dec store-back single strh
 *   risk:       reshape-able: 021b947c is called with no args but its result feeds both d81d4(raw&0xff) and tag; if mwcc spills r5 across the call differently, fix by binding raw before tag and keeping r5 first.
 *   confidence: med
 */
/* func_ov002_02220e54 (ov002, D) — guard call, then per-slot loop + hi-byte dec.
 * f2(@+2):1 at bit0 -> helper(2 args, r1=1). f6(@+6): n = high byte
 * ((f6<<0x10)>>0x18 = (f6>>8)&0xff); if n==0 return. Resolve slot via def4(c,n-1),
 * keep result in r5; helper2() -> raw; tag = ((raw signed >>8)&0xff)... actually
 * (raw<<0x10>>0x10>>8)&0xff with asr = signed :8 mid byte; if tag==0xf fire d81d4.
 * Then field6 high byte -= 1 (the :8 at bit8 decrement). store-order: single strh. */
typedef unsigned short u16;
struct Card { u16 f0; u16 f2; u16 f4; u16 f6; };
extern int  func_ov002_021b947c(void);
extern int  func_ov002_021ca63c(int a, int b);
extern void func_ov002_021d81d4(int a, int b);
extern int  func_ov002_0223def4(struct Card *c, int slot);

int func_ov002_02220e54(struct Card *c) {
    int n, raw, tag, r5;
    if (!func_ov002_021ca63c(c->f2 & 1, 1))
        return 0;
    n = (c->f6 >> 8) & 0xff;
    if (n == 0)
        return 0;
    r5 = func_ov002_0223def4(c, n - 1);
    raw = func_ov002_021b947c();
    tag = (((int)(short)raw >> 8)) & 0xff;
    if (tag == 0xf)
        func_ov002_021d81d4(r5, raw & 0xff);
    c->f6 = (c->f6 & ~0xff00) | (((((c->f6 >> 8) & 0xff) - 1) & 0xff) << 8);
    return 0;
}
