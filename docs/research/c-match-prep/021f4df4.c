/* CAMPAIGN-PREP candidate for func_021f4df4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two single-bit extracts eor'd (bitfields b0,b14); bind 021f3458 result in r7; mvnle -1
 *   risk:       the eor of two bit-extracts: orig does mov r1,r2,lsl#17;lsr#31 (bit14) and r2,lsl#31;lsr#31 (bit0) then eor - a :1 bitfield pair may compile but mwcc could fold via a different shift pair, and the inner-block decl of r may shift reg-alloc. reshape-able (try (((u16)x<<17)>>31)^(((u16)x<<31)>>31) raw if bitfield diverges); struct-guessed on the +2 bit layout
 *   confidence: low
 */
/* func_ov002_021f4df4: self=arg0 (r6), arg1 (r5). Reads u16 at self+2, builds
 * a bit0^bit4-ish parity from two single-bit extracts (b0 = bit0, b4 from
 * lsl#17;lsr#31 = bit14), eor'd into r4 (the 'player' selector). Calls
 * 021f3458(self) -> r7; compares cf16c[(r4&1)*0x868] (int at +0) to r7; if
 * <=, return -1. Else 021f4a84(self,arg1) -> r5; if r5==1, 021df780(r4,r7).
 * Returns r5. */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];
extern int  func_ov002_021f3458(void *self);
extern int  func_ov002_021f4a84(void *self, int arg1);
extern void func_ov002_021df780(int a, int b);

struct Ov002Self2 { u16 b0 : 1; u16 : 13; u16 b14 : 1; };

int func_ov002_021f4df4(void *self, int arg1) {
    int sel;
    int t;
    int v;
    struct Ov002Self2 *s = (struct Ov002Self2 *)((char *)self + 2);
    sel = s->b14 ^ s->b0;
    t = func_ov002_021f3458(self);
    v = *(int *)(data_ov002_022cf16c + (sel & 1) * 0x868);
    if (v <= t)
        return -1;
    {
        int r = func_ov002_021f4a84(self, arg1);
        if (r == 1)
            func_ov002_021df780(sel, t);
        return r;
    }
}
