/* CAMPAIGN-PREP candidate for func_021af0a8 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0..5 loop; counter i before row/a1i; OAM field stores in orig order; +0x14 RMW twice
 *   risk:       loop reg-alloc rotation across r4-r8 (orig pins buf=r4,row=r6,a1i=r7,i=r5); decl order steers it but the +0x14 double-RMW + base<<7 schedule may still diverge. reshape-able (decl-order/store-order)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov008_021af0a8 (ov008, class C, MED) — built-free.
 * UNVERIFIED + ITERATION-EXPECTED. Counted 0..5 OAM loop, mul index.
 *
 * row = data_021b2de4[+0xc0] + a0*5*2  (a 10-byte stride row of u16). a1*5 seeds
 * the per-iter OAM "char base" (a1i*8 + 0xf3 + 0x200) << 7, a1i incremented each
 * pass. Per i in 0..4: read u16 row[i], glyph = func_0202be4c(u16); fill a 0x28
 * OAM record (func_0201d47c), RMW fields in store order, commit (func_0201e5b8),
 * free the handle stored at [sp] (func_02006e1c).
 */
extern void func_0201d47c(void *p);
extern int  func_0202be4c(int code);
extern void func_0201e5b8(void *p);
extern void func_02006e1c(int h);

extern char data_ov008_021b2de4[];    /* _LIT0: ptr@+0xc0 -> u16 row table */

void func_ov008_021af0a8(int a0, int a1) {
    char buf[0x28];
    unsigned short *row =
        (unsigned short *)(*(char **)(data_ov008_021b2de4 + 0xc0) + a0 * 5 * 2);
    int a1i = a1 * 5;
    int i;

    for (i = 0; i < 5; i++) {
        int glyph;
        func_0201d47c(buf);
        glyph = func_0202be4c(row[i]);

        *(unsigned short *)(buf + 0x14) = (*(unsigned short *)(buf + 0x14) & ~0xf) | 0x9;
        *(int *)(buf + 0x0)  = glyph;
        *(int *)(buf + 0xc)  = ((a1i * 8 + 0xf3 + 0x200) << 7);
        *(unsigned short *)(buf + 0x14) = *(unsigned short *)(buf + 0x14) | 0x10;
        *(int *)(buf + 0x18) = (*(int *)(buf + 0x18) & ~0x1c000) | 0x1c000;

        func_0201e5b8(buf);
        func_02006e1c(*(int *)(buf + 0x0));
        a1i++;
    }
}
