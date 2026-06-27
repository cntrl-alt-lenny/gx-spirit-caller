/* CAMPAIGN-PREP candidate for func_020b10e0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: r4=p,r5=oldexp held across calls; reload p->len each iter (asm re-ldrb [r4,#4]); pad then +0x30
 *   risk:       permuter-class: orig binds p in r4 and exp in r5 across two bl calls, and the pad loop's strb-digit-at-old-len uses a stale r0 (add r0,r4,r0) before reloading len. mwcc's reload/order of [r4,#4] in the two loops will likely differ.
 *   confidence: low
 */
typedef unsigned char u8;
typedef signed short s16;

struct Num {
    u8  flag0;    /* 0x0 */
    u8  pad1;
    s16 exp;      /* 0x2 */
    u8  len;      /* 0x4 */
    u8  digits[1];/* 0x5 */
};

extern void func_020b0f60(struct Num *p);
extern void func_020b044c(struct Num *p, int n);

extern void func_020b10e0(int r0, int r1, int r2, struct Num *p);

void func_020b10e0(int r0, int r1, int r2, struct Num *p) {
    s16 oldexp = p->exp;
    func_020b0f60(p);
    if (p->digits[0] > 9)
        return;
    if (oldexp > 0x20)
        oldexp = 0x20;
    func_020b044c(p, oldexp);
    {
        u8 ln = p->len;
        if ((int)ln < (int)oldexp) {
            int zero = 0;
            do {
                u8 cur = p->len;
                p->digits[ln] = (u8)zero;
                p->len = cur + 1;
                ln = p->len;
            } while ((int)ln < (int)oldexp);
        }
        {
            s16 e = p->exp;
            p->exp = (s16)(e - (ln - 1));
        }
    }
    {
        int i = 0;
        u8 cnt = p->len;
        if ((int)cnt > 0) {
            do {
                u8 v = p->digits[i];
                p->digits[i] = (u8)(v + 0x30);
                i++;
                cnt = p->len;
            } while (i < (int)cnt);
        }
    }
}
