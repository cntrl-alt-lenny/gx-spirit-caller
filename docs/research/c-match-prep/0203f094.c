/* CAMPAIGN-PREP candidate for func_0203f094 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(s-0xa)->jump-table; eq-chain b/e/f; case0 first lays table ascending; r5=s default
 *   risk:       reshape-able-ish: the s==0xe path FALLS THROUGH into .L_27c (shared store+r5=0xb tail) — my duplicated body may diverge; restructure as goto/fallthrough. Jump-table emission also at risk (permuter-class).
 *   confidence: low
 */
/* func_0203f094 — dispatcher: state s=func_0203c888(); ctx=func_0203c900(0x10);
 * if func_0207b5f8()==9 -> jump-table on (s-0xa) in [0..5]; else eq-chain on s.
 * returns r5. Class D: addls pc,pc jump-table + equality chain. */
extern int  func_0203c888(void);   /* current state s */
extern int  func_0203c900(int);    /* (0x10) -> ctx* */
extern int  func_0207b5f8(void);
extern int  func_0203ee94(void);
extern int  func_0203eee0(void *);
extern int  func_0203eefc(void *);
extern int  func_0203ef68(void);
extern int  func_0203efa0(void *);
extern int  func_0203f030(void *);
extern void func_02043250(void);
extern void func_020432d0(void);

typedef struct Ctx {
    unsigned char _p0[0xd13];
    unsigned char f_d13;
    unsigned char _p1[0x444 - 0xd14];
    unsigned char arr444[1];
} Ctx;

int func_0203f094(void) {
    int s = func_0203c888();
    Ctx *c = (Ctx *)func_0203c900(0x10);
    int r5 = s;
    if (func_0207b5f8() == 9) {
        switch (s - 0xa) {
        case 0: r5 = func_0203f030(c); break;
        case 1: r5 = func_0203efa0(c); break;
        case 2: r5 = func_0203ef68();  break;
        case 3: r5 = func_0203eefc(c); break;
        case 4: r5 = func_0203eee0(c); break;
        case 5: r5 = func_0203ee94();  break;
        default: break;
        }
    } else if (s == 0xb) {
        r5 = func_0203ee94();
    } else if (s == 0xe) {
        func_02043250();
        func_020432d0();
        (&c->arr444[0])[c->f_d13 << 2] = 2;
        r5 = 0xb;
    } else if (s == 0xf) {
        r5 = func_0203eee0(c);
    } else {
        (&c->arr444[0])[c->f_d13 << 2] = 2;
        r5 = 0xb;
    }
    return r5;
}
