/* CAMPAIGN-PREP candidate for func_0209aa84 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D store-order: clear POWCNT2 bit before saving timer; guarded calls
 *   risk:       a==0 arm interleaves the 0x04000304 bic store with the data_021a83dc save (orig: strh then str); if mwcc reorders the two stores or hoists the pool loads the interleave diverges. reshape-able (statement order).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209aa84 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 *   recipe:     a==0 / a==1 dispatch; .L_88 store-order (clear POWCNT2 bit BEFORE saving timer); guarded calls
 *   risk:       in the a==0 arm the orig interleaves the MMIO bit-clear store with the data_021a83dc save; store-order is preserved here, but the mid-function conditional 'return 0' (diff<=7) and the cmp #0/#1 dispatch may relayout. reshape-able (statement order) / borderline permuter-class.
 *   confidence: med
 */
/* func_0209aa84: 3-state (a=0 stop / a=1 start / else noop) control of POWCNT2
 * bit0 + a debounce on a shared-WRAM frame timer (0x027ffc3c) vs data_021a83dc. */

extern int data_021a83dc;

extern void func_0209b014(int b);
extern void func_0209b050(int b, int z1, int z2);

int func_0209aa84(int a, int b, int c, int d) {
    if (a == 0) {
        *(volatile unsigned short *)0x04000304 &= ~1;
        data_021a83dc = *(volatile int *)0x027ffc3c;
        if (b != 0) {
            if (d != 0) func_0209b014(b);
            else        func_0209b050(b, 0, 0);
        }
        return 1;
    }
    if (a == 1) {
        if (c == 0) {
            if (*(volatile int *)0x027ffc3c - data_021a83dc <= 7)
                return 0;
        }
        if (b != 0) {
            if (d != 0) func_0209b014(b);
            else        func_0209b050(b, 0, 0);
        }
        *(volatile unsigned short *)0x04000304 |= 1;
    }
    return 1;
}
