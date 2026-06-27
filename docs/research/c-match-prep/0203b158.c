/* CAMPAIGN-PREP candidate for func_0203b158 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     div-by-const 1016 via plain /; 7 stack temps incl dst[2]; reload f74/fb8; store-order e->f0c,f12
 *   risk:       stack-slot assignment of the 7 temps (esp. dst[2] landing at sp#14/#18) and the several aliasing reloads (f74 x2-3, fb8/iter) are scheduling/layout dependent. permuter-class; expect iteration. Offsets struct-guessed.
 *   confidence: low
 */
/* func_0203b158 (cls D): stack-temp-heavy render walk. FULL body recovered from
 * build/eur/dis/src/main/func_0203b158.s. Divisor recovered: magic 0x02040811 +
 * (n+umulhi)>>10 round form == n / 1016 (0x3F8); confirmed by q*0x3f8 alignment.
 * 7 stack temps at sp #0,4,8,c,10,14,18 (dst[2] occupies #14/#18, indexed by i).
 * MMIO read at 0x4000006 is REG_VCOUNT. Many globals reloaded due to aliasing. */

extern int func_01ff8000(void *a, int b, void *c);

int func_0203b158(char *ctx, int idx) {
    char    *base78  = *(char**)(ctx + 0x78);
    unsigned n       = *(unsigned*)(base78 + idx * 0x20);
    int      q       = (int)(n / 1016u);
    int      aligned = q * 0x3f8;
    int     *ptr60   = (int*)(ctx + 0x60) + idx;
    int      qp1     = q + 1;
    unsigned short qlo = (unsigned short)q;
    int      neg42   = ~0x29;
    char    *dst[2];
    int      qx512   = q << 9;
    char    *base84  = *(char**)(ctx + 0x84);
    char    *e       = base78 + idx * 0x20;
    int      i;

    dst[0] = base84 + idx * 0x200;
    dst[1] = (base84 + 0x400) + idx * 0x200;

    for (i = 0; i < *(unsigned short*)(ctx + 0xb8); i++) {
        if (q != *(unsigned short*)(e + 0x12)) {
            char *t   = *(char**)(ctx + 0x74);
            int   r6v = *(int*)(t + 0x34);
            int   r3v = *(int*)(t + 0x30);
            int   flag = 0;
            int   r1v;
            if ((unsigned)qp1 >= *(unsigned*)(t + 0x2c)) {
                r6v  = *(int*)(t + 0x3c);
                r3v  = *(int*)(t + 0x38);
                flag = 1;
            }
            r1v = *(int*)(t + 0x28) + *(int*)(ctx + 0x68);
            r1v = (int)(*(unsigned short*)(ctx + 0xb8)) * qx512 + r1v;
            if (idx == 0) {
                int ip = 0xb6 - *(unsigned short*)0x4000006;
                if (ip <= neg42)
                    ip += 0x107;
                if (ip < 0)
                    return 0;
            }
            r1v += i * r3v;
            if (func_01ff8000(ptr60, r1v, dst[i]) == 0)
                return 0;
            *(int*)(e + 0xc)  = aligned + r6v;
            *(unsigned short*)(e + 0x12) = qlo;
            if (flag != 0) {
                char *t2 = *(char**)(ctx + 0x74);
                *(int*)(e + 0xc) = *(int*)(t2 + 0x20);
                {
                    char *t3 = *(char**)(ctx + 0x74);
                    if (*(unsigned char*)(t3 + 0x19) == 0) {
                        *(int*)(e + 0xc) = *(int*)(t3 + 0x24);
                        *(unsigned short*)(ctx + 0xb0) |= 2;
                    }
                }
            }
        }
        e += 0xc;
    }
    return 1;
}
