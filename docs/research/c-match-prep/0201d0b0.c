/* CAMPAIGN-PREP candidate for func_0201d0b0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed-<0 early return; table-gate ldr lsl#2; mla 0xc0 as i*0xC0 base+offset
 *   risk:       reshape-able: orig keeps i in r0 and emits `mov r1,#0xc0; mla r0,r1,r0,r2`; if mwcc strength-reduces i*0xc0 to shift+add instead of mla, write the multiply as plain i*0xc0 (it already prefers mla for a runtime base).
 *   confidence: high
 */
/* func_0201d0b0 (main, class D) — bounds-guarded table index: clamp <0 to 0,
 * gate on word table data_0218ff8c[i]!=0, then mla i*0xc0 into base
 * data_0219060c. Returns a pointer (0 on either guard miss). */
extern int  data_0218ff8c[];
extern char data_0219060c[];

char *func_0201d0b0(int i) {
    if (i < 0)
        return (char *)0;
    if (data_0218ff8c[i] == 0)
        return (char *)0;
    return data_0219060c + i * 0xc0;
}
