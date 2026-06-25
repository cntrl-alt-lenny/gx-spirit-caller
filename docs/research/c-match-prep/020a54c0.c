/* CAMPAIGN-PREP candidate for func_020a54c0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 wraps via (unsigned short) casts; if-assign wrap not ternary; bind mask/count locals
 *   risk:       permuter-class: two u16 counters i(ip)/n(lr) each lsl#16;lsr#16 + the cmp count,n fall-through-vs-store branch; reg rotation / lsl-lsr placement likely a scheduling coin-flip.
 *   confidence: low
 */
/* func_020a54c0 — round-robin "find next active slot" over a bitmask.
 *
 *   mask = func_0209e4f8(p);  if (!mask) return 0;
 *   count = p->slots;                       // u16 @ +0x4
 *   i = 0;  n = count;                       // both u16, lr=n ip=i
 *   loop:
 *     if (mask & (1 << (n-1))) {
 *         if (count != n) p->slots = n;       // advanced -> commit & done
 *         else continue;                      // first iter, n==count: keep scanning
 *         return 1;
 *     }
 *     i = (u16)(i+1);
 *     n = (n == 0x10) ? 1 : (u16)(n+1);       // wrap 1..16
 *   while (i < 0x10);
 *   return 1;
 */

extern unsigned int func_0209e4f8(void *p);

typedef struct {
    char           _pad_00[0x4];
    unsigned short slots;     /* +0x4 */
} Sched;

int func_020a54c0(void *p) {
    unsigned int   mask = func_0209e4f8(p);
    unsigned short count;
    unsigned short i;
    unsigned short n;

    if (mask == 0) return 0;

    count = ((Sched *)p)->slots;
    i = 0;
    n = count;

    do {
        if (mask & (1u << (n - 1))) {
            if (count != n) {
                ((Sched *)p)->slots = n;
                return 1;
            }
        }
        i = (unsigned short)(i + 1);
        if (n == 0x10) {
            n = 1;
        } else {
            n = (unsigned short)(n + 1);
        }
    } while (i < 0x10);

    return 1;
}
