/* CAMPAIGN-PREP candidate for func_0206df90 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload global ptr each use; movs r0->r4 capture+bne; mvn err; bind r4=ret
 *   risk:       orig reloads data_0219ece8 via a fresh `ldr _LIT0;ldr [r0]` at each of 3 uses; if mwcc CSEs the global into one reg the 3 ldr-pairs collapse (reshape-able: keep separate reads, do not cache in a local).
 *   confidence: med
 */
/* func_0206df90 (main, class C): branchy init/cleanup gated on a global
 * pointer. data_0219ece8 is a global object-pointer, reloaded each use. */

extern void *data_0219ece8;
extern int   func_0206e010(void);
extern void  func_0206de68(void *p);
extern int   func_0206df54(void *p);
extern void  func_0206dbbc(void);
extern int   func_02074134(void);
extern void  func_0207cbbc(int a);

int func_0206df90(void) {
    int r;

    if (data_0219ece8 != 0) {
        r = func_0206e010();
        if (r == 0) {
            func_0206de68(data_0219ece8);
            if (func_0206df54(data_0219ece8) != 0)
                data_0219ece8 = 0;
            r = ~0x19;
        }
        func_0206dbbc();
    } else {
        if (func_02074134() == 0)
            return ~0x19;
        func_0207cbbc(0);
        r = 0;
    }
    return r;
}
