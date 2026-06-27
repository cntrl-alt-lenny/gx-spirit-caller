/* CAMPAIGN-PREP candidate for func_0220daa0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     d2 :2 (bits12-13) branch; data016c[0xcec]==(1-a) / [0xcf8] in {2,4}; two tail calls
 *   risk:       the {2,4} test is cmp r2,#2; cmpne r2,#4 (fused predicate) -- the C `v!=2 && v!=4` should emit cmp;cmpne but mwcc may split into two branches. reshape-able. Also orig branches on d2 FIRST (movs ... bne) so d2 must be the leading test; base data016c held in r2 across both reads.
 *   confidence: med
 */
/* func_ov002_0220daa0 (ov002, class D, MED) -- batch p_0030.
 * d2 = bits12..13 of f2 (lsl#0x12;lsr#0x1e, width2). movs sets flags.
 * if d2 == 0:
 *     bit0 = f2.a;
 *     if data_022d016c[0xcec/4] != (1 - bit0) return 0;
 *     v = data_022d016c[0xcf8/4]; if v != 2 && v != 4 return 0;
 *     return func_02206780();      (tail, value passes through r0)
 * else:
 *     return func_021b8fcc(f2.a, f2.b) != 0;
 *   f2.a=bit0, f2.b=bits1..5, f2.d2=bits12..13
 */
typedef unsigned short u16;

typedef struct Entity {
    u16 field0;
    u16 a  : 1;        /* bit 0 */
    u16 b  : 5;        /* bits 1..5 */
    u16 c  : 6;        /* bits 6..11 */
    u16 d2 : 2;        /* bits 12..13 */
    u16    : 2;        /* bits 14..15 */
} Entity;

extern int  data_ov002_022d016c[];
extern int  func_ov002_021b8fcc(int a, int b);
extern int  func_ov002_02206780(void);

int func_ov002_0220daa0(Entity *self)
{
    int v;
    if (self->d2 != 0) {
        return func_ov002_021b8fcc(self->a, self->b) != 0;
    }
    if (data_ov002_022d016c[0xcec / 4] != (1 - self->a)) return 0;
    v = data_ov002_022d016c[0xcf8 / 4];
    if (v != 2 && v != 4) return 0;
    return func_ov002_02206780();
}
