/* CAMPAIGN-PREP candidate for func_02087690 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind f4 into r5 (used after call); cond-store pair in asm order; preserve store order
 *   risk:       after the f8 block orig RELOADS [r4+0x8] (ldr r0,[r4,#0x8]) to write fc=0; my p->f8[..] may reuse the cached pointer. reshape-able: re-read p->f8 before the fc=0 store to force the reload.
 *   confidence: med
 */
/* func_02087690: teardown. cond-clear *f0 and f0; func_0207cff4(f4,p); f4=0;
 * if f8: func_0207d12c(f4+0xc, f8) then f8->fc=0 and f8=0; then two literal-base
 * calls and clear byte +0x2c. Store order preserved exactly. */

typedef struct {
    int *f0;     /* +0x0 */
    char *f4;    /* +0x4 */
    int *f8;     /* +0x8 node */
} td_t;

extern char data_021a485c[];
extern char data_021a4868[];
extern void func_0207cff4(void *a, void *b);
extern void func_0207d12c(void *a, void *b);

void func_02087690(td_t *p) {
    char *f4;
    if (p->f0 != 0) {
        *p->f0 = 0;
        p->f0 = 0;
    }
    f4 = p->f4;
    func_0207cff4(f4, p);
    p->f4 = 0;
    if (p->f8 != 0) {
        func_0207d12c(f4 + 0xc, p->f8);
        p->f8[0xc/4] = 0;
        p->f8 = 0;
    }
    func_0207cff4(data_021a4868, p);
    func_0207d12c(data_021a485c, p);
    *((char *)p + 0x2c) = 0;
}
