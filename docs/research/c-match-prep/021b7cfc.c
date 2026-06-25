/* CAMPAIGN-PREP candidate for func_021b7cfc (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     5-iter init loop; 1-based count loop builds {u16,u8} recs; two stores
 *   risk:       r5 is reused for both loop-var i and the func_0202b9ec result n; if mwcc allocates n to a fresh reg the ldr/mov set diverges (permuter-class: register-mirror coin-flip).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b7cfc (ov006, class C) — MED tier.
 * UNVERIFIED build-free draft.
 *   recipe: 5-iter init loop (j held 0); then 1-based loop over count=data_020b4768 building {u16,u8} records at p+0x62a0; two summary stores.
 * Decl order tuned to reg alloc: i(r5), p(sl), j/written(r4), count(fp), accum(r6), k(r8), rec ptr(r9). r5 reused for func_0202b9ec result. */

extern int  data_020b4768;
extern int  func_0202b0e0(int k);
extern int  func_0202b9ec(void);
extern int  func_0202bb20(int h);
extern void func_ov006_021b843c(void *p, int i, int j);

typedef struct { unsigned short a; unsigned char b; unsigned char pad; } ov006_rec_t;

int func_ov006_021b7cfc(char *p) {
    int i = 0;
    int written = 0;
    int count;
    int accum = 0;
    int k;
    ov006_rec_t *rec;
    for (i = 0; i < 5; i++)
        func_ov006_021b843c(p, i, 0);
    count = data_020b4768;
    rec = (ov006_rec_t *)(p + 0x2a0 + 0x6000);
    for (k = 1; k < count; k++) {
        int h = func_0202b0e0(k);
        int n = func_0202b9ec();
        if (n <= 0 && func_0202bb20(h) == 0)
            continue;
        rec->a = (unsigned short)h;
        rec->b = (unsigned char)n;
        accum += n;
        rec++;
        written++;
    }
    *(unsigned short *)(p + 0x8100 + 0x60) = (unsigned short)written;
    *(unsigned short *)(p + 0x8100 + 0x6a) = (unsigned short)accum;
    return 1;
}
