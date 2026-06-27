/* CAMPAIGN-PREP candidate for func_02049038 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order a/b/c via r6/r5/r4; reload deep chain per guard (no bind); if-eq default fills
 *   risk:       orig re-walks the full obj->f4->f0 chain inside EACH eq-guard (4x) rather than caching d; if mwcc hoists the chain into one base, the repeated ldr sequence collapses. reshape-able via separate reads / struct-guessed depth.
 *   confidence: low
 */
/* func_02049038 (main, class C). g = *data_0219dc80.
 * If g==0 -> return 0. If func_02047804()==0 -> return 0.
 * Else: deep base d = g->obj->f4->base (the [r0],[r0,#4],[r0] chain).
 * Default args from d when sentinel: a==-1 -> d->f214; b==0 -> &d->f218;
 * c==0 -> &d->f318; tail func_02055420(a,b,c, d-derived...). */

typedef struct DeepState02049038 {
    char  _pad0[0x214];
    int   f214;         /* +0x214 default for a */
    char  buf218[0x100];/* +0x218 default ptr for b */
    char  buf318[0x100];/* +0x318 default ptr for c */
} DeepState02049038;

typedef struct Mid02049038 {
    DeepState02049038 *f0;  /* +0x00 (final deref -> base) */
} Mid02049038;

typedef struct Obj02049038 {
    char        _pad0[0x4];
    Mid02049038 *f4;        /* +0x04 */
} Obj02049038;

typedef struct State02049038 {
    Obj02049038 *obj;       /* +0x00 */
} State02049038;

extern State02049038 *data_0219dc80;
extern int func_02047804(void);
extern void func_02055420(int a, void *b, void *c, void *base);

int func_02049038(int a, void *b, void *c) {
    if (data_0219dc80 == 0) return 0;
    if (func_02047804() != 0) {
        DeepState02049038 *d;
        if (a == -1) {
            d = data_0219dc80->obj->f4->f0;
            a = (int)d->f214;
        }
        if (b == 0) {
            d = data_0219dc80->obj->f4->f0;
            b = d->buf218;
        }
        if (c == 0) {
            d = data_0219dc80->obj->f4->f0;
            c = d->buf318;
        }
        d = data_0219dc80->obj->f4->f0;
        func_02055420(a, b, c, d);
        return 0;
    }
    return 0;
}
