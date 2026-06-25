/* CAMPAIGN-PREP candidate for func_02052f04 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     discriminant switch, tail calls, two-word call-result reuse
 *   risk:       func_0205370c returns pair (r0,r1) into a,b; modeling its second return (r1=b) as a separate int is fragile — may need long long split.
 *   confidence: low
 */
extern int func_020534b4(int a, int b, int c);
extern int func_020534d4(int a, int b, int c);
extern int func_02053688(int a);
extern int func_02053704(int a);
extern int func_0205370c(int a);

int func_02052f04(int *r6, int r4) {
    int a, b;
    switch (func_02053688(r4)) {
    case 1:
        return -1;
    case 2:
        a = func_0205370c(r4);
        b = 0;
        if (func_020534d4(a, b, r6[9]) == 0) {
            return 0;
        }
        return func_020534b4(a, b, r6[9]);
    case 3:
        return func_02053704(r4);
    }
    return 0;
}
