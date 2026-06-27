/* CAMPAIGN-PREP candidate for func_021c480c (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     lsl;lsr -> :3 bitfield, constant /2 signed -> plain /2, selector single-expr
 *   risk:       struct-guessed (G104f4c word offset, data_021cdddc element type, func_02004f58 6-arg signature). reshape-able core; main risk is helper signatures wrong -> arg-marshalling diverges.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov006_021c480c (ov006, class D) — brief 494.
 * UNVERIFIED build-free draft. setup bitfield + div-by-2 + calls (full asm).
 * base = func_0208dd9c(); func_02094504(0, base+0xc40, 0xc00);
 * func_02001d0c(self+0x10,0x20,3);
 * f = (data_02104f4c.w4 << 29) >> 29  -> :3 unsigned field (bits0..2); func_02001d68(f);
 * func_02001d98(self+0x10,5);
 * sel = self->f5c + (self->f60<<2) + 1; v = data_021cdddc[sel] (signed s16);
 * h = func_0202c0c0(v); q = func_02005554(h,0xc,5); r3 = 0x74 - (q/2)  (signed /2);
 * func_02004f58(self+0x10, h, base+0xc40, 0x74-(q/2), [sp]=7, [sp+4]=0xc);
 * func_02001d98(self+0x10, -1); return 1;
 * recipe: lsl#29;lsr#29 -> :3 bitfield, constant /2 signed -> plain /2, selector single-expr.
 */
typedef short s16;
struct G104f4c { int w0; unsigned f4lo : 3; unsigned : 29; };  /* w4 bits0..2 */
extern struct G104f4c data_02104f4c;
extern s16 *data_ov006_021cdddc;          /* indexed by selector */
extern int  func_02001d0c(void *p, int a, int b);
extern int  func_02001d68(int a);
extern int  func_02001d98(void *p, int a);
extern int  func_02004f58(void *p, int a, int b, int c, int d, int e);
extern int  func_02005554(int a, int b, int c);
extern int  func_0202c0c0(int a);
extern int  func_0208dd9c(void);
extern int  func_02094504(int a, int b, int c);

struct St480c { char _0[0x5c]; int f5c; int f60; };

int func_ov006_021c480c(struct St480c *self) {
    int base = func_0208dd9c();
    int h, q;
    func_02094504(0, base + 0xc40, 0xc00);
    func_02001d0c((char *)self + 0x10, 0x20, 3);
    func_02001d68(data_02104f4c.f4lo);
    func_02001d98((char *)self + 0x10, 5);
    h = func_0202c0c0(data_ov006_021cdddc[self->f5c + (self->f60 << 2) + 1]);
    q = func_02005554(h, 0xc, 5);
    func_02004f58((char *)self + 0x10, h, base + 0xc40, 0x74 - (q / 2), 7, 0xc);
    func_02001d98((char *)self + 0x10, -1);
    return 1;
}
