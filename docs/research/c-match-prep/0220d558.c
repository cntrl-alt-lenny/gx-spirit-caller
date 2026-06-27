/* CAMPAIGN-PREP candidate for func_0220d558 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     a/b bitfields; arg kept in r4; two guard calls then (a&1)*0x868 select then tail call
 *   risk:       first guard 021bc8c8 takes f2.a in arg0 AND arg1, with f2.b in arg2 -- orig does ONE ldrh r2 then derives all three regs (r0=a,r1=a,r2=b). If mwcc re-loads f2 between args, ldrh diverges. reshape-able (single ldrh, bind container).
 *   confidence: med
 */
/* func_ov002_0220d558 (ov002, class D, MED) -- batch p_0030.
 * arg0=self(r5), arg1=arg(r4).
 * 021bc8c8(f2.a, f2.a, f2.b)!=0; 021b9e48(f2.a, f2.b)!=0;
 * parity-mul cf17c[(a&1)*0x868]!=0; tail 021ff3bc(self, arg).
 *   f2.a = bit0 (x<<31)>>31, f2.b = bits1..5 (x<<26)>>27
 * decl-order: self r5, arg r4 (callee-saved across the two guards).
 */
typedef unsigned short u16;

typedef struct Entity {
    u16 field0;
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16   : 4;
} Entity;

extern int  data_ov002_022cf17c[];
extern int  func_ov002_021b9e48(int a, int b);
extern int  func_ov002_021bc8c8(int a, int b, int c);
extern int  func_ov002_021ff3bc(Entity *self, int arg);

int func_ov002_0220d558(Entity *self, int arg)
{
    if (func_ov002_021bc8c8(self->a, self->a, self->b) == 0) return 0;
    if (func_ov002_021b9e48(self->a, self->b) == 0) return 0;
    if (*(int *)((char *)data_ov002_022cf17c + (self->a & 1) * 0x868) == 0) return 0;
    return func_ov002_021ff3bc(self, arg);
}
