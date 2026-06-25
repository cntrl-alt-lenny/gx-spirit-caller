/* CAMPAIGN-PREP candidate for func_02020914 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order halfword burst, f38 callbacks, movne bool, 0/2/4 set-test
 *   risk:       ALREADY ships as src/main/func_02020914.s (brief 302, reg-alloc-walled). The long strh burst at fac..fd6 must emit in exact source order and r2=0x10/0x1/0x0 const reuse must match; r2=(r6==2)?1:0 via movne is the coin-flip. Expect first build <100%; permuter-class
 *   confidence: low
 */
/* func_02020914: configure a new scene for mode m6 (args m6,h5,h4).
 * if f30!=1 func_02093bfc(); set f10=0x80,f3c=0x20; two optional f38 callbacks;
 * f40=m6; func_0201f138(3); burst of halfword fields (fac,fd2,fb8,fd4,fd6,
 * fb0,fb6,fb2,fae,fb4); fb4 = (m6==2)?1:0. If m6 in {0,2,4} func_0201f1b8()
 * else optional f38(data_020c6810,m6).
 * NOTE: currently shipped as .s; this is the iterate-from C draft.
 */
struct Ctl {
    char pad0[0x10];
    int f10;            /* 0x10 */
    char pad14[0x30-0x14];
    int f30;            /* 0x30 */
    char pad34[0x38-0x34];
    void (*f38)(void *, int);  /* 0x38 */
    int f3c;            /* 0x3c */
    int f40;            /* 0x40 */
    char pad44[0xac-0x44];
    unsigned short fac; /* 0xac */
    unsigned short fae; /* 0xae */
    unsigned short fb0; /* 0xb0 */
    unsigned short fb2; /* 0xb2 */
    unsigned short fb4; /* 0xb4 */
    unsigned short fb6; /* 0xb6 */
    unsigned short fb8; /* 0xb8 */
    char padBA[0xd2-0xba];
    unsigned short fd2; /* 0xd2 */
    unsigned short fd4; /* 0xd4 */
    unsigned short fd6; /* 0xd6 */
};
extern struct Ctl data_02191f40;
extern unsigned char data_020c65b4[];
extern unsigned char data_020c65cc[];
extern unsigned char data_020c6810[];
extern void func_0201f138(int);
extern void func_0201f1b8(void);
extern void func_02093bfc(void);
extern int  func_0209e3ac(void);

int func_02020914(int m6, int h5, int h4)
{
    if (data_02191f40.f30 != 1)
        func_02093bfc();
    data_02191f40.f10 = 0x80;
    data_02191f40.f3c = 0x20;
    if (data_02191f40.f38 != 0)
        data_02191f40.f38(data_020c65b4, 0);
    if (data_02191f40.f38 != 0)
        data_02191f40.f38(data_020c65cc, data_02191f40.f3c);
    data_02191f40.f40 = m6;
    func_0201f138(3);
    data_02191f40.fac = (unsigned short)h5;
    data_02191f40.fd2 = (unsigned short)h4;
    data_02191f40.fb8 = (unsigned short)func_0209e3ac();
    data_02191f40.fd4 = 0x10;
    data_02191f40.fd6 = 0x10;
    data_02191f40.fb0 = 1;
    data_02191f40.fb6 = 0;
    data_02191f40.fb2 = 0;
    data_02191f40.fae = 1;
    data_02191f40.fb4 = (m6 == 2) ? 1 : 0;
    if (m6 == 0 || m6 == 2 || m6 == 4) {
        func_0201f1b8();
        return 0;
    }
    if (data_02191f40.f38 != 0)
        data_02191f40.f38(data_020c6810, m6);
    return 0;
}
