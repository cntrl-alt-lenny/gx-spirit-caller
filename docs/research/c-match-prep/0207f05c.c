/* CAMPAIGN-PREP candidate for func_0207f05c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reuse func2 wrap; unsigned count>=n (movcs) materialised; mla base bound once from initial h8; store h0,h2,h4 in order; src post-inc, dst[i]
 *   risk:       inner stores split addressing — first via [r4,i*8] scaled-reg, h2/h4 via precomputed ip=r4+i*8; this scheduling/addressing of dst[i].field is permuter-class, unlikely exact first build.
 *   confidence: low
 */
/* func_0207f05c: range-gate then struct-copy fill into record array. */
typedef struct {
    unsigned short h0;   /* 0x0 */
    unsigned short h2;   /* 0x2 */
    unsigned short h4;   /* 0x4 */
    unsigned short h6;   /* 0x6 */
} elem_t;                /* 8 bytes */

typedef struct {
    int            f0;          /* 0x0  record index */
    unsigned short h4;          /* 0x4 */
    unsigned short h6;          /* 0x6 */
    unsigned short h8;          /* 0x8 */
} obj_t;

extern unsigned char data_021a08f4[];

int func_0207f05c(obj_t *p, elem_t *src, int n) {
    unsigned short h6 = p->h6;
    unsigned short h8 = p->h8;
    int flag = (h8 <= h6 + 1) && ((unsigned)p->h4 <= h6);
    unsigned short count = flag ? (unsigned short)(h6 - h8 + 1) : 0;
    if (count >= (unsigned)n) {
        elem_t *dst = (elem_t *)((char *)data_021a08f4 + p->f0 * 0x540 + 0x100) + p->h8;
        int i;
        for (i = 0; i < n; i++) {
            dst[i].h0 = src->h0;
            dst[i].h2 = src->h2;
            dst[i].h4 = src->h4;
            src++;
            p->h8++;
        }
        return 1;
    }
    return 0;
}
