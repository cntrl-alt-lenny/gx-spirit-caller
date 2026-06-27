/* CAMPAIGN-PREP candidate for func_02027ddc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: store-order (b1,call,cc/cf,d0,b0); bind h=cc so guard+call arg share one ldrsh
 *   risk:       reshape-able: orig reuses the ldrsh cc value as both the >=0 guard and the func_02022580 arg (no reload) - the bound int h forces that; if unbound, a 2nd ldrsh diverges. Struct offsets guessed.
 *   confidence: med
 */
/* func_02027ddc (main, class D) - teardown: clear de bit1, run func_02027ee4, free
 * handle cc (if >=0) + clear cf bit0, invoke+null d0, clear de bit0. Returns 1.
 * Store-order matters: de.b1 first; then (cc>=0) free->cc=-1->cf&=~1; then d0;
 * then de.b0 last. */
typedef unsigned char u8;
typedef unsigned short u16;

extern void func_02027ee4(void *p);
extern void func_02022580(int handle);
extern void Task_InvokeLocked(void *task);

typedef struct Obj27ddc {
    char _p0[0xcc];
    short cc;            /* 0xcc signed handle, -1=none */
    char _p1[0xcf - 0xce];
    u8   cf;            /* 0xcf flag byte */
    void *d0;           /* 0xd0 */
    char _p2[0xde - 0xd4];
    u16  b0:1, b1:1;    /* 0xde */
} Obj27ddc;

int func_02027ddc(Obj27ddc *p) {
    int h;
    p->b1 = 0;
    func_02027ee4(p);
    h = p->cc;
    if (h >= 0) {
        func_02022580(h);
        p->cc = -1;
        p->cf &= ~1;
    }
    if (p->d0) {
        Task_InvokeLocked(p->d0);
        p->d0 = 0;
    }
    p->b0 = 0;
    return 1;
}
