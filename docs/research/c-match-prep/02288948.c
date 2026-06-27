/* CAMPAIGN-PREP candidate for func_02288948 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: u16 out-param byte-split (v>>8); table index via mul(bit0&1, 0x868); signed n/2 = plain /2; (self,lo,hi) sink arity
 *   risk:       orig keeps cf16c+0x868 product via `mul r,(bit&1),0x868; ldr [ip,r]` (literal 0x868 in pool, mul not shift) and reuses n/2 (`r0,asr#1`) thrice. If mwcc turns *0x868 into shift/add or recomputes n/2, several insns diverge. permuter-class (reg/strength-reduction).
 *   confidence: low
 */
/* func_ov002_02288948 (ov002, cls D): byte-split of a u16 out-param, signed /2,
 * per-player table compares. self at r0/r5.
 *   n = func_02216004(self, &v);           v is a u16 out-param (sp slot)
 *   if (func_021c1e44(self, v & 0xff, (v>>8)&0xff) != 0) return 0;
 *   t0 = *(int*)(cf16c + (self->bit0 & 1)*0x868);
 *   if (t0 <= n/2) return 0;                 n/2 = (n + (n>>31)) >> 1 (signed)
 *   t1 = *(int*)(cf16c + ((1-self->bit0) & 1)*0x868);
 *   if (t1 <= n/2) return 1;
 *   return (v & 0xff) == (1 - self->bit0);
 */
typedef unsigned short u16;
struct S02288948 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_02216004(struct S02288948 *self, u16 *out);
extern int  func_ov002_021c1e44(struct S02288948 *self, int a, int b);
int func_ov002_02288948(struct S02288948 *self) {
    u16 v;
    int n, t0, t1, notbit;
    n = func_ov002_02216004(self, &v);
    if (func_ov002_021c1e44(self, v & 0xff, (v >> 8) & 0xff) != 0) return 0;
    t0 = *(int *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868);
    if (t0 <= n / 2) return 0;
    notbit = 1 - self->bit0;
    t1 = *(int *)(data_ov002_022cf16c + (notbit & 1) * 0x868);
    if (t1 <= n / 2) return 1;
    return (v & 0xff) == notbit;
}
