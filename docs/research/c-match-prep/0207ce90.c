/* CAMPAIGN-PREP candidate for func_0207ce90 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed int accumulator so /16 emits asr#3;lsr#28;asr#4; first-16 loop fixed-bound, second n-bound; mask 0xff at end
 *   risk:       Reshape-able: the >0x10 loop uses literal 16 bound (cmp r3,#0x10) while the second uses n; if mwcc hoists r1=data_021a08c0 differently the ldr-reload (r2 vs ip) diverges — decl-order/reload flip.
 *   confidence: med
 */
typedef unsigned char u8;

extern u8  data_021a08bc;
extern u8  data_021a08c0[];
extern int func_020b3870(void);

int func_0207ce90(void)
{
    int sum;
    int n;
    int i;
    u8 *p;

    sum = 0;
    n = data_021a08bc;
    if (n > 0x10) {
        p = data_021a08c0;
        for (i = 0; i < 0x10; i++)
            sum += *p++;
        return (sum / 16) & 0xff;
    }
    if (n == 0)
        return sum & 0xff;
    if (n > 0) {
        p = data_021a08c0;
        for (i = 0; i < n; i++)
            sum += *p++;
    } else {
        func_020b3870();
    }
    return sum & 0xff;
}
