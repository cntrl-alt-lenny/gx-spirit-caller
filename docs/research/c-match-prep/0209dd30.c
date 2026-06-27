/* CAMPAIGN-PREP candidate for func_0209dd30 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     project va idiom (no stdarg, &count&~3 +1word); count=unsigned short (ldrh); store h[0] halfword first
 *   risk:       permuter-class: loop IV asymmetry — orig walks args via moving ptr (add r4,#4; ldr[r4,#-4]) but indexes h (add r5,i<<2; str[.,#4]). mwcc's induction-var choice won't reliably reproduce both; try *args++.
 *   confidence: low
 */
/* func_0209dd30 — class C: varargs copy loop plus call, store-order.
 * h[0]=first(halfword); then `count` ints copied into h[1..count]; posts h.
 * mwccarm has no <stdarg.h>; uses the project va idiom (&last & ~3, +1 word) -
 * matches `add sp,#0x14; bic #3; add #4` in the asm. */

extern void func_020928e8(void *h, int arg);
extern int  func_02096358(int a, void *h, int c);
extern void func_0209256c(void *tag, void *h, int c);
extern void *func_0209dde8(void);

extern int data_021a8d30;

int func_0209dd30(int first, unsigned short count, ...) {
    int *h;
    int rc;
    int i;
    int *args = (int *)((unsigned int)&count & ~0x3) + 1; /* first vararg */

    h = (int *)func_0209dde8();
    if (h == 0) {
        return 8;
    }
    *(short *)h = (short)first;
    for (i = 0; i < count; i++) {
        h[i + 1] = args[i];
    }
    func_020928e8(h, 0x100);
    rc = func_02096358(0xa, h, 0);
    func_0209256c(&data_021a8d30, h, 1);
    return rc < 0 ? 8 : 2;
}
