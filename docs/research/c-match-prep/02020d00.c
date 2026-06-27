/* CAMPAIGN-PREP candidate for func_02020d00 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: store fa0 then fa4 order; bool-to-byte via (u8)(a1!=0); (u16) stack arg
 *   risk:       the two stack args ((u16)fac at [sp], (u8)bool at [sp+4]) and r3=s->fa8 ordering; if mwcc reorders stack-arg setup or widens the bool, the str-to-sp sequence diverges. reshape-able (arg-order / explicit (u8)&0xff)
 *   confidence: med
 */
/* func_02020d00: clear+init global, gate on s->f30==4, marshal 6-arg call
 * with two stack args ((u16)s->fac, (u8)(a1!=0)). */

extern char data_02191f40[];
extern char data_02193340[];
extern int  func_02020ce0(void *p);
extern void func_020944a4(void *dst, void *src, int n);
extern void func_020a078c(void *cb, void *src, int n, int a3, int a4, int a5);

typedef struct {
    char pad00[0x30];
    int  f30;       /* 0x30 */
    char pad34[0x6c];
    void *fa0;      /* 0xa0 */
    unsigned short fa4; /* 0xa4 */
    char pada6[0x02];
    int  fa8;       /* 0xa8 */
    unsigned short fac; /* 0xac */
} S02191f40b;

void func_02020d00(void *a0, int a1) {
    S02191f40b *s = (S02191f40b *)data_02191f40;
    func_020944a4(a0, data_02193340, 0x30);
    s->fa0 = data_02193340;
    s->fa4 = 0x30;
    if (s->f30 != 4) return;
    func_020a078c((void *)func_02020ce0, data_02193340, 0x30,
                  s->fa8, (unsigned short)s->fac, (unsigned char)(a1 != 0));
}
