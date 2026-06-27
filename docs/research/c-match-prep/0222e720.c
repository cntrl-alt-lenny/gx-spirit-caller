/* CAMPAIGN-PREP candidate for func_0222e720 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D/C: eor-fold disc bound once+reused; if-clamp not min(); store-order kept
 *   risk:       reshape-able (operand-order/bind): disc reused across calls so it must stay one reg; the a<b branch picks bge->two-call shape, ternary may diverge to permuter-class reg rotation. Dump truncated in .L_404.
 *   confidence: low
 */
/* func_ov002_0222e720 (ov002, D) state machine on g->state[0x5a8] (cases 0x7d/0x7e/0x80).
 * Entity *e in r0; e->f0(+0),e->f2(+2),e->f8(+8),e->fa(+0xa) halfwords.
 * eor-fold discriminant: arg = ((f2>>14)&1) ^ ((f2>>15)&1) computed early into r4
 * and reused as the leading int arg to every helper (orig holds it in r4 across
 * the whole body). Case 0x80 clamps; 0x7e clamps fa to 0x20 then +6; 0x7d steps f8.
 * The asm dump is TRUNCATED inside .L_404 (cut after second ldrh f8). */
typedef struct { unsigned short f0; unsigned short f2; char pad4[4]; unsigned short f8; unsigned short fa; } Ent;
struct GState { char pad[0x5a8]; int state; };
extern struct GState data_ov002_022ce288;
extern void func_ov002_021ae400(int disc,int a);
extern int  func_ov002_021af9d0(int disc,int b,int c,int d);
extern void func_ov002_021b004c(int x);
extern int  func_ov002_021bc618(int disc);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_021ff400(void);
extern int  func_ov002_0225368c(int disc,int b,int c);
extern void func_ov002_0227adb8(int disc,int b,int c,int d);
int func_ov002_0222e720(Ent *e) {
    unsigned short f2 = e->f2;
    int st = data_ov002_022ce288.state;
    int disc = ((f2 << 17) >> 31) ^ ((f2 << 15) >> 31);
    if (st == 0x7d) {
        unsigned short f8 = e->f8;
        if (f8 < e->fa) {
            func_ov002_021b004c(f8 + 1);
        }
        return 0;
    }
    if (st == 0x7e) {
        int fa = e->fa;
        if (fa >= 0x20) fa = 0x20;
        func_ov002_021af9d0(disc, (int)e->f0, fa + 6, 0);
        e->f8 = 0;
        func_ov002_021e2b3c();
        return 0x7d;
    }
    if (st != 0x80) return 0;
    if (func_ov002_021ff400() == 0) return 0;
    {
        int a = func_ov002_021bc618(disc);
        int b = func_ov002_0225368c(disc, (int)e->f0, 0);
        int r = (a < b) ? func_ov002_021bc618(disc)
                        : func_ov002_0225368c(disc, (int)e->f0, 0);
        e->fa = (unsigned short)r;
        if (e->fa == 0) return 0;
        func_ov002_021ae400(disc, 0);
        return 0x7e;
    }
}
