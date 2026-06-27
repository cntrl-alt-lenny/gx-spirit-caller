/* CAMPAIGN-PREP candidate for func_021ace68 (ov018, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: divmod-by-name for /var; min/max via chained ?: to mirror movgt/movle; decl r,g,b first.
 *   risk:       permuter-class: nested max-of-3/min-of-3 emit movgt/movle whose incumbent reg (r0 vs r4/r5/r6) is a coin-flip; the duplicated `if(mx<=b)else max(r,g)` branch-tail may cross-jump differently. ?: vs if-assign may flip cc sense.
 *   confidence: low
 */
// func_ov018_021ace68 : BGR555 -> HSV (H 0-360, S 0-255, V=max)
// args: r0 packed colour, r1=outHue, r2=outSat, r3=outMax(value)
extern int func_020b3870(int num, int den); // mwcc signed divmod runtime, quotient in r0

void func_ov018_021ace68(int c, int *outHue, int *outSat, int *outMax)
{
    int r = (c & 0x1f) << 3;          // r4: red,   0..248
    int g = (c & 0x3e0) >> 2;         // r5: green, 0..248
    int b = (c & 0x7c00) >> 7;        // r6: blue,  0..248
    int mx, mn, delta, sat, hue;

    // value = max(r,g,b) via max(r,g) then vs b
    mx = (r > g) ? r : g;
    if (mx <= b) mx = b; else mx = (r > g) ? r : g;
    *outMax = mx;

    // min(r,g,b)
    mn = (r > g) ? g : r;
    if (mn > b) { mn = b; } else { mn = (r > g) ? g : r; }

    delta = mx - mn;
    if (mx == 0) sat = 0;
    else sat = func_020b3870(delta * 255, mx);   // (delta*255)/max
    *outSat = sat;

    if (sat == 0) { hue = 0; }
    else {
        if (r == mx)      hue = func_020b3870((g - b) << 8, delta);
        else if (g == mx) hue = func_020b3870((b - r) << 8, delta) + 0x200;
        else if (b == mx) hue = func_020b3870((r - g) << 8, delta) + 0x400;
        else              hue = 0;
        hue = (hue * 0x3c) >> 8;
        if (hue < 0) hue += 0x168;   // +360 wrap
    }
    *outHue = hue;
}
