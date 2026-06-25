/* CAMPAIGN-PREP candidate for func_021b299c (ov007, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order follows source arg-eval; reuse f4c*0x18 index (ldrsh reloaded twice, keep two reads)
 *   risk:       struct-guessed + reshape-able: the 8-word stack arg block order must match exactly; arg-eval order in mwcc varies — likely needs operand/temp reordering. Also func_020a978c signature (r3=handle, rest on stack) is inferred.
 *   confidence: low
 */
/* func_ov007_021b299c: marshal indexed table values into a 0x124 stack
   frame and fire two calls. cls C (store-order / decl reshape). */

extern short data_020c9694[];          /* _LIT0, ldrsh [r6 + r2*0x18] */
extern unsigned int data_ov007_021b2fdc[];  /* _LIT2 */
extern unsigned int data_ov007_021b2fe8[];  /* _LIT3 */
extern unsigned int data_ov007_021b2fd4[];  /* _LIT4 */
extern unsigned int data_ov007_021b2ff4[];  /* _LIT5 */
extern int data_ov007_0223352c;        /* _LIT1, address taken */

extern int  func_0208dd9c(void);
extern int  func_0202b100(int);
extern int  func_ov007_021b2ce8(int *p, int a);
extern void func_02094504(int, int, int);
extern void func_020a978c(int *outbuf, int a0, int a1, int a2, int a3,
                          int a4, int a5, int a6, int a7, int a8, int a9);
extern void func_02004f58(void *self, int *buf, int x, int y);

typedef struct {
    char _pad3c[0x3c];
    int  f3c;   /* 0x3c */
    int  f40;   /* 0x40 */
    int  f44;   /* 0x44 */
    int  f48;   /* 0x48 */
    int  f4c;   /* 0x4c row index */
} Ctx_021b299c;

int func_ov007_021b299c(Ctx_021b299c *self)
{
    int spr;
    int v;
    int handle;
    int buf[0x40];   /* the sp+0x24 output region */

    spr = func_0208dd9c();
    v = func_0202b100(data_020c9694[self->f4c * 0x18 / 2]);
    handle = func_ov007_021b2ce8(&data_ov007_0223352c, self->f3c);
    func_02094504(0, spr, 0x6000);
    func_020a978c(buf,
                  data_ov007_021b2fdc[self->f40], self->f40,
                  data_ov007_021b2fe8[self->f44], self->f44,
                  data_ov007_021b2fd4[self->f48], self->f48,
                  self->f4c,
                  data_020c9694[self->f4c * 0x18 / 2],
                  v,
                  handle); /* r3=handle passed in reg */
    func_02004f58(self, buf, spr, 0xc);
    return 1;
}
