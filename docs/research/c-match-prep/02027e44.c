/* CAMPAIGN-PREP candidate for func_02027e44 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: frame store-order (f2c,f24,f28,f30,f34); bind sub base; (a<0&&b<0) cmplt guard
 *   risk:       struct-guessed: stack-slot offsets (0x24/0x28/0x2c/0x30/0x34) and func_020aadf8's &body=sp+4 buffer size are inferred; if any slot/size is off the frame stores reshuffle. Guard is cmp;cmplt;blt.
 *   confidence: low
 */
/* func_02027e44 (main, class D) - build a 0x3c-byte stack descriptor and submit it.
 * if (!p->h68) return 1; Fill32(0,&s,0x3c); s.f00=1; func_020aadf8(&s.body, p->h68);
 * s.f2c=&p->sub; s.f24=sub->f0c; s.f28=(s16)sub->f10; s.f30=&func_02027ed4; s.f34=p;
 * if (!(s.f24<0 && s.f28<0)) func_02022b74(&s); set de bit4. Returns 1.
 * sub is at p+0x8c; bound across the 3 reads. */
typedef short s16;
typedef unsigned short u16;

extern void Fill32(int v, void *dst, int n);
extern void func_020aadf8(void *dst, void *src);
extern void func_02022b74(void *desc);
extern void func_02027ed4(void);

typedef struct Sub8c {
    char _p0[0xc];
    int   f0c;          /* p+0x98 */
    short f10;          /* p+0x9c signed */
} Sub8c;

typedef struct Obj27e44 {
    char  _p0[0x68];
    void *h68;          /* 0x68 */
    char  _p1[0x8c - 0x6c];
    Sub8c sub;          /* 0x8c */
    char  _p2[0xde - (0x8c + 0x12)];
    u16   b0:1, b1:1, b2:1, b3:1, b4:1;   /* 0xde */
} Obj27e44;

typedef struct StkE44 {
    int   f00;                 /* 0x00 = 1 */
    char  body[0x24 - 0x04];   /* 0x04.. filled by func_020aadf8 */
    int   f24;                 /* sub->f0c */
    int   f28;                 /* (s16)sub->f10 */
    void *f2c;                 /* &p->sub */
    void *f30;                 /* &func_02027ed4 */
    void *f34;                 /* p */
    char  _tail[0x3c - 0x38];
} StkE44;

int func_02027e44(Obj27e44 *p) {
    StkE44 s;
    Sub8c *sub = &p->sub;
    if (p->h68 == 0)
        return 1;
    Fill32(0, &s, 0x3c);
    s.f00 = 1;
    func_020aadf8(&s.body, p->h68);
    s.f2c = sub;
    s.f24 = sub->f0c;
    s.f28 = sub->f10;
    s.f30 = (void *)func_02027ed4;
    s.f34 = p;
    if (!(s.f24 < 0 && s.f28 < 0))
        func_02022b74(&s);
    p->b4 = 1;
    return 1;
}
