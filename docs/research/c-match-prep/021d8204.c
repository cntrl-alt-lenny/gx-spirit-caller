/* CAMPAIGN-PREP candidate for func_021d8204 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: ldrh h via data_022d0250+arg1*4; kind 0xc/0xd if-assign; asym packs (arg1<<22)>>16 & (kind<<27)>>26
 *   risk:       reshape-able: kind map must be if-assign; struct-guessed: h is read as a u16 (ldrh) then id masked >>19 — modeled as Ov002Key.id; confirm data_022d0250 element width (u16 vs u32) and the 0x1e literal/base order.
 *   confidence: med
 */
/* func_ov002_021d8204 (ov002, cls D): guard 021b9a30(arg0,arg1)>=0, then arg-pack
 * into 021d479c. h = *(u16*)(data_022d0250 + arg1*4); kind = 0202e2c8(h.id)?0xc:0xd.
 * p1 = (arg0&1)|0x1e|((arg1&0x3ff)<<6); p2 = (arg0&1)|(kind<<1); p0=0x3f; p3=0. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Key { u32 id : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

extern char data_ov002_022d0250[];
extern int  func_ov002_021b9a30(int player, int key);
extern int  func_0202e2c8(int id);
extern int  func_ov002_021d479c(int p0, int p1, int p2, int p3);

int func_ov002_021d8204(int arg0, int arg1) {
    struct Ov002Key *h;
    int kind;
    if (func_ov002_021b9a30(arg0, arg1) < 0)
        return 0;
    h = (struct Ov002Key *)(data_ov002_022d0250 + arg1 * 4);
    kind = func_0202e2c8(h->id) ? 0xc : 0xd;
    func_ov002_021d479c(0x3f,
        (u16)((arg0 & 1) | 0x1e | ((unsigned)(arg1 << 22) >> 16)),
        (u16)((arg0 & 1) | ((unsigned)(kind << 27) >> 26)),
        0);
    return 1;
}
