/* CAMPAIGN-PREP candidate for func_0201ff98 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: switch(kind) dense 0xa..0xd -> addls-pc table; explicit case order; tag==0xf||9||0xd guard
 *   risk:       reshape-able: switch must compile to `sub#0xa;cmp#3;addls pc` table (cases 0xa/0xb/0xc/0xd dense). If mwcc emits cmp-chain instead, the `case 0xb` falling to default is the fragile slot; reorder/add case 0xb. struct-guessed.
 *   confidence: med
 */
/* func_0201ff98 (class D): u16 tag guard, then switch([4]) via addls-pc jump table.
 *   r1=arg; r0=(u16)[r1+2]; if(tag!=0){ if(tag==0xf||9||0xd) return; func_0201f19c(); func_02020b84(); return; }
 *   field=(u16)[r1+4]; switch(field) over 0xa..0xd: 0xa->.L_2c8; 0xc/0xd->return; else->.L_380
 *   .L_2c8: [0x40]==3 -> {[0x30]==6 ret; [0x30]!=4 ->L_374; func_020200d8()!=0 ret; [0x38]fn? blx(&data_020c675c); func_02020ba0(); ret}
 *           [0x40]==5 -> {func_020a037c(&data_02192b00,0xd,3,0x10,1); !=0 -> f19c();ba0();ret; else [0x38]fn? blx(&data_020c6784); func_0201f138(5); ret}
 *           else .L_374
 *   .L_374: func_0201f138(4); ret
 */
typedef void (*fn38_t)(void *);
typedef struct {
    char    _pad00[0x30];
    int     f30;        /* +0x30 */
    char    _pad34[0x38 - 0x34];
    fn38_t  f38;        /* +0x38 */
    char    _pad3c[0x40 - 0x3c];
    int     f40;        /* +0x40 */
} S2191f40;
typedef struct {
    char            _pad0[0x2];
    unsigned short  tag;        /* +0x2 */
    unsigned short  kind;       /* +0x4 */
} Arg;

extern S2191f40 data_02191f40;
extern void data_020c675c;
extern void data_020c6784;
extern void data_02192b00;
extern void func_0201f138(int);
extern void func_0201f19c(void);
extern int  func_020200d8(void);
extern void func_02020b84(void);
extern void func_02020ba0(void);
extern int  func_020a037c(void *p, int a, int b, int c, int d);

void func_0201ff98(Arg *o) {
    if (o->tag != 0) {
        if (o->tag == 0xf || o->tag == 9 || o->tag == 0xd) return;
        func_0201f19c();
        func_02020b84();
        return;
    }
    switch (o->kind) {
    case 0xa:
        if (data_02191f40.f40 == 3) {
            if (data_02191f40.f30 == 6) return;
            if (data_02191f40.f30 != 4) { func_0201f138(4); return; }
            if (func_020200d8() != 0) return;
            if (data_02191f40.f38 != 0) data_02191f40.f38(&data_020c675c);
            func_02020ba0();
            return;
        }
        if (data_02191f40.f40 == 5) {
            if (func_020a037c(&data_02192b00, 0xd, 3, 0x10, 1) != 0) {
                func_0201f19c();
                func_02020ba0();
                return;
            }
            if (data_02191f40.f38 != 0) data_02191f40.f38(&data_020c6784);
            func_0201f138(5);
            return;
        }
        func_0201f138(4);
        return;
    case 0xc:
    case 0xd:
        return;
    default:
        func_0201f138(4);
        return;
    }
}
