/* CAMPAIGN-PREP candidate for func_0204bb5c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(kind); reload getter per use; store-order 4-byte stack buf; ll pair store
 *   risk:       case-2 scan holds index in callee-saved r6 across getter reloads and writes buf[1]/buf[2] as an ordered pair; mwcc loop reg-alloc / store reorder likely diverges. struct-guessed + permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0204bb5c (main, class D, MED tier) — brief 497.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(kind); reload getter per use; store-order into 4-byte stack buf; ll pair store
 *   risk:       case-2 scan keeps the running index in r6 (callee-saved) across getter reloads and writes buf[1]/buf[2] then breaks on match; if mwcc binds the getter base or reorders the streqb/streqb pair the loop diverges. struct-guessed + permuter-class (loop reg-alloc).
 *   confidence: low
 */
/* func_0204bb5c — main, cls D. r0=val(r5), r1=kind(r4). 8-byte stack buffer buf[]
   filled per kind, passed as func_020529e8(kind, val, buf, 4). Then getter is
   reloaded and the func_020930b0() (r0,r1) pair is stored to ctx[0x1e0/0x1e4].
   func_020498f0() is RELOADED every use (orig re-bl's each access). kind==2
   walks index i (r6, &0xff) over ctx[i+0x2d0] up to ctx[0xd], writing buf. */
typedef struct GxCtx GxCtx;
struct GxCtx {
    unsigned char _p00[0xd];
    unsigned char count0d;     /* +0x0d */
    unsigned char _p0e[0xf2];
    unsigned short h1b0;       /* +0x100+0xb0 = 0x1b0 */
    unsigned char _p1b2[0x2e];
    unsigned char tab2d0[0x20];/* +0x2d0 */
};

extern GxCtx *func_020498f0(void);
extern void func_020529e8(int kind, int val, unsigned char *buf, int n);
extern long long func_020930b0(void);

void func_0204bb5c(int val, int kind)
{
    unsigned char buf[8];

    if (kind == 2) {
        unsigned char i;
        unsigned char *base = func_020498f0();
        i = 1;
        if (val == base[func_020498f0()->count0d + 0x2d0])
            buf[0] = 1;
        else
            buf[0] = 0;
        if (func_020498f0()->count0d >= 1) {
            do {                            /* .L_af0 */
                if (val == func_020498f0()->tab2d0[i]) {
                    buf[1] = i;
                    buf[2] = (unsigned char)val;
                    break;
                }
                i = (unsigned char)(i + 1);
            } while (i <= func_020498f0()->count0d);
        }
    } else if (kind == 3) {                  /* .L_b28 */
        buf[0] = (unsigned char)func_020498f0()->h1b0;
        buf[1] = (unsigned char)(func_020498f0()->h1b0 >> 8);
    }

    /* .L_b4c */
    func_020529e8(kind, val, buf, 4);
    {
        GxCtx *p = func_020498f0();
        long long v = func_020930b0();
        *(int *)((char *)p + 0x1e0) = (int)v;
        *(int *)((char *)p + 0x1e4) = (int)((unsigned long long)v >> 32);
    }
}
