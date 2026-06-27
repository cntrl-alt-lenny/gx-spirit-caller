/* CAMPAIGN-PREP candidate for func_02060728 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order hit/run; bind dst+remaining; set key-global pre-decrypt; loop-rotated
 *   risk:       orig loops via b .L_2e0 (test-at-bottom with pre-test entry); mwcc while may emit cmp;ble guard before body, shifting branch layout. permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02060728 (main, class C) — brief 496.
 * UNVERIFIED build-free draft. MED tier: byte-match not expected first build.
 *   recipe: decl-order r8/r5/r4 first-used; bind dst+remaining; set key-global before each decrypt
 */
/* func_02060728: chunked XOR-decrypt driver. Repeatedly locate the next
 * "\\final\\" delimiter (func_02060c10) from dst, decrypt the run before it
 * (func_02060d8c after pointing the key-pointer global data_02101358 at the
 * key string data_0210135c), post-process it (func_020607b0), then advance
 * past the 7-byte delimiter. Returns bytes consumed (orig_len - remaining). */

extern signed char *data_02101358;   /* key-pointer global written each chunk */
extern signed char  data_0210135c[]; /* key string source */

extern signed char *func_02060c10(signed char *start, int n);
extern void         func_020607b0(signed char *p, int len);
extern void         func_02060d8c(signed char *p, int len);

int func_02060728(signed char *dst, int remaining) {
    int orig = remaining;
    signed char *hit = func_02060c10(dst, remaining);
    int run;
    while (remaining > 0 && hit != 0) {
        run = (int)(hit - dst);
        data_02101358 = data_0210135c;
        func_02060d8c(dst, run);
        func_020607b0(dst, run);
        remaining -= run + 7;
        dst = hit + 7;
        if (remaining <= 0) break;
        hit = func_02060c10(dst, remaining);
    }
    return orig - remaining;
}
