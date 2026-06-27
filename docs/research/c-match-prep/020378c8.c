/* CAMPAIGN-PREP candidate for func_020378c8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r6=mode saved; movs r5,r0 loop var doubles as iter+test; b5a guard; two branch tails
 *   risk:       reshape-able: orig reuses r5 as both the func_02038d70 arg and its result (mov r0,r5 then movs r5,r0), and r4 holds the zero store value across the loop. If mwcc allocates a fresh iterator the mov r0,r5 / movs r5,r0 pattern diverges. Bind iter/result to one local.
 *   confidence: med
 */
extern void func_02034a84(void);
extern void *func_02038d70(int idx);
extern void *func_02038dac(void);
extern void func_0203ab9c(void *node);

typedef struct {
    char pad8[0x8];
    void *p8;          /* +0x8 */
    char pad5a[0x5a - 0xc];
    unsigned char b5a; /* +0x5a */
} LL37;

int func_020378c8(int a, int mode) {
    if (a < 0) {
        LL37 *cur;
        int it = 0;
        void *zero = 0;
        for (;;) {
            cur = (LL37 *)func_02038d70(it);
            it = (int)cur;
            if (cur == 0) return 1;
            if (mode == 0) {
                if (cur->b5a != 0) continue;
            }
            cur->p8 = zero;
            func_0203ab9c(cur);
        }
    } else {
        LL37 *h;
        func_02034a84();
        h = (LL37 *)func_02038dac();
        if (h == 0 || h->p8 == 0) return 0;
        if (mode == 0) {
            if (h->b5a != 0) return 0;
        }
        h->p8 = 0;
        func_0203ab9c(h);
        return 1;
    }
}
