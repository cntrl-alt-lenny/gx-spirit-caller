/* CAMPAIGN-PREP candidate for func_0203444c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     chained func_0203268c() return -> arg0; ctx->f_eb0 store; halfword store-order 484/486/488/48a
 *   risk:       asm has bare func_0203268c() THEN a 2nd whose r0 is the call arg (two bl per setup); I model both — correct. But mwcc may CSE the paired calls into one; reshape-able by sequencing, else permuter-class on the eb0-store block's r0 hold.
 *   confidence: low
 */
/* func_0203444c (main, class C) — long chained-setup init; func_0203268c() returns ctx ptr.
 * r0=self(r5). Each setup: func_0203268c() return -> next call arg0. ctx->f_eb0=0x7530; field stores. */
typedef struct {
    unsigned char _pad_00[0xeb0];
    int f_eb0;            /* +0xeb0 */
} Ctx_0203444c;

typedef struct {
    unsigned char _pad_00[0x484];
    short f484;           /* +0x484 (=self+0x400+0x84) */
    short f486;           /* +0x486 */
    short f488;           /* +0x488 */
    unsigned char f48a;   /* +0x48a (=self+0x484+6) */
} Self_0203444c;

extern Ctx_0203444c *func_0203268c(void);
extern int  func_020330e4(Ctx_0203444c *c, int n, void *cb1, void *cb2);
extern void func_02093bfc(void);
extern void func_020335c8(Ctx_0203444c *c, int a, int b);
extern void func_02032e80(Ctx_0203444c *c, int magic);
extern void func_020335b8(Ctx_0203444c *c, int a, void *p1, void *p2);
extern void func_02032f74(Ctx_0203444c *c, void *cb);
extern int  func_02032644(void);
extern void func_02033a48(Ctx_0203444c *c, int a, void *p);
extern int  func_020335d4(Ctx_0203444c *c, int a, int b);
extern void func_02034194(void);
extern void func_020341a4(void);
extern void func_02034430(void);
extern int  data_020fe46c;
extern int  data_020fe478;

int func_0203444c(Self_0203444c *self)
{
    func_0203268c();
    if (func_020330e4(func_0203268c(), 0x3c, (void *)func_02034194, (void *)func_020341a4) < 0) {
        func_02093bfc();
        return -1;
    }
    func_0203268c();
    func_020335c8(func_0203268c(), 0, 0);
    func_0203268c();
    func_02032e80(func_0203268c(), 0x4159584a);
    func_0203268c();
    func_020335b8(func_0203268c(), 0x2a0f, &data_020fe46c, &data_020fe478);
    func_0203268c();
    func_02032f74(func_0203268c(), (void *)func_02034430);
    {
        Ctx_0203444c *c = func_0203268c();
        c->f_eb0 = 0x7530;
    }
    self->f484 = (short)(func_02032644() << 11);
    self->f486 = 0;
    self->f488 = 0;
    self->f48a = 3;
    func_0203268c();
    func_02033a48(func_0203268c(), 8, &self->f484);
    func_0203268c();
    if (func_020335d4(func_0203268c(), 2, 0x400) >= 0)
        return 0;
    func_02093bfc();
    return -1;
}
