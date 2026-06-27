/* CAMPAIGN-PREP candidate for func_022b540c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: volatile MMIO struct, exact store-order, repeated same-offset writes.
 *   risk:       store-order/repeat writes need volatile or mwcc coalesces dup 0x2c/0x28/0x48 stores; orr operand-order (lit4|(f4>>3)) picks dest. Many LIT values/offsets struct-guessed; the func_0208ecd8 8-arg mapping is reshape-able.
 *   confidence: low
 */
/* func_ov002_022b540c - hardware/MMIO register programming, STORE-ORDER
 * critical (same offset written multiple times: 0x2c x3, 0x28 x3, base-4 x2,
 * 0x48 x5, 0x44 x3). base = data_ov002_022d11bc as volatile u32*; writes
 * must NOT be reordered/coalesced -> volatile. Two early-outs gate on
 * func_0202d9f8 and a 022a1784/022b859c handshake. */

extern int  func_0202d9f8(void);
extern int  func_ov002_022a1784(void *p);
extern int  func_ov002_022b859c(void *p);
extern void func_0208e890(void);
extern void func_0208ecd8(int a, int b, int c, int d, int e, int f, int g, int h);
extern void *data_ov002_022d11bc;   /* _LIT1 handshake arg */
extern void *data_ov002_022d1b7c;   /* _LIT0 handshake arg */

/* MMIO register window: base is _LIT2 (a fixed device address word). */
struct ov002_dev {
    int  m_4;     /* base-4 reachable via sub lr,r0,#4 */
    int  m0;      /* 0x00 */
    int  pad04[3];
    int  m10;     /* 0x10 */
    int  pad14[5];
    int  m28;     /* 0x28 */
    int  m2c;     /* 0x2c */
    int  pad30[4];
    int  m44;     /* 0x44 */
    int  pad48a;
    int  m48;     /* 0x48 */
    int  pad4c[5];
    int  m60;     /* 0x60 */
    int  m64;     /* 0x64 */
    int  m68;     /* 0x68 */
    int  pad6c[3];
    int  m7c;     /* 0x7c */
    int  m80;     /* 0x80 */
    int  pad84[13];
    int  mbc;     /* 0xbc */
};

struct ov002_540c_obj { int f0; int f4; int f8; };

extern volatile struct ov002_dev g_ov002_dev_022b540c;   /* _LIT2 */
extern unsigned int data_ov002_lit3;   /* _LIT3 value -> [0x7c] */
extern unsigned int data_ov002_lit4;   /* _LIT4 -> orr into [0x64] */
extern unsigned int data_ov002_lit5;   /* _LIT5 -> [0x60] */
extern unsigned int data_ov002_lit6;   /* _LIT6 -> [0x48] */

int func_ov002_022b540c(struct ov002_540c_obj *obj)
{
    volatile struct ov002_dev *d;
    unsigned int lit3, lit4, lit5, lit6;

    if (func_0202d9f8() == 0) return 0;
    if (func_ov002_022a1784(&data_ov002_022d11bc) == 0) {
        if (func_ov002_022b859c(&data_ov002_022d1b7c) != 0) return 0;
    }
    func_0208e890();
    func_0208ecd8(0, 0, 0xc0000, 0x100000, -0x400000, 0x400000, 0x400000, 1);

    d = &g_ov002_dev_022b540c;
    lit3 = data_ov002_lit3;
    lit4 = data_ov002_lit4;
    lit5 = data_ov002_lit5;
    lit6 = data_ov002_lit6;

    d->m0 = 0;
    d->m2c = 0x32000;
    d->m2c = 0x5c000;
    d->m2c = 0x100;
    d->m28 = 0x80000;
    d->m28 = 0x80000;
    d->m28 = 0x1000;
    d->m_4 = 3;
    d->m10 = 0;
    d->m_4 = 2;
    d->m7c = lit3;
    d->m80 = lit3 >> 0x10;
    d->m64 = lit4 | (obj->f4 >> 3);
    d->m68 = obj->f8 >> 4;
    d->m60 = lit5;
    d->mbc = 1;
    d->m44 = 0;
    d->m48 = lit6;
    d->m48 = 0;
    d->m44 = 0x80000;
    d->m48 = 0x80000 - 0x8000000;
    d->m48 = 0;
    d->m44 = 0x80000 + 0x8000000;
}
