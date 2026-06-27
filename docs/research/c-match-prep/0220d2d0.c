/* CAMPAIGN-PREP candidate for func_0220d2d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0/bits1-5 bitfields; (a&1)*0x868 parity-mul select; self bound in r4 across chain
 *   risk:       021bc8c8 gets a in BOTH arg0 and arg1 (mov r1,r0 after first lsr) -- the arg-dup must hold one reg; if mwcc reloads f2 for arg2(b) vs arg0(a) an extra ldrh diverges. reshape-able (one ldrh, reuse).
 *   confidence: med
 */
/* func_ov002_0220d2d0 (ov002, class D, MED) -- batch p_0030.
 * guard chain: 021bb91c(0x1a77)!=0; 021bc8c8(a,b2)!=0; 021ca2b8(a0)!=0;
 * parity-mul select cf17c[(a0&1)*0x868]==0 -> else return 1;
 * if hit==0: r=0223f6c4(self); 022536e8(a0, self->f0, r)!=0 else 0; else 1.
 *   a0 = f2.a (bit0)        : (x<<31)>>31
 *   a  = f2.a (bit0)        passed as arg0 to 021bc8c8
 *   b  = f2.b (bits1..5)    : (x<<26)>>27  passed as arg2 to 021bc8c8
 * decl-order: self held in r4 (callee-saved) across whole chain.
 */
typedef unsigned short u16;

typedef struct Entity {
    u16 field0;        /* +0x0 */
    u16 a : 1;         /* bit 0  */
    u16 b : 5;         /* bits 1..5 */
    u16 c : 6;         /* bits 6..11 */
    u16   : 4;         /* bits 12..15 */
} Entity;

extern int  data_ov002_022cf17c[];
extern int  func_ov002_021bb91c(int id);
extern int  func_ov002_021bc8c8(int a, int b, int c);
extern int  func_ov002_021ca2b8(int x);
extern int  func_ov002_0223f6c4(Entity *self);
extern int  func_ov002_022536e8(int x, int f0, int r);

int func_ov002_0220d2d0(Entity *self)
{
    int r;
    if (func_ov002_021bb91c(0x1a77) == 0) return 0;
    if (func_ov002_021bc8c8(self->a, self->a, self->b) == 0) return 0;
    if (func_ov002_021ca2b8(self->a) == 0) return 0;
    if (*(int *)((char *)data_ov002_022cf17c + (self->a & 1) * 0x868) == 0) {
        r = func_ov002_0223f6c4(self);
        if (func_ov002_022536e8(self->a, self->field0, r) == 0) return 0;
    }
    return 1;
}
